import 'package:isar/isar.dart';

part 'pedido_proveedor.g.dart';

@Collection()
class PedidoProveedor {
  Id id = Isar.autoIncrement;

  late int proveedorId;
  List<ItemPedidoProveedor> items = [];
  DateTime fechaCreacion = DateTime.now();
  DateTime? fechaEnvio;
  DateTime? fechaRecepcion;
  String estado = 'borrador'; // borrador, enviado, recibido, cancelado
  String? observaciones;
  double? totalEstimado;
  int? compraId; // Si se convierte en compra

  // Estados disponibles
  static const String estadoBorrador = 'borrador';
  static const String estadoEnviado = 'enviado';
  static const String estadoRecibido = 'recibido';
  static const String estadoCancelado = 'cancelado';

  // Método para cambiar estado
  void cambiarEstado(String nuevoEstado) {
    estado = nuevoEstado;
    switch (nuevoEstado) {
      case estadoEnviado:
        fechaEnvio = DateTime.now();
        break;
      case estadoRecibido:
        fechaRecepcion = DateTime.now();
        break;
    }
  }

  // Método para calcular total estimado
  double calcularTotalEstimado() {
    return items.fold(0.0, (total, item) => total + ((item.precioEstimado ?? 0.0) * item.cantidad));
  }

  // Método para verificar si se puede enviar
  bool get puedeEnviar => estado == estadoBorrador && items.isNotEmpty;

  // Método para verificar si se puede recibir
  bool get puedeRecibir => estado == estadoEnviado;

  // Método para verificar si se puede cancelar
  bool get puedeCancelar => estado == estadoBorrador || estado == estadoEnviado;
}

@embedded
class ItemPedidoProveedor {
  late int productoId;
  late String nombreProducto;
  late int cantidad;
  double? precioEstimado;
  double? precioFinal;
  String? observaciones;
  bool convertidoEnCompra = false;
  int? compraItemId; // ID del item en la compra si se convierte

  // Método para convertir a compra
  void convertirACompra(double precioFinal, int compraItemId) {
    this.precioFinal = precioFinal;
    convertidoEnCompra = true;
    this.compraItemId = compraItemId;
  }
} 