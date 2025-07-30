import 'package:isar/isar.dart';

part 'propiedad_categoria.g.dart';

enum TipoPropiedad {
  texto,
  numero,
  booleano,
  fecha,
  seleccion
}

@embedded
class PropiedadCategoria {
  late String nombre;
  @enumerated
  late TipoPropiedad tipo;
  String? valorPorDefecto;
  List<String> opciones = []; // Para tipo seleccion
  bool requerido = false;
} 