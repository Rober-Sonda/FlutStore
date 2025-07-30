import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tienda_app/src/app_routes.dart';

class OrdersView extends ConsumerStatefulWidget {
  const OrdersView({super.key});

  @override
  ConsumerState<OrdersView> createState() => _OrdersViewState();
}

class _OrdersViewState extends ConsumerState<OrdersView> {
  bool _isLoading = false;
  String _filtroSeleccionado = 'Todos';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pedidos'),
        backgroundColor: Colors.orange[700],
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              context.push(AppRoutes.orderAdd);
            },
            icon: const Icon(Icons.add),
            tooltip: 'Nuevo Pedido',
          ),
        ],
      ),
      body: Column(
        children: [
          // Header con filtros
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              border: Border(
                bottom: BorderSide(color: Colors.grey[300]!),
              ),
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
                          value: 'Pendientes',
                          child: Text('Pendientes'),
                        ),
                        const PopupMenuItem(
                          value: 'Aprobados',
                          child: Text('Aprobados'),
                        ),
                        const PopupMenuItem(
                          value: 'En Proceso',
                          child: Text('En Proceso'),
                        ),
                        const PopupMenuItem(
                          value: 'Completados',
                          child: Text('Completados'),
                        ),
                        const PopupMenuItem(
                          value: 'Cancelados',
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
                        '0',
                        Icons.receipt_long,
                        Colors.orange,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildStatCard(
                        'Pendientes',
                        '0',
                        Icons.pending,
                        Colors.red,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildStatCard(
                        'Completados',
                        '0',
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
              length: 3,
              child: Column(
                children: [
                  TabBar(
                    labelColor: Colors.orange[700],
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: Colors.orange[700],
                    tabs: const [
                      Tab(text: 'Pedidos', icon: Icon(Icons.receipt_long)),
                      Tab(text: 'Carrito', icon: Icon(Icons.shopping_cart)),
                      Tab(text: 'Análisis', icon: Icon(Icons.analytics)),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        // Tab de Pedidos
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.receipt_long_outlined,
                                size: 64,
                                color: Colors.grey[400],
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'No hay pedidos registrados',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey[600],
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Crea tu primer pedido desde el carrito',
                                style: TextStyle(
                                  color: Colors.grey[500],
                                ),
                              ),
                              const SizedBox(height: 24),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton.icon(
                                    onPressed: () {
                                      context.push(AppRoutes.orderAdd);
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
                                  const SizedBox(width: 16),
                                  ElevatedButton.icon(
                                    onPressed: () {
                                      context.push(AppRoutes.carritoCompra);
                                    },
                                    icon: const Icon(Icons.shopping_cart),
                                    label: const Text('Ver Carrito'),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blue[700],
                                      foregroundColor: Colors.white,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 24,
                                        vertical: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        
                        // Tab de Carrito
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.shopping_cart_outlined,
                                size: 64,
                                color: Colors.grey[400],
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Carrito vacío',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey[600],
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Agrega productos al carrito para crear un pedido',
                                style: TextStyle(
                                  color: Colors.grey[500],
                                ),
                              ),
                              const SizedBox(height: 24),
                              ElevatedButton.icon(
                                onPressed: () {
                                  context.push(AppRoutes.products);
                                },
                                icon: const Icon(Icons.inventory),
                                label: const Text('Ver Productos'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green[700],
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
                        
                        // Tab de Análisis
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.analytics_outlined,
                                size: 64,
                                color: Colors.grey[400],
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Sin datos de análisis',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey[600],
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Los análisis de pedidos aparecerán aquí',
                                style: TextStyle(
                                  color: Colors.grey[500],
                                ),
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
              style: TextStyle(fontSize: 10, color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
