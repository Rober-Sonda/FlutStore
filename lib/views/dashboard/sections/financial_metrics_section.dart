import 'package:flutter/material.dart';
import '../../../models/app_theme.dart';
import '../../../models/font_config.dart';
import '../widgets/dashboard_section.dart';
import '../widgets/metric_card.dart';

class FinancialMetricsSection extends StatelessWidget {
  final Map<String, dynamic> stats;
  final AppTheme theme;
  final FontConfig fontConfig;
  final VoidCallback? onTap;
  final bool isDesktop;
  final bool isTablet;

  const FinancialMetricsSection({
    super.key,
    required this.stats,
    required this.theme,
    required this.fontConfig,
    this.onTap,
    required this.isDesktop,
    required this.isTablet,
  });

  List<Widget> _buildMetricCards() {
    return [
      MetricCard(
        title: 'Ventas del Mes',
        value: '\$${stats['totalVentasMes']?.toStringAsFixed(2) ?? '0.00'}',
        icon: Icons.attach_money,
        color: Colors.green,
        trend: stats['crecimientoVentas'] ?? 0,
        theme: theme,
        fontConfig: fontConfig,
      ),
      MetricCard(
        title: 'Ganancia',
        value: '\$${stats['gananciaMes']?.toStringAsFixed(2) ?? '0.00'}',
        icon: Icons.trending_up,
        color: Colors.blue,
        trend: stats['margenGanancia'] ?? 0,
        theme: theme,
        fontConfig: fontConfig,
      ),
      MetricCard(
        title: 'Margen',
        value: '${stats['margenGanancia']?.toStringAsFixed(1) ?? '0.0'}%',
        icon: Icons.analytics,
        color: Colors.purple,
        trend: 0,
        theme: theme,
        fontConfig: fontConfig,
      ),
      MetricCard(
        title: 'Valor Inventario',
        value: '\$${stats['valorInventario']?.toStringAsFixed(2) ?? '0.00'}',
        icon: Icons.inventory,
        color: Colors.orange,
        trend: 0,
        theme: theme,
        fontConfig: fontConfig,
      ),
    ];
  }

  Widget _buildMetricsRow() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children:
            _buildMetricCards()
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

  @override
  Widget build(BuildContext context) {
    return DashboardSection(
      title: 'ðŸ“Š MÃ©tricas Financieras',
      subtitle: 'Rendimiento econÃ³mico del negocio',
      theme: theme,
      fontConfig: fontConfig,
      onTap: onTap,
      children: [_buildMetricsRow()],
    );
  }
}

