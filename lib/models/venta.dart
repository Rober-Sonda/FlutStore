import 'package:isar/isar.dart';

part 'venta.g.dart';

@Collection()
class Venta {
  Id id = Isar.autoIncrement;

  late int clienteId;
  late DateTime fecha;
  late double total;
  late String metodoPago;
  String? observaciones;
  late String estado; // 'pendiente', 'completada', 'cancelada', 'devuelta'

  // Información profesional
  String? numeroFactura;
  String? numeroRecibo;
  String? vendedor;
  String? numeroTicket;
  String? numeroOrden;

  // Información de pago
  double? montoPagado;
  double? cambio;
  String? referenciaPago;
  String? banco;
  String? numeroTarjeta;

  // Información de devolución
  bool esDevolucion = false;
  int? ventaOriginalId; // ID de la venta original si es una devolución
  String? motivoDevolucion;
  DateTime? fechaDevolucion;
  int? usuarioDevolucion;

  // Información adicional
  String? direccionEntrega;
  String? telefonoCliente;
  String? emailCliente;
  String? condicionesVenta;
  String? notasInternas;

  // Auditoría
  int usuarioId; // Usuario que creó la venta
  DateTime fechaCreacion = DateTime.now();
  DateTime? fechaActualizacion;

  Venta({
    required this.clienteId,
    required this.fecha,
    required this.total,
    required this.metodoPago,
    this.observaciones,
    required this.estado,
    this.numeroFactura,
    this.numeroRecibo,
    this.vendedor,
    this.numeroTicket,
    this.numeroOrden,
    this.montoPagado,
    this.cambio,
    this.referenciaPago,
    this.banco,
    this.numeroTarjeta,
    this.esDevolucion = false,
    this.ventaOriginalId,
    this.motivoDevolucion,
    this.fechaDevolucion,
    this.usuarioDevolucion,
    this.direccionEntrega,
    this.telefonoCliente,
    this.emailCliente,
    this.condicionesVenta,
    this.notasInternas,
    required this.usuarioId,
  });

  // Método para obtener el total formateado
  String get totalFormateado {
    return '\$${total.toStringAsFixed(2)}';
  }

  // Método para obtener el color según el estado
  String get colorEstado {
    switch (estado.toLowerCase()) {
      case 'completada':
        return 'green';
      case 'pendiente':
        return 'orange';
      case 'cancelada':
        return 'red';
      default:
        return 'grey';
    }
  }

  // Método para obtener el icono según el método de pago
  String get iconoMetodoPago {
    switch (metodoPago.toLowerCase()) {
      case 'efectivo':
        return 'money';
      case 'tarjeta':
        return 'credit_card';
      case 'transferencia':
        return 'account_balance';
      case 'otro':
        return 'payment';
      default:
        return 'payment';
    }
  }

  // Método para obtener el método de pago formateado
  String get metodoPagoFormateado {
    switch (metodoPago.toLowerCase()) {
      case 'efectivo':
        return 'Efectivo';
      case 'tarjeta':
        return 'Tarjeta';
      case 'transferencia':
        return 'Transferencia';
      case 'otro':
        return 'Otro';
      default:
        return metodoPago;
    }
  }

  // Método para obtener el estado formateado
  String get estadoFormateado {
    switch (estado.toLowerCase()) {
      case 'completada':
        return 'Completada';
      case 'pendiente':
        return 'Pendiente';
      case 'cancelada':
        return 'Cancelada';
      default:
        return estado;
    }
  }

  // Método para obtener la fecha formateada
  String get fechaFormateada {
    return '${fecha.day.toString().padLeft(2, '0')}/${fecha.month.toString().padLeft(2, '0')}/${fecha.year}';
  }

  // Método para obtener la hora formateada
  String get horaFormateada {
    return '${fecha.hour.toString().padLeft(2, '0')}:${fecha.minute.toString().padLeft(2, '0')}';
  }

  // Método para obtener la fecha y hora formateada
  String get fechaHoraFormateada {
    return '$fechaFormateada $horaFormateada';
  }

  // Método para verificar si es una venta reciente (últimas 24 horas)
  bool get esReciente {
    final ahora = DateTime.now();
    final diferencia = ahora.difference(fecha);
    return diferencia.inHours < 24;
  }

