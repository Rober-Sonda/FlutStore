import 'package:flutter/material.dart';
import 'package:tienda_app/models/app_theme.dart';
import 'package:tienda_app/models/font_config.dart';
import '../widgets/dashboard_section.dart';
import '../widgets/metric_card.dart';

class OperationsSection extends StatelessWidget {
  final Map<String, dynamic> stats;
  final AppTheme theme;
  final FontConfig fontConfig;
  final VoidCallback? onTap;
  final bool isDesktop;
  final bool isTablet;

  const OperationsSection({
    super.key,
    required this.stats,
    required this.theme,
    required this.fontConfig,
    this.onTap,
    required this.isDesktop,
    required this.isTablet,
  });

  @override
  Widget build(BuildContext context) {
    return DashboardSection(
      title: '⚡ Operaciones y Productividad',
      subtitle: 'Métricas de eficiencia operativa',
      theme: theme,
      fontConfig: fontConfig,
      onTap: onTap,
      children: [
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: isDesktop ? 3 : (isTablet ? 2 : 1),
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 2.2,
          children: [
            MetricCard(
              title: 'Pedidos del Mes',
              value: '${stats['pedidosMes'] ?? 0}',
              icon: Icons.shopping_bag,
              color: Colors.indigo,
              trend: 0,
              theme: theme,
              fontConfig: fontConfig,
            ),
            MetricCard(
              title: 'Promedio por Venta',
              value:
                  '\$${stats['promedioVenta']?.toStringAsFixed(2) ?? '0.00'}',
              icon: Icons.assessment,
              color: Colors.teal,
              trend: 0,
              theme: theme,
              fontConfig: fontConfig,
            ),
            MetricCard(
              title: 'Tasa Conversión',
              value: '${stats['tasaConversion']?.toStringAsFixed(1) ?? '0.0'}%',
              icon: Icons.people,
              color: Colors.cyan,
              trend: 0,
              theme: theme,
              fontConfig: fontConfig,
            ),
          ],
        ),
      ],
    );
  }
}
