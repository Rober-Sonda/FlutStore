import 'package:flutter/material.dart';
import 'package:tienda_app/models/app_theme.dart';
import 'package:tienda_app/models/font_config.dart';
import '../widgets/dashboard_section.dart';
import '../widgets/sales_chart.dart';
import '../widgets/top_products_list.dart';

class SalesAnalysisSection extends StatelessWidget {
  final List<Map<String, dynamic>> salesData;
  final List<Map<String, dynamic>> topProducts;
  final Map<String, dynamic> stats;
  final AppTheme theme;
  final FontConfig fontConfig;
  final VoidCallback? onTap;
  final bool isDesktop;

  const SalesAnalysisSection({
    super.key,
    required this.salesData,
    required this.topProducts,
    required this.stats,
    required this.theme,
    required this.fontConfig,
    this.onTap,
    required this.isDesktop,
  });

  @override
  Widget build(BuildContext context) {
    return DashboardSection(
      title: '📊 Análisis de Ventas',
      subtitle: 'Tendencias y patrones de venta',
      theme: theme,
      fontConfig: fontConfig,
      onTap: onTap,
      children: [
        if (isDesktop) ...[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: SalesChart(
                  salesData: salesData,
                  theme: theme,
                  fontConfig: fontConfig,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: TopProductsList(
                  topProducts: topProducts,
                  theme: theme,
                  fontConfig: fontConfig,
                ),
              ),
            ],
          ),
        ] else ...[
          SalesChart(
            salesData: salesData,
            theme: theme,
            fontConfig: fontConfig,
          ),
          const SizedBox(height: 16),
          TopProductsList(
            topProducts: topProducts,
            theme: theme,
            fontConfig: fontConfig,
          ),
        ],
      ],
    );
  }
}
