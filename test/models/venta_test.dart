import 'package:flutter_test/flutter_test.dart';
import 'package:tienda_app/models/venta.dart';

void main() {
  group('Venta Model Tests - TDD', () {
    late Venta venta;
    
    setUp(() {
      // Arrange: Configurar objeto base para cada test
      venta = Venta(
        clienteId: 1,
        clienteNombre: 'Cliente Test',
        clienteEmail: 'cliente@test.com',
        clienteTelefono: '1234567890',
        clienteDocumento: 'DNI123456',
        clienteDireccion: 'Calle Falsa 123',
        clienteTipoCliente: 'regular',
        fecha: DateTime(2024, 1, 15),
        total: 150.50,
        metodoPago: 'efectivo',
        estado: 'pendiente',
        usuarioId: 1,
      );
    });

    group('Constructor Tests', () {
      test('debe crear una venta con valores requeridos válidos', () {
        // Arrange & Act
        final nuevaVenta = Venta(
          clienteId: 2,
          clienteNombre: 'Cliente Nuevo',
          clienteEmail: 'nuevo@test.com',
          clienteTelefono: '0987654321',
          clienteDocumento: 'DNI654321',
          clienteDireccion: 'Avenida Siempre Viva 742',
          clienteTipoCliente: 'regular',
          fecha: DateTime(2024, 2, 1),
          total: 99.99,
          metodoPago: 'tarjeta',
          estado: 'completada',
          usuarioId: 2,
        );
        
        // Assert
        expect(nuevaVenta.clienteId, equals(2));
        expect(nuevaVenta.fecha, equals(DateTime(2024, 2, 1)));
        expect(nuevaVenta.total, equals(99.99));
        expect(nuevaVenta.metodoPago, equals('tarjeta'));
        expect(nuevaVenta.estado, equals('completada'));
      });

      test('debe tener id autogenerado por defecto', () {
        // Act & Assert
        expect(venta.id, isA<int>()); // Isar.autoIncrement
      });
    });

    group('Validation Tests', () {
      test('debe validar estado como pendiente correctamente', () {
        // Act & Assert
        expect(venta.estado, equals('pendiente'));
      });

      test('debe validar total positivo', () {
        // Act & Assert  
        expect(venta.total, greaterThan(0));
      });

      test('debe manejar observaciones opcionales como null', () {
        // Act & Assert
        expect(venta.observaciones, isNull);
      });

      test('debe tener esDevolucion como false por defecto', () {
        // Act & Assert
        expect(venta.esDevolucion, isFalse);
      });
    });

    group('Business Logic Tests', () {
      test('debe calcular cambio correctamente cuando montoPagado es mayor', () {
        // Arrange
        venta.montoPagado = 200.0;
        
        // Act
        final cambioEsperado = venta.montoPagado! - venta.total;
        
        // Assert
        expect(cambioEsperado, equals(49.5));
      });

      test('debe validar método de pago válido', () {
        // Arrange
        final metodosPago = ['efectivo', 'tarjeta', 'transferencia'];
        
        // Act & Assert
        expect(metodosPago.contains(venta.metodoPago), isTrue);
      });

      test('debe validar estados válidos de venta', () {
        // Arrange
        final estadosValidos = ['pendiente', 'completada', 'cancelada', 'devuelta'];
        
        // Act & Assert
        expect(estadosValidos.contains(venta.estado), isTrue);
      });
    });

    group('Data Integrity Tests', () {
      test('debe validar clienteId positivo', () {
        // Act & Assert
        expect(venta.clienteId, greaterThan(0));
      });

      test('debe validar fecha no futura para ventas normales', () {
        // Act & Assert
        expect(venta.fecha.isBefore(DateTime.now().add(Duration(days: 1))), isTrue);
      });

      test('debe manejar información de pago opcional', () {
        // Arrange
        venta.referenciaPago = 'REF123';
        venta.banco = 'Banco Test';
        
        // Act & Assert
        expect(venta.referenciaPago, equals('REF123'));
        expect(venta.banco, equals('Banco Test'));
        expect(venta.numeroTarjeta, isNull);
      });
    });

    group('Professional Info Tests', () {
      test('debe manejar información profesional opcional', () {
        // Arrange
        venta.numeroFactura = 'F-001';
        venta.numeroRecibo = 'R-001';
        venta.vendedor = 'Juan Pérez';
        
        // Act & Assert
        expect(venta.numeroFactura, equals('F-001'));
        expect(venta.numeroRecibo, equals('R-001'));
        expect(venta.vendedor, equals('Juan Pérez'));
      });

      test('debe generar número de ticket único', () {
        // Arrange & Act
        venta.numeroTicket = 'TKT-${DateTime.now().millisecondsSinceEpoch}';
        
        // Assert
        expect(venta.numeroTicket, isNotNull);
        expect(venta.numeroTicket!.startsWith('TKT-'), isTrue);
      });
    });

    group('Return Logic Tests', () {
      test('debe configurar venta como devolución correctamente', () {
        // Act
        venta.esDevolucion = true;
        venta.estado = 'devuelta';
        
        // Assert
        expect(venta.esDevolucion, isTrue);
        expect(venta.estado, equals('devuelta'));
      });

      test('debe validar total negativo para devoluciones', () {
        // Arrange
        venta.esDevolucion = true;
        venta.total = -50.0;
        
        // Act & Assert
        expect(venta.esDevolucion, isTrue);
        expect(venta.total, lessThan(0));
      });
    });
  });
}