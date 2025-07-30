import 'package:isar/isar.dart';

part 'rol.g.dart';

@Collection()
class Rol {
  Id id = Isar.autoIncrement;

  late String nombre;
  String? descripcion;
  List<String>? permisos;
  DateTime? fechaCreacion;
}
