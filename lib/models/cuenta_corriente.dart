import 'package:isar/isar.dart';

part 'cuenta_corriente.g.dart';

@Collection()
class CuentaCorriente {
  Id id = Isar.autoIncrement;

  // Información del cliente
  int clienteId;
  String nombreCliente;

  // Información de la deuda
  double montoTotal;
  double montoPagado;
  double saldoPendiente;

  // Fechas
  DateTime fechaCreacion;
  DateTime fechaVencimiento;
  DateTime? fechaUltimoPago;

  // Estado
  bool activa = true;
  String? observaciones;

  // Cuotas
  int totalCuotas;
  int cuotasPagadas;
  double montoPorCuota;

  // Métodos de pago
  String? metodoPago;
  String? referenciaPago;

  CuentaCorriente({
    required this.clienteId,
    required this.nombreCliente,
    required this.montoTotal,
    this.montoPagado = 0.0,
    required this.fechaCreacion,
    required this.fechaVencimiento,
    this.totalCuotas = 1,
    this.cuotasPagadas = 0,
    this.observaciones,
    this.metodoPago,
    this.referenciaPago,
  }) : saldoPendiente = montoTotal - montoPagado,
       montoPorCuota = montoTotal / totalCuotas;

  // Método para registrar un pago
  void registrarPago(double monto, String? metodoPago, String? referencia) {
    montoPagado += monto;
    saldoPendiente = montoTotal - montoPagado;
    fechaUltimoPago = DateTime.now();
    cuotasPagadas = (montoPagado / montoPorCuota).floor();
    this.metodoPago = metodoPago;
    referenciaPago = referencia;
  }

  // Verificar si está pagada
  bool get estaPagada => saldoPendiente <= 0;

  // Verificar si está vencida
  bool get estaVencida =>
      DateTime.now().isAfter(fechaVencimiento) && !estaPagada;

  // Obtener días de atraso
  int get diasAtraso {
    if (estaPagada) return 0;
    return DateTime.now().difference(fechaVencimiento).inDays;
  }

  // Obtener porcentaje pagado
  double get porcentajePagado => (montoPagado / montoTotal) * 100;

  // Obtener cuotas restantes
  int get cuotasRestantes => totalCuotas - cuotasPagadas;

  // Obtener monto de la próxima cuota
  double get montoProximaCuota {
    if (estaPagada) return 0.0;
    final cuotasRestantes = this.cuotasRestantes;
    if (cuotasRestantes <= 0) return saldoPendiente;
    return montoPorCuota;
  }
}
