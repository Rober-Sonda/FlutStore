import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import '../models/carrito_compra.dart';
import '../models/proveedor.dart';
import '../services/isar_service.dart';

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
    String? codigoProveedor,
    int? stockDisponible,
    String? observacionesProveedor,
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
            ..esUrgente = esUrgente
            ..notas = notas
            ..codigoProveedor = codigoProveedor
            ..stockDisponibleProveedor = stockDisponible
            ..observacionesProveedor = observacionesProveedor
            ..proveedorSeleccionado = true
            ..fechaAgregado = DateTime.now();

      // Calcular el precio total
      item.calcularPrecioTotal();

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
        item.actualizarCantidad(nuevaCantidad);
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
    // En el futuro esto podrÃ­a filtrarse por proveedores que realmente venden este producto
    return await isar.proveedors.where().findAll();
  }

  // Obtener el proveedor mÃ¡s econÃ³mico para un producto
  Future<Proveedor?> obtenerProveedorMasEconomico(int productoId) async {
    final proveedores = await obtenerProveedoresParaProducto(productoId);
    if (proveedores.isEmpty) return null;

    // Por ahora retornamos el primero, pero aquÃ­ se implementarÃ­a la lÃ³gica
    // para determinar cuÃ¡l es el mÃ¡s econÃ³mico basado en precios histÃ³ricos
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

  // Obtener estadÃ­sticas del carrito
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

