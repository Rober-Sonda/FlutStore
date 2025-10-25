import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../src/app_routes.dart';
import '../../services/app_config_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/app_theme.dart';
import '../../models/font_config.dart';
import '../../services/permission_service.dart';
import '../../services/auth_service.dart';
import '../../providers/carrito_provider.dart';

class AppNavigationRail extends ConsumerStatefulWidget {
  const AppNavigationRail({super.key});

  @override
  ConsumerState<AppNavigationRail> createState() => _AppNavigationRailState();
}

class _AppNavigationRailState extends ConsumerState<AppNavigationRail> {
  AppTheme? _currentTheme;
  FontConfig? _currentFontConfig;
  Set<String> _expandedCategories = {};
  List<_NavCategory> _filteredCategories = [];
  bool _isLoadingPermissions = true;
  String? _selectedRoute;

  // Nueva estructura jerarquizada basada en principios UX/UI
  final List<_NavCategory> _allCategories = const [
    // 📊 PANEL - Centro de control principal
    _NavCategory(
      id: 'panel',
      icon: Icons.dashboard_rounded,
      label: 'Panel',
      color: Color(0xFF6366F1),
      items: [
        _NavItemData(
          icon: Icons.analytics_outlined,
          label: 'Dashboard',
          route: AppRoutes.dashboard,
          resource: 'dashboard',
          action: 'read',
        ),
      ],
    ),

    // 🏪 INVENTARIO - Gestión de productos y stock
    _NavCategory(
      id: 'inventario',
      icon: Icons.inventory_2_rounded,
      label: 'Inventario',
      color: Color(0xFF10B981),
      items: [
        _NavItemData(
          icon: Icons.shopping_bag_outlined,
          label: 'Productos',
          route: AppRoutes.products,
          resource: 'productos',
          action: 'read',
        ),
        _NavItemData(
          icon: Icons.category_outlined,
          label: 'Categorías',
          route: AppRoutes.categories,
          resource: 'categorias',
          action: 'read',
        ),
        _NavItemData(
          icon: Icons.swap_horiz_rounded,
          label: 'Movimientos Stock',
          route: AppRoutes.stockMovements,
          resource: 'stock',
          action: 'read',
        ),
      ],
    ),

    // 🤝 COMERCIAL - Clientes y ventas
    _NavCategory(
      id: 'comercial',
      icon: Icons.store_rounded,
      label: 'Comercial',
      color: Color(0xFF06B6D4),
      items: [
        _NavItemData(
          icon: Icons.people_outline,
          label: 'Clientes',
          route: AppRoutes.clients,
          resource: 'clientes',
          action: 'read',
        ),
        _NavItemData(
          icon: Icons.point_of_sale_outlined,
          label: 'Ventas',
          route: AppRoutes.sales,
          resource: 'ventas',
          action: 'read',
        ),
        _NavItemData(
          icon: Icons.assignment_outlined,
          label: 'Pedidos Cliente',
          route: AppRoutes.orders,
          resource: 'pedidos',
          action: 'read',
        ),
        _NavItemData(
          icon: Icons.account_balance_outlined,
          label: 'Cuenta Corriente',
          route: AppRoutes.accountBalance,
          resource: 'cuenta_corriente',
          action: 'read',
        ),
      ],
    ),

    // 📦 COMPRAS - Proveedores y adquisiciones
    _NavCategory(
      id: 'compras',
      icon: Icons.local_shipping_rounded,
      label: 'Compras',
      color: Color(0xFFF59E0B),
      items: [
        _NavItemData(
          icon: Icons.business_outlined,
          label: 'Proveedores',
          route: AppRoutes.providers,
          resource: 'proveedores',
          action: 'read',
        ),
        _NavItemData(
          icon: Icons.shopping_cart_outlined,
          label: 'Órdenes de Compra',
          route: AppRoutes.purchases,
          resource: 'compras',
          action: 'read',
        ),
        _NavItemData(
          icon: Icons.receipt_long_outlined,
          label: 'Pedidos Proveedores',
          route: AppRoutes.pedidosProveedor,
          resource: 'pedidos',
          action: 'read',
        ),
        _NavItemData(
          icon: Icons.shopping_basket_outlined,
          label: 'Carrito Compras',
          route: AppRoutes.carritoCompra,
          resource: 'carrito',
          action: 'read',
        ),
      ],
    ),

    // 💰 FINANZAS - Gestión financiera y reportes
    _NavCategory(
      id: 'finanzas',
      icon: Icons.attach_money_rounded,
      label: 'Finanzas',
      color: Color(0xFF059669),
      items: [
        _NavItemData(
          icon: Icons.receipt_outlined,
          label: 'Registros Financieros',
          route: AppRoutes.financialRecords,
          resource: 'finanzas',
          action: 'read',
        ),
        _NavItemData(
          icon: Icons.assessment_outlined,
          label: 'Informes',
          route: AppRoutes.reports,
          resource: 'reportes',
          action: 'read',
        ),
        _NavItemData(
          icon: Icons.local_offer_outlined,
          label: 'Ofertas',
          route: AppRoutes.offers,
          resource: 'ofertas',
          action: 'read',
        ),
        _NavItemData(
          icon: Icons.card_giftcard_outlined,
          label: 'Sorteos',
          route: AppRoutes.sweepstakes,
          resource: 'sorteos',
          action: 'read',
        ),
      ],
    ),

    // ⚙️ GESTIÓN - Administración del sistema
    _NavCategory(
      id: 'gestion',
      icon: Icons.settings_rounded,
      label: 'Gestión',
      color: Color(0xFF6B7280),
      items: [
        _NavItemData(
          icon: Icons.people_alt_outlined,
          label: 'Usuarios',
          route: AppRoutes.users,
          resource: 'usuarios',
          action: 'read',
        ),
        _NavItemData(
          icon: Icons.admin_panel_settings_outlined,
          label: 'Roles y Permisos',
          route: AppRoutes.roles,
          resource: 'roles',
          action: 'read',
        ),
        _NavItemData(
          icon: Icons.tune_outlined,
          label: 'Configuración',
          route: AppRoutes.settings,
          resource: 'configuracion',
          action: 'read',
        ),
      ],
    ),
  ];

