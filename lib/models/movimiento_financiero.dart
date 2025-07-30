import 'package:isar/isar.dart';

part 'movimiento_financiero.g.dart';

@Collection()
class MovimientoFinanciero {
  Id id = Isar.autoIncrement;

  late String concepto;
  String? descripcion;
  double monto;
  String tipo; // 'ingreso' o 'gasto'
  String
  categoria; // 'ventas', 'compras', 'gastos_fijos', 'sorteos', 'servicios', 'otros'

  // Información de la transacción
  DateTime fecha;
  String? numeroComprobante;
  String? metodoPago; // 'efectivo', 'tarjeta', 'transferencia', 'cheque'

  // Relaciones
  int? ventaId; // Si está relacionado con una venta
  int? compraId; // Si está relacionado con una compra
  int? sorteoId; // Si está relacionado con un sorteo
  int? gastoFijoId; // Si está relacionado con un gasto fijo
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

  MovimientoFinanciero({
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
    this.sorteoId,
    this.gastoFijoId,
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
      case 'gastos_fijos':
        return 'schedule';
      case 'sorteos':
        return 'card_giftcard';
      case 'servicios':
        return 'build';
      case 'impuestos':
        return 'account_balance';
      case 'salarios':
        return 'people';
      case 'marketing':
        return 'campaign';
      case 'alquiler':
        return 'home';
      case 'utilities':
        return 'lightbulb';
      case 'mantenimiento':
        return 'handyman';
      case 'seguros':
        return 'security';
      case 'intereses':
        return 'trending_up';
      case 'otros':
        return 'more_horiz';
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
      case 'gastos_fijos':
        return 'blue';
      case 'sorteos':
        return 'purple';
      case 'servicios':
        return 'cyan';
      case 'impuestos':
        return 'red';
      case 'salarios':
        return 'pink';
      case 'marketing':
        return 'amber';
      case 'alquiler':
        return 'teal';
      case 'utilities':
        return 'indigo';
      case 'mantenimiento':
        return 'brown';
      case 'seguros':
        return 'deep_purple';
      case 'intereses':
        return 'light_blue';
      case 'otros':
        return 'grey';
      default:
        return 'grey';
    }
  }

  // Método para verificar si es un ingreso
  bool get esIngreso {
    return tipo == 'ingreso';
  }

  // Método para verificar si es un gasto
  bool get esGasto {
    return tipo == 'gasto';
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

  // Método para obtener el tipo formateado
  String get tipoFormateado {
    return tipo == 'ingreso' ? 'Ingreso' : 'Gasto';
  }

  // Método para obtener la categoría formateada
  String get categoriaFormateada {
    switch (categoria.toLowerCase()) {
      case 'ventas':
        return 'Ventas';
      case 'compras':
        return 'Compras';
      case 'gastos_fijos':
        return 'Gastos Fijos';
      case 'sorteos':
        return 'Sorteos';
      case 'servicios':
        return 'Servicios';
      case 'impuestos':
        return 'Impuestos';
      case 'salarios':
        return 'Salarios';
      case 'marketing':
        return 'Marketing';
      case 'alquiler':
        return 'Alquiler';
      case 'utilities':
        return 'Servicios Públicos';
      case 'mantenimiento':
        return 'Mantenimiento';
      case 'seguros':
        return 'Seguros';
      case 'intereses':
        return 'Intereses';
      case 'otros':
        return 'Otros';
      default:
        return categoria;
    }
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

  // Método para verificar si es un gasto de sorteo
  bool get esGastoSorteo {
    return categoria.toLowerCase() == 'sorteos' && esGasto;
  }

  // Método para verificar si es un gasto fijo
  bool get esGastoFijo {
    return categoria.toLowerCase() == 'gastos_fijos' && esGasto;
  }

  // Método para verificar si es una venta
  bool get esVenta {
    return categoria.toLowerCase() == 'ventas' && esIngreso;
  }

  // Método para verificar si es una compra
  bool get esCompra {
    return categoria.toLowerCase() == 'compras' && esGasto;
  }
}
