import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:isar/isar.dart';
import 'package:tienda_app/models/usuario.dart';
import 'package:tienda_app/models/rol.dart';
import 'package:tienda_app/services/auth_service.dart';
import 'package:tienda_app/services/isar_service.dart';
import 'package:tienda_app/src/app_routes.dart';

class UsersView extends ConsumerStatefulWidget {
  const UsersView({super.key});

  @override
  ConsumerState<UsersView> createState() => _UsersViewState();
}

class _UsersViewState extends ConsumerState<UsersView> {
  List<Usuario> _usuarios = [];
  List<Rol> _roles = [];
  bool _isLoading = true;
  String? _errorMessage;
  Usuario? _currentUser;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      setState(() {
        _isLoading = true;
        _errorMessage = null;
      });

      final isarService = ref.read(isarServiceProvider);
      final isar = await isarService.db;

      final usuarios = await isar.usuarios.where().findAll();
      final roles = await isar.rols.where().findAll();

      // Obtener usuario actual
      final currentUser = ref.read(currentUserProvider);

      // Filtrar usuarios según permisos
      List<Usuario> usuariosFiltrados = [];
      for (final usuario in usuarios) {
        final authService = ref.read(authServiceProvider);
        final esAdmin = await authService.isAdmin(usuario);
        final esUltimoAdmin = await authService.isLastAdmin(usuario);

        // No mostrar el último administrador a otros usuarios
        if (esUltimoAdmin && currentUser?.id != usuario.id) {
          continue;
        }

        usuariosFiltrados.add(usuario);
      }

      if (mounted) {
        setState(() {
          _usuarios = usuariosFiltrados;
          _roles = roles;
          _currentUser = currentUser;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _errorMessage = 'Error al cargar usuarios: $e';
          _isLoading = false;
        });
      }
    }
  }

  String _getRoleName(int? rolId) {
    if (rolId == null) return 'Sin rol';
    final rol = _roles.firstWhere((r) => r.id == rolId, orElse: () => Rol());
    return rol.nombre ?? 'Sin rol';
  }

  Future<void> _deleteUser(Usuario usuario) async {
    final authService = ref.read(authServiceProvider);
    final puedeEliminar = await authService.canDeleteUser(usuario.id);

    if (!puedeEliminar) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'No se puede eliminar este usuario. Es el último administrador del sistema.',
          ),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    final confirmar = await showDialog<bool>(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Confirmar eliminación'),
            content: Text(
              '¿Estás seguro de que quieres eliminar al usuario "${usuario.nombre}"?\n\nEsta acción no se puede deshacer.',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('Cancelar'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pop(context, true),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text('Eliminar'),
              ),
            ],
          ),
    );

    if (confirmar == true) {
      try {
        final isarService = ref.read(isarServiceProvider);
        final isar = await isarService.db;

        await isar.writeTxn(() async {
          await isar.usuarios.delete(usuario.id);
        });

        await _loadData();

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Usuario eliminado correctamente'),
            backgroundColor: Colors.green,
          ),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error al eliminar usuario: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _resetPassword(Usuario usuario) async {
    final newPasswordController = TextEditingController();

    final result = await showDialog<bool>(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Restablecer Contraseña'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Nueva contraseña para ${usuario.nombre}:'),
                const SizedBox(height: 16),
                TextField(
                  controller: newPasswordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Nueva contraseña',
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('Cancelar'),
              ),
              ElevatedButton(
                onPressed: () {
                  if (newPasswordController.text.length >= 6) {
                    Navigator.pop(context, true);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'La contraseña debe tener al menos 6 caracteres',
                        ),
                        backgroundColor: Colors.orange,
                      ),
                    );
                  }
                },
                child: const Text('Restablecer'),
              ),
            ],
          ),
    );

    if (result == true) {
      try {
        final authService = ref.read(authServiceProvider);
        final success = await authService.resetPassword(
          usuario.id,
          newPasswordController.text,
        );

        if (success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Contraseña restablecida correctamente'),
              backgroundColor: Colors.green,
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Error al restablecer la contraseña'),
              backgroundColor: Colors.red,
            ),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e'), backgroundColor: Colors.red),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestión de Usuarios'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loadData,
            tooltip: 'Actualizar',
          ),
        ],
      ),
      body:
          _errorMessage != null
              ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      size: 64,
                      color: Colors.red,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Error',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(_errorMessage!),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: _loadData,
                      child: const Text('Reintentar'),
                    ),
                  ],
                ),
              )
              : _usuarios.isEmpty
              ? const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.people_outline, size: 64, color: Colors.grey),
                    SizedBox(height: 16),
                    Text(
                      'No hay usuarios',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text('Los usuarios aparecerán aquí cuando se creen'),
                  ],
                ),
              )
              : ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: _usuarios.length,
                itemBuilder: (context, index) {
                  final usuario = _usuarios[index];
                  final authService = ref.read(authServiceProvider);

                  return FutureBuilder<bool>(
                    future: authService.isAdmin(usuario),
                    builder: (context, snapshot) {
                      final esAdmin = snapshot.data ?? false;

                      return Card(
                        margin: const EdgeInsets.only(bottom: 12),
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 25,
                            backgroundColor:
                                esAdmin ? Colors.blue : Colors.grey,
                            child: ClipOval(
                              child:
                                  usuario.avatarUrl != null &&
                                          usuario.avatarUrl!.isNotEmpty
                                      ? Image.network(
                                        usuario.avatarUrl!,
                                        width: 50,
                                        height: 50,
                                        fit: BoxFit.cover,
                                        loadingBuilder: (
                                          context,
                                          child,
                                          loadingProgress,
                                        ) {
                                          if (loadingProgress == null)
                                            return child;
                                          return Container(
                                            width: 50,
                                            height: 50,
                                            color: Colors.grey[200],
                                            child: Center(
                                              child: CircularProgressIndicator(
                                                value:
                                                    loadingProgress
                                                                .expectedTotalBytes !=
                                                            null
                                                        ? loadingProgress
                                                                .cumulativeBytesLoaded /
                                                            loadingProgress
                                                                .expectedTotalBytes!
                                                        : null,
                                                color: Colors.blue[600],
                                              ),
                                            ),
                                          );
                                        },
                                        errorBuilder: (
                                          context,
                                          error,
                                          stackTrace,
                                        ) {
                                          return Container(
                                            width: 50,
                                            height: 50,
                                            color: Colors.grey[200],
                                            child: Icon(
                                              esAdmin
                                                  ? Icons.admin_panel_settings
                                                  : Icons.person,
                                              color: Colors.white,
                                            ),
                                          );
                                        },
                                      )
                                      : Container(
                                        width: 50,
                                        height: 50,
                                        color:
                                            esAdmin ? Colors.blue : Colors.grey,
                                        child: Icon(
                                          esAdmin
                                              ? Icons.admin_panel_settings
                                              : Icons.person,
                                          color: Colors.white,
                                        ),
                                      ),
                            ),
                          ),
                          title: Text(
                            usuario.nombre,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Usuario: ${usuario.username}'),
                              Text('Rol: ${_getRoleName(usuario.rolId)}'),
                              if (usuario.email != null)
                                Text('Email: ${usuario.email}'),
                            ],
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.lock_reset),
                                onPressed: () => _resetPassword(usuario),
                                tooltip: 'Restablecer contraseña',
                              ),
                              if (usuario.id != _currentUser?.id)
                                IconButton(
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                  onPressed: () => _deleteUser(usuario),
                                  tooltip: 'Eliminar usuario',
                                ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
    );
  }
}
