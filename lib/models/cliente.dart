import 'package:isar/isar.dart';

part 'cliente.g.dart';

@Collection()
class Cliente {
  Id id = Isar.autoIncrement;

  late String nombre;
  String? apellido;
  String? email;
  String? telefono;
  String? direccion;
  String? dni;
  String? cuil;
  DateTime? fechaRegistro;
}
