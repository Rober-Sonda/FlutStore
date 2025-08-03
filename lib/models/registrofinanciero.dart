import 'package:isar/isar.dart';

part 'registrofinanciero.g.dart';

@Collection()
class RegistroFinanciero {
  Id id = Isar.autoIncrement;

  // Información básica
  late String concepto;
  String? descripcion;
  double monto = 0.0;
  String tipo = 'ingreso'; // 'ingreso' o 'egreso'
  String categoria = 'general'; // 'ventas', 'compras', 'gastos', 'servicios', 'otros'
  
  // Fecha y hora
  DateTime fecha = DateTime.now();
  DateTime? fechaVencimiento;
  
  // Información de la transacción
  String? numeroComprobante;
  String? metodoPago; // 'efectivo', 'tarjeta', 'transferencia', 'cheque', 'pago_movil'
  String? banco;
  String? numeroCuenta;
  
  // Relaciones
  int? ventaId;
  int? compraId;
  int? clienteId;
  int? proveedorId;
  int? categoriaId;
  int usuarioId = 1; // Usuario que registró el registro
  
  // Estados
  String estado = 'pendiente'; // 'pendiente', 'confirmado', 'anulado'
  bool esRecurrente = false;
  String? frecuenciaRecurrencia; // 'diario', 'semanal', 'mensual', 'anual'
  
  // Información adicional
  String? observaciones;
  String? adjunto; // URL o ruta del archivo adjunto
  List<String> etiquetas = [];
  
  // Auditoría
  DateTime fechaCreacion = DateTime.now();
  DateTime? fechaActualizacion;
  DateTime? fechaConfirmacion;
  DateTime? fechaAnulacion;
  String? motivoAnulacion;
  int? usuarioAnulacion;

  RegistroFinanciero({
    required this.concepto,
    this.descripcion,
    required this.monto,
    required this.tipo,
    required this.categoria,
    required this.fecha,
    this.fechaVencimiento,
    this.numeroComprobante,
    this.metodoPago,
    this.banco,
    this.numeroCuenta,
    this.ventaId,
    this.compraId,
    this.clienteId,
    this.proveedorId,
    this.categoriaId,
    this.usuarioId = 1,
    this.estado = 'pendiente',
    this.esRecurrente = false,
    this.frecuenciaRecurrencia,
    this.observaciones,
    this.adjunto,
    this.etiquetas = const [],
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
      case 'general':
        return 'attach_money';
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
      case 'general':
        return 'grey';
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

  // Método para obtener el estado formateado
  String get estadoFormateado {
    switch (estado) {
      case 'pendiente':
        return 'Pendiente';
      case 'confirmado':
        return 'Confirmado';
      case 'anulado':
        return 'Anulado';
      default:
        return estado;
    }
  }

  // Método para obtener el color del estado
  String get colorEstado {
    switch (estado) {
      case 'pendiente':
        return 'orange';
      case 'confirmado':
        return 'green';
      case 'anulado':
        return 'red';
      default:
        return 'grey';
    }
  }

  // Método para confirmar el registro
  void confirmarRegistro() {
    estado = 'confirmado';
    fechaConfirmacion = DateTime.now();
    fechaActualizacion = DateTime.now();
  }

  // Método para anular el registro
  void anularRegistro(String motivo, int usuarioId) {
    estado = 'anulado';
    motivoAnulacion = motivo;
    usuarioAnulacion = usuarioId;
    fechaAnulacion = DateTime.now();
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

  // Método para verificar si está vencido
  bool get estaVencido {
    if (fechaVencimiento == null) return false;
    return DateTime.now().isAfter(fechaVencimiento!);
  }

  // Método para verificar si está próximo a vencer (7 días)
  bool get proximoAVencer {
    if (fechaVencimiento == null) return false;
    final sieteDias = DateTime.now().add(const Duration(days: 7));
    return DateTime.now().isBefore(fechaVencimiento!) && 
           fechaVencimiento!.isBefore(sieteDias);
  }

  // Método para agregar etiqueta
  void agregarEtiqueta(String etiqueta) {
    if (!etiquetas.contains(etiqueta)) {
      etiquetas.add(etiqueta);
    }
  }

  // Método para remover etiqueta
  void removerEtiqueta(String etiqueta) {
    etiquetas.remove(etiqueta);
  }
}
