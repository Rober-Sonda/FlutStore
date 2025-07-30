import 'package:isar/isar.dart';

part 'reporte.g.dart';

@Collection()
class Reporte {
  Id id = Isar.autoIncrement;

  String? titulo;
  String? descripcion;
  DateTime? fecha;
}
