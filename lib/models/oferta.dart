import 'package:isar/isar.dart';

part 'oferta.g.dart';

@Collection()
class Oferta {
  Id id = Isar.autoIncrement;

  late String nombre;
  String? descripcion;
  int productoId;
  double precioOriginal;
  double precioOferta;
  double porcentajeDescuento;
  
  // Fechas de la oferta
  DateTime fechaInicio;
  DateTime fechaFin;
  bool activa = true;
  
  // Configuración de la oferta
  int? stockDisponible; // Stock específico para la oferta
  int? cantidadMinima; // Cantidad mínima para aplicar la oferta
  int? cantidadMaxima; // Cantidad máxima por cliente
  
  // Información adicional
  String? codigoDescuento;
  bool requiereCodigo = false;
  String? imagenOferta;
  String? condiciones;
  
  // Estadísticas
  int ventasRealizadas = 0;
  double ingresosGenerados = 0.0;
  DateTime fechaCreacion = DateTime.now();
  DateTime? fechaActualizacion;

  Oferta({
    required this.nombre,
    this.descripcion,
    required this.productoId,
    required this.precioOriginal,
    required this.precioOferta,
    required this.porcentajeDescuento,
    required this.fechaInicio,
    required this.fechaFin,
    this.stockDisponible,
    this.cantidadMinima,
    this.cantidadMaxima,
    this.codigoDescuento,
    this.requiereCodigo = false,
    this.imagenOferta,
    this.condiciones,
  });

  // Método para verificar si la oferta está activa
  bool get estaActiva {
    final ahora = DateTime.now();
    return activa && 
           ahora.isAfter(fechaInicio) && 
           ahora.isBefore(fechaFin) &&
           (stockDisponible == null || stockDisponible! > 0);
  }

  // Método para verificar si la oferta ha expirado
  bool get haExpirado {
    return DateTime.now().isAfter(fechaFin);
  }

  // Método para verificar si la oferta está por comenzar
  bool get estaPorComenzar {
    return DateTime.now().isBefore(fechaInicio);
  }

  // Método para obtener el ahorro en pesos
  double get ahorroEnPesos {
    return precioOriginal - precioOferta;
  }

  // Método para obtener el ahorro formateado
  String get ahorroFormateado {
    return '\$${ahorroEnPesos.toStringAsFixed(2)}';
  }

  // Método para obtener el precio de oferta formateado
  String get precioOfertaFormateado {
    return '\$${precioOferta.toStringAsFixed(2)}';
  }

  // Método para obtener el precio original formateado
  String get precioOriginalFormateado {
    return '\$${precioOriginal.toStringAsFixed(2)}';
  }

  // Método para obtener el porcentaje de descuento formateado
  String get porcentajeDescuentoFormateado {
    return '${porcentajeDescuento.toStringAsFixed(0)}%';
  }

  // Método para obtener el estado de la oferta
  String get estadoOferta {
    if (!activa) return 'Inactiva';
    if (haExpirado) return 'Expirada';
    if (estaPorComenzar) return 'Próximamente';
    if (stockDisponible != null && stockDisponible! <= 0) return 'Agotada';
    return 'Activa';
  }

  // Método para obtener el color del estado
  String get colorEstado {
    switch (estadoOferta) {
      case 'Activa':
        return 'green';
      case 'Próximamente':
        return 'blue';
      case 'Expirada':
      case 'Inactiva':
        return 'red';
      case 'Agotada':
        return 'orange';
      default:
        return 'grey';
    }
  }

  // Método para actualizar estadísticas de venta
  void registrarVenta(int cantidad, double precioVenta) {
    ventasRealizadas += cantidad;
    ingresosGenerados += precioVenta * cantidad;
    if (stockDisponible != null) {
      stockDisponible = stockDisponible! - cantidad;
    }
    fechaActualizacion = DateTime.now();
  }

  // Método para verificar si hay stock disponible
  bool get hayStockDisponible {
    return stockDisponible == null || stockDisponible! > 0;
  }

  // Método para obtener días restantes
  int get diasRestantes {
    final ahora = DateTime.now();
    if (ahora.isAfter(fechaFin)) return 0;
    return fechaFin.difference(ahora).inDays;
  }

  // Método para obtener días transcurridos
  int get diasTranscurridos {
    final ahora = DateTime.now();
    if (ahora.isBefore(fechaInicio)) return 0;
    return ahora.difference(fechaInicio).inDays;
  }

  // Método para obtener el progreso de la oferta (0.0 a 1.0)
  double get progresoOferta {
    final totalDias = fechaFin.difference(fechaInicio).inDays;
    if (totalDias <= 0) return 0.0;
    
    final diasTranscurridos = this.diasTranscurridos;
    if (diasTranscurridos <= 0) return 0.0;
    if (diasTranscurridos >= totalDias) return 1.0;
    
    return diasTranscurridos / totalDias;
  }
} 