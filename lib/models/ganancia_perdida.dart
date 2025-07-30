import 'package:isar/isar.dart';

part 'ganancia_perdida.g.dart';

@Collection()
class GananciaPerdida {
  Id id = Isar.autoIncrement;

  late String concepto;
  String? descripcion;
  double monto;
  String tipo; // 'ganancia' o 'perdida'
  String categoria; // 'ventas', 'descuentos', 'gastos_operativos', 'impuestos', 'otros'
  
  // Información de la transacción
  DateTime fecha;
  String? numeroComprobante;
  
  // Relaciones
  int? ventaId; // Si está relacionado con una venta
  int? compraId; // Si está relacionado con una compra
  int? ofertaId; // Si está relacionado con una oferta
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

  GananciaPerdida({
    required this.concepto,
    this.descripcion,
    required this.monto,
    required this.tipo,
    required this.categoria,
    required this.fecha,
    this.numeroComprobante,
    this.ventaId,
    this.compraId,
    this.ofertaId,
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
    final signo = tipo == 'ganancia' ? '+' : '-';
    return '$signo\$${monto.abs().toStringAsFixed(2)}';
  }

  // Método para obtener el color según el tipo
  String get colorTipo {
    return tipo == 'ganancia' ? 'green' : 'red';
  }

  // Método para obtener el icono según la categoría
  String get iconoCategoria {
    switch (categoria.toLowerCase()) {
      case 'ventas':
        return 'shopping_cart';
      case 'descuentos':
        return 'local_offer';
      case 'gastos_operativos':
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
      case 'descuentos':
        return 'orange';
      case 'gastos_operativos':
        return 'red';
      case 'impuestos':
        return 'brown';
      case 'salarios':
        return 'purple';
      case 'marketing':
        return 'pink';
      case 'alquiler':
        return 'teal';
      case 'utilities':
        return 'cyan';
      case 'mantenimiento':
        return 'blue';
      case 'seguros':
        return 'indigo';
      case 'intereses':
        return 'amber';
      case 'otros':
        return 'grey';
      default:
        return 'grey';
    }
  }

  // Método para verificar si es una ganancia
  bool get esGanancia {
    return tipo == 'ganancia';
  }

  // Método para verificar si es una pérdida
  bool get esPerdida {
    return tipo == 'perdida';
  }

  // Método para obtener el monto con signo
  double get montoConSigno {
    return esGanancia ? monto : -monto;
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
    return tipo == 'ganancia' ? 'Ganancia' : 'Pérdida';
  }

  // Método para obtener la categoría formateada
  String get categoriaFormateada {
    switch (categoria.toLowerCase()) {
      case 'ventas':
        return 'Ventas';
      case 'descuentos':
        return 'Descuentos';
      case 'gastos_operativos':
        return 'Gastos Operativos';
      case 'impuestos':
        return 'Impuestos';
      case 'salarios':
        return 'Salarios';
      case 'marketing':
        return 'Marketing';
      case 'alquiler':
        return 'Alquiler';
      case 'utilities':
        return 'Servicios';
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

  // Método para calcular el margen de ganancia (si aplica)
  double? calcularMargenGanancia(double costo) {
    if (esGanancia && monto > 0 && costo > 0) {
      return ((monto - costo) / costo) * 100;
    }
    return null;
  }

  // Método para obtener el margen formateado
  String? get margenFormateado {
    // Este método se implementaría cuando se tenga el costo
    return null;
  }
} 