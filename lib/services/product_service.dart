import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:tienda_app/models/product.dart';
import 'package:tienda_app/models/product_attribute.dart';
import 'package:tienda_app/services/isar_service.dart';
import 'package:tienda_app/services/id_validator.dart';

final productServiceProvider = Provider<ProductService>(
  (ref) => ProductService(),
);

class ProductService {
  Future<Isar> get db async {
    final isarService = IsarService();
    return await isarService.db;
  }

  Future<List<Product>> getAll() async {
    final isar = await db;
    return isar.products.where().findAll();
  }

  String _generateSlug(AttributeType type, String name) {
    final base = name.trim().toLowerCase().replaceAll(RegExp(r'\s+'), '-');
    return '${type.name}-$base';
  }

  Future<int> _putAttributeIfNotExists(
    Isar isar,
    ProductAttribute? attribute,
  ) async {
    if (attribute == null) return -1;

    print('🟡 Verificando atributo: ${attribute.name}');

    // Buscar si ya existe por name + type
    final existing =
        await isar.productAttributes
            .filter()
            .nameEqualTo(attribute.name.trim(), caseSensitive: false)
            .typeEqualTo(attribute.type)
            .findFirst();

    if (existing != null) {
      print(
        '🔁 Atributo ya existente encontrado: ${existing.name} (ID: ${existing.id})',
      );
      attribute.id = existing.id;
      return existing.id;
    }

    // 🆕 Generar slug único (esto debe coincidir con el índice @Index(unique: true))
    attribute.slug = _generateSlug(attribute.type, attribute.name);

    // Asignar ID como autoincrement
    attribute.id = Isar.autoIncrement;

    // Guardar el atributo
    final id = await isar.productAttributes.put(attribute);
    attribute.id = id;

    // Validar y registrar el ID del atributo
    IdValidator.validateAndLogEntityWithName(
      id,
      'Atributo',
      attribute.name,
      'Atributo guardado',
    );

    return id;
  }

  Future<void> add(Product product) async {
    final isar = await db;

    final isNew = product.id <= 0;

    print('👉 Iniciando guardado de producto: ${product.name}');
    print('¿Es nuevo? $isNew');

    final random = Random();

    // Asignar SKU y barcode temporales si están vacíos, ANTES de buscar duplicados
    if (product.sku.isEmpty) {
      product.sku =
          'TEMP-${DateTime.now().millisecondsSinceEpoch}-${random.nextInt(10000)}';
    }

    if (product.barcode.isEmpty) {
      product.barcode =
          'TEMP-${DateTime.now().millisecondsSinceEpoch}-${random.nextInt(10000)}';
    }

    print('SKU a guardar: ${product.sku}');
    print('Barcode a guardar: ${product.barcode}');

    await isar.writeTxn(() async {
      final skuExists =
          await isar.products
              .filter()
              .skuEqualTo(product.sku, caseSensitive: false)
              .findFirst();

      if (skuExists != null && (isNew || skuExists.id != product.id)) {
        print(
          '❌ SKU duplicado detectado: ${product.sku} con ID: ${skuExists.id}',
        );
        throw Exception('SKU ya existe en otro producto.');
      }

      final barcodeExists =
          await isar.products
              .filter()
              .barcodeEqualTo(product.barcode, caseSensitive: false)
              .findFirst();

      if (barcodeExists != null && (isNew || barcodeExists.id != product.id)) {
        print(
          '❌ Barcode duplicado detectado: ${product.barcode} con ID: ${barcodeExists.id}',
        );
        throw Exception('Barcode ya existe en otro producto.');
      }

      try {
        print('💾 Guardando atributos si no existen...');

        if (product.category.value != null) {
          print('🟡 Guardando category: ${product.category.value!.name}');
          product.category.value!.id = await _putAttributeIfNotExists(
            isar,
            product.category.value,
          );
        }

        if (product.size.value != null) {
          print('🟡 Guardando size: ${product.size.value!.name}');
          final id = await _putAttributeIfNotExists(isar, product.size.value);
          product.size.value!.id = id;
        }

        if (product.color.value != null) {
          print('🟡 Guardando color: ${product.color.value!.name}');
          product.color.value!.id = await _putAttributeIfNotExists(
            isar,
            product.color.value,
          );
        }

        if (product.season.value != null) {
          print('🟡 Guardando season: ${product.season.value!.name}');
          product.season.value!.id = await _putAttributeIfNotExists(
            isar,
            product.season.value,
          );
        }

        if (product.brand.value != null) {
          print('🟡 Guardando brand: ${product.brand.value!.name}');
          product.brand.value!.id = await _putAttributeIfNotExists(
            isar,
            product.brand.value,
          );
        }

        if (product.gender.value != null) {
          print('🟡 Guardando gender: ${product.gender.value!.name}');
          product.gender.value!.id = await _putAttributeIfNotExists(
            isar,
            product.gender.value,
          );
        }

        final productId = await isar.products.put(product);

        // **IMPORTANTE**: Actualiza el ID del producto después de guardarlo
        product.id = productId;

        // Validar y registrar el ID del producto
        IdValidator.validateAndLogEntityWithName(
          productId,
          'Producto',
          product.name,
          'Producto guardado',
        );

        print('✅ Producto guardado con ID: $productId');

        // Vincular atributos con el producto recién guardado
        if (product.category.value != null) {
          product.category.attach(
            isar.products,
            isar.productAttributes,
            'category',
            productId,
          );
          await product.category.save();
        }
        if (product.size.value != null) {
          product.size.attach(
            isar.products,
            isar.productAttributes,
            'size',
            productId,
          );
          await product.size.save();
        }
        if (product.color.value != null) {
          product.color.attach(
            isar.products,
            isar.productAttributes,
            'color',
            productId,
          );
          await product.color.save();
        }
        if (product.season.value != null) {
          product.season.attach(
            isar.products,
            isar.productAttributes,
            'season',
            productId,
          );
          await product.season.save();
        }
        if (product.brand.value != null) {
          product.brand.attach(
            isar.products,
            isar.productAttributes,
            'brand',
            productId,
          );
          await product.brand.save();
        }
        if (product.gender.value != null) {
          product.gender.attach(
            isar.products,
            isar.productAttributes,
            'gender',
            productId,
          );
          await product.gender.save();
        }

        print('✅ Producto y atributos guardados correctamente');
      } catch (e, stack) {
        print('❌ ERROR al guardar producto: $e');
        print('📍 Stack: $stack');
        rethrow;
      }
    });
  }

  Future<void> update(Product product) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await product.category.save();
      await product.size.save();
      await product.color.save();
      await product.season.save();
      await product.brand.save();
      await product.gender.save();

      await isar.products.put(product);
    });
  }

  Future<List<ProductAttribute>> getAttributesByType(AttributeType type) async {
    final isar = await db;
    return await isar.productAttributes.filter().typeEqualTo(type).findAll();
  }

  Future<Product?> getById(int id) async {
    final isar = await db;
    return await isar.products.get(id);
  }
}
