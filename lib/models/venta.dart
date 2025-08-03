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
  late String estado; // 'pendiente', 'completada', 'cancelada'
  
  // Información adicional
  String? numeroFactura;
  String? numeroRecibo;
  String? vendedor;
  
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
} 