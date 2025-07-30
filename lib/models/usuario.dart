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
  DateTime? fechaCreacion;

  // Imagen de perfil (avatar)
  String? avatarUrl;

  // Getter para obtener la imagen de usuario (avatar o por defecto)
  String get imagenPerfil =>
      avatarUrl?.isNotEmpty == true
          ? avatarUrl!
          : 'assets/images/icons/default_avatar.png';
}
