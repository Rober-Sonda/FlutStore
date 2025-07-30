import 'package:isar/isar.dart';

part 'proveedor.g.dart';

@Collection()
class Proveedor {
  Id id = Isar.autoIncrement;

  late String nombre;
  String? razonSocial;
  String? email;
  String? telefono;
  String? direccion;
  String? cuit;
  String? contacto;
  String? observaciones;
  DateTime? fechaRegistro;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Proveedor && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
