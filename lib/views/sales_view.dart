import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tienda_app/src/app_routes.dart';

class SalesView extends ConsumerStatefulWidget {
  const SalesView({super.key});

  @override
  ConsumerState<SalesView> createState() => _SalesViewState();
}

class _SalesViewState extends ConsumerState<SalesView> {
  bool _isLoading = false;
  String _filtroSeleccionado = 'Todas';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ventas'),
        backgroundColor: Colors.blue[700],
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              context.push(AppRoutes.saleAdd);
            },
            icon: const Icon(Icons.add),
            tooltip: 'Nueva Venta',
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
                        'Gestión de Ventas',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[700],
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
                          value: 'Todas',
                          child: Text('Todas las ventas'),
                        ),
                        const PopupMenuItem(
                          value: 'Pendientes',
                          child: Text('Pendientes'),
                        ),
                        const PopupMenuItem(
                          value: 'Completadas',
                          child: Text('Completadas'),
                        ),
                        const PopupMenuItem(
                          value: 'Canceladas',
                          child: Text('Canceladas'),
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
                        'Total Ventas',
                        '0',
                        Icons.point_of_sale,
                        Colors.blue,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildStatCard(
                        'Ventas Hoy',
                        '0',
                        Icons.today,
                        Colors.green,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildStatCard(
                        'Ingresos',
                        '\$0.00',
                        Icons.attach_money,
                        Colors.orange,
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
                    labelColor: Colors.blue[700],
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: Colors.blue[700],
                    tabs: const [
                      Tab(text: 'Ventas', icon: Icon(Icons.point_of_sale)),
                      Tab(text: 'Carrito', icon: Icon(Icons.shopping_cart)),
                      Tab(text: 'Historial', icon: Icon(Icons.history)),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        // Tab de Ventas
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.point_of_sale_outlined,
                                size: 64,
                                color: Colors.grey[400],
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'No hay ventas registradas',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey[600],
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Crea tu primera venta desde el carrito',
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
                                      context.push(AppRoutes.saleAdd);
                                    },
                                    icon: const Icon(Icons.add_shopping_cart),
                                    label: const Text('Nueva Venta'),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blue[700],
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
                                'Agrega productos al carrito para crear una venta',
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
                        
                        // Tab de Historial
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.history,
                                size: 64,
                                color: Colors.grey[400],
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Sin historial',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey[600],
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'El historial de ventas aparecerá aquí',
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
