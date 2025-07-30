import 'package:isar/isar.dart';
import 'propiedad_categoria.dart';

part 'categoria.g.dart';

@Collection()
class Categoria {
  Id id = Isar.autoIncrement;

  late String nombre;
  String? descripcion;
  List<PropiedadCategoria> propiedades = [];
  int? parent;
  int orden = 0; // Para ordenar las categorías
}
