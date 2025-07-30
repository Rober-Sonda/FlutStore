import 'package:isar/isar.dart';

part 'movimientostock.g.dart';

@Collection()
class MovimientoStock {
  Id id = Isar.autoIncrement;

  int? productoId;
  int? cantidad;
  String? tipo;
  DateTime? fecha;
}
