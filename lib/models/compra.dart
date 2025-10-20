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
      'pendiente'; // 'pendiente', 'confirmada', 'cancelada', 'recibida', 'devuelta'

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

  // Información profesional
  String? numeroOrden;
  String? numeroRemito;
  String? numeroGuia;
  String? referenciaProveedor;
  String? condicionesPago;
  String? plazoEntrega;
  String? direccionEntrega;
  String? contactoProveedor;
  String? telefonoProveedor;
  String? emailProveedor;

  // Información de devolución
  bool esDevolucion = false;
  int? compraOriginalId; // ID de la compra original si es una devolución
  String? motivoDevolucion;
  DateTime? fechaDevolucion;
  int? usuarioDevolucion;

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
    this.numeroOrden,
    this.numeroRemito,
    this.numeroGuia,
    this.referenciaProveedor,
    this.condicionesPago,
    this.plazoEntrega,
    this.direccionEntrega,
    this.contactoProveedor,
    this.telefonoProveedor,
    this.emailProveedor,
    this.esDevolucion = false,
    this.compraOriginalId,
    this.motivoDevolucion,
    this.fechaDevolucion,
    this.usuarioDevolucion,
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

  // Métodos para devoluciones
  bool get puedeDevolver => estado == 'recibida' && !esDevolucion;
  bool get esDevolucionValida => esDevolucion && compraOriginalId != null;

  // Método para crear una devolución
  Compra crearDevolucion({
    required String motivo,
    required int usuarioId,
    String? observaciones,
  }) {
    return Compra(
      numeroFactura: 'DEV-$numeroFactura',
      fecha: DateTime.now(),
      total: -total, // Total negativo para indicar devolución
      observaciones: observaciones ?? 'Devolución de compra #$id',
      estado: 'devuelta',
      proveedorId: proveedorId,
      metodoPago: metodoPago,
      montoPagado: 0.0,
      saldoPendiente: 0.0,
      esDevolucion: true,
      compraOriginalId: id,
      motivoDevolucion: motivo,
      fechaDevolucion: DateTime.now(),
      usuarioDevolucion: usuarioId,
      usuarioId: usuarioId,
    );
  }

  // Método para obtener el tipo de documento
  String get tipoDocumento {
    if (esDevolucion) return 'Devolución';
    if (numeroOrden != null) return 'Orden de Compra';
    if (numeroRemito != null) return 'Remito';
    if (numeroGuia != null) return 'Guía';
    return 'Compra';
  }

  // Método para obtener el número de documento
  String get numeroDocumento {
    if (esDevolucion) return 'DEV-${id.toString().padLeft(6, '0')}';
    if (numeroFactura.isNotEmpty) return numeroFactura;
    if (numeroOrden != null) return numeroOrden!;
    if (numeroRemito != null) return numeroRemito!;
    return 'C-${id.toString().padLeft(6, '0')}';
  }

  // Método para obtener el total con signo
  String get totalConSigno {
    if (esDevolucion) {
      return '-\$${total.abs().toStringAsFixed(2)}';
    }
    return '\$${total.toStringAsFixed(2)}';
  }

  // Método para obtener el estado formateado actualizado
  String get estadoFormateadoCompleto {
    switch (estado) {
      case 'pendiente':
        return 'Pendiente';
      case 'confirmada':
        return 'Confirmada';
      case 'cancelada':
        return 'Cancelada';
      case 'recibida':
        return 'Recibida';
      case 'devuelta':
        return 'Devuelta';
      default:
        return estado;
    }
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
