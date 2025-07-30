import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:isar/isar.dart';
import 'package:tienda_app/src/app_routes.dart';
import 'package:tienda_app/models/usuario.dart';
import 'package:tienda_app/models/rol.dart';
import 'package:tienda_app/services/isar_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tienda_app/widgets/user_avatar_picker.dart';

class UserAddEditView extends ConsumerStatefulWidget {
  final Usuario? usuario;

  const UserAddEditView({super.key, this.usuario});

  @override
  ConsumerState<UserAddEditView> createState() => _UserAddEditViewState();
}

class _UserAddEditViewState extends ConsumerState<UserAddEditView> {
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _apellidoController = TextEditingController();
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _isLoading = false;
  bool _isEditing = false;
  bool _showPassword = false;
  bool _showConfirmPassword = false;

  Rol? _rolSeleccionado;
  List<Rol> _roles = [];

  // Gestión de avatar
  String? _avatarUrl;

  @override
  void initState() {
    super.initState();
    _isEditing = widget.usuario != null;
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      final isar = await ref.read(isarServiceProvider).db;
      final roles = await isar.rols.where().findAll();
      setState(() {
        _roles = roles;
      });

      if (_isEditing) {
        _loadUsuarioData();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error cargando roles: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  void _loadUsuarioData() {
    final usuario = widget.usuario!;
    _nombreController.text = usuario.nombre;
    _apellidoController.text = usuario.apellido ?? '';
    _emailController.text = usuario.email ?? '';
    _usernameController.text = usuario.username;
    _avatarUrl = usuario.avatarUrl;

    // Buscar el rol del usuario
    if (usuario.rolId != null) {
      _rolSeleccionado = _roles.firstWhere(
        (rol) => rol.id == usuario.rolId,
        orElse: () => _roles.isNotEmpty ? _roles.first : Rol(),
      );
    }
  }

  @override
  void dispose() {
    _nombreController.dispose();
    _apellidoController.dispose();
    _emailController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _saveUsuario() async {
    if (!_formKey.currentState!.validate()) return;

    // Validar contraseñas si es nuevo usuario
    if (!_isEditing) {
      if (_passwordController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('La contraseña es requerida'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      if (_passwordController.text != _confirmPasswordController.text) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Las contraseñas no coinciden'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }
    }

    setState(() => _isLoading = true);

    try {
      final isar = await ref.read(isarServiceProvider).db;

      final usuario = _isEditing ? widget.usuario! : Usuario();
      usuario.nombre = _nombreController.text.trim();
      usuario.apellido = _apellidoController.text.trim();
      usuario.email = _emailController.text.trim();
      usuario.username = _usernameController.text.trim();
      usuario.rolId = _rolSeleccionado?.id;
      usuario.avatarUrl = _avatarUrl;

      if (!_isEditing || _passwordController.text.isNotEmpty) {
        usuario.password =
            _passwordController.text; // En producción deberías hashear
      }

      usuario.fechaCreacion = DateTime.now();

      await isar.writeTxn(() async {
        await isar.usuarios.put(usuario);
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              _isEditing ? 'Usuario actualizado' : 'Usuario creado',
            ),
            backgroundColor: Colors.green,
          ),
        );
        context.pop();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e'), backgroundColor: Colors.red),
        );
      }
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isEditing ? 'Editar Usuario' : 'Nuevo Usuario'),
        actions: [
          if (_isEditing)
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: _deleteUsuario,
              tooltip: 'Eliminar Usuario',
            ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Información Personal',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _nombreController,
                            decoration: const InputDecoration(
                              labelText: 'Nombre *',
                              prefixIcon: Icon(Icons.person),
                            ),
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'El nombre es requerido';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: TextFormField(
                            controller: _apellidoController,
                            decoration: const InputDecoration(
                              labelText: 'Apellido',
                              prefixIcon: Icon(Icons.person_outline),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.email),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value != null && value.isNotEmpty) {
                          if (!RegExp(
                            r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                          ).hasMatch(value)) {
                            return 'Email inválido';
                          }
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Sección de Avatar
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Avatar del Usuario',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 16),
                    Center(
                      child: UserAvatarPicker(
                        avatarUrl: _avatarUrl,
                        onAvatarChanged: (url) {
                          setState(() {
                            _avatarUrl = url;
                          });
                        },
                        onAvatarRemoved: () {
                          setState(() {
                            _avatarUrl = null;
                          });
                        },
                        size: 120,
                        isEditable: true,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Información de Acceso',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _usernameController,
                      decoration: const InputDecoration(
                        labelText: 'Nombre de Usuario *',
                        prefixIcon: Icon(Icons.account_circle),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'El nombre de usuario es requerido';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    DropdownButtonFormField<Rol>(
                      value: _rolSeleccionado,
                      decoration: const InputDecoration(
                        labelText: 'Rol *',
                        prefixIcon: Icon(Icons.security),
                      ),
                      items:
                          _roles.map((rol) {
                            return DropdownMenuItem(
                              value: rol,
                              child: Text(rol.nombre),
                            );
                          }).toList(),
                      onChanged: (Rol? value) {
                        setState(() {
                          _rolSeleccionado = value;
                        });
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Debe seleccionar un rol';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Contraseña',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText:
                            _isEditing
                                ? 'Nueva Contraseña (opcional)'
                                : 'Contraseña *',
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _showPassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _showPassword = !_showPassword;
                            });
                          },
                        ),
                      ),
                      obscureText: !_showPassword,
                    ),
                    if (!_isEditing) ...[
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _confirmPasswordController,
                        decoration: InputDecoration(
                          labelText: 'Confirmar Contraseña *',
                          prefixIcon: const Icon(Icons.lock_outline),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _showConfirmPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _showConfirmPassword = !_showConfirmPassword;
                              });
                            },
                          ),
                        ),
                        obscureText: !_showConfirmPassword,
                      ),
                    ],
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _isLoading ? null : _saveUsuario,
                child:
                    _isLoading
                        ? const CircularProgressIndicator()
                        : Text(
                          _isEditing ? 'Actualizar Usuario' : 'Crear Usuario',
                        ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _deleteUsuario() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Eliminar Usuario'),
            content: const Text(
              '¿Estás seguro de que quieres eliminar este usuario?',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('Cancelar'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('Eliminar'),
                style: TextButton.styleFrom(foregroundColor: Colors.red),
              ),
            ],
          ),
    );

    if (confirmed == true) {
      setState(() => _isLoading = true);
      try {
        final isar = await ref.read(isarServiceProvider).db;
        await isar.writeTxn(() async {
          await isar.usuarios.delete(widget.usuario!.id);
        });

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Usuario eliminado'),
              backgroundColor: Colors.green,
            ),
          );
          context.pop();
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: $e'), backgroundColor: Colors.red),
          );
        }
      } finally {
        setState(() => _isLoading = false);
      }
    }
  }
}
