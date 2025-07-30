import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tienda_app/src/app_routes.dart';
import 'package:tienda_app/services/app_config_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tienda_app/models/app_theme.dart';
import 'package:tienda_app/models/font_config.dart';

class AppNavigationRail extends ConsumerStatefulWidget {
  const AppNavigationRail({super.key});

  @override
  ConsumerState<AppNavigationRail> createState() => _AppNavigationRailState();
}

class _AppNavigationRailState extends ConsumerState<AppNavigationRail> {
  int _selectedIndex = 0;
  AppTheme? _currentTheme;
  FontConfig? _currentFontConfig;

  final List<_NavItemData> _items = const [
    _NavItemData(
      icon: Icons.dashboard_outlined,
      label: 'Dashboard',
      route: AppRoutes.dashboard,
      color: Color(0xFF2196F3), // Azul
    ),
    _NavItemData(
      icon: Icons.store_outlined,
      label: 'Productos',
      route: AppRoutes.products,
      color: Color(0xFF4CAF50), // Verde
    ),
    _NavItemData(
      icon: Icons.category_outlined,
      label: 'Categorías',
      route: AppRoutes.categories,
      color: Color(0xFF9C27B0), // Púrpura
    ),
    _NavItemData(
      icon: Icons.local_shipping_outlined,
      label: 'Proveedores',
      route: AppRoutes.providers,
      color: Color(0xFFFF9800), // Naranja
    ),
    _NavItemData(
      icon: Icons.shopping_cart_outlined,
      label: 'Compras',
      route: AppRoutes.purchases,
      color: Color(0xFF795548), // Marrón
    ),
    _NavItemData(
      icon: Icons.shopping_basket_outlined,
      label: 'Carrito Compra',
      route: AppRoutes.carritoCompra,
      color: Color(0xFF607D8B), // Azul gris
    ),
    _NavItemData(
      icon: Icons.assignment_outlined,
      label: 'Pedidos',
      route: AppRoutes.orders,
      color: Color(0xFFE91E63), // Rosa
    ),
    _NavItemData(
      icon: Icons.person_outline,
      label: 'Clientes',
      route: AppRoutes.clients,
      color: Color(0xFF00BCD4), // Cian
    ),
    _NavItemData(
      icon: Icons.account_balance_wallet_outlined,
      label: 'Cuenta Corriente',
      route: AppRoutes.accountBalance,
      color: Color(0xFF8BC34A), // Verde claro
    ),
    _NavItemData(
      icon: Icons.point_of_sale_outlined,
      label: 'Ventas',
      route: AppRoutes.sales,
      color: Color(0xFFF44336), // Rojo
    ),
    _NavItemData(
      icon: Icons.inventory_2_outlined,
      label: 'Mov. Stock',
      route: AppRoutes.stockMovements,
      color: Color(0xFF9E9E9E), // Gris
    ),
    _NavItemData(
      icon: Icons.attach_money_outlined,
      label: 'Finanzas',
      route: AppRoutes.financialRecords,
      color: Color(0xFFFF5722), // Rojo oscuro
    ),
    _NavItemData(
      icon: Icons.insert_chart_outlined,
      label: 'Informes',
      route: AppRoutes.reports,
      color: Color(0xFF673AB7), // Púrpura oscuro
    ),
    _NavItemData(
      icon: Icons.admin_panel_settings_outlined,
      label: 'Roles',
      route: AppRoutes.roles,
      color: Color(0xFF3F51B5), // Índigo
    ),
    _NavItemData(
      icon: Icons.people_alt_outlined,
      label: 'Usuarios',
      route: AppRoutes.users,
      color: Color(0xFF009688), // Verde azulado
    ),
    _NavItemData(
      icon: Icons.settings_outlined,
      label: 'Configuración',
      route: AppRoutes.settings,
      color: Color(0xFF607D8B), // Azul gris
    ),
    // Nuevas secciones
    _NavItemData(
      icon: Icons.local_offer_outlined,
      label: 'Ofertas',
      route: AppRoutes.offers,
      color: Color(0xFFFFC107), // Amarillo
    ),
    _NavItemData(
      icon: Icons.account_balance_outlined,
      label: 'Flujo de Caja',
      route: AppRoutes.cashFlow,
      color: Color(0xFF4CAF50), // Verde
    ),
    _NavItemData(
      icon: Icons.trending_up_outlined,
      label: 'Ganancias y Pérdidas',
      route: AppRoutes.profitLoss,
      color: Color(0xFFE91E63), // Rosa
    ),
    _NavItemData(
      icon: Icons.point_of_sale_outlined,
      label: 'Cierre de Caja',
      route: AppRoutes.cashRegister,
      color: Color(0xFF2196F3), // Azul
    ),
    _NavItemData(
      icon: Icons.card_giftcard_outlined,
      label: 'Sorteos',
      route: AppRoutes.sweepstakes,
      color: Color(0xFF9C27B0), // Púrpura
    ),
    _NavItemData(
      icon: Icons.schedule_outlined,
      label: 'Gastos Fijos',
      route: AppRoutes.fixedExpenses,
      color: Color(0xFF009688), // Verde azulado
    ),
  ];

