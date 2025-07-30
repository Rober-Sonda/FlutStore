import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import '../models/propiedad.dart';

final propiedadControllerProvider = Provider((ref) => PropiedadController());

class PropiedadController {
  Future<List<Propiedad>> getPropiedades({Isar? isar}) async {
    isar ??= Isar.getInstance();
    if (isar == null) return [];
    return await isar.propiedads.where().findAll();
  }

  Future<void> addPropiedad(Propiedad propiedad, {Isar? isar}) async {
    isar ??= Isar.getInstance();
    if (isar == null) return;
    await isar.writeTxn(() async {
      await isar!.propiedads.put(propiedad);
    });
  }
}
