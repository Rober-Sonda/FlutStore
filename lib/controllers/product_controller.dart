// lib/src/controllers/product_controller.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/producto.dart';
import '../services/product_service.dart';

final productControllerProvider = Provider<ProductController>((ref) {
  final productService = ref.read(productServiceProvider);
  return ProductController(productService);
});

class ProductController {
  final ProductService _service;

  ProductController(this._service);

  Future<List<Producto>> getAll() => _service.getAll();

  Future<Producto?> getById(int id) async {
    return await _service.getById(id);
  }

  Future<void> add(Producto producto) async {
    await _service.add(producto);
  }

  Future<void> update(Producto producto) async {
    await _service.update(producto);
  }

  Future<void> delete(int id) async {
    await _service.delete(id);
  }

  Future<List<Producto>> searchByName(String query) async {
    return await _service.searchByName(query);
  }

  Future<List<Producto>> getByCategory(int categoryId) async {
    return await _service.getByCategory(categoryId);
  }

  Future<List<Producto>> getLowStockProducts([int threshold = 10]) async {
    return await _service.getLowStockProducts(threshold);
  }
}
