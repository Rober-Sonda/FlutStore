import 'package:flutter_test/flutter_test.dart';
import 'package:tienda_app/services/database_service.dart';
import 'package:tienda_app/models/producto.dart';

// MockDatabaseService removed because the tests below use the real DatabaseService.
// If you need a mock, generate it using mockito's @GenerateMocks and import the
// generated mocks file (run build_runner) instead of declaring the mock manually.

void main() {
  group('Database Service Tests', () {
    late DatabaseService databaseService;
    late Producto testProducto;

    setUp(() {
      databaseService = DatabaseService();
      testProducto = Producto(
        id: 1,
        nombre: 'Producto Test',
        descripcion: 'Descripción de prueba',
        precio: 100.0,
        stockActual: 5,
        categoria: 'Test',
      );
    });

    test('should insert product successfully', () async {
      await databaseService.insertProducto(testProducto);
      final productos = await databaseService.getProductos();

      expect(productos.any((p) => p.id == testProducto.id), true);
    });

    test('should update product stock correctly', () async {
      await databaseService.insertProducto(testProducto);
      await databaseService.updateProductoStock(testProducto.id, 10);

      final productos = await databaseService.getProductos();
      final producto = productos.firstWhere((p) => p.id == testProducto.id);

      expect(producto.stockActual, 10);
    });

    test('should delete product successfully', () async {
      await databaseService.insertProducto(testProducto);
      await databaseService.deleteProducto(testProducto.id);

      final productos = await databaseService.getProductos();
      expect(productos.any((p) => p.id == testProducto.id), false);
    });
  });
}