  @override
  void initState() {
    super.initState();
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    final configService = ref.read(appConfigServiceProvider);
    final theme = await configService.getSelectedTheme();
    final fontConfig = await configService.getSelectedFontConfig();

    setState(() {
      _currentTheme = theme;
      _currentFontConfig = fontConfig;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _selectedIndex = _getIndexFromRoute(context);
  }

  @override
  void didUpdateWidget(covariant AppNavigationRail oldWidget) {
    super.didUpdateWidget(oldWidget);
    final newIndex = _getIndexFromRoute(context);
    if (newIndex != _selectedIndex) {
      setState(() => _selectedIndex = newIndex);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = _currentTheme ?? AppTheme.darkTheme;
    final fontConfig = _currentFontConfig ?? FontConfig.defaultConfig;
    final screenWidth = MediaQuery.of(context).size.width;
    final isCompact = screenWidth < 1200;
    final railWidth = isCompact ? 80.0 : 200.0;

    return Container(
      width: railWidth,
      decoration: BoxDecoration(
        color: theme.surfaceColor,
        border: Border(
          right: BorderSide(
            color: theme.textSecondaryColor.withOpacity(0.2),
            width: 1,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color:
                theme.isDark
                    ? Colors.black.withOpacity(0.3)
                    : Colors.grey.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(2, 0),
          ),
        ],
      ),
      child: Column(
        children: [
          // Header
          Container(
            padding: EdgeInsets.symmetric(vertical: isCompact ? 16 : 20),
            decoration: BoxDecoration(
              color: theme.primaryColor.withOpacity(0.05),
              border: Border(
                bottom: BorderSide(
                  color: theme.textSecondaryColor.withOpacity(0.1),
                  width: 1,
                ),
              ),
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: theme.primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.storefront_rounded,
                    size: isCompact ? 32 : 40,
                    color: theme.primaryColor,
                  ),
                ),
                if (!isCompact) ...[
                  const SizedBox(height: 8),
                  Text(
                    'NAJAM',
                    style: TextStyle(
                      color: theme.primaryColor,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.1,
                      fontSize: 18,
                      fontFamily: fontConfig.titleFont,
                    ),
                  ),
                  Text(
                    'TIENDA',
                    style: TextStyle(
                      color: theme.textSecondaryColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 10,
                      letterSpacing: 0.5,
                      fontFamily: fontConfig.bodyFont,
                    ),
                  ),
                ],
              ],
            ),
          ),

          // Navigation Items
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final itemHeight = (constraints.maxHeight - 40) / _items.length;
                final minItemHeight = 48.0;
                final actualItemHeight =
                    itemHeight < minItemHeight ? minItemHeight : itemHeight;

                return ListView.builder(
                  itemCount: _items.length,
                  itemBuilder: (context, index) {
                    final item = _items[index];
                    final selected = _selectedIndex == index;

                    return MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          setState(() => _selectedIndex = index);
                          _onTap(context, index);
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          height: actualItemHeight,
                          margin: EdgeInsets.symmetric(
                            horizontal: isCompact ? 4 : 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color:
                                selected
                                    ? theme.primaryColor.withOpacity(0.15)
                                    : Colors.transparent,
                            borderRadius: BorderRadius.circular(12),
                            border:
                                selected
                                    ? Border.all(
                                      color: theme.primaryColor.withOpacity(
                                        0.3,
                                      ),
                                      width: 1,
                                    )
                                    : null,
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: isCompact ? 8 : 16),
                              Icon(
                                item.icon,
                                color:
                                    selected
                                        ? theme.primaryColor
                                        : theme.textSecondaryColor,
                                size:
                                    selected
                                        ? (isCompact ? 24 : 32)
                                        : (isCompact ? 20 : 28),
                              ),
                              if (!isCompact) ...[
                                SizedBox(width: 16),
                                Expanded(
                                  child: Text(
                                    item.label,
                                    style: TextStyle(
                                      color:
                                          selected
                                              ? theme.primaryColor
                                              : theme.textSecondaryColor,
                                      fontWeight:
                                          selected
                                              ? FontWeight.bold
                                              : FontWeight.normal,
                                      fontSize: 16,
                                      fontFamily: fontConfig.bodyFont,
                                    ),
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),

          // Bottom Actions
          Padding(
            padding: EdgeInsets.symmetric(horizontal: isCompact ? 8 : 16),
            child: Row(
              children: [
                Expanded(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: theme.primaryColor,
                      backgroundColor: theme.primaryColor.withOpacity(0.1),
                      minimumSize: Size(double.infinity, isCompact ? 36 : 44),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Icon(Icons.logout, size: isCompact ? 20 : 30),
                    onPressed: () {
                      // lógica logout
                    },
                  ),
                ),
                if (!isCompact) ...[
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: theme.primaryColor,
                        backgroundColor: theme.primaryColor.withOpacity(0.1),
                        minimumSize: const Size(double.infinity, 44),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Icon(
                        Icons.account_circle_outlined,
                        size: 30,
                      ),
                      onPressed: () {
                        context.go(AppRoutes.profile);
                      },
                    ),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  int _getIndexFromRoute(BuildContext context) {
    final uri = GoRouter.of(context).routeInformationProvider.value.uri;
    final path = uri.path;

    for (int i = 0; i < _items.length; i++) {
      // Coincidencia exacta o path segmentado
      if (path == _items[i].route || path.startsWith('${_items[i].route}/')) {
        return i;
      }
    }
    return 0;
  }

  void _onTap(BuildContext context, int index) {
    context.go(_items[index].route);
  }
}

class _NavItemData {
  final IconData icon;
  final String label;
  final String route;
  final Color color;

  const _NavItemData({
    required this.icon,
    required this.label,
    required this.route,
    required this.color,
  });
}

class NavItem extends StatelessWidget {
  final _NavItemData data;
  final bool selected;
  final bool isSelectedIcon;

  const NavItem({
    super.key,
    required this.data,
    required this.selected,
    this.isSelectedIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    final color = selected ? data.color : Colors.white70;
    final size = isSelectedIcon ? 34.0 : 30.0;
    final borderRadius = isSelectedIcon ? 0.0 : 2.0;

    return Tooltip(
      message: data.label,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 6),
            child: Icon(data.icon, size: size, color: color),
          ),
          if (selected)
            Positioned(
              top: 6,
              bottom: 6,
              right: 0,
              child: Container(
                width: 4,
                decoration: BoxDecoration(
                  color: data.color,
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
