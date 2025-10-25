import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import '../models/producto.dart';
import '../services/isar_service.dart';

final productServiceProvider = Provider<ProductService>(
  (ref) => ProductService(),
);

class ProductService {
  Future<Isar> get db async {
    final isarService = IsarService();
    return await isarService.db;
  }

  Future<List<Producto>> getAll() async {
    final isar = await db;
    return await isar.collection<Producto>().where().findAll();
  }

  Future<void> add(Producto producto) async {
    final isar = await db;

    final isNew = producto.id <= 0;
    final random = Random();

    // Asignar SKU y barcode temporales si están vacíos
    if (producto.sku == null || producto.sku!.isEmpty) {
      producto.sku = 'TEMP-${DateTime.now().millisecondsSinceEpoch}-${random.nextInt(10000)}';
    }

    if (producto.codigoBarras == null || producto.codigoBarras!.isEmpty) {
      producto.codigoBarras = 'TEMP-${DateTime.now().millisecondsSinceEpoch}-${random.nextInt(10000)}';
    }

    await isar.writeTxn(() async {
      // Verificar SKU duplicado
      final todosProductos = await isar.collection<Producto>().where().findAll();
      final skuExists = todosProductos.where((p) => 
        p.sku?.toLowerCase() == producto.sku?.toLowerCase() && 
        (isNew || p.id != producto.id)
      ).isNotEmpty;

      if (skuExists) {
        throw Exception('SKU ya existe en otro producto.');
      }

      // Verificar código de barras duplicado
      final barcodeExists = todosProductos.where((p) => 
        p.codigoBarras?.toLowerCase() == producto.codigoBarras?.toLowerCase() && 
        (isNew || p.id != producto.id)
      ).isNotEmpty;

      if (barcodeExists) {
        throw Exception('Código de barras ya existe en otro producto.');
      }

      // Asignar fecha de creación si es nuevo
      if (isNew) {
        producto.fechaCreacion = DateTime.now();
      }
      producto.fechaActualizacion = DateTime.now();

      // Guardar el producto
      final productId = await isar.collection<Producto>().put(producto);
      producto.id = productId;
    });
  }

  Future<void> update(Producto producto) async {
    final isar = await db;
    await isar.writeTxn(() async {
      producto.fechaActualizacion = DateTime.now();
      await isar.collection<Producto>().put(producto);
    });
  }

  Future<Producto?> getById(int id) async {
    final isar = await db;
    return await isar.collection<Producto>().get(id);
  }

  Future<void> delete(int id) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.collection<Producto>().delete(id);
    });
  }

  Future<List<Producto>> searchByName(String query) async {
    final isar = await db;
    final productos = await isar.collection<Producto>().where().findAll();
    return productos.where((p) => 
      p.nombre?.toLowerCase().contains(query.toLowerCase()) ?? false
    ).toList();
  }

  Future<List<Producto>> getByCategory(int categoryId) async {
    final isar = await db;
    final productos = await isar.collection<Producto>().where().findAll();
    return productos.where((p) => p.categoriaId == categoryId).toList();
  }

  Future<List<Producto>> getLowStockProducts([int threshold = 10]) async {
    final isar = await db;
    final productos = await isar.collection<Producto>().where().findAll();
    return productos.where((p) => (p.stockActual ?? 0) <= threshold).toList();
  }
}