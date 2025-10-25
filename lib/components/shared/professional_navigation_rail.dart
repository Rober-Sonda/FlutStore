import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../src/app_routes.dart';
import '../../services/permission_service.dart';
import '../../services/auth_service.dart';
import '../../widgets/app_design_system.dart';

class ProfessionalNavigationRail extends ConsumerStatefulWidget {
  const ProfessionalNavigationRail({super.key});

  @override
  ConsumerState<ProfessionalNavigationRail> createState() =>
      _ProfessionalNavigationRailState();
}

class _ProfessionalNavigationRailState
    extends ConsumerState<ProfessionalNavigationRail>
    with TickerProviderStateMixin {
  late AnimationController _slideController;
  late Animation<double> _slideAnimation;

  Set<String> _expandedCategories = {};
  List<_NavSection> _filteredSections = [];
  bool _isLoadingPermissions = true;
  String? _selectedRoute;
  bool _isCollapsed = false;

  // Nueva estructura profesional con iconografía más seria
  final List<_NavSection> _allSections = const [
    // 📊 CENTRO DE CONTROL
    _NavSection(
      id: 'control',
      icon: Icons.dashboard,
      label: 'Centro de Control',
      color: AppDesignSystem.primaryIndigo,
      priority: 0,
      items: [
        _NavItem(
          icon: Icons.analytics,
          label: 'Panel de Control',
          route: AppRoutes.dashboard,
          resource: 'dashboard',
          action: 'read',
          description: 'Métricas y KPIs principales',
        ),
      ],
    ),

    // 📦 GESTIÓN DE INVENTARIO
    _NavSection(
      id: 'inventario',
      icon: Icons.inventory,
      label: 'Inventario',
      color: AppDesignSystem.accentEmerald,
      priority: 1,
      items: [
        _NavItem(
          icon: Icons.category,
          label: 'Productos',
          route: AppRoutes.products,
          resource: 'productos',
          action: 'read',
          description: 'Catálogo de productos',
        ),
        _NavItem(
          icon: Icons.folder,
          label: 'Categorías',
          route: AppRoutes.categories,
          resource: 'categorias',
          action: 'read',
          description: 'Clasificación de productos',
        ),
        _NavItem(
          icon: Icons.swap_horiz,
          label: 'Movimientos',
          route: AppRoutes.stockMovements,
          resource: 'stock',
          action: 'read',
          description: 'Control de stock',
        ),
      ],
    ),

    // 👥 RELACIONES COMERCIALES
    _NavSection(
      id: 'comercial',
      icon: Icons.business_center,
      label: 'Comercial',
      color: AppDesignSystem.accentEmerald,
      priority: 2,
      items: [
        _NavItem(
          icon: Icons.people,
          label: 'Clientes',
          route: AppRoutes.clients,
          resource: 'clientes',
          action: 'read',
          description: 'Base de clientes',
        ),
        _NavItem(
          icon: Icons.receipt_long,
          label: 'Ventas',
          route: AppRoutes.sales,
          resource: 'ventas',
          action: 'read',
          description: 'Registro de ventas',
        ),
        _NavItem(
          icon: Icons.assignment,
          label: 'Pedidos',
          route: AppRoutes.orders,
          resource: 'pedidos',
          action: 'read',
          description: 'Gestión de pedidos',
        ),
        _NavItem(
          icon: Icons.account_balance_wallet,
          label: 'Cuenta Corriente',
          route: AppRoutes.accountBalance,
          resource: 'cuenta_corriente',
          action: 'read',
          description: 'Estados de cuenta',
        ),
      ],
    ),

    // 🏭 CADENA DE SUMINISTRO
    _NavSection(
      id: 'suministro',
      icon: Icons.local_shipping,
      label: 'Suministro',
      color: AppDesignSystem.warning,
      priority: 3,
      items: [
        _NavItem(
          icon: Icons.domain,
          label: 'Proveedores',
          route: AppRoutes.providers,
          resource: 'proveedores',
          action: 'read',
          description: 'Red de proveedores',
        ),
        _NavItem(
          icon: Icons.shopping_cart,
          label: 'Compras',
          route: AppRoutes.purchases,
          resource: 'compras',
          action: 'read',
          description: 'Órdenes de compra',
        ),
        _NavItem(
          icon: Icons.inventory_2,
          label: 'Pedidos Proveedor',
          route: AppRoutes.pedidosProveedor,
          resource: 'pedidos',
          action: 'read',
          description: 'Solicitudes pendientes',
        ),
      ],
    ),

    // 💼 FINANZAS CORPORATIVAS
    _NavSection(
      id: 'finanzas',
      icon: Icons.account_balance,
      label: 'Finanzas',
      color: Color(0xFF059669), // Emerald-600
      priority: 4,
      items: [
        _NavItem(
          icon: Icons.description,
          label: 'Registros',
          route: AppRoutes.financialRecords,
          resource: 'finanzas',
          action: 'read',
          description: 'Movimientos financieros',
        ),
        _NavItem(
          icon: Icons.bar_chart,
          label: 'Reportes',
          route: AppRoutes.reports,
          resource: 'reportes',
          action: 'read',
          description: 'Análisis financiero',
        ),
        _NavItem(
          icon: Icons.campaign,
          label: 'Promociones',
          route: AppRoutes.offers,
          resource: 'ofertas',
          action: 'read',
          description: 'Ofertas y descuentos',
        ),
      ],
    ),

    // ⚙️ ADMINISTRACIÓN GENERAL
    _NavSection(
      id: 'administracion',
      icon: Icons.admin_panel_settings,
      label: 'Administración',
      color: Color(0xFF64748B), // Slate-500
      priority: 5,
      items: [
        _NavItem(
          icon: Icons.group,
          label: 'Usuarios',
          route: AppRoutes.users,
          resource: 'usuarios',
          action: 'read',
          description: 'Gestión de usuarios',
        ),
        _NavItem(
          icon: Icons.security,
          label: 'Roles',
          route: AppRoutes.roles,
          resource: 'roles',
          action: 'read',
          description: 'Control de acceso',
        ),
        _NavItem(
          icon: Icons.settings,
          label: 'Configuración',
          route: AppRoutes.settings,
          resource: 'configuracion',
          action: 'read',
          description: 'Configuración del sistema',
        ),
      ],
    ),
  ];

  @override
  void initState() {
    super.initState();
    _slideController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _slideAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _slideController, curve: Curves.easeInOut),
    );

    _slideController.forward();
    _filterItemsByPermissions();
  }

  @override
  void dispose() {
    _slideController.dispose();
    super.dispose();
  }

  Future<void> _filterItemsByPermissions() async {
    setState(() {
      _isLoadingPermissions = true;
    });

    final currentUser = ref.read(currentUserProvider);
    final permissionService = ref.read(permissionServiceProvider);

    if (currentUser == null) {
      setState(() {
        _filteredSections = [];
        _isLoadingPermissions = false;
      });
      return;
    }

    final filteredSections = <_NavSection>[];

    for (final section in _allSections) {
      final filteredItems = <_NavItem>[];

      for (final item in section.items) {
        final hasPermission = await permissionService.canPerformAction(
          currentUser,
          item.action,
          item.resource,
        );
        if (hasPermission) {
          filteredItems.add(item);
        }
      }

      if (filteredItems.isNotEmpty) {
        filteredSections.add(
          _NavSection(
            id: section.id,
            icon: section.icon,
            label: section.label,
            color: section.color,
            priority: section.priority,
            items: filteredItems,
          ),
        );
      }
    }

    // Ordenar por prioridad
    filteredSections.sort((a, b) => a.priority.compareTo(b.priority));

    setState(() {
      _filteredSections = filteredSections;
      _isLoadingPermissions = false;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateSelectedRoute();
  }

  void _updateSelectedRoute() {
    final uri = GoRouter.of(context).routeInformationProvider.value.uri;
    final path = uri.path;

    setState(() {
      _selectedRoute = path;
    });

    // Auto-expandir la sección que contiene la ruta actual
    for (final section in _filteredSections) {
      for (final item in section.items) {
        if (path == item.route || path.startsWith('${item.route}/')) {
          setState(() {
            _expandedCategories.add(section.id);
          });
          return;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final railWidth = _isCollapsed ? 80.0 : 280.0;

    if (_isLoadingPermissions) {
      return _buildLoadingState(railWidth);
    }

    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(-1.0, 0.0),
        end: Offset.zero,
      ).animate(_slideAnimation),
      child: Container(
        width: railWidth,
        height: double.infinity,
        decoration: _buildContainerDecoration(),
        child: Column(
          children: [
            _buildHeader(),
            Expanded(child: _buildNavigationSections()),
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildLoadingState(double width) {
    return Container(
      width: width,
      decoration: _buildContainerDecoration(),
      child: const Center(
        child: CircularProgressIndicator(
          color: AppDesignSystem.primaryIndigo,
          strokeWidth: 2,
        ),
      ),
    );
  }

  BoxDecoration _buildContainerDecoration() {
    return AppDesignSystem.getNavigationDecoration();
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.all(_isCollapsed ? 16 : 24),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color:
                AppDesignSystem.isDark
                    ? AppDesignSystem.navSecondary
                    : const Color(0xFFE2E8F0),
            width: 1,
          ),
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors:
              AppDesignSystem.isDark
                  ? [
                    const Color(0xFF0F172A),
                    const Color(0xFF1E293B).withOpacity(0.8),
                  ]
                  : [Colors.white, const Color(0xFFF8FAFC)],
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              // Logo empresarial moderno
              Container(
                width: _isCollapsed ? 40 : 48,
                height: _isCollapsed ? 40 : 48,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      AppDesignSystem.navAccent,
                      AppDesignSystem.navActive,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: AppDesignSystem.navAccent.withOpacity(0.3),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Icon(
                  Icons.storefront_rounded,
                  size: _isCollapsed ? 20 : 24,
                  color: Colors.white,
                ),
              ),

              if (!_isCollapsed) ...[
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'NAJAM STORE',
                        style: AppDesignSystem.headingSm(
                          color:
                              AppDesignSystem.isDark
                                  ? AppDesignSystem.navText
                                  : AppDesignSystem.navPrimary,
                        ).copyWith(
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1.5,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              AppDesignSystem.navAccent.withOpacity(0.2),
                              AppDesignSystem.navActive.withOpacity(0.1),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: AppDesignSystem.navAccent.withOpacity(0.3),
                            width: 1,
                          ),
                        ),
                        child: Text(
                          'SISTEMA PROFESIONAL',
                          style: AppDesignSystem.caption(
                            color: AppDesignSystem.navAccent,
                          ).copyWith(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],

              // Toggle button mejorado
              Container(
                decoration: BoxDecoration(
                  color:
                      AppDesignSystem.isDark
                          ? Colors.white.withOpacity(0.1)
                          : Colors.black.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      _isCollapsed = !_isCollapsed;
                    });
                  },
                  icon: AnimatedRotation(
                    duration: const Duration(milliseconds: 300),
                    turns: _isCollapsed ? 0 : 0.5,
                    child: Icon(
                      _isCollapsed ? Icons.menu_rounded : Icons.close_rounded,
                      color:
                          AppDesignSystem.isDark
                              ? AppDesignSystem.navText
                              : AppDesignSystem.navPrimary,
                      size: 20,
                    ),
                  ),
                  tooltip: _isCollapsed ? 'Expandir menú' : 'Contraer menú',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationSections() {
    if (_filteredSections.isEmpty) {
      return _buildEmptyState();
    }

    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 16),
      itemCount: _filteredSections.length,
      separatorBuilder: (context, index) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        final section = _filteredSections[index];
        final isExpanded = _expandedCategories.contains(section.id);

        return _buildNavigationSection(section, isExpanded);
      },
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.lock_outline,
            color: AppDesignSystem.textMuted,
            size: _isCollapsed ? 32 : 48,
          ),
          if (!_isCollapsed) ...[
            const SizedBox(height: 16),
            Text(
              'Acceso Restringido',
              style: AppDesignSystem.bodyMd().copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'No tienes permisos para acceder a ninguna sección del sistema.',
              style: AppDesignSystem.bodySm(),
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildNavigationSection(_NavSection section, bool isExpanded) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: _isCollapsed ? 8 : 16),
      child: Column(
        children: [
          _buildSectionHeader(section, isExpanded),
          _buildSectionItems(section, isExpanded),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(_NavSection section, bool isExpanded) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          setState(() {
            if (isExpanded) {
              _expandedCategories.remove(section.id);
            } else {
              _expandedCategories.add(section.id);
            }
          });
        },
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: EdgeInsets.all(_isCollapsed ? 12 : 16),
          decoration: BoxDecoration(
            color: section.color.withOpacity(isExpanded ? 0.1 : 0.05),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: section.color.withOpacity(0.2), width: 1),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: section.color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  section.icon,
                  color: section.color,
                  size: _isCollapsed ? 16 : 18,
                ),
              ),

              if (!_isCollapsed) ...[
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    section.label,
                    style: AppDesignSystem.bodyMd().copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppDesignSystem.textPrimary,
                    ),
                  ),
                ),
                Icon(
                  isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: AppDesignSystem.textTertiary,
                  size: 20,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionItems(_NavSection section, bool isExpanded) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      height: isExpanded ? section.items.length * 48.0 : 0,
      child: ClipRect(
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: section.items.length,
          itemBuilder: (context, index) {
            final item = section.items[index];
            final isSelected = _selectedRoute == item.route;

            return _buildNavigationItem(item, isSelected);
          },
        ),
      ),
    );
  }

  Widget _buildNavigationItem(_NavItem item, bool isSelected) {
    return AppDesignSystem.buildNavItem(
      icon: item.icon,
      label: item.label,
      isSelected: isSelected,
      onTap: () {
        setState(() {
          _selectedRoute = item.route;
        });
        context.go(item.route);
      },
      description: _isCollapsed ? null : item.description,
    );
  }

  Widget _buildFooter() {
    return Container(
      padding: EdgeInsets.all(_isCollapsed ? 12 : 16),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Color(0xFF334155), width: 1)),
      ),
      child: Column(
        children: [
          if (!_isCollapsed) ...[
            _buildUserProfile(),
            const SizedBox(height: 12),
          ],
          _buildLogoutButton(),
        ],
      ),
    );
  }

  Widget _buildUserProfile() {
    final currentUser = ref.watch(currentUserProvider);

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppDesignSystem.surfaceLight.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppDesignSystem.textMuted.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: AppDesignSystem.primaryIndigo,
            child: Text(
              _getUserInitial(currentUser),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  currentUser?.nombre ?? 'Usuario',
                  style: AppDesignSystem.bodySm().copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppDesignSystem.textPrimary,
                  ),
                ),
                Text(
                  currentUser?.rolNombre ?? 'Sin rol',
                  style: AppDesignSystem.caption().copyWith(
                    color: AppDesignSystem.textMuted,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLogoutButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () async {
          final shouldLogout = await _showLogoutConfirmation();
          if (shouldLogout == true) {
            await _performLogout();
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: AppDesignSystem.error,
          elevation: 0,
          side: BorderSide(
            color: AppDesignSystem.error.withOpacity(0.3),
            width: 1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.symmetric(vertical: _isCollapsed ? 12 : 16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.logout, size: _isCollapsed ? 16 : 18),
            if (!_isCollapsed) ...[
              const SizedBox(width: 8),
              const Text(
                'Cerrar Sesión',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Future<bool?> _showLogoutConfirmation() {
    return showDialog<bool>(
      context: context,
      builder:
          (context) => AlertDialog(
            backgroundColor: AppDesignSystem.surface,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            title: Text(
              'Confirmar cierre de sesión',
              style: AppDesignSystem.headingSm().copyWith(
                color: AppDesignSystem.textPrimary,
              ),
            ),
            content: Text(
              '¿Estás seguro de que deseas cerrar la sesión actual?',
              style: AppDesignSystem.bodyMd().copyWith(
                color: AppDesignSystem.textSecondary,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text(
                  'Cancelar',
                  style: TextStyle(color: AppDesignSystem.textTertiary),
                ),
              ),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(true),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppDesignSystem.error,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Cerrar Sesión'),
              ),
            ],
          ),
    );
  }

  Future<void> _performLogout() async {
    final authService = ref.read(authServiceProvider);
    await authService.logout();
    ref.read(currentUserProvider.notifier).state = null;
    ref.read(isAuthenticatedProvider.notifier).state = false;
    if (context.mounted) {
      context.go('/login');
    }
  }

  String _getUserInitial(dynamic currentUser) {
    if (currentUser?.nombre != null && currentUser.nombre.isNotEmpty) {
      return currentUser.nombre.substring(0, 1).toUpperCase();
    }
    return 'U';
  }
}

class _NavItem {
  final IconData icon;
  final String label;
  final String route;
  final String resource;
  final String action;
  final String description;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.route,
    required this.resource,
    required this.action,
    this.description = '',
  });
}

class _NavSection {
  final String id;
  final IconData icon;
  final String label;
  final Color color;
  final int priority;
  final List<_NavItem> items;

  const _NavSection({
    required this.id,
    required this.icon,
    required this.label,
    required this.color,
    required this.priority,
    required this.items,
  });
}
