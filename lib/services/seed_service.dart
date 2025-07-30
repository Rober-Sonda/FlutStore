import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import '../seed/isar_seed.dart';
import 'product_service.dart';

class SeedService {
  final ProductService _productService;

  SeedService(this._productService);

  Future<Isar> get _db => _productService.db;

  /// Ejecuta el seed de la base de datos
  Future<void> seedDatabase() async {
    try {
      final isar = await _db;
      await seedIsar(isar);
    } catch (e) {
      throw Exception('Error al ejecutar el seed: $e');
    }
  }

  /// Limpia toda la base de datos
  Future<void> clearDatabase() async {
    try {
      final isar = await _db;
      await clearIsar(isar);
    } catch (e) {
      throw Exception('Error al limpiar la base de datos: $e');
    }
  }

  /// Verifica si la base de datos tiene datos
  Future<bool> hasDataInDatabase() async {
    try {
      final isar = await _db;
      return await hasData(isar);
    } catch (e) {
      return false;
    }
  }

  /// Ejecuta el seed solo si la base de datos está vacía
  Future<void> seedIfEmpty() async {
    final hasDataInDb = await hasDataInDatabase();
    if (!hasDataInDb) {
      await seedDatabase();
    }
  }
}

// Provider para el SeedService
final seedServiceProvider = Provider<SeedService>((ref) {
  final productService = ref.watch(productServiceProvider);
  return SeedService(productService);
});

// Provider para verificar si hay datos
final hasDataProvider = FutureProvider<bool>((ref) async {
  final seedService = ref.watch(seedServiceProvider);
  return await seedService.hasDataInDatabase();
});
