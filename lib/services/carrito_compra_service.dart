import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:tienda_app/models/carrito_compra.dart';
import 'package:tienda_app/models/producto.dart';
import 'package:tienda_app/models/proveedor.dart';
import 'package:tienda_app/services/isar_service.dart';

final carritoCompraServiceProvider = Provider<CarritoCompraService>(
  (ref) => CarritoCompraService(),
);

class CarritoCompraService {
  Future<Isar> get db async {
    final isarService = IsarService();
    return await isarService.db;
  }

  // Agregar producto al carrito
  Future<void> agregarAlCarrito({
    required String nombreProducto,
    required int productoId,
    required int proveedorId,
    required String nombreProveedor,
    required int cantidad,
    required double precioUnitario,
    bool esUrgente = false,
    String? notas,
  }) async {
    final isar = await db;

    await isar.writeTxn(() async {
      final item =
          CarritoCompra()
            ..nombreProducto = nombreProducto
            ..productoId = productoId
            ..proveedorId = proveedorId
            ..nombreProveedor = nombreProveedor
            ..cantidad = cantidad
            ..precioUnitario = precioUnitario
            ..precioTotal = precioUnitario * cantidad
            ..esUrgente = esUrgente
            ..notas = notas
            ..fechaAgregado = DateTime.now();

      await isar.carritoCompras.put(item);
    });
  }

  // Obtener todos los items del carrito
  Future<List<CarritoCompra>> obtenerCarrito() async {
    final isar = await db;
    return await isar.carritoCompras
        .filter()
        .estadoEqualTo('pendiente')
        .sortByFechaAgregado()
        .findAll();
  }

  // Eliminar item del carrito
  Future<void> eliminarDelCarrito(int id) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.carritoCompras.delete(id);
    });
  }

  // Actualizar cantidad
  Future<void> actualizarCantidad(int id, int nuevaCantidad) async {
    final isar = await db;
    await isar.writeTxn(() async {
      final item = await isar.carritoCompras.get(id);
      if (item != null) {
        item.cantidad = nuevaCantidad;
        item.precioTotal = (item.precioUnitario ?? 0) * nuevaCantidad;
        await isar.carritoCompras.put(item);
      }
    });
  }

  // Marcar como procesado
  Future<void> marcarComoProcesado(int id) async {
    final isar = await db;
    await isar.writeTxn(() async {
      final item = await isar.carritoCompras.get(id);
      if (item != null) {
        item.estado = 'procesado';
        await isar.carritoCompras.put(item);
      }
    });
  }

  // Obtener proveedores disponibles para un producto
  Future<List<Proveedor>> obtenerProveedoresParaProducto(int productoId) async {
    final isar = await db;
    // Por ahora retornamos todos los proveedores
    // En el futuro esto podría filtrarse por proveedores que realmente venden este producto
    return await isar.proveedors.where().findAll();
  }

  // Obtener el proveedor más económico para un producto
  Future<Proveedor?> obtenerProveedorMasEconomico(int productoId) async {
    final proveedores = await obtenerProveedoresParaProducto(productoId);
    if (proveedores.isEmpty) return null;

    // Por ahora retornamos el primero, pero aquí se implementaría la lógica
    // para determinar cuál es el más económico basado en precios históricos
    return proveedores.first;
  }

  // Limpiar carrito procesado
  Future<void> limpiarCarritoProcesado() async {
    final isar = await db;
    await isar.writeTxn(() async {
      final itemsProcesados =
          await isar.carritoCompras
              .filter()
              .estadoEqualTo('procesado')
              .findAll();

      for (final item in itemsProcesados) {
        await isar.carritoCompras.delete(item.id);
      }
    });
  }

  // Obtener estadísticas del carrito
  Future<Map<String, dynamic>> obtenerEstadisticasCarrito() async {
    final carrito = await obtenerCarrito();

    final totalItems = carrito.length;
    final totalValor = carrito.fold<double>(
      0,
      (sum, item) => sum + (item.precioTotal ?? 0),
    );
    final itemsUrgentes = carrito.where((item) => item.esUrgente).length;

    return {
      'totalItems': totalItems,
      'totalValor': totalValor,
      'itemsUrgentes': itemsUrgentes,
    };
  }
}
