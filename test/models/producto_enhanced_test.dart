import 'package:flutter_test/flutter_test.dart';
import 'package:tienda_app/models/producto.dart';

void main() {
  group('Producto Enhanced Model Tests - TDD', () {
    late Producto producto;

    setUp(() {
      // Arrange: Producto base para tests
      producto = Producto(
        nombre: 'Remera Deportiva Nike',
        descripcion: 'Remera de algodón para deporte',
        precio: 2500.0,
        precioCosto: 1000.0,
        stockActual: 15,
        stockMinimo: 5,
        stockMaximo: 100,
        marca: 'Nike',
        genero: GeneroProducto.unisex,
        temporada: TemporadaProducto.todoElAno,
        estado: EstadoProducto.activo,
        activo: true,
        destacado: false,
        esServicio: false,
        aplicaIVA: true,
        disponibleVenta: true,
        pesoGramos: 200,
        garantiaMeses: 6,
        codigoBarras: '1234567890123',
        sku: 'NIKE-REM-001',
        usuarioCreacion: 1,
      );
    });

    group('Enums Tests - TDD Red-Green-Refactor', () {
      test('EstadoProducto enum should have all expected values', () {
        // Assert: Verificar que todos los estados estén disponibles
        expect(EstadoProducto.values.length, 5);
        expect(EstadoProducto.values, contains(EstadoProducto.activo));
        expect(EstadoProducto.values, contains(EstadoProducto.descontinuado));
        expect(EstadoProducto.values, contains(EstadoProducto.agotado));
        expect(EstadoProducto.values, contains(EstadoProducto.estacional));
        expect(EstadoProducto.values, contains(EstadoProducto.oculto));
      });

      test('GeneroProducto enum should have all expected values', () {
        // Assert: Verificar géneros para tienda de ropa
        expect(GeneroProducto.values.length, 5);
        expect(GeneroProducto.values, contains(GeneroProducto.hombre));
        expect(GeneroProducto.values, contains(GeneroProducto.mujer));
        expect(GeneroProducto.values, contains(GeneroProducto.unisex));
        expect(GeneroProducto.values, contains(GeneroProducto.nino));
        expect(GeneroProducto.values, contains(GeneroProducto.nina));
      });

      test('TemporadaProducto enum should have all seasons', () {
        // Assert: Verificar temporadas del año
        expect(TemporadaProducto.values.length, 5);
        expect(TemporadaProducto.values, contains(TemporadaProducto.verano));
        expect(TemporadaProducto.values, contains(TemporadaProducto.invierno));
        expect(TemporadaProducto.values, contains(TemporadaProducto.primavera));
        expect(TemporadaProducto.values, contains(TemporadaProducto.otono));
        expect(TemporadaProducto.values, contains(TemporadaProducto.todoElAno));
      });
    });

    group('Stock Management Tests - TDD', () {
      test('tieneStockBajo should return true when stock is below minimum', () {
        // Arrange
        producto.stockActual = 3;
        producto.stockMinimo = 5;

        // Act & Assert
        expect(producto.tieneStockBajo, true);
      });

      test(
        'tieneStockBajo should return false when stock is above minimum',
        () {
          // Arrange
          producto.stockActual = 10;
          producto.stockMinimo = 5;

          // Act & Assert
          expect(producto.tieneStockBajo, false);
        },
      );

      test('estaAgotado should return true when stock is zero or null', () {
        // Arrange
        producto.stockActual = 0;

        // Act & Assert
        expect(producto.estaAgotado, true);

        // Test with null stock
        producto.stockActual = null;
        expect(producto.estaAgotado, true);
      });

      test('estaDisponible should consider multiple conditions', () {
        // Arrange: Producto disponible
        producto.activo = true;
        producto.disponibleVenta = true;
        producto.estado = EstadoProducto.activo;
        producto.stockActual = 10;

        // Act & Assert
        expect(producto.estaDisponible, true);

        // Test inactive product
        producto.activo = false;
        expect(producto.estaDisponible, false);
      });

      test('actualizarStock should update stock and set timestamp', () {
        // Arrange
        const int nuevoStock = 20;
        const int usuarioId = 2;

        // Act
        producto.actualizarStock(nuevoStock, usuarioId);

        // Assert
        expect(producto.stockActual, nuevoStock);
        expect(producto.usuarioActualizacion, usuarioId);
        expect(producto.fechaActualizacion, isNotNull);
        expect(producto.estado, EstadoProducto.activo);
      });

      test(
        'actualizarStock should set estado to agotado when stock is zero',
        () {
          // Act
          producto.actualizarStock(0);

          // Assert
          expect(producto.stockActual, 0);
          expect(producto.estado, EstadoProducto.agotado);
        },
      );

      test('incrementarStock should add to existing stock', () {
        // Arrange
        const int stockInicial = 10;
        const int incremento = 5;
        producto.stockActual = stockInicial;

        // Act
        producto.incrementarStock(incremento);

        // Assert
        expect(producto.stockActual, stockInicial + incremento);
      });

      test('decrementarStock should subtract from existing stock', () {
        // Arrange
        const int stockInicial = 10;
        const int decremento = 3;
        producto.stockActual = stockInicial;

        // Act
        producto.decrementarStock(decremento);

        // Assert
        expect(producto.stockActual, stockInicial - decremento);
      });

      test('decrementarStock should not go below zero', () {
        // Arrange
        producto.stockActual = 2;

        // Act
        producto.decrementarStock(5); // Trying to decrement more than available

        // Assert
        expect(producto.stockActual, 0);
      });
    });

    group('Business Logic Tests - TDD', () {
      test('porcentajeStock should calculate correct percentage', () {
        // Arrange
        producto.stockActual = 25;
        producto.stockMaximo = 100;

        // Act & Assert
        expect(producto.porcentajeStock, 25.0);
      });

      test('margenGanancia should calculate profit margin correctly', () {
        // Arrange
        producto.precio = 2500.0;
        producto.precioCosto = 1000.0;

        // Act
        final margen = producto.margenGanancia;

        // Assert
        expect(margen, 150.0); // (2500-1000)/1000 * 100 = 150%
      });

      test('precioConDescuento should apply discount correctly', () {
        // Arrange
        producto.precio = 1000.0;
        const double descuento = 20.0; // 20%

        // Act
        final precioFinal = producto.precioConDescuento(descuento);

        // Assert
        expect(precioFinal, 800.0); // 1000 * (1 - 20/100)
      });

      test('marcarComoVendido should update sale timestamp', () {
        // Act
        producto.marcarComoVendido();

        // Assert
        expect(producto.fechaUltimaVenta, isNotNull);
        expect(producto.fechaActualizacion, isNotNull);
      });

      test('necesitaReabastecimiento should identify restock needs', () {
        // Arrange: Stock bajo
        producto.stockActual = 2;
        producto.stockMinimo = 5;

        // Act & Assert
        expect(producto.necesitaReabastecimiento, true);

        // Test with good stock
        producto.stockActual = 20;
        expect(producto.necesitaReabastecimiento, false);
      });
    });

    group('Estado y Descripción Tests - TDD', () {
      test('descripcionEstado should return correct descriptions', () {
        // Test inactive product
        producto.activo = false;
        expect(producto.descripcionEstado, 'Inactivo');

        // Test unavailable for sale
        producto.activo = true;
        producto.disponibleVenta = false;
        expect(producto.descripcionEstado, 'No disponible');

        // Test out of stock
        producto.disponibleVenta = true;
        producto.stockActual = 0;
        expect(producto.descripcionEstado, 'Agotado');

        // Test low stock
        producto.stockActual = 2;
        producto.stockMinimo = 5;
        expect(producto.descripcionEstado, 'Stock bajo');

        // Test available
        producto.stockActual = 20;
        producto.estado = EstadoProducto.activo;
        expect(producto.descripcionEstado, 'Disponible');
      });

      test('colorEstado should return appropriate colors', () {
        // Test unavailable - red
        producto.activo = false;
        expect(producto.colorEstado, 'red');

        // Test low stock - orange
        producto.activo = true;
        producto.disponibleVenta = true;
        producto.stockActual = 2;
        producto.stockMinimo = 5;
        expect(producto.colorEstado, 'orange');

        // Test featured - gold
        producto.stockActual = 20;
        producto.destacado = true;
        expect(producto.colorEstado, 'gold');

        // Test normal available - green
        producto.destacado = false;
        expect(producto.colorEstado, 'green');
      });
    });

    group('JSON Serialization Tests - TDD', () {
      test('toJson should include all new fields', () {
        // Act
        final json = producto.toJson();

        // Assert - Verificar campos nuevos
        expect(json['stockMinimo'], producto.stockMinimo);
        expect(json['stockMaximo'], producto.stockMaximo);
        expect(json['marca'], producto.marca);
        expect(json['genero'], producto.genero?.name);
        expect(json['temporada'], producto.temporada?.name);
        expect(json['estado'], producto.estado.name);
        expect(json['activo'], producto.activo);
        expect(json['destacado'], producto.destacado);
        expect(json['esServicio'], producto.esServicio);
        expect(json['aplicaIVA'], producto.aplicaIVA);
        expect(json['disponibleVenta'], producto.disponibleVenta);
        expect(json['pesoGramos'], producto.pesoGramos);
        expect(json['garantiaMeses'], producto.garantiaMeses);
        expect(json['usuarioCreacion'], producto.usuarioCreacion);
      });

      test('fromJson should recreate object with all fields', () {
        // Arrange
        final json = {
          'id': 1,
          'nombre': 'Test Product',
          'precio': 1500.0,
          'stock': 25,
          'stockMinimo': 5,
          'stockMaximo': 100,
          'marca': 'TestBrand',
          'genero': 'mujer',
          'temporada': 'verano',
          'estado': 'activo',
          'activo': true,
          'destacado': false,
          'esServicio': false,
          'aplicaIVA': true,
          'disponibleVenta': true,
          'pesoGramos': 300,
          'garantiaMeses': 12,
          'usuarioCreacion': 1,
        };

        // Act
        final productoFromJson = Producto.fromJson(json);

        // Assert
        expect(productoFromJson.nombre, 'Test Product');
        expect(productoFromJson.stockMinimo, 5);
        expect(productoFromJson.stockMaximo, 100);
        expect(productoFromJson.marca, 'TestBrand');
        expect(productoFromJson.genero, GeneroProducto.mujer);
        expect(productoFromJson.temporada, TemporadaProducto.verano);
        expect(productoFromJson.estado, EstadoProducto.activo);
        expect(productoFromJson.activo, true);
        expect(productoFromJson.destacado, false);
        expect(productoFromJson.pesoGramos, 300);
        expect(productoFromJson.garantiaMeses, 12);
      });
    });

    group('copyWith Method Tests - TDD', () {
      test('copyWith should update only specified fields', () {
        // Act
        final productoCopiado = producto.copyWith(
          nombre: 'Nuevo Nombre',
          marca: 'Nueva Marca',
          destacado: true,
          stockMinimo: 10,
        );

        // Assert - Campos actualizados
        expect(productoCopiado.nombre, 'Nuevo Nombre');
        expect(productoCopiado.marca, 'Nueva Marca');
        expect(productoCopiado.destacado, true);
        expect(productoCopiado.stockMinimo, 10);

        // Assert - Campos no cambiados
        expect(productoCopiado.precio, producto.precio);
        expect(productoCopiado.stockActual, producto.stockActual);
        expect(productoCopiado.genero, producto.genero);
        expect(productoCopiado.activo, producto.activo);
      });
    });

    group('resumenProducto Tests - TDD', () {
      test('resumenProducto should provide complete summary', () {
        // Act
        final resumen = producto.resumenProducto;

        // Assert
        expect(resumen['id'], producto.id);
        expect(resumen['nombre'], producto.nombre);
        expect(resumen['marca'], producto.marca);
        expect(resumen['precio'], producto.precio);
        expect(resumen['stock'], producto.stockActual);
        expect(resumen['estado'], isA<String>());
        expect(resumen['disponible'], isA<bool>());
        expect(resumen['stockBajo'], isA<bool>());
        expect(resumen['margenGanancia'], contains('%'));
      });
    });
  });
}
