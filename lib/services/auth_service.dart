import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'package:tienda_app/models/usuario.dart';
import 'package:tienda_app/models/rol.dart';
import 'package:tienda_app/services/isar_service.dart';
import 'package:tienda_app/services/id_validator.dart';

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
        print('Error: No se pudo obtener la instancia de Isar');
        return false;
      }

      final hashedPassword = _hashPassword(password);
      print(
        'Login intent - Username: $username, Password hash: $hashedPassword',
      );

      final usuario =
          await isar.usuarios
              .filter()
              .usernameEqualTo(username)
              .and()
              .passwordEqualTo(hashedPassword)
              .findFirst();

      print('Usuario encontrado: ${usuario != null}');
      if (usuario != null) {
        print(
          'Usuario ID: ${usuario.id}, Nombre: ${usuario.nombre}, Rol: ${usuario.rolId}',
        );
      }

      return usuario != null;
    } catch (e) {
      print('Error en login: $e');
      return false;
    }
  }

  Future<Usuario?> getCurrentUser(String username) async {
    try {
      final isar = await db;
      if (isar == null) return null;

      final usuario =
          await isar.usuarios.filter().usernameEqualTo(username).findFirst();

      return usuario;
    } catch (e) {
      print('Error obteniendo usuario actual: $e');
      return null;
    }
  }

  Future<bool> isAdmin(Usuario usuario) async {
    try {
      final isar = await db;
      if (isar == null) return false;

      if (usuario.rolId == null) return false;

      final rol = await isar.rols.get(usuario.rolId!);

      return rol?.nombre.toLowerCase() == 'administrador';
    } catch (e) {
      print('Error verificando si es admin: $e');
      return false;
    }
  }

  Future<bool> canDeleteUser(int userId) async {
    try {
      final isar = await db;
      if (isar == null) return false;

      // Verificar si el usuario a eliminar es administrador
      final usuarioAEliminar = await isar.usuarios.get(userId);
      if (usuarioAEliminar == null) return false;

      final esAdminAEliminar = await isAdmin(usuarioAEliminar);

      if (!esAdminAEliminar) return true; // Puede eliminar usuarios no admin

      // Si es admin, verificar cuántos administradores hay
      final admins = await isar.usuarios.filter().rolIdIsNotNull().findAll();

      int adminCount = 0;
      for (final admin in admins) {
        if (await isAdmin(admin)) {
          adminCount++;
        }
      }

      // Solo puede eliminar si hay más de un administrador
      return adminCount > 1;
    } catch (e) {
      print('Error verificando si puede eliminar usuario: $e');
      return false;
    }
  }

  Future<bool> isLastAdmin(Usuario usuario) async {
    try {
      final isar = await db;
      if (isar == null) return false;

      if (!await isAdmin(usuario)) return false;

      // Contar todos los administradores
      final admins = await isar.usuarios.filter().rolIdIsNotNull().findAll();

      int adminCount = 0;
      for (final admin in admins) {
        if (await isAdmin(admin)) {
          adminCount++;
        }
      }

      return adminCount == 1;
    } catch (e) {
      print('Error verificando si es último admin: $e');
      return false;
    }
  }

  Future<bool> resetPassword(int userId, String newPassword) async {
    try {
      final isar = await db;
      if (isar == null) return false;

      final hashedPassword = _hashPassword(newPassword);

      await isar.writeTxn(() async {
        final usuario = await isar.usuarios.get(userId);
        if (usuario != null) {
          usuario.password = hashedPassword;
          await isar.usuarios.put(usuario);
        }
      });

      return true;
    } catch (e) {
      print('Error reseteando contraseña: $e');
      return false;
    }
  }

  Future<void> createDefaultAdmin() async {
    try {
      final isar = await db;
      if (isar == null) {
        print(
          'Error: No se pudo obtener la instancia de Isar para crear admin',
        );
        return;
      }

      // Verificar si ya existe un administrador
      final existingAdmin =
          await isar.usuarios.filter().usernameEqualTo('admin').findFirst();

      if (existingAdmin != null) {
        IdValidator.validateAndLogEntityWithName(
          existingAdmin.id,
          'Administrador',
          existingAdmin.username,
          'Administrador ya existe',
        );
        return;
      }

      print('Creando administrador por defecto...');

      // Crear rol de administrador si no existe
      Rol? adminRol =
          await isar.rols.filter().nombreEqualTo('Administrador').findFirst();

      if (adminRol == null) {
        print('Creando rol de administrador...');
        await isar.writeTxn(() async {
          adminRol =
              Rol()
                ..nombre = 'Administrador'
                ..descripcion = 'Rol con todos los permisos del sistema';
          await isar.rols.put(adminRol!);
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

        await isar.usuarios.put(adminUser);
        print(
          'Administrador por defecto creado exitosamente - ID: ${adminUser.id}',
        );
        print('Password hash: ${adminUser.password}');
      });

      print('Administrador por defecto creado exitosamente');
    } catch (e) {
      print('Error creando administrador por defecto: $e');
    }
  }
}
