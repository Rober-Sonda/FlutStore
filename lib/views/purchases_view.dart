// lib/views/purchases_view.dart (pantalla dummy para Compras)
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tienda_app/src/app_routes.dart';

class PurchasesView extends ConsumerStatefulWidget {
  const PurchasesView({super.key});

  @override
  ConsumerState<PurchasesView> createState() => _PurchasesViewState();
}

class _PurchasesViewState extends ConsumerState<PurchasesView> {
  bool _isLoading = false;
  String _filtroSeleccionado = 'Todas';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Compras'),
        backgroundColor: Colors.green[700],
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              context.push(AppRoutes.purchaseAdd);
            },
            icon: const Icon(Icons.add),
            tooltip: 'Nueva Compra',
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
              border: Border(bottom: BorderSide(color: Colors.grey[300]!)),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Gestión de Compras',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.green[700],
                        ),
                      ),
                    ),
                    PopupMenuButton<String>(
                      onSelected: (value) {
                        setState(() {
                          _filtroSeleccionado = value;
                        });
                      },
                      itemBuilder:
                          (context) => [
                            const PopupMenuItem(
                              value: 'Todas',
                              child: Text('Todas las compras'),
                            ),
                            const PopupMenuItem(
                              value: 'Pendientes',
                              child: Text('Pendientes'),
                            ),
                            const PopupMenuItem(
                              value: 'Completadas',
                              child: Text('Completadas'),
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
                        'Total Compras',
                        '0',
                        Icons.shopping_cart,
                        Colors.green,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildStatCard(
                        'Pedidos Disponibles',
                        '0',
                        Icons.receipt_long,
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
              length: 2,
              child: Column(
                children: [
                  TabBar(
                    labelColor: Colors.green[700],
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: Colors.green[700],
                    tabs: const [
                      Tab(text: 'Compras', icon: Icon(Icons.shopping_cart)),
                      Tab(
                        text: 'Pedidos Disponibles',
                        icon: Icon(Icons.receipt_long),
                      ),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        // Tab de Compras
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
                                'No hay compras registradas',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey[600],
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Crea tu primera compra o convierte un pedido',
                                style: TextStyle(color: Colors.grey[500]),
                              ),
                              const SizedBox(height: 24),
                              ElevatedButton.icon(
                                onPressed: () {
                                  context.push(AppRoutes.purchaseAdd);
                                },
                                icon: const Icon(Icons.add_shopping_cart),
                                label: const Text('Crear Primera Compra'),
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

                        // Tab de Pedidos Disponibles
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
                                'No hay pedidos disponibles',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey[600],
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Los pedidos aparecerán aquí para convertirlos en compras',
                                style: TextStyle(color: Colors.grey[500]),
                              ),
                              const SizedBox(height: 24),
                              ElevatedButton.icon(
                                onPressed: () {
                                  context.push(AppRoutes.orders);
                                },
                                icon: const Icon(Icons.receipt_long),
                                label: const Text('Ver Pedidos'),
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
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(icon, color: color, size: 32),
            const SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            Text(
              title,
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
