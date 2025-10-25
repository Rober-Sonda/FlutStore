import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:isar/isar.dart';
import 'package:tienda_app/models/gasto_fijo.dart';
import 'package:tienda_app/services/isar_service.dart';
import 'package:tienda_app/widgets/permission_widget.dart';

class FixedExpensesView extends ConsumerStatefulWidget {
  const FixedExpensesView({super.key});

  @override
  ConsumerState<FixedExpensesView> createState() => _FixedExpensesViewState();
}

class _FixedExpensesViewState extends ConsumerState<FixedExpensesView> {
  List<GastoFijo> _gastos = [];
  bool _isLoading = true;
  String _filtroSeleccionado = 'Todos';

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      setState(() => _isLoading = true);

      final isar = await ref.read(isarServiceProvider).db;
      final gastos = await isar.collection<GastoFijo>().where().findAll();

      setState(() {
        _gastos = gastos;
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error al cargar datos: $e')));
      }
    }
  }

  List<GastoFijo> get _gastosFiltrados {
    switch (_filtroSeleccionado) {
      case 'Activos':
        return _gastos.where((g) => g.activo == true).toList();
      case 'Inactivos':
        return _gastos.where((g) => g.activo == false).toList();
      case 'Vencidos':
        return _gastos.where((g) => _esVencido(g)).toList();
      default:
        return _gastos;
    }
  }

  bool _esVencido(GastoFijo gasto) {
    return gasto.estaVencido;
  }

  double get _totalGastosMensuales {
    return _gastos
        .where((g) => g.activo == true)
        .fold(0.0, (total, gasto) => total + (gasto.monto ?? 0.0));
  }

  int get _gastosVencidos {
    return _gastos.where((g) => _esVencido(g)).length;
  }

  Color _getEstadoColor(GastoFijo gasto) {
    if (!gasto.activo) return Colors.grey;
    if (gasto.estaVencido) return Colors.red;
    if (gasto.estaProximoAVencer) return Colors.orange;
    return Colors.green;
  }

  String _getEstadoText(GastoFijo gasto) {
    if (!gasto.activo) return 'Inactivo';
    if (gasto.estaVencido) return 'Vencido';
    if (gasto.estaProximoAVencer) return 'Vence pronto';
    return 'Activo';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'Gastos Fijos',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.filter_list, color: Colors.white),
            onSelected: (value) {
              setState(() => _filtroSeleccionado = value);
            },
            itemBuilder:
                (context) => [
                  const PopupMenuItem(value: 'Todos', child: Text('Todos')),
                  const PopupMenuItem(value: 'Activos', child: Text('Activos')),
                  const PopupMenuItem(
                    value: 'Inactivos',
                    child: Text('Inactivos'),
                  ),
                  const PopupMenuItem(
                    value: 'Vencidos',
                    child: Text('Vencidos'),
                  ),
                ],
          ),
        ],
      ),
      body:
          _isLoading
              ? const Center(child: CircularProgressIndicator())
              : Column(
                children: [
                  // Resumen de gastos fijos
                  Card(
                    margin: const EdgeInsets.all(16),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          const Text(
                            'Resumen de Gastos Fijos',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: _buildStatCard(
                                  'Total Mensual',
                                  _totalGastosMensuales,
                                  Colors.blue,
                                  Icons.account_balance_wallet,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: _buildStatCard(
                                  'Vencidos',
                                  _gastosVencidos.toDouble(),
                                  Colors.red,
                                  Icons.warning,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Lista de gastos fijos
                  Expanded(
                    child:
                        _gastosFiltrados.isEmpty
                            ? const Center(
                              child: Text(
                                'No hay gastos fijos registrados',
                                style: TextStyle(color: Colors.white70),
                              ),
                            )
                            : ListView.builder(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              itemCount: _gastosFiltrados.length,
                              itemBuilder: (context, index) {
                                final gasto = _gastosFiltrados[index];
                                return Card(
                                  margin: const EdgeInsets.only(bottom: 8),
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      backgroundColor: _getEstadoColor(gasto),
                                      child: Icon(
                                        Icons.receipt_long,
                                        color: Colors.white,
                                      ),
                                    ),
                                    title: Text(gasto.nombre ?? 'Sin nombre'),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          gasto.descripcion ??
                                              'Sin descripción',
                                        ),
                                        const SizedBox(height: 4),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.calendar_today,
                                              size: 12,
                                              color: _getEstadoColor(gasto),
                                            ),
                                            const SizedBox(width: 4),
                                            Text(
                                              'Vence: ${_formatDate(gasto.proximoVencimiento)}',
                                              style: TextStyle(
                                                color: _getEstadoColor(gasto),
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    trailing: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          '\$${(gasto.monto ?? 0.0).toStringAsFixed(2)}',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 6,
                                            vertical: 2,
                                          ),
                                          decoration: BoxDecoration(
                                            color: _getEstadoColor(
                                              gasto,
                                            ).withOpacity(0.1),
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                            border: Border.all(
                                              color: _getEstadoColor(gasto),
                                            ),
                                          ),
                                          child: Text(
                                            _getEstadoText(gasto),
                                            style: TextStyle(
                                              color: _getEstadoColor(gasto),
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                  ),
                ],
              ),
      floatingActionButton: PermissionFAB(
        onPressed: () {
          context.push('/fixed-expenses/add');
        },
        action: 'create',
        resource: 'finanzas',
        icon: Icons.add,
        tooltip: 'Agregar Gasto Fijo',
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
    );
  }

  Widget _buildStatCard(
    String title,
    double amount,
    Color color,
    IconData icon,
  ) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              color: color,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title == 'Vencidos'
                ? amount.toInt().toString()
                : '\$${amount.toStringAsFixed(2)}',
            style: TextStyle(
              color: color,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }
}
