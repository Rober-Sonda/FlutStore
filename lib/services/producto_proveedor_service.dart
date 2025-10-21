import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import '../models/producto_proveedor.dart';
import '../models/proveedor.dart';
import '../services/isar_service.dart';

final productoProveedorServiceProvider = Provider<ProductoProveedorService>((
  ref,
) {
  return ProductoProveedorService(ref);
});

class ProductoProveedorService {
  final Ref _ref;

  ProductoProveedorService(this._ref);

  Future<Isar> get db => _ref.read(isarServiceProvider).db;

  // Obtener todos los proveedores de un producto
  Future<List<ProductoProveedor>> obtenerProveedoresDeProducto(
    int productoId,
  ) async {
    final isar = await db;
    return await isar.productoProveedors
        .filter()
        .productoIdEqualTo(productoId)
        .findAll();
  }

  // Obtener el proveedor por defecto de un producto
  Future<ProductoProveedor?> obtenerProveedorPorDefecto(int productoId) async {
    final isar = await db;
    return await isar.productoProveedors
        .filter()
        .productoIdEqualTo(productoId)
        .and()
        .esProveedorPorDefectoEqualTo(true)
        .findFirst();
  }

  // Obtener informaciÃ³n completa de proveedores para un producto
  Future<List<Map<String, dynamic>>> obtenerProveedoresCompletos(
    int productoId,
  ) async {
    final isar = await db;
    final productoProveedores =
        await isar.productoProveedors
            .filter()
            .productoIdEqualTo(productoId)
            .findAll();

    List<Map<String, dynamic>> proveedoresCompletos = [];

    for (final productoProveedor in productoProveedores) {
      final proveedor = await isar.proveedors.get(
        productoProveedor.proveedorId,
      );
      if (proveedor != null) {
        proveedoresCompletos.add({
          'productoProveedor': productoProveedor,
          'proveedor': proveedor,
          'precioFormateado': productoProveedor.precioFormateado,
          'stockFormateado': productoProveedor.stockFormateado,
          'estaDisponible': productoProveedor.estaDisponible,
        });
      }
    }

    return proveedoresCompletos;
  }

  // Agregar un proveedor a un producto
  Future<void> agregarProveedorAProducto(
    ProductoProveedor productoProveedor,
  ) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.productoProveedors.put(productoProveedor);
    });
  }

  // Actualizar informaciÃ³n de un proveedor para un producto
  Future<void> actualizarProductoProveedor(
    ProductoProveedor productoProveedor,
  ) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.productoProveedors.put(productoProveedor);
    });
  }

  // Eliminar un proveedor de un producto
  Future<void> eliminarProveedorDeProducto(int id) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.productoProveedors.delete(id);
    });
  }

  // Establecer un proveedor como por defecto
  Future<void> establecerProveedorPorDefecto(
    int productoId,
    int proveedorId,
  ) async {
    final isar = await db;
    await isar.writeTxn(() async {
      // Primero, quitar el flag de por defecto de todos los proveedores del producto
      final todosLosProveedores =
          await isar.productoProveedors
              .filter()
              .productoIdEqualTo(productoId)
              .findAll();

      for (final productoProveedor in todosLosProveedores) {
        productoProveedor.esProveedorPorDefecto = false;
        await isar.productoProveedors.put(productoProveedor);
      }

      // Luego, establecer el nuevo proveedor por defecto
      final productoProveedor =
          await isar.productoProveedors
              .filter()
              .productoIdEqualTo(productoId)
              .and()
              .proveedorIdEqualTo(proveedorId)
              .findFirst();

      if (productoProveedor != null) {
        productoProveedor.esProveedorPorDefecto = true;
        await isar.productoProveedors.put(productoProveedor);
      }
    });
  }

  // Obtener productos por proveedor
  Future<List<ProductoProveedor>> obtenerProductosDeProveedor(
    int proveedorId,
  ) async {
    final isar = await db;
    return await isar.productoProveedors
        .filter()
        .proveedorIdEqualTo(proveedorId)
        .findAll();
  }

  // Verificar si un producto tiene mÃºltiples proveedores
  Future<bool> tieneMultiplesProveedores(int productoId) async {
    final proveedores = await obtenerProveedoresDeProducto(productoId);
    return proveedores.length > 1;
  }

  // Obtener el mejor proveedor para un producto (precio mÃ¡s bajo con stock)
  Future<ProductoProveedor?> obtenerMejorProveedor(int productoId) async {
    final proveedores = await obtenerProveedoresDeProducto(productoId);

    if (proveedores.isEmpty) return null;

    // Filtrar proveedores con stock disponible
    final proveedoresConStock =
        proveedores.where((p) => p.estaDisponible).toList();

    if (proveedoresConStock.isEmpty) {
      // Si no hay proveedores con stock, devolver el primero
      return proveedores.first;
    }

    // Ordenar por precio (mÃ¡s bajo primero)
    proveedoresConStock.sort((a, b) {
      if (a.precioUnitario == null && b.precioUnitario == null) return 0;
      if (a.precioUnitario == null) return 1;
      if (b.precioUnitario == null) return -1;
      return a.precioUnitario!.compareTo(b.precioUnitario!);
    });

    return proveedoresConStock.first;
  }

  // Obtener estadÃ­sticas de proveedores para un producto
  Future<Map<String, dynamic>> obtenerEstadisticasProveedores(
    int productoId,
  ) async {
    final proveedores = await obtenerProveedoresDeProducto(productoId);

    if (proveedores.isEmpty) {
      return {
        'totalProveedores': 0,
        'proveedoresConStock': 0,
        'precioPromedio': 0.0,
        'precioMinimo': 0.0,
        'precioMaximo': 0.0,
      };
    }

    final proveedoresConPrecio =
        proveedores.where((p) => p.precioUnitario != null).toList();
    final proveedoresConStock =
        proveedores.where((p) => p.estaDisponible).toList();

    double precioPromedio = 0.0;
    double precioMinimo = double.infinity;
    double precioMaximo = 0.0;

    if (proveedoresConPrecio.isNotEmpty) {
      final precios =
          proveedoresConPrecio.map((p) => p.precioUnitario!).toList();
      precioPromedio = precios.reduce((a, b) => a + b) / precios.length;
      precioMinimo = precios.reduce((a, b) => a < b ? a : b);
      precioMaximo = precios.reduce((a, b) => a > b ? a : b);
    }

    return {
      'totalProveedores': proveedores.length,
      'proveedoresConStock': proveedoresConStock.length,
      'precioPromedio': precioPromedio,
      'precioMinimo': precioMinimo == double.infinity ? 0.0 : precioMinimo,
      'precioMaximo': precioMaximo,
    };
  }
}

