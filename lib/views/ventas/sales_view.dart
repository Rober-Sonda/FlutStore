import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tienda_app/src/app_routes.dart';
import 'widgets/stat_card.dart';
import 'widgets/empty_state.dart';

class SalesView extends ConsumerStatefulWidget {
  const SalesView({super.key});

  @override
  ConsumerState<SalesView> createState() => _SalesViewState();
}

class _SalesViewState extends ConsumerState<SalesView> {
  final bool _isLoading = false;
  String _filtroSeleccionado = 'Todas';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
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
                        'Gestión de Ventas',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[700],
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        context.push(AppRoutes.saleAdd);
                      },
                      icon: const Icon(Icons.add),
                      tooltip: 'Nueva Venta',
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
                      child: StatCard(
                        title: 'Total Ventas',
                        value: '0',
                        icon: Icons.point_of_sale,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: StatCard(
                        title: 'Ventas Hoy',
                        value: '0',
                        icon: Icons.today,
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: StatCard(
                        title: 'Ingresos',
                        value: '\$0.00',
                        icon: Icons.attach_money,
                        color: Colors.orange,
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
                        EmptyState(
                          title: 'No hay ventas registradas',
                          subtitle: 'Crea tu primera venta desde el carrito',
                          actionText: 'Nueva Venta',
                          icon: Icons.point_of_sale_outlined,
                          color: Colors.blue[700]!,
                          onAction: () => context.push(AppRoutes.saleAdd),
                        ),

                        // Tab de Carrito
                        EmptyState(
                          title: 'Carrito vacío',
                          subtitle:
                              'Agrega productos al carrito para crear una venta',
                          actionText: 'Ver Productos',
                          icon: Icons.shopping_cart_outlined,
                          color: Colors.green[700]!,
                          onAction: () => context.push(AppRoutes.products),
                        ),

                        // Tab de Historial
                        EmptyState(
                          title: 'Sin historial',
                          subtitle: 'El historial de ventas aparecerá aquí',
                          actionText: 'Ver Reportes',
                          icon: Icons.history,
                          color: Colors.purple[700]!,
                          onAction: () => context.push(AppRoutes.reports),
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
}
