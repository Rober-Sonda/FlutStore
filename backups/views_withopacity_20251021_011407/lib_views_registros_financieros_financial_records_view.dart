import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../src/app_routes.dart';
import '../../widgets/permission_widget.dart';
import '../../models/registrofinanciero.dart';
import '../../services/isar_service.dart';
import '../finanzas/fixed_expenses_view.dart';
import '../finanzas/cash_register_view.dart';

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
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(title: const Text('Registros Financieros')),
        body: Column(
          children: [
            // Descripción y navegación
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                color: Colors.blueGrey[900],
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      const Text(
                        'En esta sección puedes consultar y registrar todos los movimientos financieros de tu negocio: ingresos, egresos, balances y más. Utiliza los filtros para analizar el flujo de dinero y accede rápidamente al flujo de caja, caja y los gastos fijos desde aquí.',
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      TabBar(
                        indicatorColor: Colors.orange,
                        labelColor: Colors.orange,
                        unselectedLabelColor: Colors.white70,
                        tabs: const [
                          Tab(icon: Icon(Icons.analytics), text: 'General'),
                          Tab(
                            icon: Icon(Icons.receipt_long),
                            text: 'Gastos Fijos',
                          ),
                          Tab(
                            icon: Icon(Icons.account_balance_wallet),
                            text: 'Caja',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // General
                  _isLoading
                      ? const Center(
                        child: CircularProgressIndicator(color: Colors.white),
                      )
                      : _buildAnalisisView(),
                  // Gastos Fijos
                  Builder(
                    builder: (context) {
                      return Navigator(
                        onGenerateRoute:
                            (settings) => MaterialPageRoute(
                              builder: (context) => const FixedExpensesView(),
                            ),
                      );
                    },
                  ),
                  // Caja
                  Builder(
                    builder: (context) {
                      return Navigator(
                        onGenerateRoute:
                            (settings) => MaterialPageRoute(
                              builder: (context) => const CashRegisterView(),
                            ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
        // FAB correspondiente a cada sección
        floatingActionButton: Builder(
          builder: (context) {
            final tabIndex = DefaultTabController.of(context)?.index ?? 0;
            if (tabIndex == 0) {
              // General
              return PermissionFAB(
                onPressed: () {
                  context.go(AppRoutes.financialRecordAdd);
                },
                action: 'create',
                resource: 'finanzas',
                icon: Icons.add,
                tooltip: 'Agregar Registro General',
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
              );
            }
            if (tabIndex == 1) {
              // Gastos Fijos
              return PermissionFAB(
                onPressed: () {
                  context.go('/finanzas/add-gasto-fijo');
                },
                action: 'create',
                resource: 'finanzas',
                icon: Icons.add,
                tooltip: 'Agregar Gasto Fijo',
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              );
            }
            if (tabIndex == 2) {
              // Caja
              return PermissionFAB(
                onPressed: () {
                  context.go('/finanzas/add-caja');
                },
                action: 'create',
                resource: 'finanzas',
                icon: Icons.add,
                tooltip: 'Agregar Movimiento de Caja',
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              );
            }
            // Solución: Retorna un SizedBox.shrink() en vez de null
            return const SizedBox.shrink();
          },
        ),
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
