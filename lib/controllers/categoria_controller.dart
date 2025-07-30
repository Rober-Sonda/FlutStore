import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import '../models/categoria.dart';

final categoriaControllerProvider = Provider((ref) => CategoriaController());

class CategoriaController {
  Future<List<Categoria>> getCategorias({Isar? isar}) async {
    isar ??= Isar.getInstance();
    if (isar == null) return [];
    return await isar.categorias.filter().parentIsNull().findAll();
  }

  Future<List<Categoria>> getSubcategorias(int parentId, {Isar? isar}) async {
    isar ??= Isar.getInstance();
    if (isar == null) return [];
    return await isar.categorias.filter().parentEqualTo(parentId).findAll();
  }

  Future<void> addCategoria(Categoria categoria, {Isar? isar}) async {
    isar ??= Isar.getInstance();
    if (isar == null) return;
    await isar.writeTxn(() async {
      await isar!.categorias.put(categoria);
    });
  }
}
