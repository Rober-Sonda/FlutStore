import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tienda_app/services/carrito_compra_service.dart';
import 'package:tienda_app/services/auth_service.dart';
import 'package:tienda_app/src/app_routes.dart';

class TopBarActions extends ConsumerStatefulWidget {
  const TopBarActions({super.key});

  @override
  ConsumerState<TopBarActions> createState() => _TopBarActionsState();
}

class _TopBarActionsState extends ConsumerState<TopBarActions> {
  int _carritoCount = 0;

  @override
  void initState() {
    super.initState();
    _loadCarritoCount();
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
    return Row(
      children: [
        // Carrito de compras
        _buildActionButton(
          icon: Icons.shopping_cart,
          tooltip: 'Carrito de compras',
          badge: _carritoCount > 0 ? _carritoCount.toString() : null,
          onPressed: () {
            context.push(AppRoutes.carritoCompra);
            // Recargar el contador después de navegar
            Future.delayed(const Duration(milliseconds: 500), () {
              _loadCarritoCount();
            });
          },
        ),
        const SizedBox(width: 12),

        // Perfil de usuario
        _buildActionButton(
          icon: Icons.account_circle,
          tooltip: 'Perfil de usuario',
          onPressed: () {
            _showProfileMenu(context);
          },
        ),
      ],
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String tooltip,
    required VoidCallback onPressed,
    String? badge,
  }) {
    return Tooltip(
      message: tooltip,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: onPressed,
          child: Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Colors.transparent,
            ),
            child: Stack(
              children: [
                Center(child: Icon(icon, color: Colors.grey[300], size: 20)),
                if (badge != null)
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.white, width: 1),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 2,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 16,
                        minHeight: 16,
                      ),
                      child: Text(
                        badge,
                        style: const TextStyle(
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
          ),
        ),
      ),
    );
  }

  void _showProfileMenu(BuildContext context) {
    showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(
        MediaQuery.of(context).size.width - 200,
        50,
        10,
        0,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 8,
      items: const [
        PopupMenuItem(
          value: 'profile',
          child: Row(
            children: [
              Icon(Icons.person, size: 18),
              SizedBox(width: 8),
              Text('Mi Perfil'),
            ],
          ),
        ),
        PopupMenuItem(
          value: 'settings',
          child: Row(
            children: [
              Icon(Icons.settings, size: 18),
              SizedBox(width: 8),
              Text('Configuración'),
            ],
          ),
        ),
        PopupMenuDivider(),
        PopupMenuItem(
          value: 'logout',
          child: Row(
            children: [
              Icon(Icons.logout, color: Colors.red, size: 18),
              SizedBox(width: 8),
              Text('Cerrar Sesión', style: TextStyle(color: Colors.red)),
            ],
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
          _showLogoutDialog(context);
          break;
      }
    });
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Cerrar Sesión'),
            content: const Text('¿Estás seguro de que quieres cerrar sesión?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
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
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text('Cerrar Sesión'),
              ),
            ],
          ),
    );
  }
}
