// lib/src/controllers/product_controller.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import '../models/product.dart';
import '../models/product_attribute.dart';
import '../services/product_service.dart';
import '../services/product_attribute_service.dart'; // Asumiendo que tienes este servicio

final productControllerProvider = Provider<ProductController>((ref) {
  final productService = ref.read(productServiceProvider);
  final attributeService = ref.read(
    productAttributeServiceProvider,
  ); // Servicio para ProductAttribute
  return ProductController(productService, attributeService);
});

class ProductController {
  final ProductService _service;
  final ProductAttributeService _attributeService;

  ProductController(this._service, this._attributeService);

  Future<List<Product>> getAll() => _service.getAll();

  // Nuevo método para obtener atributos por tipo
  Future<List<ProductAttribute>> getAttributesByType(AttributeType type) async {
    return await _attributeService.getByType(type);
  }

  Future<ProductAttribute> getOrCreateAttribute(String name) async {
    final existing = await _attributeService.getByName(name);
    if (existing != null) {
      return existing;
    }
    final newAttribute = ProductAttribute()..name = name;
    await _attributeService.add(newAttribute);
    return newAttribute;
  }

  Future<Product?> getById(int id) async {
    final isar = await _service.db;
    return isar.products.get(id);
  }

  Future<void> add(Product product) async {
    await _prepareLink(product.category);
    await _prepareLink(product.size);
    await _prepareLink(product.color);
    await _prepareLink(product.season);
    await _prepareLink(product.brand);
    await _prepareLink(product.gender);

    await product.category.save();
    await product.size.save();
    await product.color.save();
    await product.season.save();
    await product.brand.save();
    await product.gender.save();

    await _service.add(product);
  }

  Future<void> update(Product product) async {
    await product.category.save();
    await product.size.save();
    await product.color.save();
    await product.season.save();

    await _service.update(product);
  }

  Future<void> _prepareLink(IsarLink<ProductAttribute> link) async {
    final value = link.value;
    if (value == null) return;

    // Verificar si ya existe un atributo con el mismo tipo + nombre
    final existing = await _attributeService.getByNameAndType(
      value.name,
      value.type,
    );

    if (existing != null) {
      link.value = existing;
    } else {
      final id = await _attributeService.add(value);
      value.id = id;
      link.value = value;
    }
  }
}
