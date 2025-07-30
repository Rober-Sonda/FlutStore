import 'package:isar/isar.dart';

part 'flujo_caja.g.dart';

@Collection()
class FlujoCaja {
  Id id = Isar.autoIncrement;

  late String concepto;
  String? descripcion;
  double monto;
  String tipo; // 'ingreso' o 'egreso'
  String categoria; // 'ventas', 'compras', 'gastos', 'servicios', 'otros'
  
  // Información de la transacción
  DateTime fecha;
  String? numeroComprobante;
  String? metodoPago; // 'efectivo', 'tarjeta', 'transferencia', 'cheque'
  
  // Relaciones
  int? ventaId; // Si está relacionado con una venta
  int? compraId; // Si está relacionado con una compra
  int? clienteId; // Si está relacionado con un cliente
  int? proveedorId; // Si está relacionado con un proveedor
  
  // Información adicional
  String? observaciones;
  bool esRecurrente = false;
  String? frecuenciaRecurrencia; // 'diario', 'semanal', 'mensual', 'anual'
  
  // Estados
  bool confirmado = true;
  bool anulado = false;
  String? motivoAnulacion;
  
  // Auditoría
  int usuarioId; // Usuario que registró la transacción
  DateTime fechaCreacion = DateTime.now();
  DateTime? fechaActualizacion;

  FlujoCaja({
    required this.concepto,
    this.descripcion,
    required this.monto,
    required this.tipo,
    required this.categoria,
    required this.fecha,
    this.numeroComprobante,
    this.metodoPago,
    this.ventaId,
    this.compraId,
    this.clienteId,
    this.proveedorId,
    this.observaciones,
    this.esRecurrente = false,
    this.frecuenciaRecurrencia,
    this.confirmado = true,
    this.anulado = false,
    this.motivoAnulacion,
    required this.usuarioId,
  });

  // Método para obtener el monto formateado
  String get montoFormateado {
    final signo = tipo == 'ingreso' ? '+' : '-';
    return '$signo\$${monto.abs().toStringAsFixed(2)}';
  }

  // Método para obtener el color según el tipo
  String get colorTipo {
    return tipo == 'ingreso' ? 'green' : 'red';
  }

  // Método para obtener el icono según la categoría
  String get iconoCategoria {
    switch (categoria.toLowerCase()) {
      case 'ventas':
        return 'shopping_cart';
      case 'compras':
        return 'shopping_basket';
      case 'gastos':
        return 'money_off';
      case 'servicios':
        return 'build';
      case 'salarios':
        return 'people';
      case 'impuestos':
        return 'account_balance';
      case 'marketing':
        return 'campaign';
      case 'alquiler':
        return 'home';
      case 'utilities':
        return 'lightbulb';
      default:
        return 'attach_money';
    }
  }

  // Método para obtener el color de la categoría
  String get colorCategoria {
    switch (categoria.toLowerCase()) {
      case 'ventas':
        return 'green';
      case 'compras':
        return 'orange';
      case 'gastos':
        return 'red';
      case 'servicios':
        return 'blue';
      case 'salarios':
        return 'purple';
      case 'impuestos':
        return 'brown';
      case 'marketing':
        return 'pink';
      case 'alquiler':
        return 'teal';
      case 'utilities':
        return 'cyan';
      default:
        return 'grey';
    }
  }

  // Método para verificar si es un ingreso
  bool get esIngreso {
    return tipo == 'ingreso';
  }

  // Método para verificar si es un egreso
  bool get esEgreso {
    return tipo == 'egreso';
  }

  // Método para obtener el monto con signo
  double get montoConSigno {
    return esIngreso ? monto : -monto;
  }

  // Método para obtener el estado de la transacción
  String get estadoTransaccion {
    if (anulado) return 'Anulada';
    if (!confirmado) return 'Pendiente';
    return 'Confirmada';
  }

  // Método para obtener el color del estado
  String get colorEstado {
    switch (estadoTransaccion) {
      case 'Confirmada':
        return 'green';
      case 'Pendiente':
        return 'orange';
      case 'Anulada':
        return 'red';
      default:
        return 'grey';
    }
  }

  // Método para anular la transacción
  void anularTransaccion(String motivo) {
    anulado = true;
    motivoAnulacion = motivo;
    fechaActualizacion = DateTime.now();
  }

  // Método para confirmar la transacción
  void confirmarTransaccion() {
    confirmado = true;
    fechaActualizacion = DateTime.now();
  }

  // Método para obtener el método de pago formateado
  String get metodoPagoFormateado {
    switch (metodoPago?.toLowerCase()) {
      case 'efectivo':
        return 'Efectivo';
      case 'tarjeta':
        return 'Tarjeta';
      case 'transferencia':
        return 'Transferencia';
      case 'cheque':
        return 'Cheque';
      case 'pago_movil':
        return 'Pago Móvil';
      default:
        return metodoPago ?? 'No especificado';
    }
  }

  // Método para obtener el icono del método de pago
  String get iconoMetodoPago {
    switch (metodoPago?.toLowerCase()) {
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
      default:
        return 'payment';
    }
  }
} 