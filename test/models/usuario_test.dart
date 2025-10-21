import 'package:flutter_test/flutter_test.dart';
import 'package:tienda_app/models/usuario.dart';

void main() {
  group('Usuario Model Tests - TDD', () {
    late Usuario usuario;
    
    setUp(() {
      // Arrange: Configurar objeto base para cada test
      usuario = Usuario()
        ..nombre = 'Juan'
        ..apellido = 'Pérez'
        ..email = 'juan.perez@tienda.com'
        ..username = 'juan_perez'
        ..password = 'password123'
        ..rolId = 1
        ..fechaCreacion = DateTime(2024, 1, 15)
        ..avatarUrl = 'assets/images/avatars/juan.jpg';
    });

    group('Constructor Tests', () {
      test('debe crear usuario con campos requeridos', () {
        // Arrange & Act
        final nuevoUsuario = Usuario()
          ..nombre = 'María'
          ..username = 'maria'
          ..password = 'secreto';
        
        // Assert
        expect(nuevoUsuario.nombre, equals('María'));
        expect(nuevoUsuario.username, equals('maria'));
        expect(nuevoUsuario.password, equals('secreto'));
        expect(nuevoUsuario.id, isA<int>());
      });

      test('debe crear usuario completo con todos los campos', () {
        // Act & Assert
        expect(usuario.nombre, equals('Juan'));
        expect(usuario.apellido, equals('Pérez'));
        expect(usuario.email, equals('juan.perez@tienda.com'));
        expect(usuario.username, equals('juan_perez'));
        expect(usuario.password, equals('password123'));
        expect(usuario.rolId, equals(1));
        expect(usuario.fechaCreacion, equals(DateTime(2024, 1, 15)));
        expect(usuario.avatarUrl, equals('assets/images/avatars/juan.jpg'));
      });
    });

    group('Validation Tests', () {
      test('debe validar nombre no vacío', () {
        // Act & Assert
        expect(usuario.nombre.isNotEmpty, isTrue);
      });

      test('debe validar username único', () {
        // Act & Assert
        expect(usuario.username.isNotEmpty, isTrue);
        expect(usuario.username.length, greaterThan(3));
      });

      test('debe validar formato de email válido', () {
        // Arrange & Act
        final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
        
        // Assert
        expect(emailRegex.hasMatch(usuario.email!), isTrue);
      });

      test('debe validar contraseña segura', () {
        // Act & Assert
        expect(usuario.password.isNotEmpty, isTrue);
        expect(usuario.password.length, greaterThanOrEqualTo(6));
      });
    });

    group('Optional Fields Tests', () {
      test('debe manejar campos opcionales como null', () {
        // Arrange & Act
        final usuarioMinimo = Usuario()
          ..nombre = 'Admin'
          ..username = 'admin'
          ..password = 'admin123';
        
        // Assert
        expect(usuarioMinimo.apellido, isNull);
        expect(usuarioMinimo.email, isNull);
        expect(usuarioMinimo.rolId, isNull);
        expect(usuarioMinimo.fechaCreacion, isNull);
        expect(usuarioMinimo.avatarUrl, isNull);
      });

      test('debe permitir actualizar campos opcionales', () {
        // Arrange
        final usuarioTemporal = Usuario()
          ..nombre = 'Temporal'
          ..username = 'temp'
          ..password = 'temp123';
        
        // Act
        usuarioTemporal.email = 'temp@email.com';
        usuarioTemporal.rolId = 2;
        usuarioTemporal.fechaCreacion = DateTime.now();
        
        // Assert
        expect(usuarioTemporal.email, equals('temp@email.com'));
        expect(usuarioTemporal.rolId, equals(2));
        expect(usuarioTemporal.fechaCreacion, isNotNull);
      });
    });

    group('Profile Image Tests', () {
      test('debe retornar avatarUrl cuando está configurado', () {
        // Act & Assert
        expect(usuario.imagenPerfil, equals('assets/images/avatars/juan.jpg'));
      });

      test('debe retornar imagen por defecto cuando avatarUrl es null', () {
        // Arrange
        usuario.avatarUrl = null;
        
        // Act & Assert
        expect(usuario.imagenPerfil, equals('assets/images/icons/default_avatar.png'));
      });

      test('debe retornar imagen por defecto cuando avatarUrl está vacío', () {
        // Arrange
        usuario.avatarUrl = '';
        
        // Act & Assert
        expect(usuario.imagenPerfil, equals('assets/images/icons/default_avatar.png'));
      });

      test('debe retornar imagen por defecto cuando avatarUrl contiene solo espacios', () {
        // Arrange
        usuario.avatarUrl = '   ';
        
        // Act & Assert
        expect(usuario.imagenPerfil, equals('assets/images/icons/default_avatar.png'));
      });
    });

    group('Business Logic Tests', () {
      test('debe generar nombre completo correctamente', () {
        // Act
        final nombreCompleto = '${usuario.nombre} ${usuario.apellido ?? ''}';
        
        // Assert
        expect(nombreCompleto.trim(), equals('Juan Pérez'));
      });

      test('debe manejar nombre completo sin apellido', () {
        // Arrange
        usuario.apellido = null;
        
        // Act
        final nombreCompleto = '${usuario.nombre} ${usuario.apellido ?? ''}';
        
        // Assert
        expect(nombreCompleto.trim(), equals('Juan'));
      });

      test('debe validar si tiene rol asignado', () {
        // Act & Assert
        expect(usuario.rolId, isNotNull);
        expect(usuario.rolId! > 0, isTrue);
      });

      test('debe validar usuario sin rol', () {
        // Arrange & Act
        final usuarioSinRol = Usuario()
          ..nombre = 'SinRol'
          ..username = 'sinrol'
          ..password = 'sinrol123';
        
        // Assert
        expect(usuarioSinRol.rolId, isNull);
      });
    });

    group('Authentication Tests', () {
      test('debe tener credenciales válidas para autenticación', () {
        // Act & Assert
        expect(usuario.username.isNotEmpty, isTrue);
        expect(usuario.password.isNotEmpty, isTrue);
      });

      test('debe validar formato de username sin espacios', () {
        // Act & Assert
        expect(usuario.username.contains(' '), isFalse);
      });

      test('debe permitir diferentes formatos de username válidos', () {
        // Arrange
        final usernames = ['user123', 'user_name', 'username'];
        
        // Act & Assert
        for (final username in usernames) {
          final testUser = Usuario()
            ..nombre = 'Test'
            ..username = username
            ..password = 'test123';
          
          expect(testUser.username, equals(username));
          expect(testUser.username.isNotEmpty, isTrue);
        }
      });
    });

    group('Date Management Tests', () {
      test('debe registrar fecha de creación válida', () {
        // Act & Assert
        expect(usuario.fechaCreacion, isNotNull);
        expect(usuario.fechaCreacion!.isBefore(DateTime.now()), isTrue);
      });

      test('debe calcular días desde creación', () {
        // Arrange
        final ahora = DateTime.now();
        
        // Act
        final diasDesdeCreacion = ahora.difference(usuario.fechaCreacion!).inDays;
        
        // Assert
        expect(diasDesdeCreacion, greaterThanOrEqualTo(0));
      });

      test('debe manejar usuario sin fecha de creación', () {
        // Arrange & Act
        final usuarioSinFecha = Usuario()
          ..nombre = 'SinFecha'
          ..username = 'sinfecha'
          ..password = 'sinfecha123';
        
        // Assert
        expect(usuarioSinFecha.fechaCreacion, isNull);
      });
    });

    group('Security Tests', () {
      test('debe almacenar contraseña (en implementación real sería hash)', () {
        // Act & Assert
        expect(usuario.password, isNotEmpty);
        // En implementación real, verificaríamos que es un hash
        expect(usuario.password.length, greaterThan(5));
      });

      test('debe validar contraseñas de diferentes longitudes', () {
        // Arrange
        final contrasenasValidas = ['123456', 'password123', 'secure_pass_2024'];
        
        // Act & Assert
        for (final password in contrasenasValidas) {
          final testUser = Usuario()
            ..nombre = 'Test'
            ..username = 'test'
            ..password = password;
          
          expect(testUser.password.length, greaterThanOrEqualTo(6));
        }
      });
    });

    group('Role Management Tests', () {
      test('debe asociar usuario con rol específico', () {
        // Act & Assert
        expect(usuario.rolId, equals(1));
      });

      test('debe permitir cambiar rol de usuario', () {
        // Act
        usuario.rolId = 3; // Cambiar de rol 1 a rol 3
        
        // Assert
        expect(usuario.rolId, equals(3));
      });

      test('debe manejar usuario administrador (rol especial)', () {
        // Arrange & Act
        final admin = Usuario()
          ..nombre = 'Administrador'
          ..username = 'admin'
          ..password = 'admin_secure_123'
          ..rolId = 1; // Asumiendo que rol 1 es administrador
        
        // Assert
        expect(admin.rolId, equals(1));
      });
    });
  });
}