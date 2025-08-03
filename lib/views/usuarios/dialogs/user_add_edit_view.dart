import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:isar/isar.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';
import '../../../models/usuario.dart';
import '../../../models/rol.dart';
import '../../../services/isar_service.dart';
import '../../../services/auth_service.dart';
import '../../../widgets/permission_widget.dart';

class UserAddEditView extends ConsumerStatefulWidget {
  final int? userId;

  const UserAddEditView({super.key, this.userId});

  @override
  ConsumerState<UserAddEditView> createState() => _UserAddEditViewState();
}

class _UserAddEditViewState extends ConsumerState<UserAddEditView> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nombreController = TextEditingController();
  final _emailController = TextEditingController();

  List<Rol> _roles = [];
  Rol? _selectedRole;
  bool _isLoading = true;
  bool _isSaving = false;
  Usuario? _usuario;

  String _hashPassword(String password) {
    final bytes = utf8.encode(password);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _nombreController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _loadData() async {
    try {
      final isar = await ref.read(isarServiceProvider).db;

      // Cargar roles
      final roles = await isar.rols.where().findAll();
      setState(() {
        _roles = roles;
      });

      // Si es edición, cargar usuario
      if (widget.userId != null) {
        _usuario = await isar.usuarios.get(widget.userId!);
        if (_usuario != null) {
          _loadUserData();
        }
      }

      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error al cargar datos: $e')));
      }
    }
  }

  void _loadUserData() {
    if (_usuario == null) return;

    _usernameController.text = _usuario!.username;
    _nombreController.text = _usuario!.nombre;
    _emailController.text = _usuario!.email ?? '';

    if (_usuario!.rolId != null) {
      _selectedRole = _roles.firstWhere(
        (r) => r.id == _usuario!.rolId,
        orElse: () => _roles.first,
      );
    }
  }

  Future<void> _saveUser() async {
    if (!_formKey.currentState!.validate()) return;
    if (_selectedRole == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Debes seleccionar un rol')));
      return;
    }

    setState(() => _isSaving = true);

    try {
      final isar = await ref.read(isarServiceProvider).db;
      final authService = ref.read(authServiceProvider);

      if (_usuario == null) {
        // Crear nuevo usuario
        _usuario =
            Usuario()
              ..username = _usernameController.text.trim()
              ..nombre = _nombreController.text.trim()
              ..email =
                  _emailController.text.trim().isEmpty
                      ? null
                      : _emailController.text.trim()
              ..rolId = _selectedRole!.id;

        // Solo establecer contraseña si se proporciona
        if (_passwordController.text.isNotEmpty) {
          _usuario!.password = _hashPassword(_passwordController.text);
        } else {
          _usuario!.password = _hashPassword(
            '123456',
          ); // Contraseña por defecto
        }
      } else {
        // Actualizar usuario existente
        _usuario!.username = _usernameController.text.trim();
        _usuario!.nombre = _nombreController.text.trim();
        _usuario!.email =
            _emailController.text.trim().isEmpty
                ? null
                : _emailController.text.trim();
        _usuario!.rolId = _selectedRole!.id;

        // Actualizar contraseña solo si se proporciona una nueva
        if (_passwordController.text.isNotEmpty) {
          _usuario!.password = _hashPassword(_passwordController.text);
        }
      }

      await isar.writeTxn(() async {
        await isar.usuarios.put(_usuario!);
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Usuario guardado exitosamente'),
            backgroundColor: Colors.green,
          ),
        );
        context.pop(true);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error al guardar usuario: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isSaving = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          widget.userId == null ? 'Agregar Usuario' : 'Editar Usuario',
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          PermissionWidget(
            action: 'update',
            resource: 'usuarios',
            child: IconButton(
              icon: const Icon(Icons.save, color: Colors.white),
              onPressed: _isSaving ? null : _saveUser,
              tooltip: 'Guardar',
            ),
          ),
        ],
      ),
      body:
          _isLoading
              ? const Center(child: CircularProgressIndicator())
              : Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextFormField(
                                controller: _usernameController,
                                decoration: const InputDecoration(
                                  labelText: 'Nombre de Usuario',
                                  border: OutlineInputBorder(),
                                ),
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'El nombre de usuario es requerido';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 16),
                              TextFormField(
                                controller: _nombreController,
                                decoration: const InputDecoration(
                                  labelText: 'Nombre Completo',
                                  border: OutlineInputBorder(),
                                ),
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'El nombre es requerido';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 16),
                              TextFormField(
                                controller: _emailController,
                                decoration: const InputDecoration(
                                  labelText: 'Email (opcional)',
                                  border: OutlineInputBorder(),
                                ),
                                keyboardType: TextInputType.emailAddress,
                              ),
                              const SizedBox(height: 16),
                              TextFormField(
                                controller: _passwordController,
                                decoration: InputDecoration(
                                  labelText:
                                      widget.userId == null
                                          ? 'Contraseña'
                                          : 'Nueva Contraseña (dejar vacío para mantener)',
                                  border: const OutlineInputBorder(),
                                ),
                                obscureText: true,
                                validator: (value) {
                                  if (widget.userId == null &&
                                      (value == null || value.trim().isEmpty)) {
                                    return 'La contraseña es requerida';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 16),
                              DropdownButtonFormField<Rol>(
                                value: _selectedRole,
                                decoration: const InputDecoration(
                                  labelText: 'Rol',
                                  border: OutlineInputBorder(),
                                ),
                                items:
                                    _roles.map((rol) {
                                      return DropdownMenuItem<Rol>(
                                        value: rol,
                                        child: Text(rol.nombre),
                                      );
                                    }).toList(),
                                onChanged: (Rol? value) {
                                  setState(() {
                                    _selectedRole = value;
                                  });
                                },
                                validator: (value) {
                                  if (value == null) {
                                    return 'Debes seleccionar un rol';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
    );
  }
}
