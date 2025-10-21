import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../models/app_theme.dart';
import '../../../models/font_config.dart';
import '../../../src/app_routes.dart';
import '../widgets/dashboard_section.dart';
import '../widgets/action_button.dart';

class QuickActionsSection extends StatelessWidget {
  final AppTheme theme;
  final FontConfig fontConfig;
  final bool isDesktop;
  final bool isTablet;

  const QuickActionsSection({
    super.key,
    required this.theme,
    required this.fontConfig,
    required this.isDesktop,
    required this.isTablet,
  });

  @override
  Widget build(BuildContext context) {
    return DashboardSection(
      title: 'âš¡ Acciones RÃ¡pidas',
      subtitle: 'Acceso directo a funciones principales',
      theme: theme,
      fontConfig: fontConfig,
      onTap: null,
      children: [
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: isDesktop ? 4 : (isTablet ? 2 : 1),
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.5,
          children: [
            ActionButton(
              title: 'Agregar Producto',
              icon: Icons.add_shopping_cart,
              onTap: () => context.push(AppRoutes.productAdd),
              color: Colors.green,
              theme: theme,
              fontConfig: fontConfig,
            ),
            ActionButton(
              title: 'Nuevo Pedido',
              icon: Icons.shopping_bag,
              onTap: () => context.push(AppRoutes.orderAdd),
              color: Colors.blue,
              theme: theme,
              fontConfig: fontConfig,
            ),
            ActionButton(
              title: 'Nuevo Cliente',
              icon: Icons.person_add,
              onTap: () => context.push(AppRoutes.clientAdd),
              color: Colors.purple,
              theme: theme,
              fontConfig: fontConfig,
            ),
            ActionButton(
              title: 'Ver Reportes',
              icon: Icons.analytics,
              onTap: () => context.push(AppRoutes.reports),
              color: Colors.orange,
              theme: theme,
              fontConfig: fontConfig,
            ),
          ],
        ),
      ],
    );
  }
}

