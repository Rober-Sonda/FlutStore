import 'package:isar/isar.dart';

part 'rol.g.dart';

@Collection()
class Rol {
  Id id = Isar.autoIncrement;

  late String nombre;
  String? descripcion;
  List<String>? permisos;
  bool activo = true; // Campo para estado activo/inactivo
  DateTime? fechaCreacion;
  DateTime? fechaActualizacion;

  // Información adicional
  bool esSistema = false; // Si es un rol predefinido del sistema
  int? usuariosAsignados; // Cantidad de usuarios con este rol

  Rol({
    this.nombre = '',
    this.descripcion,
    this.permisos,
    this.activo = true,
    this.fechaCreacion,
    this.fechaActualizacion,
    this.esSistema = false,
    this.usuariosAsignados,
  });
}
