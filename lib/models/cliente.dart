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

  Cliente({
    required this.id,
    required this.nombre,
    this.apellido,
    this.email,
    this.whatsapp,
    this.instagram,
    this.direccion,
    this.dni,
    this.cuil,
    this.fechaRegistro,
  });

  // Factory para crear desde JSON
  factory Cliente.fromJson(Map<String, dynamic> json) {
    return Cliente(
      id: json['id'],
      nombre: json['nombre'],
      apellido: json['apellido'],
      email: json['email'],
      whatsapp: json['whatsapp'],
      instagram: json['instagram'],
      direccion: json['direccion'],
      dni: json['dni'],
      cuil: json['cuil'],
      fechaRegistro:
          json['fechaRegistro'] != null
              ? DateTime.parse(json['fechaRegistro'])
              : null,
    );
  }
}
