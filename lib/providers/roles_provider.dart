import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/rol.dart';

// Provider para el servicio de roles
final rolServiceProvider = Provider<RolService>((ref) {
  return RolService();
});

// Provider para la lista de roles
final rolesProvider = FutureProvider<List<Rol>>((ref) async {
  final rolService = ref.watch(rolServiceProvider);
  return await rolService.obtenerTodosLosRoles();
});

// Provider para obtener roles activos
final rolesActivosProvider = FutureProvider<List<Rol>>((ref) async {
  final rolService = ref.watch(rolServiceProvider);
  return await rolService.obtenerRolesActivos();
});

// Provider para obtener un rol específico
final rolProvider = FutureProvider.family<Rol?, int>((ref, rolId) async {
  final rolService = ref.watch(rolServiceProvider);
  return await rolService.obtenerRolPorId(rolId);
});

// Provider para obtener permisos de un rol
final permisosPorRolProvider = FutureProvider.family<List<String>, int>((
  ref,
  rolId,
) async {
  final rolService = ref.watch(rolServiceProvider);
  return await rolService.obtenerPermisosPorRol(rolId);
});

// Provider para verificar si un rol tiene un permiso específico
final rolTienePermisoProvider =
    FutureProvider.family<bool, Map<String, dynamic>>((ref, params) async {
      final rolService = ref.watch(rolServiceProvider);
      return await rolService.rolTienePermiso(
        params['rolId'],
        params['permiso'],
      );
    });

// Provider para estadísticas de roles
final estadisticasRolesProvider = FutureProvider<EstadisticasRoles>((
  ref,
) async {
  final rolService = ref.watch(rolServiceProvider);
  return await rolService.obtenerEstadisticasRoles();
});

// Provider para roles del sistema (predefinidos)
final rolesSistemaProvider = FutureProvider<List<Rol>>((ref) async {
  final rolService = ref.watch(rolServiceProvider);
  return await rolService.obtenerRolesSistema();
});

// Clase para estadísticas de roles
class EstadisticasRoles {
  final int totalRoles;
  final int rolesActivos;
  final int rolesInactivos;
  final int rolesSistema;
  final int rolesPersonalizados;
  final Map<String, int> usuariosPorRol;
  final List<String> permisosDisponibles;

  EstadisticasRoles({
    required this.totalRoles,
    required this.rolesActivos,
    required this.rolesInactivos,
    required this.rolesSistema,
    required this.rolesPersonalizados,
    required this.usuariosPorRol,
    required this.permisosDisponibles,
  });
}

// Servicio mínimo de roles para que 'RolService' exista como tipo.
// Implementación simple que devuelve valores por defecto; reemplaza con la lógica real según sea necesario.
class RolService {
  Future<List<Rol>> obtenerTodosLosRoles() async {
    return [];
  }

  Future<List<Rol>> obtenerRolesActivos() async {
    return [];
  }

  Future<Rol?> obtenerRolPorId(int id) async {
    return null;
  }

  Future<List<String>> obtenerPermisosPorRol(int rolId) async {
    return [];
  }

  Future<bool> rolTienePermiso(int rolId, String permiso) async {
    return false;
  }

  Future<EstadisticasRoles> obtenerEstadisticasRoles() async {
    return EstadisticasRoles(
      totalRoles: 0,
      rolesActivos: 0,
      rolesInactivos: 0,
      rolesSistema: 0,
      rolesPersonalizados: 0,
      usuariosPorRol: {},
      permisosDisponibles: [],
    );
  }

  Future<List<Rol>> obtenerRolesSistema() async {
    return [];
  }
}
