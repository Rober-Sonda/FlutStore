import 'package:isar/isar.dart';

part 'pedido.g.dart';

@Collection()
class Pedido {
  Id id = Isar.autoIncrement;

  int? clienteId;
  List<int> productos = [];
  DateTime? fecha;
  String? estado;
  double? total;
  double? descuento;
}
