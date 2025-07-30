import 'package:isar/isar.dart';

part 'propiedad.g.dart';

@Collection()
class Propiedad {
  Id id = Isar.autoIncrement;

  late String nombre;
  String? valor;
}
