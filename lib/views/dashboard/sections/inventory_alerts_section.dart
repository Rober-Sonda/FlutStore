import 'package:flutter/material.dart';
import 'package:tienda_app/models/app_theme.dart';
import 'package:tienda_app/models/font_config.dart';
import '../widgets/dashboard_section.dart';
import '../widgets/metric_card.dart';

class InventoryAlertsSection extends StatelessWidget {
  final Map<String, dynamic> stats;
  final List<Map<String, dynamic>> stockAlerts;
  final AppTheme theme;
  final FontConfig fontConfig;
  final VoidCallback? onTap;
  final bool isDesktop;
  final bool isTablet;

  const InventoryAlertsSection({
    super.key,
    required this.stats,
    required this.stockAlerts,
    required this.theme,
    required this.fontConfig,
    this.onTap,
    required this.isDesktop,
    required this.isTablet,
  });

  List<Widget> _buildAlertCards() {
    // Obtén los datos desde los seeds (ejemplo: stats generado por seeds)
    return [
      MetricCard(
        title: 'Productos críticos',
        value: '${stats['productosCriticos'] ?? 0}', // valor de seed
        icon: Icons.warning,
        color: Colors.red,
        trend: 0,
        theme: theme,
        fontConfig: fontConfig,
      ),
      MetricCard(
        title: 'Stock bajo',
        value: '${stats['productosBajoStock'] ?? 0}',
        icon: Icons.error_outline,
        color: Colors.orange,
        trend: 0,
        theme: theme,
        fontConfig: fontConfig,
      ),
      MetricCard(
        title: 'Sin stock',
        value: '${stats['productosSinStock'] ?? 0}',
        icon: Icons.remove_shopping_cart,
        color: Colors.grey,
        trend: 0,
        theme: theme,
        fontConfig: fontConfig,
      ),
      MetricCard(
        title: 'Total productos',
        value: '${stats['productos'] ?? 0}',
        icon: Icons.inventory_2,
        color: Colors.blueGrey,
        trend: 0,
        theme: theme,
        fontConfig: fontConfig,
      ),
      // Ejemplo de datos adicionales
      MetricCard(
        title: 'Nuevos productos',
        value: '${stats['productosNuevos'] ?? 0}',
        icon: Icons.new_releases,
        color: Colors.green,
        trend: stats['tendenciaNuevos'] ?? 0,
        theme: theme,
        fontConfig: fontConfig,
      ),
      MetricCard(
        title: 'Productos en oferta',
        value: '${stats['productosOferta'] ?? 0}',
        icon: Icons.local_offer,
        color: Colors.purple,
        trend: stats['tendenciaOferta'] ?? 0,
        theme: theme,
        fontConfig: fontConfig,
      ),
    ];
  }

  Widget _buildAlertCardsRow() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children:
            _buildAlertCards()
                .map(
                  (card) => Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: card,
                  ),
                )
                .toList(),
      ),
    );
  }

  Widget _buildStockAlertsPageView() {
    // Usa stockAlerts generado por seeds
    if (stockAlerts.isEmpty) return const SizedBox.shrink();
    return Column(
      children: [
        SizedBox(
          height: 180,
          child: PageView.builder(
            itemCount: (stockAlerts.length / 3).ceil(),
            itemBuilder: (context, pageIndex) {
              final startIndex = pageIndex * 3;
              final endIndex = (startIndex + 3).clamp(0, stockAlerts.length);
              final pageAlerts = stockAlerts.sublist(
                startIndex,
                endIndex,
              ); // datos de seed

              return Row(
                children:
                    pageAlerts.map((alerta) {
                      return SizedBox(
                        width: 200,
                        child: Card(
                          color: theme.surfaceColor,
                          elevation: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.warning,
                                      color: alerta['color'] ?? Colors.orange,
                                      size: 18,
                                    ),
                                    const SizedBox(width: 6),
                                    Expanded(
                                      child: Text(
                                        alerta['nivel'] ?? 'Bajo',
                                        style: TextStyle(
                                          color:
                                              alerta['color'] ?? Colors.orange,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  alerta['nombre'] ??
                                      'Producto sin nombre', // dato de seed
                                  style: TextStyle(
                                    color: theme.textColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Categoría: ${alerta['categoria'] ?? 'Sin categoría'}',
                                  style: TextStyle(
                                    color: theme.textSecondaryColor,
                                    fontSize: 11,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Stock: ${alerta['stock'] ?? 0} | \$${(alerta['precio'] as double?)?.toStringAsFixed(2) ?? '0.00'}',
                                  style: TextStyle(
                                    color: theme.textSecondaryColor,
                                    fontSize: 11,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                // Ejemplo de datos adicionales en la alerta
                                const SizedBox(height: 4),
                                Text(
                                  'Proveedor: ${alerta['proveedor'] ?? 'Desconocido'}',
                                  style: TextStyle(
                                    color: theme.textSecondaryColor,
                                    fontSize: 11,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  'Fecha ingreso: ${alerta['fechaIngreso'] ?? 'N/A'}',
                                  style: TextStyle(
                                    color: theme.textSecondaryColor,
                                    fontSize: 11,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
              );
            },
          ),
        ),
        if (stockAlerts.length > 3)
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                (stockAlerts.length / 3).ceil(),
                (index) => Container(
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        index == 0
                            ? theme.accentColor
                            : theme.textSecondaryColor.withOpacity(0.3),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // Todos los datos provienen de los seeds (stats, stockAlerts)
    // Los datos stats y stockAlerts deben provenir de los providers que usan los seeds
    // Ejemplo de uso en el dashboard_view.dart:
    // final stats = ref.watch(statsProvider); // stats calculados desde seeds
    // final stockAlerts = ref.watch(stockAlertsProvider); // alertas generadas desde seeds
    return DashboardSection(
      title: '🚨 Alertas de Inventario',
      subtitle: 'Productos con problemas de stock',
      theme: theme,
      fontConfig: fontConfig,
      onTap: onTap,
      children: [
        _buildAlertCardsRow(),
        const SizedBox(height: 16),
        _buildStockAlertsPageView(),
      ],
    );
  }
}
