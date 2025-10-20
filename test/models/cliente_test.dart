import 'package:flutter_test/flutter_test.dart';
import 'package:tienda_app/models/cliente.dart';

void main() {
  group('Cliente Model Tests - TDD', () {
    late Cliente cliente;
    
    setUp(() {
      // Arrange: Configurar objeto base para cada test
      cliente = Cliente(
        id: 1,
        nombre: 'Juan',
        apellido: 'Pérez',
        email: 'juan.perez@email.com',
        whatsapp: '+54911234567',
        direccion: 'Av. Corrientes 1234',
        dni: '12345678',
        fechaRegistro: DateTime(2024, 1, 15),
      );
    });

    group('Constructor Tests', () {
      test('debe crear cliente con nombre requerido', () {
        // Arrange & Act
        final nuevoCliente = Cliente(id: 2, nombre: 'María');
        
        // Assert
        expect(nuevoCliente.id, equals(2));
        expect(nuevoCliente.nombre, equals('María'));
        expect(nuevoCliente.apellido, isNull);
      });

      test('debe crear cliente completo con todos los campos', () {
        // Act & Assert
        expect(cliente.nombre, equals('Juan'));
        expect(cliente.apellido, equals('Pérez'));
        expect(cliente.email, equals('juan.perez@email.com'));
        expect(cliente.whatsapp, equals('+54911234567'));
        expect(cliente.direccion, equals('Av. Corrientes 1234'));
        expect(cliente.dni, equals('12345678'));
        expect(cliente.fechaRegistro, equals(DateTime(2024, 1, 15)));
      });
    });

    group('Validation Tests', () {
      test('debe validar nombre no vacío', () {
        // Act & Assert
        expect(cliente.nombre.isNotEmpty, isTrue);
      });

      test('debe validar formato de email válido', () {
        // Act & Assert
        final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
        expect(emailRegex.hasMatch(cliente.email!), isTrue);
      });

      test('debe validar formato de WhatsApp argentino', () {
        // Act & Assert
        expect(cliente.whatsapp!.startsWith('+549'), isTrue);
      });

      test('debe validar DNI como string numérico', () {
        // Act & Assert
        final dniRegex = RegExp(r'^\d{7,8}$');
        expect(dniRegex.hasMatch(cliente.dni!), isTrue);
      });
    });

    group('Optional Fields Tests', () {
      test('debe manejar campos opcionales como null', () {
        // Arrange & Act
        final clienteMinimo = Cliente(id: 3, nombre: 'Ana');
        
        // Assert
        expect(clienteMinimo.apellido, isNull);
        expect(clienteMinimo.email, isNull);
        expect(clienteMinimo.whatsapp, isNull);
        expect(clienteMinimo.instagram, isNull);
        expect(clienteMinimo.direccion, isNull);
        expect(clienteMinimo.dni, isNull);
        expect(clienteMinimo.cuil, isNull);
        expect(clienteMinimo.fechaRegistro, isNull);
      });

      test('debe permitir Instagram opcional', () {
        // Arrange & Act
        cliente.instagram = '@juan_perez';
        
        // Assert
        expect(cliente.instagram, equals('@juan_perez'));
      });
    });

    group('Business Logic Tests', () {
      test('debe generar nombre completo', () {
        // Act
        final nombreCompleto = '${cliente.nombre} ${cliente.apellido ?? ''}';
        
        // Assert
        expect(nombreCompleto.trim(), equals('Juan Pérez'));
      });

      test('debe formatear número de WhatsApp correctamente', () {
        // Act
        final whatsappFormateado = cliente.whatsapp!.replaceAll('+54', '');
        
        // Assert
        expect(whatsappFormateado, equals('911234567'));
      });

      test('debe validar CUIL si existe', () {
        // Arrange
        cliente.cuil = '20-12345678-9';
        
        // Act & Assert
        final cuilRegex = RegExp(r'^\d{2}-\d{8}-\d{1}$');
        expect(cuilRegex.hasMatch(cliente.cuil!), isTrue);
      });
    });

    group('Date Tests', () {
      test('debe registrar fecha de registro válida', () {
        // Act & Assert
        expect(cliente.fechaRegistro, isNotNull);
        expect(cliente.fechaRegistro!.isBefore(DateTime.now()), isTrue);
      });

      test('debe calcular días desde registro', () {
        // Arrange
        final ahora = DateTime.now();
        
        // Act
        final diasDesdeRegistro = ahora.difference(cliente.fechaRegistro!).inDays;
        
        // Assert
        expect(diasDesdeRegistro, greaterThanOrEqualTo(0));
      });
    });

    group('Contact Info Tests', () {
      test('debe validar múltiples formas de contacto', () {
        // Act & Assert
        expect(cliente.email, isNotNull);
        expect(cliente.whatsapp, isNotNull);
        expect(cliente.instagram, isNull); // Por defecto null en setup
      });

      test('debe permitir actualizar información de contacto', () {
        // Act
        cliente.email = 'nuevo.email@test.com';
        cliente.whatsapp = '+549876543210';
        cliente.instagram = '@nuevo_usuario';
        
        // Assert
        expect(cliente.email, equals('nuevo.email@test.com'));
        expect(cliente.whatsapp, equals('+549876543210'));
        expect(cliente.instagram, equals('@nuevo_usuario'));
      });
    });

    group('Address Tests', () {
      test('debe manejar dirección completa', () {
        // Act & Assert
        expect(cliente.direccion, equals('Av. Corrientes 1234'));
        expect(cliente.direccion!.isNotEmpty, isTrue);
      });

      test('debe permitir actualizar dirección', () {
        // Act
        cliente.direccion = 'Belgrano 567, Ciudad, Provincia';
        
        // Assert
        expect(cliente.direccion, equals('Belgrano 567, Ciudad, Provincia'));
      });
    });
  });
}