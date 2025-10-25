import 'package:flutter/material.dart';
import '../../widgets/app_design_system.dart';
import '../../widgets/theme_switcher.dart';

class ProfessionalAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final bool centerTitle;
  final PreferredSizeWidget? bottom;
  final bool showThemeSwitcher;

  const ProfessionalAppBar({
    super.key,
    required this.title,
    this.actions,
    this.centerTitle = true,
    this.bottom,
    this.showThemeSwitcher = true,
  });

  @override
  Widget build(BuildContext context) {
    final defaultActions = <Widget>[
      if (showThemeSwitcher) ...[
        const ThemeSwitcher(),
        const SizedBox(width: 8),
      ],
      if (actions != null) ...actions!,
      const SizedBox(width: 16),
    ];

    return AppBar(
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Icono de la sección
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppDesignSystem.navAccent.withOpacity(0.2),
                  AppDesignSystem.navActive.withOpacity(0.1),
                ],
              ),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: AppDesignSystem.navAccent.withOpacity(0.3),
                width: 1,
              ),
            ),
            child: Icon(
              _getIconForTitle(title),
              size: 20,
              color: AppDesignSystem.navAccent,
            ),
          ),
          const SizedBox(width: 12),
          // Título
          Text(
            title,
            style: AppDesignSystem.headingMd(
              color:
                  AppDesignSystem.isDark
                      ? Colors.white
                      : AppDesignSystem.navPrimary,
            ).copyWith(fontWeight: FontWeight.w700, letterSpacing: 0.5),
          ),
        ],
      ),
      centerTitle: centerTitle,
      elevation: 0,
      scrolledUnderElevation: 8,
      backgroundColor: Colors.transparent,
      foregroundColor:
          AppDesignSystem.isDark ? Colors.white : AppDesignSystem.navPrimary,
      surfaceTintColor: AppDesignSystem.navAccent.withOpacity(0.1),
      shadowColor:
          AppDesignSystem.isDark
              ? Colors.black26
              : AppDesignSystem.navPrimary.withOpacity(0.1),
      actions: defaultActions.isNotEmpty ? defaultActions : null,
      bottom: bottom,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors:
                AppDesignSystem.isDark
                    ? [
                      AppDesignSystem.navPrimary,
                      AppDesignSystem.navSecondary.withOpacity(0.9),
                    ]
                    : [Colors.white, Colors.grey.shade50],
          ),
          boxShadow: [
            BoxShadow(
              color:
                  AppDesignSystem.isDark
                      ? Colors.black38
                      : AppDesignSystem.navPrimary.withOpacity(0.08),
              blurRadius: 12,
              offset: const Offset(0, 4),
              spreadRadius: 2,
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color:
                    AppDesignSystem.isDark
                        ? AppDesignSystem.navAccent.withOpacity(0.2)
                        : AppDesignSystem.navAccent.withOpacity(0.1),
                width: 2,
              ),
            ),
          ),
        ),
      ),
    );
  }

  IconData _getIconForTitle(String title) {
    switch (title.toLowerCase()) {
      case 'dashboard':
      case 'panel de control':
        return Icons.dashboard_rounded;
      case 'productos':
      case 'products':
        return Icons.inventory_2_rounded;
      case 'clientes':
      case 'clients':
        return Icons.people_rounded;
      case 'ventas':
      case 'sales':
        return Icons.receipt_long_rounded;
      case 'compras':
      case 'purchases':
        return Icons.shopping_cart_rounded;
      case 'reportes':
      case 'reports':
        return Icons.analytics_rounded;
      case 'usuarios':
      case 'users':
        return Icons.group_rounded;
      case 'roles':
        return Icons.security_rounded;
      case 'configuración':
      case 'settings':
        return Icons.settings_rounded;
      case 'categorías':
      case 'categories':
        return Icons.category_rounded;
      case 'proveedores':
      case 'providers':
        return Icons.business_rounded;
      case 'finanzas':
      case 'finances':
        return Icons.account_balance_rounded;
      default:
        return Icons.business_center_rounded;
    }
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + (bottom?.preferredSize.height ?? 0.0));
}
