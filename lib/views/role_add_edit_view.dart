import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tienda_app/src/app_routes.dart';
import 'package:tienda_app/models/rol.dart';
import 'package:tienda_app/services/isar_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

class RoleAddEditView extends ConsumerStatefulWidget {
  final Rol? rol;
  final int? roleId;

  const RoleAddEditView({super.key, this.rol, this.roleId});

  @override
  ConsumerState<RoleAddEditView> createState() => _RoleAddEditViewState();
}

class _RoleAddEditViewState extends ConsumerState<RoleAddEditView> {
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _descripcionController = TextEditingController();

  bool _isLoading = false;
  bool _isEditing = false;

  // Permisos disponibles con acciones específicas
  final Map<String, Map<String, bool>> _permisos = {
    'productos': {'visualizar': false, 'editar': false, 'eliminar': false},
    'categorias': {'visualizar': false, 'editar': false, 'eliminar': false},
    'proveedores': {'visualizar': false, 'editar': false, 'eliminar': false},
    'compras': {'visualizar': false, 'editar': false, 'eliminar': false},
    'pedidos': {'visualizar': false, 'editar': false, 'eliminar': false},
    'clientes': {'visualizar': false, 'editar': false, 'eliminar': false},
    'cuenta_corriente': {
      'visualizar': false,
      'editar': false,
      'eliminar': false,
    },
    'ventas': {'visualizar': false, 'editar': false, 'eliminar': false},
    'movimientos_stock': {
      'visualizar': false,
      'editar': false,
      'eliminar': false,
    },
    'finanzas': {'visualizar': false, 'editar': false, 'eliminar': false},
    'informes': {'visualizar': false, 'editar': false, 'eliminar': false},
    'roles': {'visualizar': false, 'editar': false, 'eliminar': false},
    'usuarios': {'visualizar': false, 'editar': false, 'eliminar': false},
    'configuracion': {'visualizar': false, 'editar': false, 'eliminar': false},
  };

  @override
  void initState() {
    super.initState();
    _isEditing = widget.rol != null || widget.roleId != null;
    if (_isEditing) {
      _loadRolData();
    }
  }

