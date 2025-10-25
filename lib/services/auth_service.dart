import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';
import '../models/usuario.dart';
import '../models/rol.dart';
import '../services/id_validator.dart';

final authServiceProvider = Provider<AuthService>((ref) => AuthService());

final currentUserProvider = StateProvider<Usuario?>((ref) => null);

final isAuthenticatedProvider = StateProvider<bool>((ref) => false);

class AuthService {
  Future<Isar?> get db async {
    return Isar.getInstance();
  }

  String _hashPassword(String password) {
    final bytes = utf8.encode(password);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  Future<bool> login(String username, String password) async {
    try {
      final isar = await db;
      if (isar == null) {
        // Error: No se pudo obtener la instancia de Isar
        return false;
      }

      final hashedPassword = _hashPassword(password);
      // Login intent - Username: $username, Password hash: $hashedPassword

      final usuarios = await isar.collection<Usuario>().where().findAll();
      final usuario =
          usuarios
              .where(
                (u) => u.username == username && u.password == hashedPassword,
              )
              .firstOrNull;

      // Usuario encontrado: ${usuario != null}
      if (usuario != null) {
        // Usuario ID: ${usuario.id}, Nombre: ${usuario.nombre}, Rol: ${usuario.rolId}
      }

      return usuario != null;
    } catch (e) {
      // Error en login: $e
      return false;
    }
  }

  Future<Usuario?> getCurrentUser(String username) async {
    try {
      final isar = await db;
      if (isar == null) return null;

      final usuarios = await isar.collection<Usuario>().where().findAll();
      final usuario = usuarios.where((u) => u.username == username).firstOrNull;

      return usuario;
    } catch (e) {
      // Error obteniendo usuario actual: $e
      return null;
    }
  }

  Future<bool> isAdmin(Usuario usuario) async {
    try {
      final isar = await db;
      if (isar == null) return false;

      if (usuario.rolId == null) return false;

      final rol = await isar.collection<Rol>().get(usuario.rolId!);

      return rol?.nombre.toLowerCase() == 'administrador';
    } catch (e) {
      // Error verificando si es admin: $e
      return false;
    }
  }

  /// Cierra la sesión del usuario actual
  Future<void> logout() async {
    try {
      // Aquí podrías agregar lógica adicional como:
      // - Limpiar tokens de sesión
      // - Registrar el logout en logs
      // - Limpiar caché local

      // Usuario ha cerrado sesión
    } catch (e) {
      // Error durante el logout: $e
    }
  }

  Future<bool> canDeleteUser(int userId) async {
    try {
      final isar = await db;
      if (isar == null) return false;

      // Verificar si el usuario a eliminar es administrador
      final usuarioAEliminar = await isar.collection<Usuario>().get(userId);
      if (usuarioAEliminar == null) return false;

      final esAdminAEliminar = await isAdmin(usuarioAEliminar);
      if (!esAdminAEliminar) return true; // Puede eliminar usuarios no admin

      // Si es admin, verificar que no sea el último
      final usuarios = await isar.collection<Usuario>().where().findAll();
      final admins = usuarios.where((u) => u.rolId != null).toList();

      int adminCount = 0;
      for (final usuario in admins) {
        if (usuario.rolId != null) {
          final rol = await isar.collection<Rol>().get(usuario.rolId!);
          if (rol?.nombre.toLowerCase() == 'administrador') {
            adminCount++;
          }
        }
      }

      return adminCount > 1; // Solo puede eliminar si hay más de un admin
    } catch (e) {
      // Error verificando si puede eliminar usuario: $e
      return false;
    }
  }

  /// Verifica si el usuario actual puede agregar usuarios
  Future<bool> canAddUser(Usuario? currentUser) async {
    try {
      if (currentUser == null) return false;

      final isar = await db;
      if (isar == null) return false;

      // Solo los administradores pueden agregar usuarios
      return await isAdmin(currentUser);
    } catch (e) {
      // Error verificando si puede agregar usuario: $e
      return false;
    }
  }

  Future<bool> isLastAdmin(Usuario usuario) async {
    try {
      final isar = await db;
      if (isar == null) return false;

      if (!await isAdmin(usuario)) return false;

      // Contar todos los administradores
      final usuarios = await isar.collection<Usuario>().where().findAll();
      final admins = usuarios.where((u) => u.rolId != null).toList();

      int adminCount = 0;
      for (final admin in admins) {
        if (await isAdmin(admin)) {
          adminCount++;
        }
      }

      return adminCount == 1;
    } catch (e) {
      // Error verificando si es último admin: $e
      return false;
    }
  }

  Future<bool> resetPassword(int userId, String newPassword) async {
    try {
      final isar = await db;
      if (isar == null) return false;

      final hashedPassword = _hashPassword(newPassword);

      await isar.writeTxn(() async {
        final usuario = await isar.collection<Usuario>().get(userId);
        if (usuario != null) {
          usuario.password = hashedPassword;
          await isar.collection<Usuario>().put(usuario);
        }
      });

      return true;
    } catch (e) {
      // Error reseteando contraseña: $e
      return false;
    }
  }

  Future<void> createDefaultAdmin() async {
    try {
      final isar = await db;
      if (isar == null) {
        // Error: No se pudo obtener la instancia de Isar para crear admin
        return;
      }

      // Verificar si ya existe un administrador
      final usuarios = await isar.collection<Usuario>().where().findAll();
      final existingAdmin =
          usuarios.where((u) => u.username == 'admin').firstOrNull;

      if (existingAdmin != null) {
        IdValidator.validateAndLogEntityWithName(
          existingAdmin.id,
          'Administrador',
          existingAdmin.username,
          'Administrador ya existe',
        );
        return;
      }

      // Creando administrador por defecto...

      // Crear rol de administrador si no existe
      final roles = await isar.collection<Rol>().where().findAll();
      Rol? adminRol =
          roles.where((r) => r.nombre == 'Administrador').firstOrNull;

      if (adminRol == null) {
        // Creando rol de administrador...
        await isar.writeTxn(() async {
          adminRol =
              Rol()
                ..nombre = 'Administrador'
                ..descripcion = 'Rol con todos los permisos del sistema';
          await isar.collection<Rol>().put(adminRol!);
        });
        IdValidator.validateAndLogEntityWithName(
          adminRol!.id,
          'Rol',
          adminRol!.nombre,
          'Rol de administrador creado',
        );
      } else {
        IdValidator.validateAndLogEntityWithName(
          adminRol.id,
          'Rol',
          adminRol.nombre,
          'Rol de administrador ya existe',
        );
      }

      // Crear usuario administrador por defecto
      await isar.writeTxn(() async {
        final adminUser =
            Usuario()
              ..username = 'admin'
              ..password = _hashPassword('admin123')
              ..nombre = 'Administrador'
              ..email = 'admin@najam.com'
              ..rolId = adminRol!.id;

        await isar.collection<Usuario>().put(adminUser);
        // Administrador por defecto creado exitosamente - ID: ${adminUser.id}
        // Password hash: ${adminUser.password}
      });

      // Administrador por defecto creado exitosamente
    } catch (e) {
      // Error creando administrador por defecto: $e
    }
  }
}
