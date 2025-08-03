import 'package:isar/isar.dart';

part 'cierre_caja.g.dart';

@Collection()
class CierreCaja {
  Id id = Isar.autoIncrement;

  late String numeroCierre;
  DateTime fechaApertura;
  DateTime? fechaCierre;

  // Montos por método de pago
  double montoEfectivo = 0.0;
  double montoTarjeta = 0.0;
  double montoTransferencia = 0.0;
  double montoCheque = 0.0;
  double montoPagoMovil = 0.0;
  double montoOtros = 0.0;

  // Totales
  double totalIngresos = 0.0;
  double totalEgresos = 0.0;
  double saldoFinal = 0.0;
  double saldoEsperado = 0.0;
  double diferencia = 0.0;

  // Información del cajero
  int usuarioId;
  String? observaciones;

  // Estados
  bool abierto = true;
  bool confirmado = false;
  bool anulado = false;
  String? motivoAnulacion;

  // Auditoría
  DateTime fechaCreacion = DateTime.now();
  DateTime? fechaActualizacion;

  CierreCaja({
    required this.numeroCierre,
    required this.fechaApertura,
    this.fechaCierre,
    this.montoEfectivo = 0.0,
    this.montoTarjeta = 0.0,
    this.montoTransferencia = 0.0,
    this.montoCheque = 0.0,
    this.montoPagoMovil = 0.0,
    this.montoOtros = 0.0,
    this.totalIngresos = 0.0,
    this.totalEgresos = 0.0,
    this.saldoFinal = 0.0,
    this.saldoEsperado = 0.0,
    this.diferencia = 0.0,
    required this.usuarioId,
    this.observaciones,
    this.abierto = true,
    this.confirmado = false,
    this.anulado = false,
    this.motivoAnulacion,
  });

  // Método para obtener el total de ingresos
  double get totalIngresosCalculado {
    return montoEfectivo +
        montoTarjeta +
        montoTransferencia +
        montoCheque +
        montoPagoMovil +
        montoOtros;
  }

  // Método para obtener el saldo final calculado
  double get saldoFinalCalculado {
    return totalIngresosCalculado - totalEgresos;
  }

  // Método para calcular la diferencia
  double get diferenciaCalculada {
    return saldoFinalCalculado - saldoEsperado;
  }

  // Método para obtener el estado del cierre
  String get estadoCierre {
    if (anulado) return 'Anulado';
    if (!abierto) return 'Cerrado';
    return 'Abierto';
  }

  // Método para obtener el color del estado
  String get colorEstado {
    switch (estadoCierre) {
      case 'Abierto':
        return 'green';
      case 'Cerrado':
        return 'blue';
      case 'Anulado':
        return 'red';
      default:
        return 'grey';
    }
  }

  // Método para obtener el color de la diferencia
  String get colorDiferencia {
    if (diferenciaCalculada == 0) return 'green';
    if (diferenciaCalculada > 0) return 'orange';
    return 'red';
  }

  // Método para cerrar el cierre de caja
  void cerrarCaja() {
    abierto = false;
    fechaCierre = DateTime.now();
    fechaActualizacion = DateTime.now();
  }

  // Método para confirmar el cierre
  void confirmarCierre() {
    confirmado = true;
    fechaActualizacion = DateTime.now();
  }

  // Método para anular el cierre
  void anularCierre(String motivo) {
    anulado = true;
    motivoAnulacion = motivo;
    fechaActualizacion = DateTime.now();
  }

  // Método para obtener el total formateado
  String get totalFormateado {
    return '\$${totalIngresosCalculado.toStringAsFixed(2)}';
  }

  // Método para obtener el saldo final formateado
  String get saldoFinalFormateado {
    return '\$${saldoFinalCalculado.toStringAsFixed(2)}';
  }

  // Método para obtener la diferencia formateada
  String get diferenciaFormateada {
    final signo = diferenciaCalculada >= 0 ? '+' : '';
    return '$signo\$${diferenciaCalculada.abs().toStringAsFixed(2)}';
  }

  // Método para obtener el monto por método de pago formateado
  String getMontoFormateado(String metodoPago) {
    double monto = 0.0;
    switch (metodoPago.toLowerCase()) {
      case 'efectivo':
        monto = montoEfectivo;
        break;
      case 'tarjeta':
        monto = montoTarjeta;
        break;
      case 'transferencia':
        monto = montoTransferencia;
        break;
      case 'cheque':
        monto = montoCheque;
        break;
      case 'pago_movil':
        monto = montoPagoMovil;
        break;
      case 'otros':
        monto = montoOtros;
        break;
    }
    return '\$${monto.toStringAsFixed(2)}';
  }

  // Método para obtener el icono del método de pago
  String getIconoMetodoPago(String metodoPago) {
    switch (metodoPago.toLowerCase()) {
      case 'efectivo':
        return 'money';
      case 'tarjeta':
        return 'credit_card';
      case 'transferencia':
        return 'account_balance';
      case 'cheque':
        return 'receipt';
      case 'pago_movil':
        return 'smartphone';
      case 'otros':
        return 'payment';
      default:
        return 'attach_money';
    }
  }

  // Método para obtener el color del método de pago
  String getColorMetodoPago(String metodoPago) {
    switch (metodoPago.toLowerCase()) {
      case 'efectivo':
        return 'green';
      case 'tarjeta':
        return 'blue';
      case 'transferencia':
        return 'purple';
      case 'cheque':
        return 'orange';
      case 'pago_movil':
        return 'teal';
      case 'otros':
        return 'grey';
      default:
        return 'grey';
    }
  }

  // Método para obtener la duración del cierre
  @ignore
  Duration get duracionCierre {
    final fechaFin = fechaCierre ?? DateTime.now();
    return fechaFin.difference(fechaApertura);
  }

  // Método para obtener la duración formateada
  String get duracionFormateada {
    final duracion = duracionCierre;
    final horas = duracion.inHours;
    final minutos = duracion.inMinutes % 60;
    return '${horas}h ${minutos}m';
  }

  // Método para verificar si hay diferencia
  bool get hayDiferencia {
    return diferenciaCalculada != 0;
  }

  // Método para obtener el mensaje de diferencia
  String get mensajeDiferencia {
    if (diferenciaCalculada == 0) {
      return 'Caja balanceada';
    } else if (diferenciaCalculada > 0) {
      return 'Sobrante: $diferenciaFormateada';
    } else {
      return 'Faltante: $diferenciaFormateada';
    }
  }
}
