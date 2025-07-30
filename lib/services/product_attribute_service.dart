import 'package:isar/isar.dart';
import '../models/product_attribute.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'isar_service.dart';

// ✅ Declarar el provider FUERA de la clase
final productAttributeServiceProvider = Provider<ProductAttributeService>((
  ref,
) {
  return ProductAttributeService();
});

class ProductAttributeService {
  Future<Isar> get db async {
    final isarService = IsarService();
    return await isarService.db;
  }

  Future<List<ProductAttribute>> getByType(AttributeType type) async {
    final isar = await db;
    return await isar.productAttributes.filter().typeEqualTo(type).findAll();
  }

  Future<ProductAttribute?> getByNameAndType(
    String name,
    AttributeType type,
  ) async {
    final isar = await db;
    return await isar.productAttributes
        .filter()
        .nameEqualTo(name, caseSensitive: false)
        .typeEqualTo(type)
        .findFirst();
  }

  Future<ProductAttribute?> getByName(String name) async {
    final isar = await db;
    return await isar.productAttributes.filter().nameEqualTo(name).findFirst();
  }

  Future<List<ProductAttribute>> getAll() async {
    final isar = await db;
    return isar.productAttributes.where().findAll();
  }

  Future<int> add(ProductAttribute attribute) async {
    final isar = await db;

    // Verificamos por name+type
    final existing =
        await isar.productAttributes
            .filter()
            .nameEqualTo(attribute.name, caseSensitive: false)
            .typeEqualTo(attribute.type)
            .findFirst();

    if (existing != null) {
      return existing.id; // Ya existe, devolvemos su ID
    }

    // Si tiene slug, verificamos por slug también
    if (attribute.slug != null) {
      final slugExists =
          await isar.productAttributes
              .filter()
              .slugEqualTo(attribute.slug!, caseSensitive: false)
              .findFirst();

      if (slugExists != null) {
        throw Exception('Ya existe un atributo con ese slug.');
      }
    }

    return await isar.writeTxn(() async {
      return await isar.productAttributes.put(attribute);
    });
  }

  Future<void> update(ProductAttribute attribute) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.productAttributes.put(attribute);
    });
  }
}
