import 'package:isar/isar.dart';

part 'usuario.g.dart';

@Collection()
class Usuario {
  Id id = Isar.autoIncrement;

  late String nombre;
  String? apellido;
  String? email;
  late String username;
  late String password;
  int? rolId;
  bool activo = true; // Campo para estado activo/inactivo
  DateTime? fechaCreacion;

  // Imagen de perfil (avatar)
  String? avatarUrl;

  // Información adicional del rol (almacenada para evitar dependencias)
  String? rolNombre;
  String? rolDescripcion;
  List<String>? rolPermisos;

  // Getter para obtener la imagen de usuario (avatar o por defecto)
  String get imagenPerfil =>
      avatarUrl?.trim().isNotEmpty == true
          ? avatarUrl!
          : 'assets/images/icons/default_avatar.png';
}
