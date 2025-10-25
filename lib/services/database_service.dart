import '../models/producto.dart';
import '../models/venta.dart';

class DatabaseService {
  // Simulación de base de datos en memoria
  static List<Producto> _productos = [];
  static List<Venta> _ventas = [];

  // Productos
  Future<List<Producto>> getProductos() async {
    // Simular delay de red
    await Future.delayed(const Duration(milliseconds: 500));
    return List.from(_productos);
  }

  Future<void> insertProducto(Producto producto) async {
    await Future.delayed(const Duration(milliseconds: 200));
    _productos.add(producto);
  }

  Future<void> updateProducto(Producto producto) async {
    await Future.delayed(const Duration(milliseconds: 200));
    final index = _productos.indexWhere((p) => p.id == producto.id);
    if (index != -1) {
      _productos[index] = producto;
    }
  }

  Future<void> updateProductoStock(int id, int nuevoStock) async {
    await Future.delayed(const Duration(milliseconds: 200));
    final index = _productos.indexWhere((p) => p.id == id);
    if (index != -1) {
      _productos[index] = _productos[index].copyWith(stockActual: nuevoStock);
    }
  }

  Future<void> deleteProducto(int id) async {
    await Future.delayed(const Duration(milliseconds: 200));
    _productos.removeWhere((p) => p.id == id);
  }

  // Ventas
  Future<List<Venta>> getVentas() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return List.from(_ventas);
  }

  Future<void> insertVenta(Venta venta) async {
    await Future.delayed(const Duration(milliseconds: 200));
    _ventas.add(venta);
  }

  // Método para agregar datos de prueba
  Future<void> initializeTestData() async {
    if (_productos.isEmpty) {
      _productos.addAll([
        Producto(
          id: 1,
          nombre: 'Laptop HP Pavilion',
          descripcion: 'Laptop para gaming y trabajo',
          precio: 1299.99,
          stockActual: 5,
          categoria: 'Electrónicos',
          imagen: 'assets/images/laptop.jpg',
        ),
        Producto(
          id: 2,
          nombre: 'Mouse Logitech',
          descripcion: 'Mouse inalámbrico ergonómico',
          precio: 45.99,
          stockActual: 15,
          categoria: 'Accesorios',
          imagen: 'assets/images/mouse.jpg',
        ),
        Producto(
          id: 3,
          nombre: 'Teclado Mecánico',
          descripcion: 'Teclado mecánico RGB',
          precio: 89.99,
          stockActual: 8,
          categoria: 'Accesorios',
        ),
        Producto(
          id: 4,
          nombre: 'Monitor 24"',
          descripcion: 'Monitor Full HD 24 pulgadas',
          precio: 199.99,
          stockActual: 3,
          categoria: 'Electrónicos',
        ),
        Producto(
          id: 5,
          nombre: 'Smartphone',
          descripcion: 'Smartphone Android última generación',
          precio: 699.99,
          stockActual: 12,
          categoria: 'Móviles',
        ),
      ]);
    }
  }

  // Método para limpiar datos (útil para tests)
  Future<void> clearAllData() async {
    _productos.clear();
    _ventas.clear();
  }
}
