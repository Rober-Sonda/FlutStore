import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../models/flujo_caja.dart';
import '../../services/isar_service.dart';
import '../../widgets/permission_widget.dart';

class CashFlowView extends ConsumerStatefulWidget {
  const CashFlowView({super.key});

  @override
  ConsumerState<CashFlowView> createState() => _CashFlowViewState();
}

class _CashFlowViewState extends ConsumerState<CashFlowView> {
  List<FlujoCaja> _flujos = [];
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
      final flujosRaw = await isar.flujoCajas.getAll([0]);
      final flujos = flujosRaw.whereType<FlujoCaja>().toList();

      setState(() {
        _flujos = flujos;
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

  List<FlujoCaja> get _flujosFiltrados {
    switch (_filtroSeleccionado) {
      case 'Ingresos':
        return _flujos.where((f) => f.tipo == 'ingreso').toList();
      case 'Egresos':
        return _flujos.where((f) => f.tipo == 'egreso').toList();
      default:
        return _flujos;
    }
  }

  double get _totalIngresos {
    return _flujos
        .where((f) => f.tipo == 'ingreso')
        .fold(0.0, (total, flujo) => total + (flujo.monto ?? 0.0));
  }

  double get _totalEgresos {
    return _flujos
        .where((f) => f.tipo == 'egreso')
        .fold(0.0, (total, flujo) => total + (flujo.monto ?? 0.0));
  }

  double get _saldoNeto => _totalIngresos - _totalEgresos;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'Flujo de Caja',
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
                  const PopupMenuItem(
                    value: 'Ingresos',
                    child: Text('Ingresos'),
                  ),
                  const PopupMenuItem(value: 'Egresos', child: Text('Egresos')),
                ],
          ),
        ],
      ),
      body:
          _isLoading
              ? const Center(child: CircularProgressIndicator())
              : Column(
                children: [
                  // Resumen de flujo de caja
                  Card(
                    margin: const EdgeInsets.all(16),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          const Text(
                            'Resumen de Flujo de Caja',
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
                                  'Ingresos',
                                  _totalIngresos,
                                  Colors.green,
                                  Icons.trending_up,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: _buildStatCard(
                                  'Egresos',
                                  _totalEgresos,
                                  Colors.red,
                                  Icons.trending_down,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color:
                                  _saldoNeto >= 0
                                      ? Colors.green.withOpacity(0.1)
                                      : Colors.red.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color:
                                    _saldoNeto >= 0 ? Colors.green : Colors.red,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Saldo Neto:',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '\$${_saldoNeto.toStringAsFixed(2)}',
                                  style: TextStyle(
                                    color:
                                        _saldoNeto >= 0
                                            ? Colors.green
                                            : Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Lista de flujos
                  Expanded(
                    child:
                        _flujosFiltrados.isEmpty
                            ? const Center(
                              child: Text(
                                'No hay registros de flujo de caja',
                                style: TextStyle(color: Colors.white70),
                              ),
                            )
                            : ListView.builder(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              itemCount: _flujosFiltrados.length,
                              itemBuilder: (context, index) {
                                final flujo = _flujosFiltrados[index];
                                return Card(
                                  margin: const EdgeInsets.only(bottom: 8),
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      backgroundColor:
                                          flujo.tipo == 'ingreso'
                                              ? Colors.green
                                              : Colors.red,
                                      child: Icon(
                                        flujo.tipo == 'ingreso'
                                            ? Icons.trending_up
                                            : Icons.trending_down,
                                        color: Colors.white,
                                      ),
                                    ),
                                    title: Text(
                                      flujo.descripcion ?? 'Sin descripción',
                                    ),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          flujo.categoria ?? 'Sin categoría',
                                        ),
                                        if (flujo.fecha != null)
                                          Text(
                                            '${flujo.fecha!.day}/${flujo.fecha!.month}/${flujo.fecha!.year}',
                                            style: const TextStyle(
                                              fontSize: 12,
                                            ),
                                          ),
                                      ],
                                    ),
                                    trailing: Text(
                                      '\$${(flujo.monto ?? 0.0).toStringAsFixed(2)}',
                                      style: TextStyle(
                                        color:
                                            flujo.tipo == 'ingreso'
                                                ? Colors.green
                                                : Colors.red,
                                        fontWeight: FontWeight.bold,
                                      ),
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
          context.push('/cash-flow/add');
        },
        action: 'create',
        resource: 'finanzas',
        icon: Icons.add,
        tooltip: 'Agregar Flujo',
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
            '\$${amount.toStringAsFixed(2)}',
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
}
