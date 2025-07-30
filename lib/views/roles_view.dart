import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:isar/isar.dart';
import 'package:tienda_app/src/app_routes.dart';
import 'package:tienda_app/models/rol.dart';
import 'package:tienda_app/services/isar_service.dart';
import 'package:tienda_app/services/id_validator.dart';

class RolesView extends ConsumerStatefulWidget {
  const RolesView({super.key});

  @override
  ConsumerState<RolesView> createState() => _RolesViewState();
}

class _RolesViewState extends ConsumerState<RolesView> {
  List<Rol> _roles = [];
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadRoles();
  }

  Future<void> _loadRoles() async {
    try {
      setState(() => _isLoading = true);
      final isar = await ref.read(isarServiceProvider).db;
      final roles = await isar.rols.where().findAll();
      
      setState(() {
        _roles = roles;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = 'Error al cargar roles: $e';
        _isLoading = false;
      });
    }
  }

  Future<void> _deleteRole(Rol rol) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Eliminar Rol'),
        content: Text('¿Estás seguro de que quieres eliminar el rol "${rol.nombre}"?'),
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
      try {
        final isar = await ref.read(isarServiceProvider).db;
        await isar.writeTxn(() async {
          await isar.rols.delete(rol.id);
        });

        IdValidator.validateAndLogEntityWithName(
          rol.id,
          'Rol',
          rol.nombre,
          'Rol eliminado',
        );

        await _loadRoles();
        
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Rol "${rol.nombre}" eliminado'),
              backgroundColor: Colors.green,
            ),
          );
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error al eliminar rol: $e'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    }
  }

  Widget _buildRoleCard(Rol rol) {
    final permisos = rol.permisos ?? [];
    
    // Parsear permisos para mostrar en la card
    final permisosPorSeccion = <String, List<String>>{};
    for (final permiso in permisos) {
      final parts = permiso.split('.');
      if (parts.length == 2) {
        final seccion = parts[0];
        final accion = parts[1];
        permisosPorSeccion.putIfAbsent(seccion, () => []).add(accion);
      }
    }
    
    // Verificar permisos para roles (sección actual)
    final permisosRoles = permisosPorSeccion['roles'] ?? [];
    final canView = permisosRoles.contains('visualizar') || permisos.isEmpty;
    final canEdit = permisosRoles.contains('editar');
    final canDelete = permisosRoles.contains('eliminar');

    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(8),
      child: Container(
        width: 300, // Tamaño fijo para evitar desproporción
        height: 200, // Altura fija
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.admin_panel_settings,
                    color: Colors.blue[700],
                    size: 24,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        rol.nombre,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (rol.descripcion != null)
                        Text(
                          rol.descripcion!,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            
            // Permisos
            Text(
              'Secciones con permisos:',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 4,
              children: permisosPorSeccion.keys.map((seccion) {
                final acciones = permisosPorSeccion[seccion]!;
                final hasView = acciones.contains('visualizar');
                final hasEdit = acciones.contains('editar');
                final hasDelete = acciones.contains('eliminar');
                
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.blue.withOpacity(0.3),
                      width: 1,
                    ),
                  ),
                  child: Text(
                    _getSeccionDisplayName(seccion),
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.blue[700],
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                );
              }).toList(),
            ),
            const Spacer(),
            
            // Acciones
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (canView)
                  IconButton(
                    onPressed: () {
                      // Ver detalles del rol
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Detalles del Rol: ${rol.nombre}'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Nombre: ${rol.nombre}'),
                              if (rol.descripcion != null)
                                Text('Descripción: ${rol.descripcion}'),
                              Text('Fecha de creación: ${rol.fechaCreacion?.toString().split(' ')[0] ?? 'No especificada'}'),
                              const SizedBox(height: 8),
                              const Text('Permisos por sección:', style: TextStyle(fontWeight: FontWeight.bold)),
                              ...permisosPorSeccion.entries.map((entry) {
                                final seccion = entry.key;
                                final acciones = entry.value;
                                return Text('• ${_getSeccionDisplayName(seccion)}: ${acciones.join(', ')}');
                              }),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: const Text('Cerrar'),
                            ),
                          ],
                        ),
                      );
                    },
                    icon: const Icon(Icons.visibility),
                    tooltip: 'Ver detalles',
                  ),
                if (canEdit)
                  IconButton(
                    onPressed: () {
                      context.push('${AppRoutes.roleEdit}/${rol.id}');
                    },
                    icon: const Icon(Icons.edit),
                    tooltip: 'Editar rol',
                  ),
                if (canDelete)
                  IconButton(
                    onPressed: () => _deleteRole(rol),
                    icon: const Icon(Icons.delete),
                    tooltip: 'Eliminar rol',
                    color: Colors.red,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _getSeccionDisplayName(String seccion) {
    switch (seccion) {
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
        return 'Stock';
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
        return seccion;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Roles'),
        backgroundColor: Colors.blue[700],
        foregroundColor: Colors.white,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _error != null
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.error, size: 64, color: Colors.red[300]),
                      const SizedBox(height: 16),
                      Text(
                        _error!,
                        style: TextStyle(color: Colors.red[700]),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: _loadRoles,
                        child: const Text('Reintentar'),
                      ),
                    ],
                  ),
                )
              : Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Listado de Roles (${_roles.length})',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          ElevatedButton.icon(
                            onPressed: () {
                              context.go(AppRoutes.roleAdd);
                            },
                            icon: const Icon(Icons.add),
                            label: const Text('Nuevo Rol'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue[700],
                              foregroundColor: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: _roles.isEmpty
                          ? Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.admin_panel_settings_outlined,
                                    size: 64,
                                    color: Colors.grey[400],
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    'No hay roles creados',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Crea el primer rol para comenzar',
                                    style: TextStyle(
                                      color: Colors.grey[500],
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  ElevatedButton.icon(
                                    onPressed: () {
                                      context.go(AppRoutes.roleAdd);
                                    },
                                    icon: const Icon(Icons.add),
                                    label: const Text('Crear Primer Rol'),
                                  ),
                                ],
                              ),
                            )
                          : LayoutBuilder(
                              builder: (context, constraints) {
                                final crossAxisCount = (constraints.maxWidth / 320).floor();
                                final actualCrossAxisCount = crossAxisCount > 0 ? crossAxisCount : 1;
                                
                                return GridView.builder(
                                  padding: const EdgeInsets.all(8),
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: actualCrossAxisCount,
                                    childAspectRatio: 1.5,
                                    crossAxisSpacing: 8,
                                    mainAxisSpacing: 8,
                                  ),
                                  itemCount: _roles.length,
                                  itemBuilder: (context, index) {
                                    return _buildRoleCard(_roles[index]);
                                  },
                                );
                              },
                            ),
                    ),
                  ],
                ),
    );
  }
}