  Future<void> _loadRolData() async {
    try {
      Rol? rolToLoad = widget.rol;

      // Si no se proporciona el rol pero sí el ID, cargarlo desde la BD
      if (rolToLoad == null && widget.roleId != null) {
        final isar = await ref.read(isarServiceProvider).db;
        rolToLoad = await isar.rols.get(widget.roleId!);

        if (rolToLoad == null) {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Rol no encontrado'),
                backgroundColor: Colors.red,
              ),
            );
            context.pop();
            return;
          }
        }
      }

      if (rolToLoad != null) {
        _nombreController.text = rolToLoad.nombre;
        _descripcionController.text = rolToLoad.descripcion ?? '';

        // Cargar permisos existentes
        if (rolToLoad.permisos != null) {
          for (final permiso in rolToLoad.permisos!) {
            // Parsear permisos en formato "seccion.accion"
            final parts = permiso.split('.');
            if (parts.length == 2) {
              final seccion = parts[0];
              final accion = parts[1];
              if (_permisos.containsKey(seccion) &&
                  _permisos[seccion]!.containsKey(accion)) {
                _permisos[seccion]![accion] = true;
              }
            }
          }
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error al cargar rol: $e'),
            backgroundColor: Colors.red,
          ),
        );
        context.pop();
      }
    }
  }

  // Convertir permisos a formato de lista para guardar
  List<String> _getPermisosList() {
    final permisosList = <String>[];
    for (final seccion in _permisos.keys) {
      for (final accion in _permisos[seccion]!.keys) {
        if (_permisos[seccion]![accion] == true) {
          permisosList.add('$seccion.$accion');
        }
      }
    }
    return permisosList;
  }

  @override
  void dispose() {
    _nombreController.dispose();
    _descripcionController.dispose();
    super.dispose();
  }

  Future<void> _saveRol() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final isar = await ref.read(isarServiceProvider).db;

      Rol rol;
      if (_isEditing) {
        // Si estamos editando, obtener el rol existente
        if (widget.rol != null) {
          rol = widget.rol!;
        } else if (widget.roleId != null) {
          rol = await isar.rols.get(widget.roleId!) ?? Rol();
        } else {
          rol = Rol();
        }
      } else {
        rol = Rol();
      }

      rol.nombre = _nombreController.text.trim();
      rol.descripcion = _descripcionController.text.trim();
      rol.permisos = _getPermisosList();
      rol.fechaCreacion = DateTime.now();

      await isar.writeTxn(() async {
        await isar.rols.put(rol);
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(_isEditing ? 'Rol actualizado' : 'Rol creado'),
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
        title: Text(_isEditing ? 'Editar Rol' : 'Nuevo Rol'),
        actions: [
          if (_isEditing)
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: _deleteRol,
              tooltip: 'Eliminar Rol',
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
                      'Información del Rol',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _nombreController,
                      decoration: const InputDecoration(
                        labelText: 'Nombre del Rol *',
                        prefixIcon: Icon(Icons.security),
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
                      controller: _descripcionController,
                      decoration: const InputDecoration(
                        labelText: 'Descripción',
                        prefixIcon: Icon(Icons.description),
                        hintText:
                            'Descripción del rol y sus responsabilidades...',
                      ),
                      maxLines: 3,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            _buildPermisosSection(),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _isLoading ? null : _saveRol,
                child:
                    _isLoading
                        ? const CircularProgressIndicator()
                        : Text(_isEditing ? 'Actualizar Rol' : 'Crear Rol'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPermisosSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Permisos del Rol',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            const Text(
              'Selecciona los permisos que tendrá este rol:',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 400, // Altura fija para evitar problemas de layout
              child: ListView.builder(
                itemCount: _permisos.length,
                itemBuilder: (context, index) {
                  final seccion = _permisos.keys.elementAt(index);
                  final permisosSeccion = _permisos[seccion]!;

                  return Card(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: ExpansionTile(
                      title: Text(
                        _getPermisoDisplayName(seccion),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(_getPermisoDescription(seccion)),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              _buildPermisoCheckbox(
                                seccion,
                                'visualizar',
                                'Visualizar',
                                Icons.visibility,
                                Colors.green,
                              ),
                              _buildPermisoCheckbox(
                                seccion,
                                'editar',
                                'Editar',
                                Icons.edit,
                                Colors.orange,
                              ),
                              _buildPermisoCheckbox(
                                seccion,
                                'eliminar',
                                'Eliminar',
                                Icons.delete,
                                Colors.red,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPermisoCheckbox(
    String seccion,
    String accion,
    String displayName,
    IconData icon,
    Color color,
  ) {
    final isChecked = _permisos[seccion]![accion] ?? false;

    return CheckboxListTile(
      title: Row(
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(width: 8),
          Text(displayName),
        ],
      ),
      value: isChecked,
      onChanged: (value) {
        setState(() {
          _permisos[seccion]![accion] = value ?? false;
        });
      },
      controlAffinity: ListTileControlAffinity.leading,
      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
    );
  }

  String _getPermisoDisplayName(String key) {
    switch (key) {
      case 'productos':
        return 'Productos';
      case 'categorias':
        return 'Categorías';
      case 'proveedores':
        return 'Proveedores';
      case 'compras':
        return 'Compras';
      case 'pedidos':
        return 'Pedidos';
      case 'clientes':
        return 'Clientes';
      case 'cuenta_corriente':
        return 'Cuenta Corriente';
      case 'ventas':
        return 'Ventas';
      case 'movimientos_stock':
        return 'Movimientos Stock';
      case 'finanzas':
        return 'Finanzas';
      case 'informes':
        return 'Informes';
      case 'roles':
        return 'Roles';
      case 'usuarios':
        return 'Usuarios';
      case 'configuracion':
        return 'Configuración';
      default:
        return key;
    }
  }

  String _getPermisoDescription(String key) {
    switch (key) {
      case 'productos':
        return 'Gestionar productos';
      case 'categorias':
        return 'Gestionar categorías';
      case 'proveedores':
        return 'Gestionar proveedores';
      case 'compras':
        return 'Gestionar compras';
      case 'pedidos':
        return 'Gestionar pedidos';
      case 'clientes':
        return 'Gestionar clientes';
      case 'cuenta_corriente':
        return 'Ver cuenta corriente';
      case 'ventas':
        return 'Gestionar ventas';
      case 'movimientos_stock':
        return 'Gestionar stock';
      case 'finanzas':
        return 'Gestionar finanzas';
      case 'informes':
        return 'Ver informes';
      case 'roles':
        return 'Gestionar roles';
      case 'usuarios':
        return 'Gestionar usuarios';
      case 'configuracion':
        return 'Configurar sistema';
      default:
        return '';
    }
  }

  Future<void> _deleteRol() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Eliminar Rol'),
            content: const Text(
              '¿Estás seguro de que quieres eliminar este rol?',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('Cancelar'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                style: TextButton.styleFrom(foregroundColor: Colors.red),
                child: const Text('Eliminar'),
              ),
            ],
          ),
    );

    if (confirmed == true) {
      setState(() => _isLoading = true);
      try {
        final isar = await ref.read(isarServiceProvider).db;

        int? roleIdToDelete;
        if (widget.rol != null) {
          roleIdToDelete = widget.rol!.id;
        } else if (widget.roleId != null) {
          roleIdToDelete = widget.roleId;
        }

        if (roleIdToDelete != null) {
          await isar.writeTxn(() async {
            await isar.rols.delete(roleIdToDelete as Id);
          });

          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Rol eliminado'),
                backgroundColor: Colors.green,
              ),
            );
            context.pop();
          }
        } else {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('No se pudo identificar el rol a eliminar'),
                backgroundColor: Colors.red,
              ),
            );
          }
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