  @override
  void initState() {
    super.initState();
    _loadTheme();
    _filterItemsByPermissions();
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

  Future<void> _filterItemsByPermissions() async {
    setState(() {
      _isLoadingPermissions = true;
    });

    final currentUser = ref.read(currentUserProvider);
    final permissionService = ref.read(permissionServiceProvider);

    if (currentUser == null) {
      setState(() {
        _filteredCategories = [];
        _isLoadingPermissions = false;
      });
      return;
    }

    final filteredCategories = <_NavCategory>[];

    for (final category in _allCategories) {
      final filteredItems = <_NavItemData>[];

      for (final item in category.items) {
        final hasPermission = await permissionService.canPerformAction(
          currentUser,
          item.action,
          item.resource,
        );
        if (hasPermission) {
          filteredItems.add(item);
        }
      }

      // Solo incluir categorías que tengan al menos un item con permisos
      if (filteredItems.isNotEmpty) {
        filteredCategories.add(
          _NavCategory(
            id: category.id,
            icon: category.icon,
            label: category.label,
            color: category.color,
            items: filteredItems,
          ),
        );
      }
    }

    setState(() {
      _filteredCategories = filteredCategories;
      _isLoadingPermissions = false;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateSelectedRoute(context);
  }

  @override
  void didUpdateWidget(covariant AppNavigationRail oldWidget) {
    super.didUpdateWidget(oldWidget);
    _updateSelectedRoute(context);
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = ref.watch(currentUserProvider);
    final theme = _currentTheme ?? AppTheme.darkTheme;
    final fontConfig = _currentFontConfig ?? FontConfig.defaultConfig;
    final screenWidth = MediaQuery.of(context).size.width;
    final isCompact = screenWidth < 1200;
    final railWidth = isCompact ? 80.0 : 240.0;

    final carrito = ref.watch(carritoProvider);

    if (currentUser != null &&
        _filteredCategories.isEmpty &&
        !_isLoadingPermissions) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _filterItemsByPermissions();
      });
    }

    if (_isLoadingPermissions) {
      return Container(
        width: railWidth,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              theme.surfaceColor,
              theme.surfaceColor.withValues(alpha: 0.95),
              theme.surfaceColor,
            ],
          ),
        ),
        child: const Center(
          child: CircularProgressIndicator(color: Colors.white),
        ),
      );
    }

    return Container(
      width: railWidth,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            theme.surfaceColor,
            theme.surfaceColor.withValues(alpha: 0.95),
            theme.surfaceColor,
          ],
        ),
        border: Border(
          right: BorderSide(
            color: theme.textSecondaryColor.withValues(alpha: 0.1),
            width: 1,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color:
                theme.isDark
                    ? Colors.black.withValues(alpha: 0.4)
                    : Colors.grey.withValues(alpha: 0.15),
            blurRadius: 20,
            offset: const Offset(4, 0),
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        children: [
          // Header - Diseño más moderno y fluido
          Container(
            padding: EdgeInsets.symmetric(
              vertical: isCompact ? 24 : 32,
              horizontal: isCompact ? 8 : 16,
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white.withValues(alpha: 0.05),
                  Colors.transparent,
                ],
              ),
              border: Border(
                bottom: BorderSide(
                  color: Colors.white.withValues(alpha: 0.08),
                  width: 1,
                ),
              ),
            ),
            child: Column(
              children: [
                // Logo mejorado con gradiente
                Container(
                  width: isCompact ? 52 : 72,
                  height: isCompact ? 52 : 72,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF6366F1), // Indigo
                        Color(0xFF8B5CF6), // Violet
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.2),
                        blurRadius: 16,
                        offset: const Offset(0, 4),
                        spreadRadius: 2,
                      ),
                      BoxShadow(
                        color: const Color(0xFF6366F1).withValues(alpha: 0.3),
                        blurRadius: 24,
                        offset: const Offset(0, 8),
                        spreadRadius: -4,
                      ),
                    ],
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Icon(
                        Icons.storefront_rounded,
                        size: isCompact ? 28 : 36,
                        color: Colors.white,
                      ),
                      // Dot de estado activo
                      Positioned(
                        top: 8,
                        right: 8,
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: const Color(0xFF10B981), // Verde éxito
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(
                                  0xFF10B981,
                                ).withValues(alpha: 0.4),
                                blurRadius: 4,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (!isCompact) ...[
                  const SizedBox(height: 20),
                  // Título con mejor tipografía
                  ShaderMask(
                    shaderCallback:
                        (bounds) => const LinearGradient(
                          colors: [Colors.white, Color(0xFFE5E7EB)],
                        ).createShader(bounds),
                    child: Text(
                      'NAJAM',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 3.0,
                        fontSize: 26,
                        fontFamily: fontConfig.titleFont,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Subtitle con mejor estilo
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.white.withValues(alpha: 0.15),
                          Colors.white.withValues(alpha: 0.05),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.2),
                        width: 1,
                      ),
                    ),
                    child: Text(
                      'TIENDA OFICIAL',
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.9),
                        fontWeight: FontWeight.w600,
                        fontSize: 11,
                        letterSpacing: 1.5,
                        fontFamily: fontConfig.bodyFont,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
          // Navigation Items - Nueva estructura jerárquica
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (_filteredCategories.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.lock_outline,
                          color: Colors.white.withValues(alpha: 0.5),
                          size: 48,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Sin permisos',
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.5),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontFamily: fontConfig.bodyFont,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'No tienes acceso a ninguna sección',
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.3),
                            fontSize: 12,
                            fontFamily: fontConfig.bodyFont,
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  itemCount: _filteredCategories.length,
                  itemBuilder: (context, categoryIndex) {
                    final category = _filteredCategories[categoryIndex];
                    final isExpanded = _expandedCategories.contains(
                      category.id,
                    );

                    return Column(
                      children: [
                        // Header de categoría
                        _buildCategoryHeader(
                          category,
                          isExpanded,
                          isCompact,
                          fontConfig,
                        ),

                        // Items de la categoría (expandible)
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          height: isExpanded ? category.items.length * 48.0 : 0,
                          child: ClipRect(
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: category.items.length,
                              itemBuilder: (context, itemIndex) {
                                final item = category.items[itemIndex];
                                final isSelected = _selectedRoute == item.route;

                                return _buildSubMenuItem(
                                  item,
                                  isSelected,
                                  isCompact,
                                  fontConfig,
                                  carrito,
                                );
                              },
                            ),
                          ),
                        ),

                        if (categoryIndex < _filteredCategories.length - 1)
                          Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            height: 1,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Colors.transparent,
                                  Colors.white.withValues(alpha: 0.1),
                                  Colors.transparent,
                                ],
                              ),
                            ),
                          ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
          // Bottom Actions - Acciones de usuario mejoradas
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: isCompact ? 8 : 16,
              vertical: 16,
            ),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Colors.white.withValues(alpha: 0.08),
                  width: 1,
                ),
              ),
            ),
            child: Column(
              children: [
                if (!isCompact) ...[
                  // Botón de Perfil mejorado
                  Container(
                    width: double.infinity,
                    height: 52,
                    margin: const EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          const Color(0xFF6366F1).withValues(alpha: 0.15),
                          const Color(0xFF6366F1).withValues(alpha: 0.05),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: const Color(0xFF6366F1).withValues(alpha: 0.2),
                        width: 1,
                      ),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(16),
                        onTap: () {
                          context.go(AppRoutes.profile);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: const Color(
                                    0xFF6366F1,
                                  ).withValues(alpha: 0.2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Icon(
                                  Icons.account_circle_outlined,
                                  size: 20,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(width: 12),
                              const Expanded(
                                child: Text(
                                  'Mi Perfil',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.chevron_right_rounded,
                                color: Colors.white.withValues(alpha: 0.6),
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],

                // Botón de Cerrar Sesión mejorado
                Container(
                  width: double.infinity,
                  height: isCompact ? 44 : 52,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        const Color(0xFFEF4444).withValues(alpha: 0.15),
                        const Color(0xFFEF4444).withValues(alpha: 0.05),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: const Color(0xFFEF4444).withValues(alpha: 0.2),
                      width: 1,
                    ),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(16),
                      onTap: () async {
                        // Confirmación antes de cerrar sesión
                        final shouldLogout = await showDialog<bool>(
                          context: context,
                          builder:
                              (context) => AlertDialog(
                                backgroundColor: Colors.grey[900],
                                title: const Text(
                                  '¿Cerrar sesión?',
                                  style: TextStyle(color: Colors.white),
                                ),
                                content: const Text(
                                  '¿Estás seguro de que quieres cerrar sesión?',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed:
                                        () => Navigator.of(context).pop(false),
                                    child: const Text('Cancelar'),
                                  ),
                                  TextButton(
                                    onPressed:
                                        () => Navigator.of(context).pop(true),
                                    child: const Text(
                                      'Cerrar Sesión',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                ],
                              ),
                        );

                        if (shouldLogout == true) {
                          final authService = ref.read(authServiceProvider);
                          await authService.logout();
                          ref.read(currentUserProvider.notifier).state = null;
                          ref.read(isAuthenticatedProvider.notifier).state =
                              false;
                          if (context.mounted) {
                            context.go('/');
                          }
                        }
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: isCompact ? 8 : 16,
                        ),
                        child: Row(
                          mainAxisAlignment:
                              isCompact
                                  ? MainAxisAlignment.center
                                  : MainAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: const Color(
                                  0xFFEF4444,
                                ).withValues(alpha: 0.2),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(
                                Icons.logout_rounded,
                                size: isCompact ? 16 : 18,
                                color: Colors.white,
                              ),
                            ),
                            if (!isCompact) ...[
                              const SizedBox(width: 12),
                              const Text(
                                'Cerrar Sesión',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  void _updateSelectedRoute(BuildContext context) {
    final uri = GoRouter.of(context).routeInformationProvider.value.uri;
    final path = uri.path;

    setState(() {
      _selectedRoute = path;
    });

    // Auto-expandir la categoría que contiene la ruta actual
    for (final category in _filteredCategories) {
      for (final item in category.items) {
        if (path == item.route || path.startsWith('${item.route}/')) {
          setState(() {
            _expandedCategories.add(category.id);
          });
          return;
        }
      }
    }
  }

  Widget _buildCategoryHeader(
    _NavCategory category,
    bool isExpanded,
    bool isCompact,
    FontConfig fontConfig,
  ) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (isExpanded) {
              _expandedCategories.remove(category.id);
            } else {
              _expandedCategories.add(category.id);
            }
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: EdgeInsets.symmetric(
            horizontal: isCompact ? 6 : 12,
            vertical: 2,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: isCompact ? 12 : 16,
            vertical: 12,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                category.color.withValues(alpha: isExpanded ? 0.15 : 0.08),
                category.color.withValues(alpha: isExpanded ? 0.08 : 0.04),
              ],
            ),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: category.color.withValues(alpha: 0.2),
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: category.color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  category.icon,
                  color: Colors.white,
                  size: isCompact ? 18 : 20,
                ),
              ),
              if (!isCompact) ...[
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    category.label,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      fontFamily: fontConfig.bodyFont,
                    ),
                  ),
                ),
                Icon(
                  isExpanded
                      ? Icons.keyboard_arrow_up_rounded
                      : Icons.keyboard_arrow_down_rounded,
                  color: Colors.white.withValues(alpha: 0.7),
                  size: 20,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSubMenuItem(
    _NavItemData item,
    bool isSelected,
    bool isCompact,
    FontConfig fontConfig,
    List carrito,
  ) {
    final isCarrito = item.label.contains('Carrito');

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedRoute = item.route;
          });
          context.go(item.route);
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: EdgeInsets.symmetric(
            horizontal: isCompact ? 10 : 16,
            vertical: 2,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: isCompact ? 8 : 12,
            vertical: 8,
          ),
          decoration: BoxDecoration(
            color:
                isSelected
                    ? Colors.white.withValues(alpha: 0.1)
                    : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            border:
                isSelected
                    ? Border.all(
                      color: Colors.white.withValues(alpha: 0.2),
                      width: 1,
                    )
                    : null,
          ),
          child: Row(
            children: [
              SizedBox(width: isCompact ? 4 : 8),
              Stack(
                children: [
                  Icon(
                    item.icon,
                    color:
                        isSelected
                            ? Colors.white
                            : Colors.white.withValues(alpha: 0.7),
                    size: isCompact ? 16 : 18,
                  ),
                  if (isCarrito && carrito.isNotEmpty)
                    Positioned(
                      right: -2,
                      top: -2,
                      child: Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                ],
              ),
              if (!isCompact) ...[
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    item.label,
                    style: TextStyle(
                      color:
                          isSelected
                              ? Colors.white
                              : Colors.white.withValues(alpha: 0.8),
                      fontWeight:
                          isSelected ? FontWeight.w600 : FontWeight.w400,
                      fontSize: 13,
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
  }
}

class _NavItemData {
  final IconData icon;
  final String label;
  final String route;
  final String resource;
  final String action;

  const _NavItemData({
    required this.icon,
    required this.label,
    required this.route,
    required this.resource,
    required this.action,
  });
}

class _NavCategory {
  final String id;
  final IconData icon;
  final String label;
  final Color color;
  final List<_NavItemData> items;

  const _NavCategory({
    required this.id,
    required this.icon,
    required this.label,
    required this.color,
    required this.items,
  });
}