  // Método para verificar si es una venta del día
  bool get esDelDia {
    final ahora = DateTime.now();
    return fecha.year == ahora.year &&
        fecha.month == ahora.month &&
        fecha.day == ahora.day;
  }

  // Método para verificar si es una venta de la semana
  bool get esDeLaSemana {
    final ahora = DateTime.now();
    final inicioSemana = ahora.subtract(Duration(days: ahora.weekday - 1));
    final finSemana = inicioSemana.add(const Duration(days: 6));
    return fecha.isAfter(inicioSemana.subtract(const Duration(days: 1))) &&
        fecha.isBefore(finSemana.add(const Duration(days: 1)));
  }

  // Método para verificar si es una venta del mes
  bool get esDelMes {
    final ahora = DateTime.now();
    return fecha.year == ahora.year && fecha.month == ahora.month;
  }

  // Método para obtener el período de la venta
  String get periodoVenta {
    if (esDelDia) return 'Hoy';
    if (esDeLaSemana) return 'Esta semana';
    if (esDelMes) return 'Este mes';
    return 'Anterior';
  }

  // Método para obtener el color del período
  String get colorPeriodo {
    switch (periodoVenta) {
      case 'Hoy':
        return 'green';
      case 'Esta semana':
        return 'blue';
      case 'Este mes':
        return 'orange';
      default:
        return 'grey';
    }
  }

  // Métodos para devoluciones
  bool get puedeDevolver => estado == 'completada' && !esDevolucion;
  bool get esDevolucionValida => esDevolucion && ventaOriginalId != null;

  // Método para crear una devolución
  Venta crearDevolucion({
    required String motivo,
    required int usuarioId,
    String? observaciones,
  }) {
    return Venta(
      clienteId: clienteId,
      fecha: DateTime.now(),
      total: -total, // Total negativo para indicar devolución
      metodoPago: metodoPago,
      observaciones: observaciones ?? 'Devolución de venta #$id',
      estado: 'devuelta',
      numeroFactura: numeroFactura != null ? 'DEV-$numeroFactura' : null,
      numeroRecibo: numeroRecibo != null ? 'DEV-$numeroRecibo' : null,
      vendedor: vendedor,
      esDevolucion: true,
      ventaOriginalId: id,
      motivoDevolucion: motivo,
      fechaDevolucion: DateTime.now(),
      usuarioDevolucion: usuarioId,
      usuarioId: usuarioId,
    );
  }

  // Método para obtener el tipo de documento
  String get tipoDocumento {
    if (esDevolucion) return 'Devolución';
    if (numeroFactura != null) return 'Factura';
    if (numeroRecibo != null) return 'Recibo';
    if (numeroTicket != null) return 'Ticket';
    return 'Venta';
  }

  // Método para obtener el número de documento
  String get numeroDocumento {
    if (esDevolucion) return 'DEV-${id.toString().padLeft(6, '0')}';
    if (numeroFactura != null) return numeroFactura!;
    if (numeroRecibo != null) return numeroRecibo!;
    if (numeroTicket != null) return numeroTicket!;
    return 'V-${id.toString().padLeft(6, '0')}';
  }

  // Método para obtener el total con signo
  String get totalConSigno {
    if (esDevolucion) {
      return '-\$${total.abs().toStringAsFixed(2)}';
    }
    return '\$${total.toStringAsFixed(2)}';
  }
}

class ProductoVenta {
  final String productoId;
  final String nombre;
  final double precio;
  final int cantidad;
  final double subtotal;

  ProductoVenta({
    required this.productoId,
    required this.nombre,
    required this.precio,
    required this.cantidad,
    required this.subtotal,
  });

  Map<String, dynamic> toJson() {
    return {
      'productoId': productoId,
      'nombre': nombre,
      'precio': precio,
      'cantidad': cantidad,
      'subtotal': subtotal,
    };
  }

  factory ProductoVenta.fromJson(Map<String, dynamic> json) {
    return ProductoVenta(
      productoId: json['productoId'] ?? '',
      nombre: json['nombre'] ?? '',
      precio: (json['precio'] ?? 0).toDouble(),
      cantidad: json['cantidad'] ?? 0,
      subtotal: (json['subtotal'] ?? 0).toDouble(),
    );
  }
}
