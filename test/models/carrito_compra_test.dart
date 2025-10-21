import 'package:flutter_test/flutter_test.dart';
import 'package:tienda_app/models/carrito_compra.dart';

void main() {
  group('CarritoCompra Model Tests - TDD', () {
    late CarritoCompra itemCarrito;
    
    setUp(() {
      // Arrange: Configurar objeto base para cada test
      itemCarrito = CarritoCompra()
        ..nombreProducto = 'Camisa Polo'
        ..productoId = 1
        ..cantidad = 2
        ..precioUnitario = 25.99
        ..fechaAgregado = DateTime(2024, 1, 15)
        ..notas = 'Talla M, Color Azul';
      
      itemCarrito.calcularPrecioTotal();
    });

    group('Constructor Tests', () {
      test('debe crear item de carrito con valores por defecto', () {
        // Arrange & Act
        final nuevoItem = CarritoCompra()
          ..nombreProducto = 'Producto Test';
        
        // Assert
        expect(nuevoItem.id, isA<int>());
        expect(nuevoItem.nombreProducto, equals('Producto Test'));
        expect(nuevoItem.cantidad, equals(1));
        expect(nuevoItem.estado, equals('pendiente'));
        expect(nuevoItem.esUrgente, isFalse);
        expect(nuevoItem.proveedorSeleccionado, isFalse);
      });

      test('debe crear item completo con todos los campos', () {
        // Act & Assert
        expect(itemCarrito.nombreProducto, equals('Camisa Polo'));
        expect(itemCarrito.productoId, equals(1));
        expect(itemCarrito.cantidad, equals(2));
        expect(itemCarrito.precioUnitario, equals(25.99));
        expect(itemCarrito.precioTotal, equals(51.98));
        expect(itemCarrito.notas, equals('Talla M, Color Azul'));
      });
    });

    group('Price Calculation Tests', () {
      test('debe calcular precio total correctamente', () {
        // Arrange
        itemCarrito.precioUnitario = 15.50;
        itemCarrito.cantidad = 3;
        
        // Act
        itemCarrito.calcularPrecioTotal();
        
        // Assert
        expect(itemCarrito.precioTotal, equals(46.50));
      });

      test('debe manejar precio unitario null sin error', () {
        // Arrange
        itemCarrito.precioUnitario = null;
        itemCarrito.precioTotal = null; // Resetear valor previo
        itemCarrito.cantidad = 5;
        
        // Act
        itemCarrito.calcularPrecioTotal();
        
        // Assert
        expect(itemCarrito.precioTotal, isNull);
      });

      test('debe manejar cantidad cero correctamente', () {
        // Arrange
        itemCarrito.precioUnitario = 10.00;
        itemCarrito.precioTotal = null; // Resetear valor previo
        itemCarrito.cantidad = 0;
        
        // Act
        itemCarrito.calcularPrecioTotal();
        
        // Assert
        expect(itemCarrito.precioTotal, isNull);
      });

      test('debe recalcular automáticamente al actualizar cantidad', () {
        // Arrange
        itemCarrito.precioUnitario = 20.00;
        
        // Act
        itemCarrito.actualizarCantidad(4);
        
        // Assert
        expect(itemCarrito.cantidad, equals(4));
        expect(itemCarrito.precioTotal, equals(80.00));
      });
    });

    group('Provider Management Tests', () {
      test('debe establecer información del proveedor correctamente', () {
        // Act
        itemCarrito.establecerProveedor(
          proveedorId: 101,
          nombreProveedor: 'Proveedor ABC',
          precioUnitario: 22.50,
          codigoProveedor: 'PROV001',
          stockDisponible: 50,
          observaciones: 'Entrega en 3 días',
        );
        
        // Assert
        expect(itemCarrito.proveedorId, equals(101));
        expect(itemCarrito.nombreProveedor, equals('Proveedor ABC'));
        expect(itemCarrito.precioUnitario, equals(22.50));
        expect(itemCarrito.codigoProveedor, equals('PROV001'));
        expect(itemCarrito.stockDisponibleProveedor, equals(50));
        expect(itemCarrito.observacionesProveedor, equals('Entrega en 3 días'));
        expect(itemCarrito.proveedorSeleccionado, isTrue);
        expect(itemCarrito.precioTotal, equals(45.00)); // 22.50 * 2
      });

      test('debe mantener precio anterior si no se proporciona nuevo', () {
        // Arrange
        itemCarrito.precioUnitario = 30.00;
        itemCarrito.calcularPrecioTotal();
        final precioAnterior = itemCarrito.precioTotal;
        
        // Act
        itemCarrito.establecerProveedor(
          proveedorId: 102,
          nombreProveedor: 'Proveedor XYZ',
          // No se proporciona precioUnitario
        );
        
        // Assert
        expect(itemCarrito.precioUnitario, equals(30.00));
        expect(itemCarrito.precioTotal, equals(precioAnterior));
        expect(itemCarrito.proveedorSeleccionado, isTrue);
      });
    });

    group('Stock Management Tests', () {
      test('debe indicar stock suficiente cuando hay inventario', () {
        // Arrange
        itemCarrito.cantidad = 3;
        itemCarrito.stockDisponibleProveedor = 10;
        
        // Act & Assert
        expect(itemCarrito.hayStockSuficiente, isTrue);
        expect(itemCarrito.estadoStock, equals('Stock suficiente'));
        expect(itemCarrito.colorEstadoStock, equals('green'));
      });

      test('debe indicar stock insuficiente cuando no alcanza', () {
        // Arrange
        itemCarrito.cantidad = 8;
        itemCarrito.stockDisponibleProveedor = 5;
        
        // Act & Assert
        expect(itemCarrito.hayStockSuficiente, isFalse);
        expect(itemCarrito.estadoStock, equals('Stock insuficiente'));
        expect(itemCarrito.colorEstadoStock, equals('orange'));
      });

      test('debe indicar sin stock cuando inventario es cero', () {
        // Arrange
        itemCarrito.cantidad = 2;
        itemCarrito.stockDisponibleProveedor = 0;
        
        // Act & Assert
        expect(itemCarrito.hayStockSuficiente, isFalse);
        expect(itemCarrito.estadoStock, equals('Sin stock'));
        expect(itemCarrito.colorEstadoStock, equals('red'));
      });

      test('debe asumir stock disponible cuando no hay información', () {
        // Arrange
        itemCarrito.cantidad = 5;
        itemCarrito.stockDisponibleProveedor = null;
        
        // Act & Assert
        expect(itemCarrito.hayStockSuficiente, isTrue);
        expect(itemCarrito.estadoStock, equals('Stock no disponible'));
        expect(itemCarrito.colorEstadoStock, equals('grey'));
      });
    });

    group('State Management Tests', () {
      test('debe cambiar estado correctamente', () {
        // Act
        itemCarrito.estado = 'procesado';
        
        // Assert
        expect(itemCarrito.estado, equals('procesado'));
      });

      test('debe manejar estados válidos del carrito', () {
        // Arrange
        final estadosValidos = ['pendiente', 'procesado', 'cancelado'];
        
        // Act & Assert
        for (final estado in estadosValidos) {
          itemCarrito.estado = estado;
          expect(itemCarrito.estado, equals(estado));
        }
      });

      test('debe marcar como urgente correctamente', () {
        // Act
        itemCarrito.esUrgente = true;
        
        // Assert
        expect(itemCarrito.esUrgente, isTrue);
      });
    });

    group('Business Logic Tests', () {
      test('debe validar cantidad mínima', () {
        // Act & Assert
        expect(itemCarrito.cantidad, greaterThan(0));
      });

      test('debe manejar productos sin ID asignado', () {
        // Arrange & Act
        final itemSinId = CarritoCompra()
          ..nombreProducto = 'Producto Nuevo';
        
        // Assert
        expect(itemSinId.productoId, isNull);
        expect(itemSinId.nombreProducto, equals('Producto Nuevo'));
      });

      test('debe registrar fecha de agregado automáticamente', () {
        // Act & Assert
        expect(itemCarrito.fechaAgregado, isNotNull);
        expect(itemCarrito.fechaAgregado.isBefore(DateTime.now()), isTrue);
      });
    });

    group('Notes and Comments Tests', () {
      test('debe almacenar notas del producto correctamente', () {
        // Act & Assert
        expect(itemCarrito.notas, equals('Talla M, Color Azul'));
      });

      test('debe manejar notas vacías o nulas', () {
        // Arrange & Act
        final itemSinNotas = CarritoCompra()
          ..nombreProducto = 'Producto Sin Notas';
        
        // Assert
        expect(itemSinNotas.notas, isNull);
      });

      test('debe permitir agregar observaciones del proveedor', () {
        // Arrange & Act
        itemCarrito.observacionesProveedor = 'Descuento por volumen aplicable';
        
        // Assert
        expect(itemCarrito.observacionesProveedor, equals('Descuento por volumen aplicable'));
      });
    });

    group('Integration Tests', () {
      test('debe manejar flujo completo de agregar al carrito', () {
        // Arrange
        final nuevoItem = CarritoCompra()
          ..nombreProducto = 'Pantalón Jeans'
          ..productoId = 25
          ..cantidad = 1
          ..precioUnitario = 45.00;
        
        // Act - Simular flujo de agregar producto
        nuevoItem.calcularPrecioTotal();
        nuevoItem.establecerProveedor(
          proveedorId: 203,
          nombreProveedor: 'Textiles SA',
          stockDisponible: 15,
        );
        nuevoItem.esUrgente = true;
        
        // Assert
        expect(nuevoItem.nombreProducto, equals('Pantalón Jeans'));
        expect(nuevoItem.precioTotal, equals(45.00));
        expect(nuevoItem.proveedorSeleccionado, isTrue);
        expect(nuevoItem.hayStockSuficiente, isTrue);
        expect(nuevoItem.esUrgente, isTrue);
        expect(nuevoItem.estado, equals('pendiente'));
      });

      test('debe validar item listo para procesar compra', () {
        // Arrange & Act
        itemCarrito.establecerProveedor(
          proveedorId: 150,
          nombreProveedor: 'Proveedor Confiable',
          stockDisponible: 100,
        );
        
        // Assert - Validaciones para procesar
        expect(itemCarrito.nombreProducto.isNotEmpty, isTrue);
        expect(itemCarrito.cantidad > 0, isTrue);
        expect(itemCarrito.precioUnitario != null, isTrue);
        expect(itemCarrito.precioTotal != null, isTrue);
        expect(itemCarrito.proveedorSeleccionado, isTrue);
        expect(itemCarrito.hayStockSuficiente, isTrue);
      });
    });
  });
}