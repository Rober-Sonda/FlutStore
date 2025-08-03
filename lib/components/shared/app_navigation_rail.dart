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
  int _hoveredIndex = -1;

  final List<_NavItemData> _items = const [
    _NavItemData(
      icon: Icons.dashboard_rounded,
      label: 'Dashboard',
      route: AppRoutes.dashboard,
      color: Color(0xFF6366F1), // Indigo moderno
    ),
    _NavItemData(
      icon: Icons.inventory_2_rounded,
      label: 'Productos',
      route: AppRoutes.products,
      color: Color(0xFF10B981), // Emerald moderno
    ),
    _NavItemData(
      icon: Icons.category_rounded,
      label: 'Categorías',
      route: AppRoutes.categories,
      color: Color(0xFF8B5CF6), // Violet moderno
    ),
    _NavItemData(
      icon: Icons.local_shipping_rounded,
      label: 'Proveedores',
      route: AppRoutes.providers,
      color: Color(0xFFF59E0B), // Amber moderno
    ),
    _NavItemData(
      icon: Icons.shopping_cart_rounded,
      label: 'Compras',
      route: AppRoutes.purchases,
      color: Color(0xFFEF4444), // Red moderno
    ),
    _NavItemData(
      icon: Icons.inventory_2_outlined,
      label: 'Pedidos Proveedores',
      route: AppRoutes.pedidosProveedor,
      color: Color(0xFF8B5CF6), // Violet moderno
    ),
    _NavItemData(
      icon: Icons.shopping_basket_rounded,
      label: 'Carrito Compra',
      route: AppRoutes.carritoCompra,
      color: Color(0xFF6B7280), // Gray moderno
    ),
    _NavItemData(
      icon: Icons.assignment_rounded,
      label: 'Pedidos',
      route: AppRoutes.orders,
      color: Color(0xFFEC4899), // Pink moderno
    ),
    _NavItemData(
      icon: Icons.people_rounded,
      label: 'Clientes',
      route: AppRoutes.clients,
      color: Color(0xFF06B6D4), // Cyan moderno
    ),
    _NavItemData(
      icon: Icons.account_balance_wallet_rounded,
      label: 'Cuenta Corriente',
      route: AppRoutes.accountBalance,
      color: Color(0xFF84CC16), // Lime moderno
    ),
    _NavItemData(
      icon: Icons.point_of_sale_rounded,
      label: 'Ventas',
      route: AppRoutes.sales,
      color: Color(0xFFDC2626), // Red-600 moderno
    ),
    _NavItemData(
      icon: Icons.inventory_rounded,
      label: 'Mov. Stock',
      route: AppRoutes.stockMovements,
      color: Color(0xFF7C3AED), // Violet-600 moderno
    ),
    _NavItemData(
      icon: Icons.attach_money_rounded,
      label: 'Finanzas',
      route: AppRoutes.financialRecords,
      color: Color(0xFF059669), // Emerald-600 moderno
    ),
    _NavItemData(
      icon: Icons.analytics_rounded,
      label: 'Informes',
      route: AppRoutes.reports,
      color: Color(0xFF7C2D12), // Orange-900 moderno
    ),
    _NavItemData(
      icon: Icons.admin_panel_settings_rounded,
      label: 'Roles',
      route: AppRoutes.roles,
      color: Color(0xFF1E40AF), // Blue-800 moderno
    ),
    _NavItemData(
      icon: Icons.people_alt_rounded,
      label: 'Usuarios',
      route: AppRoutes.users,
      color: Color(0xFF0D9488), // Teal-600 moderno
    ),
    _NavItemData(
      icon: Icons.settings_rounded,
      label: 'Configuración',
      route: AppRoutes.settings,
      color: Color(0xFF6B7280), // Gray-500 moderno
    ),
    // Nuevas secciones
    _NavItemData(
      icon: Icons.local_offer_rounded,
      label: 'Ofertas',
      route: AppRoutes.offers,
      color: Color(0xFFFCD34D), // Yellow-300 moderno
    ),
    _NavItemData(
      icon: Icons.account_balance_rounded,
      label: 'Flujo de Caja',
      route: AppRoutes.cashFlow,
      color: Color(0xFF34D399), // Emerald-400 moderno
    ),
    _NavItemData(
      icon: Icons.trending_up_rounded,
      label: 'Ganancias y Pérdidas',
      route: AppRoutes.profitLoss,
      color: Color(0xFFF472B6), // Pink-400 moderno
    ),
    _NavItemData(
      icon: Icons.point_of_sale_rounded,
      label: 'Cierre de Caja',
      route: AppRoutes.cashRegister,
      color: Color(0xFF60A5FA), // Blue-400 moderno
    ),
    _NavItemData(
      icon: Icons.card_giftcard_rounded,
      label: 'Sorteos',
      route: AppRoutes.sweepstakes,
      color: Color(0xFFA78BFA), // Violet-400 moderno
    ),
    _NavItemData(
      icon: Icons.schedule_rounded,
      label: 'Gastos Fijos',
      route: AppRoutes.fixedExpenses,
      color: Color(0xFF5EEAD4), // Teal-300 moderno
    ),
  ];

  @override
  void initState() {
    super.initState();
    _loadTheme();
  }

  @override
  void dispose() {
    super.dispose();
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
    final railWidth = isCompact ? 80.0 : 240.0;

    return Container(
      width: railWidth,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            theme.surfaceColor,
            theme.surfaceColor.withOpacity(0.95),
            theme.surfaceColor,
          ],
        ),
        border: Border(
          right: BorderSide(
            color: theme.textSecondaryColor.withOpacity(0.1),
            width: 1,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color:
                theme.isDark
                    ? Colors.black.withOpacity(0.4)
                    : Colors.grey.withOpacity(0.15),
            blurRadius: 20,
            offset: const Offset(4, 0),
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        children: [
          // Modern Header with Animated Logo
          Container(
            padding: EdgeInsets.symmetric(vertical: isCompact ? 20 : 24),
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border(
                bottom: BorderSide(
                  color: theme.textSecondaryColor.withOpacity(0.1),
                  width: 1,
                ),
              ),
            ),
            child: Column(
              children: [
                // Static Logo Container (sin animaciones)
                Container(
                  width: isCompact ? 48 : 64,
                  height: isCompact ? 48 : 64,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Main icon
                      Icon(
                        Icons.storefront_rounded,
                        size: isCompact ? 24 : 32,
                        color: Colors.black,
                      ),
                      // Shine effect
                      Positioned(
                        top: 4,
                        left: 4,
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (!isCompact) ...[
                  const SizedBox(height: 16),
                  // Static Typography (sin gradientes)
                  Text(
                    'NAJAM',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 2.0,
                      fontSize: 24,
                      fontFamily: fontConfig.titleFont,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.3),
                        width: 1,
                      ),
                    ),
                    child: Text(
                      'TIENDA OFICIAL',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 10,
                        letterSpacing: 1.2,
                        fontFamily: fontConfig.bodyFont,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),

          // Modern Navigation Items
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final itemHeight = (constraints.maxHeight - 40) / _items.length;
                final minItemHeight = 52.0;
                final actualItemHeight =
                    itemHeight < minItemHeight ? minItemHeight : itemHeight;

                return ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  itemCount: _items.length,
                  itemBuilder: (context, index) {
                    final item = _items[index];
                    final selected = _selectedIndex == index;
                    final isHovered = _hoveredIndex == index;

                    return MouseRegion(
                      cursor: SystemMouseCursors.click,
                      onEnter: (_) => setState(() => _hoveredIndex = index),
                      onExit: (_) => setState(() => _hoveredIndex = -1),
                      child: GestureDetector(
                        onTap: () {
                          setState(() => _selectedIndex = index);
                          _onTap(context, index);
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          height: actualItemHeight,
                          margin: EdgeInsets.symmetric(
                            horizontal: isCompact ? 6 : 12,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: isCompact ? 12 : 20),
                              // Icon with modern styling
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Icon(
                                  item.icon,
                                  color:
                                      selected
                                          ? item.color
                                          : isHovered
                                          ? item.color.withOpacity(0.8)
                                          : item.color.withOpacity(0.6),
                                  size:
                                      selected
                                          ? (isCompact ? 24 : 28)
                                          : (isCompact ? 20 : 24),
                                ),
                              ),
                              if (!isCompact) ...[
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.label,
                                        style: TextStyle(
                                          color:
                                              selected
                                                  ? item.color
                                                  : isHovered
                                                  ? item.color.withOpacity(0.8)
                                                  : item.color.withOpacity(0.6),
                                          fontWeight:
                                              selected
                                                  ? FontWeight.w700
                                                  : FontWeight.w500,
                                          fontSize: 15,
                                          fontFamily: fontConfig.bodyFont,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                              // Selection indicator or hover indicator
                              if (selected || isHovered)
                                Container(
                                  width: 4,
                                  height: 24,
                                  margin: EdgeInsets.only(
                                    right: isCompact ? 8 : 16,
                                  ),
                                  decoration: BoxDecoration(
                                    color: item.color,
                                    borderRadius: BorderRadius.circular(2),
                                    boxShadow:
                                        selected
                                            ? [
                                              BoxShadow(
                                                color: item.color.withOpacity(
                                                  0.5,
                                                ),
                                                blurRadius: 4,
                                                offset: const Offset(0, 1),
                                              ),
                                            ]
                                            : null,
                                  ),
                                ),
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

          // Modern Bottom Actions
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: isCompact ? 8 : 16,
              vertical: 12,
            ),
            child: Column(
              children: [
                // Logout button
                Container(
                  width: double.infinity,
                  height: isCompact ? 40 : 48,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        theme.errorColor.withOpacity(0.1),
                        theme.errorColor.withOpacity(0.05),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: theme.errorColor.withOpacity(0.2),
                      width: 1,
                    ),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {
                        // lógica logout
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.logout_rounded,
                            size: isCompact ? 18 : 22,
                            color: theme.errorColor,
                          ),
                          if (!isCompact) ...[
                            const SizedBox(width: 8),
                            Text(
                              'Cerrar Sesión',
                              style: TextStyle(
                                color: theme.errorColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                fontFamily: fontConfig.bodyFont,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                ),
                if (!isCompact) ...[
                  const SizedBox(height: 8),
                  // Profile button
                  Container(
                    width: double.infinity,
                    height: 48,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          theme.primaryColor.withOpacity(0.1),
                          theme.primaryColor.withOpacity(0.05),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: theme.primaryColor.withOpacity(0.2),
                        width: 1,
                      ),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: () {
                          context.go(AppRoutes.profile);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.account_circle_rounded,
                              size: 22,
                              color: theme.primaryColor,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Mi Perfil',
                              style: TextStyle(
                                color: theme.primaryColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                fontFamily: fontConfig.bodyFont,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(height: 16),
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
