import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:isar/isar.dart';
import '../../src/app_routes.dart';
import '../../models/pedido.dart';

class OrdersView extends ConsumerStatefulWidget {
  const OrdersView({super.key});

  @override
  ConsumerState<OrdersView> createState() => _OrdersViewState();
}

class _OrdersViewState extends ConsumerState<OrdersView> {
  String _filtroSeleccionado = 'Todos';
  List<Pedido> _pedidos = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadPedidos();
  }

  Future<void> _loadPedidos() async {
    setState(() {
      _isLoading = true;
    });
    final isar = Isar.getInstance();
    if (isar == null) {
      setState(() {
        _pedidos = [];
        _isLoading = false;
      });
      return;
    }
    List<Pedido> pedidos = await isar.pedidos.where().sortByFechaDesc().findAll();
    setState(() {
      _pedidos = pedidos;
      _isLoading = false;
    });
  }

  List<Pedido> _getPedidosFiltrados() {
    if (_filtroSeleccionado == 'Todos') return _pedidos;
    return _pedidos.where((p) => (p.estado ?? 'Pendiente') == _filtroSeleccionado).toList();
  }

  @override
  Widget build(BuildContext context) {
    final pedidosFiltrados = _getPedidosFiltrados();

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          // NUEVO: Descripción de la sección de pedidos
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              color: Colors.blueGrey[900],
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  'En esta sección puedes consultar y gestionar los pedidos realizados por tus clientes. Crea nuevos pedidos, revisa su estado y mantén el control de las ventas.',
                  style: const TextStyle(color: Colors.white70, fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          // Header con filtros
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[900],
              border: Border(bottom: BorderSide(color: Colors.grey[700]!)),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Gestión de Pedidos',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange[700],
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        final result = await context.push(AppRoutes.orderAdd);
                        if (result == true) _loadPedidos();
                      },
                      icon: const Icon(Icons.add),
                      tooltip: 'Nuevo Pedido',
                    ),
                    PopupMenuButton<String>(
                      onSelected: (value) {
                        setState(() {
                          _filtroSeleccionado = value;
                        });
                      },
                      itemBuilder: (context) => [
                        const PopupMenuItem(
                          value: 'Todos',
                          child: Text('Todos los pedidos'),
                        ),
                        const PopupMenuItem(
                          value: 'Pendiente',
                          child: Text('Pendientes'),
                        ),
                        const PopupMenuItem(
                          value: 'Aprobado',
                          child: Text('Aprobados'),
                        ),
                        const PopupMenuItem(
                          value: 'En Proceso',
                          child: Text('En Proceso'),
                        ),
                        const PopupMenuItem(
                          value: 'Completado',
                          child: Text('Completados'),
                        ),
                        const PopupMenuItem(
                          value: 'Cancelado',
                          child: Text('Cancelados'),
                        ),
                      ],
                      child: Chip(
                        label: Text(_filtroSeleccionado),
                        avatar: const Icon(Icons.filter_list),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // Estadísticas rápidas
                Row(
                  children: [
                    Expanded(
                      child: _buildStatCard(
                        'Total Pedidos',
                        '${_pedidos.length}',
                        Icons.receipt_long,
                        Colors.orange,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildStatCard(
                        'Pendientes',
                        '${_pedidos.where((p) => (p.estado ?? 'Pendiente') == 'Pendiente').length}',
                        Icons.pending,
                        Colors.red,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildStatCard(
                        'Completados',
                        '${_pedidos.where((p) => (p.estado ?? '') == 'Completado').length}',
                        Icons.check_circle,
                        Colors.green,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Contenido principal
          Expanded(
            child: DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  TabBar(
                    labelColor: Colors.orange[700],
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: Colors.orange[700],
                    tabs: const [
                      Tab(text: 'Pedidos', icon: Icon(Icons.receipt_long)),
                      Tab(text: 'Análisis', icon: Icon(Icons.analytics)),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        // Tab de Pedidos
                        _isLoading
                            ? const Center(child: CircularProgressIndicator())
                            : pedidosFiltrados.isEmpty
                                ? Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.receipt_long_outlined,
                                          size: 64,
                                          color: Colors.grey[600],
                                        ),
                                        const SizedBox(height: 16),
                                        Text(
                                          'No hay pedidos registrados',
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.grey[300],
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          'Crea tu primer pedido',
                                          style: TextStyle(color: Colors.grey[400]),
                                        ),
                                        const SizedBox(height: 24),
                                        ElevatedButton.icon(
                                          onPressed: () async {
                                            final result = await context.push(AppRoutes.orderAdd);
                                            if (result == true) _loadPedidos();
                                          },
                                          icon: const Icon(Icons.add_shopping_cart),
                                          label: const Text('Nuevo Pedido'),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.orange[700],
                                            foregroundColor: Colors.white,
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 24,
                                              vertical: 12,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : ListView.separated(
                                    padding: const EdgeInsets.all(16),
                                    itemCount: pedidosFiltrados.length,
                                    separatorBuilder: (_, __) => const Divider(height: 1),
                                    itemBuilder: (context, index) {
                                      final pedido = pedidosFiltrados[index];
                                      return ListTile(
                                        leading: const Icon(Icons.receipt_long, color: Colors.orange),
                                        title: Text('Pedido #${pedido.id}'),
                                        subtitle: Text(
                                          'Fecha: ${pedido.fecha?.toString().substring(0, 16) ?? '-'}\n'
                                          'Total: \$${pedido.total?.toStringAsFixed(2) ?? '0.00'}',
                                        ),
                                        trailing: Text(pedido.estado ?? 'Pendiente'),
                                        onTap: () {
                                          // Aquí puedes mostrar detalles del pedido
                                        },
                                      );
                                    },
                                  ),
                        // Tab de Análisis
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.analytics_outlined,
                                size: 64,
                                color: Colors.grey[600],
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Sin datos de análisis',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey[300],
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Los análisis de pedidos aparecerán aquí',
                                style: TextStyle(color: Colors.grey[400]),
                              ),
                              const SizedBox(height: 24),
                              ElevatedButton.icon(
                                onPressed: () {
                                  context.push(AppRoutes.reports);
                                },
                                icon: const Icon(Icons.analytics),
                                label: const Text('Ver Reportes'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.purple[700],
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 24,
                                    vertical: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(height: 6),
            Text(
              value,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            Text(
              title,
              style: TextStyle(fontSize: 10, color: Colors.grey[400]),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
