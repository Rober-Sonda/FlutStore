import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import '../models/producto.dart';

final productoControllerProvider = Provider((ref) => ProductoController());

class ProductoController {
  Future<List<Producto>> getProductos({Isar? isar}) async {
    isar ??= Isar.getInstance();
    if (isar == null) return [];
    return await isar.collection<Producto>().where().findAll();
  }

  Future<void> addProducto(Producto producto, {Isar? isar}) async {
    isar ??= Isar.getInstance();
    if (isar == null) return;
    await isar.writeTxn(() async {
      await isar!.collection<Producto>().put(producto);
    });
  }
}
