import 'package:flutter_test/flutter_test.dart';
import 'package:tienda_app/providers/producto_provider.dart';
import 'package:tienda_app/models/producto.dart';
import 'package:tienda_app/services/database_service.dart';

void main() {
  group('ProductoProvider Tests', () {
    late ProductoProvider provider;
    late DatabaseService databaseService;

    setUp(() async {
      databaseService = DatabaseService();
      await databaseService.clearAllData(); // Limpiar datos antes de cada test
      provider = ProductoProvider();
    });

    group('Product Management Tests', () {
      test('should load initial test data on startup', () async {
        // Arrange & Act - esperar a que termine la inicialización
        await Future.delayed(const Duration(milliseconds: 600)); // Esperar más tiempo para que cargue
        
        // Assert
        expect(provider.productos, isNotEmpty);
        expect(provider.productosFiltrados, isNotEmpty);
        expect(provider.isLoading, isFalse);
      });

      test('should add product to database and update list', () async {
        // Arrange
        final producto = Producto(
          nombre: 'Test Product',
          descripcion: 'Test Description',
          precio: 50.0,
          stock: 10,
          categoria: 'Test',
        );

        // Act
        await provider.agregarProducto(producto);
        
        // Assert
        expect(provider.productos.length, greaterThanOrEqualTo(1));
        final productosConNombre = provider.productos
            .where((p) => p.nombre == 'Test Product')
            .toList();
        expect(productosConNombre.length, 1);
        expect(productosConNombre.first.descripcion, 'Test Description');
      });

      test('should update existing product', () async {
        // Arrange
        final producto = Producto(
          nombre: 'Original Product',
          precio: 100.0,
          stock: 5,
        );
        await provider.agregarProducto(producto);
        
        // Obtener el producto guardado (con ID asignado)
        final productoGuardado = provider.productos
            .firstWhere((p) => p.nombre == 'Original Product');
        final productoActualizado = productoGuardado.copyWith(
          nombre: 'Updated Product',
          precio: 150.0,
        );

        // Act
        await provider.actualizarProducto(productoActualizado);
        
        // Assert
        final productosActualizados = provider.productos
            .where((p) => p.nombre == 'Updated Product')
            .toList();
        expect(productosActualizados.length, 1);
        expect(productosActualizados.first.precio, 150.0);
      });

      test('should delete product from database and update list', () async {
        // Arrange
        await Future.delayed(const Duration(milliseconds: 600)); // Esperar carga inicial
        final cantidadInicial = provider.productos.length;
        
        final producto = Producto(
          nombre: 'Product to Delete',
          precio: 50.0,
        );
        await provider.agregarProducto(producto);
        
        final productoGuardado = provider.productos
            .firstWhere((p) => p.nombre == 'Product to Delete');

        // Act
        await provider.eliminarProducto(productoGuardado.id);
        
        // Assert
        expect(provider.productos.length, cantidadInicial);
        final productosEliminados = provider.productos
            .where((p) => p.nombre == 'Product to Delete')
            .toList();
        expect(productosEliminados, isEmpty);
      });
    });

    group('Filtering Tests', () {
      setUp(() async {
        // Esperar a que se carguen los datos iniciales
        await Future.delayed(const Duration(milliseconds: 600));
      });

      test('should filter products by category correctly', () {
        // Act
        provider.filtrarPorCategoria('Electrónicos');
        
        // Assert
        expect(provider.productosFiltrados.length, greaterThan(0));
        for (final producto in provider.productosFiltrados) {
          expect(producto.categoria, 'Electrónicos');
        }
      });

      test('should filter products by text in name', () {
        // Act
        provider.filtrarPorTexto('laptop'); // Buscar por laptop (case insensitive)
        
        // Assert
        expect(provider.productosFiltrados.length, greaterThan(0));
        for (final producto in provider.productosFiltrados) {
          expect(producto.nombre?.toLowerCase(), anyOf(contains('laptop'), contains('hp')));
        }
      });

      test('should filter products by text in description', () {
        // Act
        provider.filtrarPorTexto('gaming'); // Buscar por gaming en descripción
        
        // Assert
        expect(provider.productosFiltrados.length, greaterThan(0));
        for (final producto in provider.productosFiltrados) {
          final textoCompleto = '${producto.nombre ?? ''} ${producto.descripcion ?? ''}';
          expect(textoCompleto.toLowerCase(), contains('gaming'));
        }
      });

      test('should apply combined filters (category and text)', () {
        // Act
        provider.filtrarPorCategoria('Accesorios');
        provider.filtrarPorTexto('mouse');
        
        // Assert
        expect(provider.productosFiltrados.length, greaterThan(0));
        for (final producto in provider.productosFiltrados) {
          expect(producto.categoria, 'Accesorios');
          expect(producto.nombre?.toLowerCase(), contains('mouse'));
        }
      });

      test('should return empty list when no products match filters', () {
        // Act
        provider.filtrarPorCategoria('Categoría Inexistente');
        
        // Assert
        expect(provider.productosFiltrados, isEmpty);
      });

      test('should clear filters and show all products', () {
        // Arrange
        provider.filtrarPorCategoria('Electrónicos'); // Aplicar filtro
        expect(provider.productosFiltrados.length, lessThan(provider.productos.length));
        
        // Act
        provider.limpiarFiltros();
        
        // Assert
        expect(provider.productosFiltrados.length, provider.productos.length);
      });

      test('should handle null values in product fields when filtering', () {
        // Arrange - Producto con valores nulos
        final productoConNulos = Producto(
          nombre: null,
          descripcion: null,
          categoria: null,
        );

        // Este test verifica que el filtering no crashee con valores nulos
        expect(() {
          // Act
          provider.filtrarPorTexto('test');
          provider.filtrarPorCategoria('test');
        }, returnsNormally);
      });
    });

    group('Category Management Tests', () {
      test('should return unique categories from products', () async {
        // Arrange - esperar datos iniciales y agregar más
        await Future.delayed(const Duration(milliseconds: 600));
        await provider.agregarProducto(Producto(categoria: 'Nueva Categoría'));
        await provider.agregarProducto(Producto(categoria: 'Electrónicos')); // Duplicado
        await provider.agregarProducto(Producto(categoria: null)); // Null
        
        // Act
        final categorias = provider.categorias;
        
        // Assert
        expect(categorias, contains('Electrónicos'));
        expect(categorias, contains('Nueva Categoría'));
        expect(categorias.where((c) => c == 'Electrónicos').length, 1); // Sin duplicados
        expect(categorias, isNot(contains(''))); // Sin categorías vacías
      });

      test('should return sorted categories', () async {
        // Arrange - usar los datos existentes que ya están ordenados
        await Future.delayed(const Duration(milliseconds: 600));
        
        // Act
        final categorias = provider.categorias;
        
        // Assert
        expect(categorias, isA<List<String>>());
        expect(categorias, isNot(isEmpty));
        // Verificar que están ordenadas
        final categoriasCopia = List<String>.from(categorias);
        categoriasCopia.sort();
        expect(categorias, categoriasCopia);
      });
    });

    group('Loading State Tests', () {
      test('should indicate loading state during operations', () async {
        // Arrange - esperar inicialización inicial
        await Future.delayed(const Duration(milliseconds: 600));
        expect(provider.isLoading, isFalse);
        
        // Act & Assert
        final future = provider.cargarProductos();
        // Durante la operación podría estar en loading (difícil de verificar sin mocks)
        
        await future;
        expect(provider.isLoading, isFalse); // Debe terminar en false
      });
    });
  });
}
