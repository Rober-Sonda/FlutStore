import 'package:flutter_test/flutter_test.dart';
import 'package:tienda_app/models/producto.dart';

void main() {
  group('Producto Model Tests', () {
    group('Constructor Tests', () {
      test('should create product with all required fields', () {
        // Arrange
        const expectedId = 1;
        const expectedNombre = 'Laptop HP';
        const expectedDescripcion = 'Laptop para gaming';
        const expectedPrecio = 1500.0;
        const expectedStock = 10;
        const expectedCategoria = 'Electrónicos';
        const expectedImagen = 'laptop.jpg';

        // Act
        final producto = Producto(
          id: expectedId,
          nombre: expectedNombre,
          descripcion: expectedDescripcion,
          precio: expectedPrecio,
          stockActual: expectedStock,
          categoria: expectedCategoria,
          imagen: expectedImagen,
        );

        // Assert
        expect(producto.id, expectedId);
        expect(producto.nombre, expectedNombre);
        expect(producto.descripcion, expectedDescripcion);
        expect(producto.precio, expectedPrecio);
        expect(producto.stockActual, expectedStock);
        expect(producto.categoria, expectedCategoria);
        expect(producto.imagen, expectedImagen);
        expect(producto.imagenes, isEmpty);
        expect(producto.fechaCreacion, isNull);
      });

      test('should create product with minimal required fields', () {
        // Arrange & Act
        final producto = Producto(nombre: 'Producto Básico');

        // Assert
        expect(producto.nombre, 'Producto Básico');
        expect(producto.descripcion, isNull);
        expect(producto.precio, isNull);
        expect(producto.stockActual, isNull);
        expect(producto.categoria, isNull);
        expect(producto.imagenes, isEmpty);
        expect(producto.fechaCreacion, isNull);
      });

      test('should allow null fechaCreacion when not provided', () {
        // Arrange & Act
        final producto = Producto(nombre: 'Test');

        // Assert
        expect(producto.fechaCreacion, isNull);
      });

      test('should use provided fechaCreacion when specified', () {
        // Arrange
        final fechaEspecifica = DateTime(2023, 5, 15);

        // Act
        final producto = Producto(
          nombre: 'Test',
          fechaCreacion: fechaEspecifica,
        );

        // Assert
        expect(producto.fechaCreacion, fechaEspecifica);
      });
    });

    group('JSON Serialization Tests', () {
      test('should convert product to JSON correctly with all fields', () {
        // Arrange
        final fechaCreacion = DateTime(2023, 10, 20);
        final producto = Producto(
          id: 1,
          nombre: 'Mouse Inalámbrico',
          descripcion: 'Mouse inalámbrico ergonómico',
          precio: 25.99,
          stockActual: 50,
          categoria: 'Accesorios',
          imagen: 'mouse.jpg',
          fechaCreacion: fechaCreacion,
          codigoBarras: '123456789',
          sku: 'MOU-001',
          precioCosto: 15.00,
          utilidad: 42.4,
        );
        producto.imagenes.addAll(['imagen1.jpg', 'imagen2.jpg']);

        // Act
        final json = producto.toJson();

        // Assert
        expect(json['id'], 1);
        expect(json['nombre'], 'Mouse Inalámbrico');
        expect(json['descripcion'], 'Mouse inalámbrico ergonómico');
        expect(json['precio'], 25.99);
        expect(json['stock'], 50);
        expect(json['categoria'], 'Accesorios');
        expect(json['imagen'], 'mouse.jpg');
        expect(json['fechaCreacion'], fechaCreacion.toIso8601String());
        expect(json['codigoBarras'], '123456789');
        expect(json['sku'], 'MOU-001');
        expect(json['precioCosto'], 15.00);
        expect(json['utilidad'], 42.4);
        expect(json['imagenes'], ['imagen1.jpg', 'imagen2.jpg']);
      });

      test('should handle null values in JSON conversion', () {
        // Arrange
        final producto = Producto(nombre: 'Producto Simple');

        // Act
        final json = producto.toJson();

        // Assert
        expect(json['nombre'], 'Producto Simple');
        expect(json['descripcion'], isNull);
        expect(json['precio'], isNull);
        expect(json['stock'], isNull);
        expect(json['categoria'], isNull);
        expect(json['imagen'], isNull);
        expect(json['codigoBarras'], isNull);
        expect(json['sku'], isNull);
        expect(json['precioCosto'], isNull);
        expect(json['utilidad'], isNull);
        expect(json['imagenes'], isEmpty);
      });
    });

    group('JSON Deserialization Tests', () {
      test('should create product from complete JSON correctly', () {
        // Arrange
        final json = {
          'id': 2,
          'nombre': 'Teclado Mecánico',
          'descripcion': 'Teclado mecánico RGB',
          'precio': 75.50,
          'stock': 20,
          'categoria': 'Accesorios',
          'imagen': 'teclado.jpg',
          'fechaCreacion': '2023-10-20T10:30:00.000Z',
          'codigoBarras': '987654321',
          'sku': 'TEC-001',
          'precioCosto': 45.00,
          'utilidad': 67.8,
          'imagenes': ['tec1.jpg', 'tec2.jpg'],
        };

        // Act
        final producto = Producto.fromJson(json);

        // Assert
        expect(producto.id, 2);
        expect(producto.nombre, 'Teclado Mecánico');
        expect(producto.descripcion, 'Teclado mecánico RGB');
        expect(producto.precio, 75.50);
        expect(producto.stockActual, 20);
        expect(producto.categoria, 'Accesorios');
        expect(producto.imagen, 'teclado.jpg');
        expect(
          producto.fechaCreacion,
          DateTime.parse('2023-10-20T10:30:00.000Z'),
        );
        expect(producto.codigoBarras, '987654321');
        expect(producto.sku, 'TEC-001');
        expect(producto.precioCosto, 45.00);
        expect(producto.utilidad, 67.8);
        expect(producto.imagenes, ['tec1.jpg', 'tec2.jpg']);
      });

      test('should handle missing fields in JSON gracefully', () {
        // Arrange
        final json = {'nombre': 'Producto Mínimo'};

        // Act
        final producto = Producto.fromJson(json);

        // Assert
        expect(producto.nombre, 'Producto Mínimo');
        expect(producto.descripcion, isNull);
        expect(producto.precio, isNull);
        expect(producto.stockActual, isNull);
        expect(producto.categoria, isNull);
        expect(producto.imagen, isNull);
        expect(producto.fechaCreacion, isNull);
        expect(producto.codigoBarras, isNull);
        expect(producto.sku, isNull);
        expect(producto.precioCosto, isNull);
        expect(producto.utilidad, isNull);
        expect(producto.imagenes, isEmpty);
      });

      test('should handle null imagenes field in JSON', () {
        // Arrange
        final json = {'nombre': 'Producto Test', 'imagenes': null};

        // Act
        final producto = Producto.fromJson(json);

        // Assert
        expect(producto.nombre, 'Producto Test');
        expect(producto.imagenes, isEmpty);
      });
    });

    group('Image Management Tests', () {
      test('should add images correctly', () {
        // Arrange
        final producto = Producto(nombre: 'Test Product');

        // Act
        producto.agregarImagen('imagen1.jpg');
        producto.agregarImagen('imagen2.jpg');

        // Assert
        expect(producto.imagenes, ['imagen1.jpg', 'imagen2.jpg']);
      });

      test('should not add duplicate images', () {
        // Arrange
        final producto = Producto(nombre: 'Test Product');
        producto.agregarImagen('imagen1.jpg');

        // Act
        producto.agregarImagen('imagen1.jpg'); // Intentar agregar duplicado

        // Assert
        expect(producto.imagenes, ['imagen1.jpg']);
        expect(producto.imagenes.length, 1);
      });

      test('should remove images correctly', () {
        // Arrange
        final producto = Producto(nombre: 'Test Product');
        producto.agregarImagen('imagen1.jpg');
        producto.agregarImagen('imagen2.jpg');

        // Act
        producto.eliminarImagen('imagen1.jpg');

        // Assert
        expect(producto.imagenes, ['imagen2.jpg']);
      });

      test('should clear all images', () {
        // Arrange
        final producto = Producto(nombre: 'Test Product');
        producto.agregarImagen('imagen1.jpg');
        producto.agregarImagen('imagen2.jpg');

        // Act
        producto.limpiarImagenes();

        // Assert
        expect(producto.imagenes, isEmpty);
      });

      test(
        'should get imagenPrincipal from imagen field when no images in collection',
        () {
          // Arrange
          final producto = Producto(nombre: 'Test Product', imagen: 'main.jpg');

          // Act
          final imagenPrincipal = producto.imagenPrincipal;

          // Assert
          expect(imagenPrincipal, 'main.jpg');
        },
      );

      test(
        'should get imagenPrincipal from first image in collection when available',
        () {
          // Arrange
          final producto = Producto(nombre: 'Test Product', imagen: 'main.jpg');
          producto.agregarImagen('first.jpg');
          producto.agregarImagen('second.jpg');

          // Act
          final imagenPrincipal = producto.imagenPrincipal;

          // Assert
          expect(imagenPrincipal, 'first.jpg');
        },
      );
    });

    group('CopyWith Tests', () {
      test('should create copy with modified fields', () {
        // Arrange
        final original = Producto(
          id: 1,
          nombre: 'Producto Original',
          precio: 100.0,
          stockActual: 5,
        );
        original.agregarImagen('imagen1.jpg');

        // Act
        final copia = original.copyWith(
          nombre: 'Producto Modificado',
          precio: 150.0,
        );

        // Assert
        expect(copia.id, 1); // Sin cambio
        expect(copia.nombre, 'Producto Modificado'); // Modificado
        expect(copia.precio, 150.0); // Modificado
        expect(copia.stockActual, 5); // Sin cambio
        expect(copia.imagenes, ['imagen1.jpg']); // Se copian las imágenes
      });

      test('should preserve original when copying', () {
        // Arrange
        final original = Producto(nombre: 'Original', precio: 100.0);

        // Act
        final copia = original.copyWith(nombre: 'Copia');

        // Assert
        expect(original.nombre, 'Original'); // Original no cambia
        expect(original.precio, 100.0);
        expect(copia.nombre, 'Copia');
        expect(copia.precio, 100.0);
      });
    });
  });
}
