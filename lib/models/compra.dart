import 'package:isar/isar.dart';

part 'compra.g.dart';

@Collection()
class Compra {
  Id id = Isar.autoIncrement;

  // Información básica
  late String numeroFactura;
  DateTime fecha = DateTime.now();
  double total = 0.0;
  String? observaciones;
  String estado =
      'pendiente'; // 'pendiente', 'confirmada', 'cancelada', 'recibida'

  // Relaciones
  int? proveedorId;
  int usuarioId = 1; // Usuario que registró la compra

  // Detalles de productos
  List<CompraProducto> productos = [];

  // Información de pago
  String metodoPago =
      'efectivo'; // 'efectivo', 'tarjeta', 'transferencia', 'cheque'
  double montoPagado = 0.0;
  double saldoPendiente = 0.0;

  // Auditoría
  DateTime fechaCreacion = DateTime.now();
  DateTime? fechaActualizacion;
  DateTime? fechaRecepcion;

  // Estados adicionales
  bool esUrgente = false;
  String? prioridad; // 'baja', 'media', 'alta', 'urgente'

  Compra({
    required this.numeroFactura,
    required this.fecha,
    required this.total,
    this.observaciones,
    this.estado = 'pendiente',
    this.proveedorId,
    this.usuarioId = 1,
    this.metodoPago = 'efectivo',
    this.montoPagado = 0.0,
    this.saldoPendiente = 0.0,
    this.esUrgente = false,
    this.prioridad,
  });

  // Método para calcular el saldo pendiente
  void calcularSaldoPendiente() {
    saldoPendiente = total - montoPagado;
  }

  // Método para registrar un pago
  void registrarPago(double monto) {
    montoPagado += monto;
    calcularSaldoPendiente();
    fechaActualizacion = DateTime.now();
  }

  // Método para confirmar la compra
  void confirmarCompra() {
    estado = 'confirmada';
    fechaActualizacion = DateTime.now();
  }

  // Método para recibir la compra
  void recibirCompra() {
    estado = 'recibida';
    fechaRecepcion = DateTime.now();
    fechaActualizacion = DateTime.now();
  }

  // Método para cancelar la compra
  void cancelarCompra() {
    estado = 'cancelada';
    fechaActualizacion = DateTime.now();
  }

  // Método para obtener el estado formateado
  String get estadoFormateado {
    switch (estado) {
      case 'pendiente':
        return 'Pendiente';
      case 'confirmada':
        return 'Confirmada';
      case 'cancelada':
        return 'Cancelada';
      case 'recibida':
        return 'Recibida';
      default:
        return estado;
    }
  }

  // Método para obtener el color del estado
  String get colorEstado {
    switch (estado) {
      case 'pendiente':
        return 'orange';
      case 'confirmada':
        return 'blue';
      case 'cancelada':
        return 'red';
      case 'recibida':
        return 'green';
      default:
        return 'grey';
    }
  }

  // Método para obtener el método de pago formateado
  String get metodoPagoFormateado {
    switch (metodoPago) {
      case 'efectivo':
        return 'Efectivo';
      case 'tarjeta':
        return 'Tarjeta';
      case 'transferencia':
        return 'Transferencia';
      case 'cheque':
        return 'Cheque';
      default:
        return metodoPago;
    }
  }

  // Método para verificar si está pagada
  bool get estaPagada {
    return saldoPendiente <= 0;
  }

  // Método para verificar si está recibida
  bool get estaRecibida {
    return estado == 'recibida';
  }
}

// Modelo para los productos de una compra
@embedded
class CompraProducto {
  int productoId = 0;
  String nombreProducto = '';
  int cantidad = 0;
  double precioUnitario = 0.0;
  double subtotal = 0.0;
  String? observaciones;

  CompraProducto({
    this.productoId = 0,
    this.nombreProducto = '',
    this.cantidad = 0,
    this.precioUnitario = 0.0,
    this.observaciones,
  }) {
    calcularSubtotal();
  }

  void calcularSubtotal() {
    subtotal = cantidad * precioUnitario;
  }
}
