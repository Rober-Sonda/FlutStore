import 'package:isar/isar.dart';

part 'carrito_compra.g.dart';

@Collection()
class CarritoCompra {
  Id id = Isar.autoIncrement;

  late String nombreProducto;
  int? productoId;
  int? proveedorId;
  String? nombreProveedor;
  int cantidad = 1;
  double? precioUnitario;
  double? precioTotal;
  DateTime fechaAgregado = DateTime.now();
  bool esUrgente = false;
  String? notas;
  String estado = 'pendiente'; // pendiente, procesado, cancelado
} 