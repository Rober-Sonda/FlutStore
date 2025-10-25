import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:tienda_app/models/product.dart';
import '../models/producto.dart';
import '../services/isar_service.dart';

// Provider para obtener todos los productos
final productosProvider = FutureProvider<List<Producto>>((ref) async {
  try {
    final isarService = await Isar.getInstance();
    if (isarService == null) {
      // Si no hay instancia de Isar, devolvemos lista vacía
      return <Producto>[];
    }
    // Obtener la colección de productos y recuperar todos los registros
    final productosCollection = isarService.products;
    final productosIsar = await productosCollection.where().findAll();
    // Convertir los modelos de Isar (Product) a los modelos de dominio (Producto).
    // Mapeamos manualmente los campos comunes del modelo Isar `Product` al dominio `Producto`.
    // Ajusta los nombres de campos si tu modelo Isar usa otros nombres.
    final productos = productosIsar.map((p) {
      return Producto(
        id: p.id,
        nombre: p.name,
        precio: p.price,
        stockActual: p.stock,
        activo: p.isDiscontinued,
        fechaUltimaVenta: p.lastSoldAt,
      );
    }).toList();
    return productos;
  } catch (e) {
    // En caso de error, devolvemos lista vacía
    return <Producto>[];
  }
});

// Provider para métricas de productos
final productosMetricsProvider = FutureProvider<ProductosMetrics>((ref) async {
  try {
    final productos = await ref.watch(productosProvider.future);
    return ProductosMetrics.fromProductos(productos);
  } catch (e) {
    return ProductosMetrics.empty();
  }
});

// Clase para métricas de productos
class ProductosMetrics {
  final int totalProductos;
  final int productosActivos;
  final int productosStockBajo;
  final int productosAgotados;
  final double valorTotalInventario;
  final List<Producto> productosMasVendidos;

  ProductosMetrics({
    this.totalProductos = 0,
    this.productosActivos = 0,
    this.productosStockBajo = 0,
    this.productosAgotados = 0,
    this.valorTotalInventario = 0.0,
    this.productosMasVendidos = const [],
  });

  factory ProductosMetrics.fromProductos(List<Producto> productos) {
    int activos = 0;
    int stockBajo = 0;
    int agotados = 0;
    double valorTotal = 0.0;

    for (final producto in productos) {
      if (producto.activo) activos++;
      if (producto.tieneStockBajo) stockBajo++;
      if (producto.estaAgotado) agotados++;

      if (producto.precio != null && producto.stockActual != null) {
        valorTotal += (producto.precio! * producto.stockActual!);
      }
    }

    // Ordenar por fecha de última venta (más recientes primero)
    final productosMasVendidos =
        productos.where((p) => p.fechaUltimaVenta != null).toList()
          ..sort((a, b) => b.fechaUltimaVenta!.compareTo(a.fechaUltimaVenta!));

    return ProductosMetrics(
      totalProductos: productos.length,
      productosActivos: activos,
      productosStockBajo: stockBajo,
      productosAgotados: agotados,
      valorTotalInventario: valorTotal,
      productosMasVendidos: productosMasVendidos.take(5).toList(),
    );
  }

  factory ProductosMetrics.empty() {
    return ProductosMetrics();
  }
}
