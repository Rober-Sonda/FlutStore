import 'package:isar/isar.dart';

part 'proveedor.g.dart';

@Collection()
class Proveedor {
  Id id = Isar.autoIncrement;

  // Información básica
  late String nombre;
  String? razonSocial;
  String? email;
  String? telefono;
  String? whatsapp;
  String? direccion;
  String? cuit;
  String? contacto;
  String? observaciones;

  // Información adicional
  String? sitioWeb;
  String? horarioAtencion;
  String? condicionesPago;
  int? plazoEntrega; // en días
  double? descuento; // porcentaje de descuento

  // Estados
  bool activo = true;
  String estado = 'activo'; // 'activo', 'inactivo', 'suspendido'

  // Categorías de productos
  List<String> categorias = [];

  // Información de contacto adicional
  String? emailAlternativo;
  String? telefonoAlternativo;
  String? personaContacto;
  String? cargoContacto;

  // Auditoría
  DateTime fechaRegistro = DateTime.now();
  DateTime? fechaActualizacion;
  int usuarioId = 1; // Usuario que registró el proveedor

  // Calificaciones
  double calificacion = 0.0;
  int totalCompras = 0;
  double totalComprado = 0.0;

  // Información financiera
  double limiteCredito = 0.0;
  double saldoPendiente = 0.0;
  String? banco;
  String? numeroCuenta;
  String? tipoCuenta;

  Proveedor({
    required this.nombre,
    this.razonSocial,
    this.email,
    this.telefono,
    this.whatsapp,
    this.direccion,
    this.cuit,
    this.contacto,
    this.observaciones,
    this.sitioWeb,
    this.horarioAtencion,
    this.condicionesPago,
    this.plazoEntrega,
    this.descuento,
    this.activo = true,
    this.estado = 'activo',
    this.categorias = const [],
    this.emailAlternativo,
    this.telefonoAlternativo,
    this.personaContacto,
    this.cargoContacto,
    this.usuarioId = 1,
    this.calificacion = 0.0,
    this.totalCompras = 0,
    this.totalComprado = 0.0,
    this.limiteCredito = 0.0,
    this.saldoPendiente = 0.0,
    this.banco,
    this.numeroCuenta,
    this.tipoCuenta,
  });

  // Método para obtener el nombre completo
  String get nombreCompleto {
    if (razonSocial != null && razonSocial!.isNotEmpty) {
      return '$nombre ($razonSocial)';
    }
    return nombre;
  }

  // Método para obtener el contacto principal
  String get contactoPrincipal {
    if (telefono != null && telefono!.isNotEmpty) {
      return telefono!;
    }
    if (whatsapp != null && whatsapp!.isNotEmpty) {
      return whatsapp!;
    }
    if (email != null && email!.isNotEmpty) {
      return email!;
    }
    return 'No disponible';
  }

  // Método para obtener el icono del contacto principal
  String get iconoContactoPrincipal {
    if (telefono != null && telefono!.isNotEmpty) {
      return 'phone';
    }
    if (whatsapp != null && whatsapp!.isNotEmpty) {
      return 'whatsapp';
    }
    if (email != null && email!.isNotEmpty) {
      return 'email';
    }
    return 'contact_support';
  }

  // Método para obtener el estado formateado
  String get estadoFormateado {
    switch (estado) {
      case 'activo':
        return 'Activo';
      case 'inactivo':
        return 'Inactivo';
      case 'suspendido':
        return 'Suspendido';
      default:
        return estado;
    }
  }

  // Método para obtener el color del estado
  String get colorEstado {
    switch (estado) {
      case 'activo':
        return 'green';
      case 'inactivo':
        return 'grey';
      case 'suspendido':
        return 'red';
      default:
        return 'grey';
    }
  }

  // Método para obtener la calificación formateada
  String get calificacionFormateada {
    return '${calificacion.toStringAsFixed(1)}/5.0';
  }

  // Método para obtener el total comprado formateado
  String get totalCompradoFormateado {
    return '\$${totalComprado.toStringAsFixed(2)}';
  }

  // Método para obtener el saldo pendiente formateado
  String get saldoPendienteFormateado {
    return '\$${saldoPendiente.toStringAsFixed(2)}';
  }

  // Método para verificar si tiene descuento
  bool get tieneDescuento {
    return descuento != null && descuento! > 0;
  }

  // Método para obtener el descuento formateado
  String get descuentoFormateado {
    if (tieneDescuento) {
      return '${descuento!.toStringAsFixed(1)}%';
    }
    return 'Sin descuento';
  }

  // Método para verificar si tiene límite de crédito
  bool get tieneLimiteCredito {
    return limiteCredito > 0;
  }

  // Método para obtener el límite de crédito formateado
  String get limiteCreditoFormateado {
    if (tieneLimiteCredito) {
      return '\$${limiteCredito.toStringAsFixed(2)}';
    }
    return 'Sin límite';
  }

  // Método para verificar si está al límite de crédito
  bool get estaAlLimiteCredito {
    return tieneLimiteCredito && saldoPendiente >= limiteCredito;
  }

  // Método para agregar categoría
  void agregarCategoria(String categoria) {
    if (!categorias.contains(categoria)) {
      categorias.add(categoria);
    }
  }

  // Método para remover categoría
  void removerCategoria(String categoria) {
    categorias.remove(categoria);
  }

  // Método para actualizar calificación
  void actualizarCalificacion(double nuevaCalificacion) {
    calificacion = nuevaCalificacion;
    fechaActualizacion = DateTime.now();
  }

  // Método para registrar compra
  void registrarCompra(double monto) {
    totalCompras++;
    totalComprado += monto;
    fechaActualizacion = DateTime.now();
  }

  // Método para registrar pago
  void registrarPago(double monto) {
    saldoPendiente -= monto;
    if (saldoPendiente < 0) saldoPendiente = 0;
    fechaActualizacion = DateTime.now();
  }

  // Método para activar proveedor
  void activarProveedor() {
    activo = true;
    estado = 'activo';
    fechaActualizacion = DateTime.now();
  }

  // Método para desactivar proveedor
  void desactivarProveedor() {
    activo = false;
    estado = 'inactivo';
    fechaActualizacion = DateTime.now();
  }

  // Método para suspender proveedor
  void suspenderProveedor() {
    activo = false;
    estado = 'suspendido';
    fechaActualizacion = DateTime.now();
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Proveedor && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
