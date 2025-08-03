import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tienda_app/services/carrito_compra_service.dart';
import 'package:tienda_app/services/auth_service.dart';
import 'package:tienda_app/src/app_routes.dart';
import 'package:tienda_app/services/theme_service.dart';
import 'package:tienda_app/models/app_theme.dart';

class TopBarActions extends ConsumerStatefulWidget {
  const TopBarActions({super.key});

  @override
  ConsumerState<TopBarActions> createState() => _TopBarActionsState();
}

class _TopBarActionsState extends ConsumerState<TopBarActions>
    with TickerProviderStateMixin {
  int _carritoCount = 0;
  bool _isCarritoHovered = false;
  bool _isProfileHovered = false;
  late AnimationController _carritoAnimationController;
  late AnimationController _profileAnimationController;

  @override
  void initState() {
    super.initState();
    _loadCarritoCount();
    _carritoAnimationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _profileAnimationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _carritoAnimationController.dispose();
    _profileAnimationController.dispose();
    super.dispose();
  }

  Future<void> _loadCarritoCount() async {
    final carritoService = ref.read(carritoCompraServiceProvider);
    final carrito = await carritoService.obtenerCarrito();
    setState(() {
      _carritoCount = carrito.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentTheme = ref.watch(currentThemeProvider);

    return Row(
      children: [
        // Modern Carrito de compras
        _buildModernActionButton(
          icon: Icons.shopping_cart_rounded,
          tooltip: 'Carrito de compras',
          badge: _carritoCount > 0 ? _carritoCount.toString() : null,
          isHovered: _isCarritoHovered,
          animationController: _carritoAnimationController,
          onHoverChanged: (hovered) {
            setState(() => _isCarritoHovered = hovered);
            if (hovered) {
              _carritoAnimationController.forward();
            } else {
              _carritoAnimationController.reverse();
            }
          },
          onPressed: () {
            context.push(AppRoutes.carritoCompra);
            // Recargar el contador después de navegar
            Future.delayed(const Duration(milliseconds: 500), () {
              _loadCarritoCount();
            });
          },
          currentTheme: currentTheme,
        ),
        const SizedBox(width: 12),

        // Modern Perfil de usuario
        _buildModernActionButton(
          icon: Icons.account_circle_rounded,
          tooltip: 'Perfil de usuario',
          isHovered: _isProfileHovered,
          animationController: _profileAnimationController,
          onHoverChanged: (hovered) {
            setState(() => _isProfileHovered = hovered);
            if (hovered) {
              _profileAnimationController.forward();
            } else {
              _profileAnimationController.reverse();
            }
          },
          onPressed: () {
            _showModernProfileMenu(context);
          },
          currentTheme: currentTheme,
        ),
      ],
    );
  }

  Widget _buildModernActionButton({
    required IconData icon,
    required String tooltip,
    required VoidCallback onPressed,
    required bool isHovered,
    required AnimationController animationController,
    required Function(bool) onHoverChanged,
    required AppTheme currentTheme,
    String? badge,
  }) {
    return Tooltip(
      message: tooltip,
      child: MouseRegion(
        onEnter: (_) => onHoverChanged(true),
        onExit: (_) => onHoverChanged(false),
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: onPressed,
          child: AnimatedBuilder(
            animation: animationController,
            builder: (context, child) {
              return Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  gradient:
                      isHovered
                          ? LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              currentTheme.primaryColor.withOpacity(0.2),
                              currentTheme.primaryColor.withOpacity(0.1),
                            ],
                          )
                          : null,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color:
                        isHovered
                            ? currentTheme.primaryColor.withOpacity(0.4)
                            : Colors.transparent,
                    width: 1,
                  ),
                  boxShadow:
                      isHovered
                          ? [
                            BoxShadow(
                              color: currentTheme.primaryColor.withOpacity(0.3),
                              blurRadius: 6,
                              offset: const Offset(0, 2),
                            ),
                          ]
                          : null,
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Transform.scale(
                        scale: 1.0 + (animationController.value * 0.1),
                        child: Icon(
                          icon,
                          color:
                              isHovered
                                  ? currentTheme.primaryColor
                                  : currentTheme.textSecondaryColor,
                          size: 18,
                        ),
                      ),
                    ),
                    if (badge != null)
                      Positioned(
                        right: -2,
                        top: -2,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 4,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                currentTheme.errorColor,
                                currentTheme.errorColor.withOpacity(0.8),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.white, width: 1),
                            boxShadow: [
                              BoxShadow(
                                color: currentTheme.errorColor.withOpacity(0.4),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          constraints: const BoxConstraints(
                            minWidth: 16,
                            minHeight: 16,
                          ),
                          child: Text(
                            badge,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _showModernProfileMenu(BuildContext context) {
    final currentTheme = ref.watch(currentThemeProvider);

    showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(
        MediaQuery.of(context).size.width - 220,
        50,
        10,
        0,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 8,
      color: currentTheme.surfaceColor,
      items: [
        PopupMenuItem(
          value: 'profile',
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: currentTheme.primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Icon(
                    Icons.person_rounded,
                    size: 16,
                    color: currentTheme.primaryColor,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  'Mi Perfil',
                  style: TextStyle(
                    color: currentTheme.textColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
        PopupMenuItem(
          value: 'settings',
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: currentTheme.primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Icon(
                    Icons.settings_rounded,
                    size: 16,
                    color: currentTheme.primaryColor,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  'Configuración',
                  style: TextStyle(
                    color: currentTheme.textColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
        PopupMenuDivider(
          height: 1,
          color: currentTheme.textSecondaryColor.withOpacity(0.2),
        ),
        PopupMenuItem(
          value: 'logout',
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: currentTheme.errorColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Icon(
                    Icons.logout_rounded,
                    size: 16,
                    color: currentTheme.errorColor,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  'Cerrar Sesión',
                  style: TextStyle(
                    color: currentTheme.errorColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ).then((value) {
      switch (value) {
        case 'profile':
          // TODO: Implementar vista de perfil
          break;
        case 'settings':
          context.push(AppRoutes.settings);
          break;
        case 'logout':
          _showModernLogoutDialog(context);
          break;
      }
    });
  }

  void _showModernLogoutDialog(BuildContext context) {
    final currentTheme = ref.watch(currentThemeProvider);

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            backgroundColor: currentTheme.surfaceColor,
            title: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: currentTheme.errorColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.logout_rounded,
                    color: currentTheme.errorColor,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  'Cerrar Sesión',
                  style: TextStyle(
                    color: currentTheme.textColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            content: Text(
              '¿Estás seguro de que quieres cerrar sesión?',
              style: TextStyle(color: currentTheme.textSecondaryColor),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                style: TextButton.styleFrom(
                  foregroundColor: currentTheme.textSecondaryColor,
                ),
                child: const Text('Cancelar'),
              ),
              ElevatedButton(
                onPressed: () async {
                  Navigator.pop(context);

                  // Limpiar estado de autenticación
                  ref.read(currentUserProvider.notifier).state = null;
                  ref.read(isAuthenticatedProvider.notifier).state = false;

                  // Navegar al login
                  context.go('/login');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: currentTheme.errorColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Cerrar Sesión'),
              ),
            ],
          ),
    );
  }
}
