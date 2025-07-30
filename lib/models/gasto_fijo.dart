import 'package:isar/isar.dart';

part 'gasto_fijo.g.dart';

@Collection()
class GastoFijo {
  Id id = Isar.autoIncrement;

  late String nombre;
  String? descripcion;
  double monto;
  String categoria; // 'servicios', 'alquiler', 'impuestos', 'seguros', 'otros'
  
  // Configuración de frecuencia
  String frecuencia; // 'mensual', 'bimestral', 'trimestral', 'semestral', 'anual'
  int diaVencimiento; // Día del mes en que vence
  bool activo = true;
  
  // Información adicional
  String? proveedor;
  String? numeroCuenta;
  String? numeroFactura;
  String? observaciones;
  
  // Configuración de notificaciones
  bool notificarVencimiento = true;
  int diasAnticipacionNotificacion = 7;
  
  // Historial de pagos
  List<DateTime> fechasPago = [];
  List<double> montosPagados = [];
  
  // Auditoría
  int usuarioId; // Usuario que creó el gasto fijo
  DateTime fechaCreacion = DateTime.now();
  DateTime? fechaActualizacion;

  GastoFijo({
    required this.nombre,
    this.descripcion,
    required this.monto,
    required this.categoria,
    required this.frecuencia,
    required this.diaVencimiento,
    this.activo = true,
    this.proveedor,
    this.numeroCuenta,
    this.numeroFactura,
    this.observaciones,
    this.notificarVencimiento = true,
    this.diasAnticipacionNotificacion = 7,
    required this.usuarioId,
  });

  // Método para obtener el monto formateado
  String get montoFormateado {
    return '\$${monto.toStringAsFixed(2)}';
  }

  // Método para obtener el color según la categoría
  String get colorCategoria {
    switch (categoria.toLowerCase()) {
      case 'servicios':
        return 'blue';
      case 'alquiler':
        return 'green';
      case 'impuestos':
        return 'red';
      case 'seguros':
        return 'purple';
      case 'otros':
        return 'orange';
      default:
        return 'grey';
    }
  }

  // Método para obtener el icono según la categoría
  String get iconoCategoria {
    switch (categoria.toLowerCase()) {
      case 'servicios':
        return 'lightbulb';
      case 'alquiler':
        return 'home';
      case 'impuestos':
        return 'account_balance';
      case 'seguros':
        return 'security';
      case 'otros':
        return 'more_horiz';
      default:
        return 'attach_money';
    }
  }

  // Método para obtener la frecuencia formateada
  String get frecuenciaFormateada {
    switch (frecuencia.toLowerCase()) {
      case 'mensual':
        return 'Mensual';
      case 'bimestral':
        return 'Bimestral';
      case 'trimestral':
        return 'Trimestral';
      case 'semestral':
        return 'Semestral';
      case 'anual':
        return 'Anual';
      default:
        return frecuencia;
    }
  }

  // Método para obtener la categoría formateada
  String get categoriaFormateada {
    switch (categoria.toLowerCase()) {
      case 'servicios':
        return 'Servicios';
      case 'alquiler':
        return 'Alquiler';
      case 'impuestos':
        return 'Impuestos';
      case 'seguros':
        return 'Seguros';
      case 'otros':
        return 'Otros';
      default:
        return categoria;
    }
  }

  // Método para calcular el próximo vencimiento
  DateTime get proximoVencimiento {
    final ahora = DateTime.now();
    DateTime proximo = DateTime(ahora.year, ahora.month, diaVencimiento);
    
    if (proximo.isBefore(ahora)) {
      proximo = DateTime(ahora.year, ahora.month + 1, diaVencimiento);
    }
    
    return proximo;
  }

  // Método para calcular días hasta el vencimiento
  int get diasHastaVencimiento {
    final vencimiento = proximoVencimiento;
    final ahora = DateTime.now();
    return vencimiento.difference(ahora).inDays;
  }

  // Método para verificar si está próximo a vencer
  bool get estaProximoAVencer {
    return diasHastaVencimiento <= diasAnticipacionNotificacion;
  }

  // Método para verificar si está vencido
  bool get estaVencido {
    return diasHastaVencimiento < 0;
  }

  // Método para obtener el estado del gasto
  String get estadoGasto {
    if (!activo) return 'Inactivo';
    if (estaVencido) return 'Vencido';
    if (estaProximoAVencer) return 'Próximo a vencer';
    return 'Al día';
  }

  // Método para obtener el color del estado
  String get colorEstado {
    switch (estadoGasto) {
      case 'Al día':
        return 'green';
      case 'Próximo a vencer':
        return 'orange';
      case 'Vencido':
        return 'red';
      case 'Inactivo':
        return 'grey';
      default:
        return 'grey';
    }
  }

  // Método para registrar un pago
  void registrarPago(double monto, DateTime fecha) {
    fechasPago.add(fecha);
    montosPagados.add(monto);
    fechaActualizacion = DateTime.now();
  }

  // Método para obtener el total pagado en el último año
  double get totalPagadoUltimoAno {
    final unAnoAtras = DateTime.now().subtract(const Duration(days: 365));
    double total = 0;
    
    for (int i = 0; i < fechasPago.length; i++) {
      if (fechasPago[i].isAfter(unAnoAtras)) {
        total += montosPagados[i];
      }
    }
    
    return total;
  }

  // Método para obtener el promedio mensual
  double get promedioMensual {
    if (fechasPago.isEmpty) return monto;
    
    final totalPagado = montosPagados.reduce((a, b) => a + b);
    final mesesTranscurridos = DateTime.now().difference(fechasPago.first).inDays / 30;
    
    return mesesTranscurridos > 0 ? totalPagado / mesesTranscurridos : monto;
  }

  // Método para obtener el último pago
  DateTime? get ultimoPago {
    if (fechasPago.isEmpty) return null;
    return fechasPago.last;
  }

  // Método para obtener el monto del último pago
  double? get montoUltimoPago {
    if (montosPagados.isEmpty) return null;
    return montosPagados.last;
  }

  // Método para obtener el próximo monto estimado
  double get proximoMontoEstimado {
    return promedioMensual > 0 ? promedioMensual : monto;
  }

  // Método para obtener el monto estimado formateado
  String get proximoMontoEstimadoFormateado {
    return '\$${proximoMontoEstimado.toStringAsFixed(2)}';
  }

  // Método para obtener el total pagado formateado
  String get totalPagadoUltimoAnoFormateado {
    return '\$${totalPagadoUltimoAno.toStringAsFixed(2)}';
  }

  // Método para obtener el promedio mensual formateado
  String get promedioMensualFormateado {
    return '\$${promedioMensual.toStringAsFixed(2)}';
  }
} 