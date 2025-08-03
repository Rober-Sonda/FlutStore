import 'package:isar/isar.dart';

part 'cliente.g.dart';

@Collection()
class Cliente {
  Id id = Isar.autoIncrement;

  late String nombre;
  String? apellido;
  String? email;
  String? whatsapp; // Cambiado de telefono a whatsapp
  String? instagram; // Nuevo campo para Instagram
  String? direccion;
  String? dni;
  String? cuil;
  DateTime? fechaRegistro;
}
