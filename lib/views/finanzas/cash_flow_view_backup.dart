import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../models/flujo_caja.dart';
import '../../services/isar_service.dart';
import '../../widgets/permission_widget.dart';
import 'fixed_expenses_view.dart';

// Cambia la declaración de CashFlowView para que extienda de ConsumerStatefulWidget
class CashFlowView extends ConsumerStatefulWidget {
  const CashFlowView({super.key});

  @override
  ConsumerState<CashFlowView> createState() => _CashFlowViewState();
}

class _CashFlowViewState extends ConsumerState<CashFlowView> {
  List<FlujoCaja> _flujos = [];
  bool _isLoading = true;
  String _filtroSeleccionado = 'Todos';
  int _tabIndex = 0;

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
        .fold(0.0, (total, flujo) => total + flujo.monto);
  }

  double get _totalEgresos {
    return _flujos
        .where((f) => f.tipo == 'egreso')
        .fold(0.0, (total, flujo) => total + flujo.monto);
  }

  double get _saldoNeto => _totalIngresos - _totalEgresos;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // 3 subsecciones: General, Gastos Fijos, Flujo de Caja
      initialIndex: _tabIndex,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text('Finanzas', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.black,
          iconTheme: const IconThemeData(color: Colors.white),
          bottom: TabBar(
            onTap: (i) => setState(() => _tabIndex = i),
            tabs: const [
              Tab(text: 'General', icon: Icon(Icons.analytics)),
              Tab(text: 'Gastos Fijos', icon: Icon(Icons.receipt_long)),
              Tab(text: 'Flujo de Caja', icon: Icon(Icons.swap_vert)),
            ],
          ),
        ),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            // Tab 1: General (Resumen de dinero de todas las áreas)
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Card(
                    color: Colors.blueGrey[900],
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        'Resumen financiero general: aquí puedes ver el saldo total, ingresos, egresos y movimientos de todas las áreas del negocio (ventas, compras, caja, gastos fijos, etc). Usa los filtros para analizar el flujo de dinero global.',
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Expanded(child: _buildGeneralTab(context)),
              ],
            ),
            // Tab 2: Gastos Fijos
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Card(
                    color: Colors.red[900],
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        'Aquí puedes registrar y consultar los gastos fijos del negocio (alquiler, servicios, sueldos, etc). Los gastos fijos se agregan automáticamente como egresos en las fechas que configures.',
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Expanded(child: FixedExpensesView()),
              ],
            ),
            // Tab 3: Flujo de Caja
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Card(
                    color: Colors.orange[900],
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        'En esta sección puedes ver y registrar los movimientos de caja física, ingresos y egresos diarios. Controla el efectivo disponible y el historial de movimientos de caja.',
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Expanded(child: _buildFlujoCajaTab(context)),
              ],
            ),
          ],
        ),
        floatingActionButton: _buildFAB(context),
      ),
    );
  }

  Widget _buildGeneralTab(BuildContext context) {
    // Aquí puedes mostrar el resumen de dinero de todas las áreas del negocio
    // Ejemplo: ingresos/egresos totales, saldo neto, lista de movimientos generales
    return _isLoading
        ? const Center(child: CircularProgressIndicator())
        : Column(
          children: [
            Card(
              margin: const EdgeInsets.all(16),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Text(
                      'Resumen General',
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
                          color: _saldoNeto >= 0 ? Colors.green : Colors.red,
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
                                  _saldoNeto >= 0 ? Colors.green : Colors.red,
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
            // Lista de movimientos generales (puedes combinar ventas, compras, caja, etc)
            Expanded(
              child:
                  _flujosFiltrados.isEmpty
                      ? const Center(
                        child: Text(
                          'No hay movimientos registrados',
                          style: TextStyle(color: Colors.white70),
                        ),
                      )
                      : ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(flujo.categoria ?? 'Sin categoría'),
                                  Text(
                                    '${flujo.fecha.day}/${flujo.fecha.month}/${flujo.fecha.year}',
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                              trailing: Text(
                                '\$${flujo.monto.toStringAsFixed(2)}',
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
        );
  }

  Widget _buildFlujoCajaTab(BuildContext context) {
    return _isLoading
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
                          color: _saldoNeto >= 0 ? Colors.green : Colors.red,
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
                                  _saldoNeto >= 0 ? Colors.green : Colors.red,
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
                        padding: const EdgeInsets.symmetric(horizontal: 16),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(flujo.categoria ?? 'Sin categoría'),
                                  Text(
                                    '${flujo.fecha.day}/${flujo.fecha.month}/${flujo.fecha.year}',
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                              trailing: Text(
                                '\$${flujo.monto.toStringAsFixed(2)}',
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
        );
  }

  Widget? _buildFAB(BuildContext context) {
    if (_tabIndex == 0) {
      // General
      return PermissionFAB(
        onPressed: () {
          context.push('/finanzas/add-flujo');
        },
        action: 'create',
        resource: 'finanzas',
        icon: Icons.add,
        tooltip: 'Agregar Movimiento General',
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      );
    }
    if (_tabIndex == 1) {
      // Gastos fijos
      return FloatingActionButton.extended(
        icon: const Icon(Icons.add),
        label: const Text('Agregar Gasto Fijo'),
        onPressed: () {
          context.push('/finanzas/add-gasto-fijo');
        },
      );
    }
    if (_tabIndex == 2) {
      // Flujo de caja
      return PermissionFAB(
        onPressed: () {
          context.push('/finanzas/add-caja');
        },
        action: 'create',
        resource: 'finanzas',
        icon: Icons.add,
        tooltip: 'Agregar Movimiento de Caja',
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      );
    }
    return null;
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


