import 'package:isar/isar.dart';

part 'pago_cuota.g.dart';

@Collection()
class PagoCuota {
  Id id = Isar.autoIncrement;

  // Referencia a la cuenta corriente
  int cuentaCorrienteId;

  // Información del pago
  double monto;
  DateTime fechaPago;
  String metodoPago;
  String? referenciaPago;
  String? observaciones;

  // Información del cliente
  int clienteId;
  String nombreCliente;

  // Estado del pago
  bool registradoEnGanancias = false;

  PagoCuota({
    required this.cuentaCorrienteId,
    required this.monto,
    required this.fechaPago,
    required this.metodoPago,
    this.referenciaPago,
    this.observaciones,
    required this.clienteId,
    required this.nombreCliente,
  });

  // Método para marcar como registrado en ganancias
  void marcarComoRegistradoEnGanancias() {
    registradoEnGanancias = true;
  }

  // Obtener descripción del pago
  String get descripcion => 'Pago de cuota - $nombreCliente';

  // Obtener monto formateado
  String get montoFormateado => '\$${monto.toStringAsFixed(2)}';

  // Obtener fecha formateada
  String get fechaFormateada =>
      '${fechaPago.day}/${fechaPago.month}/${fechaPago.year}';
}
