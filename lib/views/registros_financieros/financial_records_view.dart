import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../src/app_routes.dart';
import '../../widgets/permission_widget.dart';
import '../../models/registrofinanciero.dart';
import '../../services/isar_service.dart';

class FinancialRecordsView extends ConsumerStatefulWidget {
  const FinancialRecordsView({super.key});

  @override
  ConsumerState<FinancialRecordsView> createState() =>
      _FinancialRecordsViewState();
}

class _FinancialRecordsViewState extends ConsumerState<FinancialRecordsView> {
  List<RegistroFinanciero> _registros = [];
  bool _isLoading = true;
  String _filtroSeleccionado = 'Todos';
  String _vistaSeleccionada = 'registros'; // 'registros' o 'analisis'

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      setState(() => _isLoading = true);

      final isar = await ref.read(isarServiceProvider).db;
      final registrosRaw = await isar.registroFinancieros.getAll([0]);
      final registros = registrosRaw.whereType<RegistroFinanciero>().toList();

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

  List<RegistroFinanciero> get _registrosFiltrados {
    switch (_filtroSeleccionado) {
      case 'Ingresos':
        return _registros.where((r) => r.tipo == 'ingreso').toList();
      case 'Egresos':
        return _registros.where((r) => r.tipo == 'egreso').toList();
      case 'Pendientes':
        return _registros.where((r) => r.estado == 'pendiente').toList();
      case 'Confirmados':
        return _registros.where((r) => r.estado == 'confirmado').toList();
      default:
        return _registros;
    }
  }

  // Cálculos para análisis
  double get _totalIngresos {
    return _registros
        .where((r) => r.tipo == 'ingreso' && r.estado == 'confirmado')
        .fold(0.0, (total, registro) => total + registro.monto);
  }

  double get _totalEgresos {
    return _registros
        .where((r) => r.tipo == 'egreso' && r.estado == 'confirmado')
        .fold(0.0, (total, registro) => total + registro.monto);
  }

  double get _utilidadNeta => _totalIngresos - _totalEgresos;

  double get _totalPendientes {
    return _registros
        .where((r) => r.estado == 'pendiente')
        .fold(0.0, (total, registro) => total + registro.monto);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'Registros Financieros',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          // Botón para cambiar entre vistas
          IconButton(
            icon: Icon(
              _vistaSeleccionada == 'registros' ? Icons.analytics : Icons.list,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                _vistaSeleccionada =
                    _vistaSeleccionada == 'registros'
                        ? 'analisis'
                        : 'registros';
              });
            },
            tooltip:
                _vistaSeleccionada == 'registros'
                    ? 'Ver Análisis'
                    : 'Ver Registros',
          ),
          // Filtro
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
                  const PopupMenuItem(
                    value: 'Pendientes',
                    child: Text('Pendientes'),
                  ),
                  const PopupMenuItem(
                    value: 'Confirmados',
                    child: Text('Confirmados'),
                  ),
                ],
          ),
        ],
      ),
      body:
          _isLoading
              ? const Center(
                child: CircularProgressIndicator(color: Colors.white),
              )
              : _vistaSeleccionada == 'registros'
              ? _buildRegistrosView()
              : _buildAnalisisView(),
      floatingActionButton: PermissionFAB(
        onPressed: () {
          context.go(AppRoutes.financialRecordAdd);
        },
        action: 'create',
        resource: 'finanzas',
        icon: Icons.add,
        tooltip: 'Agregar Registro',
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
    );
  }

  Widget _buildRegistrosView() {
    if (_registrosFiltrados.isEmpty) {
      return const Center(
        child: Text(
          'No hay registros financieros.',
          style: TextStyle(color: Colors.white),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _registrosFiltrados.length,
      itemBuilder: (context, index) {
        final registro = _registrosFiltrados[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          color: Colors.grey[900],
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor:
                  registro.tipo == 'ingreso' ? Colors.green : Colors.red,
              child: Icon(
                registro.tipo == 'ingreso'
                    ? Icons.trending_up
                    : Icons.trending_down,
                color: Colors.white,
              ),
            ),
            title: Text(
              registro.concepto,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  registro.descripcion ?? '',
                  style: TextStyle(color: Colors.grey[400]),
                ),
                Text(
                  '${registro.fecha.day}/${registro.fecha.month}/${registro.fecha.year}',
                  style: TextStyle(color: Colors.grey[400]),
                ),
              ],
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  registro.montoFormateado,
                  style: TextStyle(
                    color:
                        registro.tipo == 'ingreso' ? Colors.green : Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color:
                        registro.estado == 'confirmado'
                            ? Colors.green
                            : Colors.orange,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    registro.estado.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            onTap: () {
              context.go('${AppRoutes.financialRecordEdit}/${registro.id}');
            },
          ),
        );
      },
    );
  }

  Widget _buildAnalisisView() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Resumen de ganancias y pérdidas
          Card(
            color: Colors.grey[900],
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Análisis de Ganancias y Pérdidas',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: _buildMetricCard(
                          'Total Ingresos',
                          _totalIngresos,
                          Colors.green,
                          Icons.trending_up,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildMetricCard(
                          'Total Egresos',
                          _totalEgresos,
                          Colors.red,
                          Icons.trending_down,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: _buildMetricCard(
                          'Utilidad Neta',
                          _utilidadNeta,
                          _utilidadNeta >= 0 ? Colors.green : Colors.red,
                          Icons.account_balance,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildMetricCard(
                          'Pendientes',
                          _totalPendientes,
                          Colors.orange,
                          Icons.pending,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Gráfico de distribución por categorías
          Card(
            color: Colors.grey[900],
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Distribución por Categorías',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildCategoriaChart(),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Lista de registros recientes
          Card(
            color: Colors.grey[900],
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Registros Recientes',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ..._registros
                      .take(5)
                      .map((registro) => _buildRegistroItem(registro)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMetricCard(
    String title,
    double value,
    Color color,
    IconData icon,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 8),
          Text(title, style: TextStyle(color: Colors.grey[400], fontSize: 12)),
          const SizedBox(height: 4),
          Text(
            '\$${value.abs().toStringAsFixed(2)}',
            style: TextStyle(
              color: color,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoriaChart() {
    final categorias = <String, double>{};

    for (final registro in _registros) {
      categorias[registro.categoria] =
          (categorias[registro.categoria] ?? 0) + registro.monto;
    }

    return Column(
      children:
          categorias.entries.map((entry) {
            final porcentaje =
                _totalIngresos > 0 ? (entry.value / _totalIngresos * 100) : 0.0;

            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      entry.key.toUpperCase(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: LinearProgressIndicator(
                      value: porcentaje / 100,
                      backgroundColor: Colors.grey[700],
                      valueColor: AlwaysStoppedAnimation<Color>(
                        entry.value >= 0 ? Colors.green : Colors.red,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    flex: 1,
                    child: Text(
                      '${porcentaje.toStringAsFixed(1)}%',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
    );
  }

  Widget _buildRegistroItem(RegistroFinanciero registro) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Icon(
            registro.tipo == 'ingreso'
                ? Icons.trending_up
                : Icons.trending_down,
            color: registro.tipo == 'ingreso' ? Colors.green : Colors.red,
            size: 16,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              registro.concepto,
              style: const TextStyle(color: Colors.white),
            ),
          ),
          Text(
            registro.montoFormateado,
            style: TextStyle(
              color: registro.tipo == 'ingreso' ? Colors.green : Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
