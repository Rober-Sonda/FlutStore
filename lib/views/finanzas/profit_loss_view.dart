import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../models/ganancia_perdida.dart';
import '../../services/isar_service.dart';
import '../../widgets/permission_widget.dart';

class ProfitLossView extends ConsumerStatefulWidget {
  const ProfitLossView({super.key});

  @override
  ConsumerState<ProfitLossView> createState() => _ProfitLossViewState();
}

class _ProfitLossViewState extends ConsumerState<ProfitLossView> {
  List<GananciaPerdida> _registros = [];
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
      final registrosRaw = await isar.gananciaPerdidas.getAll([0]);
      final registros = registrosRaw.whereType<GananciaPerdida>().toList();

      setState(() {
        _registros = registros;
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

  List<GananciaPerdida> get _registrosFiltrados {
    switch (_filtroSeleccionado) {
      case 'Ganancias':
        return _registros.where((r) => r.tipo == 'ganancia').toList();
      case 'Pérdidas':
        return _registros.where((r) => r.tipo == 'perdida').toList();
      default:
        return _registros;
    }
  }

  double get _totalGanancias {
    return _registros
        .where((r) => r.tipo == 'ganancia')
        .fold(0.0, (total, registro) => total + (registro.monto ?? 0.0));
  }

  double get _totalPerdidas {
    return _registros
        .where((r) => r.tipo == 'perdida')
        .fold(0.0, (total, registro) => total + (registro.monto ?? 0.0));
  }

  double get _utilidadNeta => _totalGanancias - _totalPerdidas;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'Ganancia y Pérdida',
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
                    value: 'Ganancias',
                    child: Text('Ganancias'),
                  ),
                  const PopupMenuItem(
                    value: 'Pérdidas',
                    child: Text('Pérdidas'),
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
                  // Resumen de ganancias y pérdidas
                  Card(
                    margin: const EdgeInsets.all(16),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          const Text(
                            'Resumen de Ganancias y Pérdidas',
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
                                  'Ganancias',
                                  _totalGanancias,
                                  Colors.green,
                                  Icons.trending_up,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: _buildStatCard(
                                  'Pérdidas',
                                  _totalPerdidas,
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
                                  _utilidadNeta >= 0
                                      ? Colors.green.withOpacity(0.1)
                                      : Colors.red.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color:
                                    _utilidadNeta >= 0
                                        ? Colors.green
                                        : Colors.red,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Utilidad Neta:',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '\$${_utilidadNeta.toStringAsFixed(2)}',
                                  style: TextStyle(
                                    color:
                                        _utilidadNeta >= 0
                                            ? Colors.green
                                            : Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (_totalGanancias > 0) ...[
                            const SizedBox(height: 8),
                            Text(
                              'Margen de ganancia: ${((_utilidadNeta / _totalGanancias) * 100).toStringAsFixed(1)}%',
                              style: TextStyle(
                                color:
                                    _utilidadNeta >= 0
                                        ? Colors.green
                                        : Colors.red,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                  // Lista de registros
                  Expanded(
                    child:
                        _registrosFiltrados.isEmpty
                            ? const Center(
                              child: Text(
                                'No hay registros de ganancias y pérdidas',
                                style: TextStyle(color: Colors.white70),
                              ),
                            )
                            : ListView.builder(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              itemCount: _registrosFiltrados.length,
                              itemBuilder: (context, index) {
                                final registro = _registrosFiltrados[index];
                                return Card(
                                  margin: const EdgeInsets.only(bottom: 8),
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      backgroundColor:
                                          registro.tipo == 'ganancia'
                                              ? Colors.green
                                              : Colors.red,
                                      child: Icon(
                                        registro.tipo == 'ganancia'
                                            ? Icons.trending_up
                                            : Icons.trending_down,
                                        color: Colors.white,
                                      ),
                                    ),
                                    title: Text(
                                      registro.descripcion ?? 'Sin descripción',
                                    ),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          registro.categoria ?? 'Sin categoría',
                                        ),
                                        if (registro.fecha != null)
                                          Text(
                                            '${registro.fecha!.day}/${registro.fecha!.month}/${registro.fecha!.year}',
                                            style: const TextStyle(
                                              fontSize: 12,
                                            ),
                                          ),
                                      ],
                                    ),
                                    trailing: Text(
                                      '\$${(registro.monto ?? 0.0).toStringAsFixed(2)}',
                                      style: TextStyle(
                                        color:
                                            registro.tipo == 'ganancia'
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
          context.push('/profit-loss/add');
        },
        action: 'create',
        resource: 'finanzas',
        icon: Icons.add,
        tooltip: 'Agregar Registro',
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
