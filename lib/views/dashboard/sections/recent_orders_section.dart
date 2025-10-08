import 'package:flutter/material.dart';
import 'package:tienda_app/models/app_theme.dart';
import 'package:tienda_app/models/font_config.dart';
import '../widgets/dashboard_section.dart';
import '../widgets/recent_orders_list.dart';

class RecentOrdersSection extends StatelessWidget {
  final List<Map<String, dynamic>> recentOrders;
  final AppTheme theme;
  final FontConfig fontConfig;
  final VoidCallback? onTap;

  const RecentOrdersSection({
    super.key,
    required this.recentOrders,
    required this.theme,
    required this.fontConfig,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return DashboardSection(
      title: '🛒 Pedidos Recientes',
      subtitle: 'Últimas transacciones del negocio',
      theme: theme,
      fontConfig: fontConfig,
      onTap: onTap,
      children: [
        RecentOrdersList(
          recentOrders: recentOrders,
          theme: theme,
          fontConfig: fontConfig,
        ),
      ],
    );
  }
}
