import '../models/pedido_proveedor.dart';
import '../models/compra.dart';
import '../models/producto.dart';
import '../models/proveedor.dart';
import 'isar_service.dart';

class PedidoCompraService {
  final IsarService _isarService = IsarService();

  /// Convierte un pedido a proveedor en una compra
  Future<Compra> convertirPedidoACompra(
    PedidoProveedor pedido,
    Proveedor proveedor,
    Map<int, double> preciosFinales,
  ) async {
    final isar = await _isarService.db;

    // Crear la compra con número de factura manual
    final compra = Compra(
      numeroFactura: 'PED-${pedido.id}-${DateTime.now().millisecondsSinceEpoch}',
      fecha: DateTime.now(),
      total: 0.0, // Se calculará después
      proveedorId: proveedor.id,
      observaciones: 'Convertido desde pedido #${pedido.id}',
      estado: 'pendiente',
    );

    // Calcular total de la compra
    double totalCompra = 0.0;
    for (final item in pedido.items) {
      final precioFinal =
          preciosFinales[item.productoId] ?? item.precioEstimado ?? 0.0;
      totalCompra += precioFinal * item.cantidad;

      // Marcar item como convertido
      item.convertirACompra(precioFinal, item.productoId);
    }

    compra.total = totalCompra;

    // Guardar la compra
    await isar.writeTxn(() async {
      await isar.compras.put(compra);

      // Actualizar el pedido
      pedido.compraId = compra.id;
      pedido.cambiarEstado(PedidoProveedor.estadoRecibido);
      await isar.pedidoProveedors.put(pedido);

      // Actualizar precios de costo de los productos
      await _actualizarPreciosCosto(pedido, preciosFinales);
    });

    return compra;
  }

  /// Actualiza los precios de costo de los productos
  Future<void> _actualizarPreciosCosto(
    PedidoProveedor pedido,
    Map<int, double> preciosFinales,
  ) async {
    final isar = await _isarService.db;

    for (final item in pedido.items) {
      final precioFinal = preciosFinales[item.productoId];
      if (precioFinal != null) {
        // Buscar el producto
        final producto = await isar.productos.get(item.productoId);
        if (producto != null) {
          // Actualizar precio de costo
          producto.precioCosto = precioFinal;

          // Calcular utilidad si hay precio de venta
          if (producto.precio != null && producto.precioCosto != null) {
            final utilidad =
                ((producto.precio! - producto.precioCosto!) /
                    producto.precioCosto!) *
                100;
            producto.utilidad = utilidad;
          }

          await isar.productos.put(producto);
        }
      }
    }
  }

  /// Obtiene la utilidad promedio de todos los productos
  Future<double> obtenerUtilidadPromedio() async {
    final isar = await _isarService.db;

    final productosRaw = await isar.productos.getAll([0]);
    final productos = productosRaw.whereType<Producto>().toList();
    final productosConUtilidad =
        productos.where((p) => p.utilidad != null).toList();

    if (productosConUtilidad.isEmpty) return 0.0;

    final utilidadTotal = productosConUtilidad.fold<double>(
      0.0,
      (total, producto) => total + (producto.utilidad ?? 0.0),
    );

    return utilidadTotal / productosConUtilidad.length;
  }

  /// Obtiene productos con baja utilidad (menos del 20%)
  Future<List<Producto>> obtenerProductosBajaUtilidad() async {
    final isar = await _isarService.db;

    final productosRaw = await isar.productos.getAll([0]);
    final productos = productosRaw.whereType<Producto>().toList();
    return productos
        .where((p) => p.utilidad != null && p.utilidad! < 20.0)
        .toList();
  }

  /// Obtiene productos con alta utilidad (más del 50%)
  Future<List<Producto>> obtenerProductosAltaUtilidad() async {
    final isar = await _isarService.db;

    final productosRaw = await isar.productos.getAll([0]);
    final productos = productosRaw.whereType<Producto>().toList();
    return productos
        .where((p) => p.utilidad != null && p.utilidad! > 50.0)
        .toList();
  }

  /// Obtiene productos con utilidad media (entre 20% y 50%)
  Future<List<Producto>> obtenerProductosMediaUtilidad() async {
    final isar = await _isarService.db;

    final productosRaw = await isar.productos.getAll([0]);
    final productos = productosRaw.whereType<Producto>().toList();
    return productos
        .where((p) => p.utilidad != null && p.utilidad! >= 20.0 && p.utilidad! <= 50.0)
        .toList();
  }
}
