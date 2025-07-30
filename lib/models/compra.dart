import 'package:isar/isar.dart';

part 'compra.g.dart';

@Collection()
class Compra {
  Id id = Isar.autoIncrement;

  int? proveedorId;
  List<int> productos = [];
  DateTime? fecha;
  double? total;
  String? numeroFactura;
  String? observaciones;
  String? estado;
}
