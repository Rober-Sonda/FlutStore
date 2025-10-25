import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/usuario.dart';

// Servicio de usuarios (stub) — define la clase para que el tipo exista.
// Reemplaza o mueve esta implementación al archivo correspondiente si ya
// tienes una implementación real en tu proyecto.
class UsuarioService {
  Future<List<Usuario>> obtenerTodosLosUsuarios() async {
    // Implementa la lógica real o conecta con tu API aquí.
    return <Usuario>[];
  }

  Future<List<Usuario>> obtenerUsuariosPorRol(int rolId) async {
    return <Usuario>[];
  }

  Future<List<Usuario>> obtenerUsuariosActivos() async {
    return <Usuario>[];
  }

  Future<Usuario?> obtenerUsuarioPorId(int id) async {
    return null;
  }

  Future<bool> tieneAdministradores() async {
    return false;
  }

  Future<EstadisticasUsuarios> obtenerEstadisticasUsuarios() async {
    return EstadisticasUsuarios(
      totalUsuarios: 0,
      usuariosActivos: 0,
      usuariosInactivos: 0,
      administradores: 0,
      operadores: 0,
      usuariosPorRol: {},
    );
  }
}

// Provider para el servicio de usuarios
final usuarioServiceProvider = Provider<UsuarioService>((ref) {
  return UsuarioService();
});

// Provider para la lista de usuarios
final usuariosProvider = FutureProvider<List<Usuario>>((ref) async {
  final usuarioService = ref.watch(usuarioServiceProvider);
  return await usuarioService.obtenerTodosLosUsuarios();
});

// Provider para obtener usuarios por rol
final usuariosPorRolProvider = FutureProvider.family<List<Usuario>, int>((
  ref,
  rolId,
) async {
  final usuarioService = ref.watch(usuarioServiceProvider);
  return await usuarioService.obtenerUsuariosPorRol(rolId);
});

// Provider para obtener usuarios activos
final usuariosActivosProvider = FutureProvider<List<Usuario>>((ref) async {
  final usuarioService = ref.watch(usuarioServiceProvider);
  return await usuarioService.obtenerUsuariosActivos();
});

// Provider para obtener un usuario específico
final usuarioProvider = FutureProvider.family<Usuario?, int>((
  ref,
  usuarioId,
) async {
  final usuarioService = ref.watch(usuarioServiceProvider);
  return await usuarioService.obtenerUsuarioPorId(usuarioId);
});

// Provider para el usuario actual (logueado)
final usuarioActualProvider = StateProvider<Usuario?>((ref) => null);

// Provider para verificar si hay usuarios administradores
final tieneAdministradoresProvider = FutureProvider<bool>((ref) async {
  final usuarioService = ref.watch(usuarioServiceProvider);
  return await usuarioService.tieneAdministradores();
});

// Provider para estadísticas de usuarios
final estadisticasUsuariosProvider = FutureProvider<EstadisticasUsuarios>((
  ref,
) async {
  final usuarioService = ref.watch(usuarioServiceProvider);
  return await usuarioService.obtenerEstadisticasUsuarios();
});

// Clase para estadísticas de usuarios
class EstadisticasUsuarios {
  final int totalUsuarios;
  final int usuariosActivos;
  final int usuariosInactivos;
  final int administradores;
  final int operadores;
  final Map<String, int> usuariosPorRol;

  EstadisticasUsuarios({
    required this.totalUsuarios,
    required this.usuariosActivos,
    required this.usuariosInactivos,
    required this.administradores,
    required this.operadores,
    required this.usuariosPorRol,
  });
}
