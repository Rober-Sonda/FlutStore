import 'package:isar/isar.dart';
import 'valor_propiedad_producto.dart';

part 'producto.g.dart';

/// Estados posibles del producto
enum EstadoProducto {
  activo,
  descontinuado,
  agotado,
  estacional,
  oculto,
}

/// Géneros disponibles para productos de ropa
enum GeneroProducto {
  hombre,
  mujer,
  unisex,
  nino,
  nina,
}

/// Temporadas del año
enum TemporadaProducto {
  verano,
  invierno,
  primavera,
  otono,
  todoElAno,
}

@Collection()
class Producto {
  Id id = Isar.autoIncrement;

  // INFORMACIÓN BÁSICA
  String? nombre;
  String? descripcion;
  String? codigoBarras; // Código de barras del producto
  String? sku; // SKU del producto
  double? precio;
  double? precioCosto; // Precio de costo para calcular utilidad
  double? utilidad; // Porcentaje de utilidad
  
  // GESTIÓN DE STOCK AVANZADA
  int? stock;
  int? stockMinimo; // Alerta de stock bajo
  int? stockMaximo; // Control de sobrecarga
  bool disponibleVenta = true; // Flag independiente del stock
  
  // CATEGORIZACIÓN
  int? categoriaId;
  String? categoria;
  String? marca; // Marca del producto
  
  // ESPECÍFICOS DE TIENDA DE ROPA
  @Enumerated(EnumType.name)
  GeneroProducto? genero;
  @Enumerated(EnumType.name)
  TemporadaProducto? temporada;
  @Enumerated(EnumType.name)
  EstadoProducto estado = EstadoProducto.activo;
  
  // CONFIGURACIÓN DEL PRODUCTO
  bool activo = true; // Producto habilitado/deshabilitado
  bool destacado = false; // Producto estrella/destacado
  bool esServicio = false; // Diferencia productos físicos de servicios
  bool aplicaIVA = true; // Control fiscal
  
  // INFORMACIÓN ADICIONAL
  int? pesoGramos; // Para cálculos de envío
  int? garantiaMeses; // Meses de garantía
  String? imagen;
  List<String> imagenes = []; // Múltiples imágenes
  List<ValorPropiedadProducto> valoresPropiedades = [];
  
  // AUDITORÍA Y FECHAS
  DateTime? fechaCreacion;
  DateTime? fechaActualizacion;
  DateTime? fechaUltimaVenta; // Para análisis de rotación
  int? usuarioCreacion;
  int? usuarioActualizacion;

  Producto({
    this.id = Isar.autoIncrement,
    this.nombre,
    this.descripcion,
    this.precio,
    this.stock,
    this.stockMinimo,
    this.stockMaximo,
    this.categoria,
    this.marca,
    this.genero,
    this.temporada,
    this.estado = EstadoProducto.activo,
    this.activo = true,
    this.destacado = false,
    this.esServicio = false,
    this.aplicaIVA = true,
    this.disponibleVenta = true,
    this.pesoGramos,
    this.garantiaMeses,
    this.imagen,
    this.fechaCreacion,
    this.fechaActualizacion,
    this.fechaUltimaVenta,
    this.codigoBarras,
    this.sku,
    this.precioCosto,
    this.utilidad,
    this.usuarioCreacion,
    this.usuarioActualizacion,
  });

  // Método para obtener la imagen principal o una por defecto
  String? get imagenPrincipal {
    return imagenes.isNotEmpty ? imagenes.first : imagen;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre': nombre,
      'descripcion': descripcion,
      'precio': precio,
      'stock': stock,
      'stockMinimo': stockMinimo,
      'stockMaximo': stockMaximo,
      'categoria': categoria,
      'marca': marca,
      'genero': genero?.name,
      'temporada': temporada?.name,
      'estado': estado.name,
      'activo': activo,
      'destacado': destacado,
      'esServicio': esServicio,
      'aplicaIVA': aplicaIVA,
      'disponibleVenta': disponibleVenta,
      'pesoGramos': pesoGramos,
      'garantiaMeses': garantiaMeses,
      'imagen': imagen,
      'imagenes': imagenes,
      'fechaCreacion': fechaCreacion?.toIso8601String(),
      'fechaActualizacion': fechaActualizacion?.toIso8601String(),
      'fechaUltimaVenta': fechaUltimaVenta?.toIso8601String(),
      'codigoBarras': codigoBarras,
      'sku': sku,
      'precioCosto': precioCosto,
      'utilidad': utilidad,
      'usuarioCreacion': usuarioCreacion,
      'usuarioActualizacion': usuarioActualizacion,
    };
  }

  factory Producto.fromJson(Map<String, dynamic> json) {
    final producto = Producto(
      id: json['id'] ?? Isar.autoIncrement,
      nombre: json['nombre'],
      descripcion: json['descripcion'],
      precio: json['precio']?.toDouble(),
      stock: json['stock'],
      stockMinimo: json['stockMinimo'],
      stockMaximo: json['stockMaximo'],
      categoria: json['categoria'],
      marca: json['marca'],
      genero: json['genero'] != null 
          ? GeneroProducto.values.firstWhere((e) => e.name == json['genero'])
          : null,
      temporada: json['temporada'] != null
          ? TemporadaProducto.values.firstWhere((e) => e.name == json['temporada'])
          : null,
      estado: json['estado'] != null
          ? EstadoProducto.values.firstWhere((e) => e.name == json['estado'])
          : EstadoProducto.activo,
      activo: json['activo'] ?? true,
      destacado: json['destacado'] ?? false,
      esServicio: json['esServicio'] ?? false,
      aplicaIVA: json['aplicaIVA'] ?? true,
      disponibleVenta: json['disponibleVenta'] ?? true,
      pesoGramos: json['pesoGramos'],
      garantiaMeses: json['garantiaMeses'],
      imagen: json['imagen'],
      fechaCreacion: json['fechaCreacion'] != null
          ? DateTime.parse(json['fechaCreacion'])
          : null,
      fechaActualizacion: json['fechaActualizacion'] != null
          ? DateTime.parse(json['fechaActualizacion'])
          : null,
      fechaUltimaVenta: json['fechaUltimaVenta'] != null
          ? DateTime.parse(json['fechaUltimaVenta'])
          : null,
      codigoBarras: json['codigoBarras'],
      sku: json['sku'],
      precioCosto: json['precioCosto']?.toDouble(),
      utilidad: json['utilidad']?.toDouble(),
      usuarioCreacion: json['usuarioCreacion'],
      usuarioActualizacion: json['usuarioActualizacion'],
    );
    
    // Agregar imágenes si existen
    if (json['imagenes'] != null) {
      producto.imagenes.addAll(List<String>.from(json['imagenes']));
    }
    
    return producto;
  }

  Producto copyWith({
    int? id,
    String? nombre,
    String? descripcion,
    double? precio,
    int? stock,
    int? stockMinimo,
    int? stockMaximo,
    String? categoria,
    String? marca,
    GeneroProducto? genero,
    TemporadaProducto? temporada,
    EstadoProducto? estado,
    bool? activo,
    bool? destacado,
    bool? esServicio,
    bool? aplicaIVA,
    bool? disponibleVenta,
    int? pesoGramos,
    int? garantiaMeses,
    String? imagen,
    DateTime? fechaCreacion,
    DateTime? fechaActualizacion,
    DateTime? fechaUltimaVenta,
    String? codigoBarras,
    String? sku,
    double? precioCosto,
    double? utilidad,
    int? usuarioCreacion,
    int? usuarioActualizacion,
  }) {
    final nuevoProducto = Producto(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
      descripcion: descripcion ?? this.descripcion,
      precio: precio ?? this.precio,
      stock: stock ?? this.stock,
      stockMinimo: stockMinimo ?? this.stockMinimo,
      stockMaximo: stockMaximo ?? this.stockMaximo,
      categoria: categoria ?? this.categoria,
      marca: marca ?? this.marca,
      genero: genero ?? this.genero,
      temporada: temporada ?? this.temporada,
      estado: estado ?? this.estado,
      activo: activo ?? this.activo,
      destacado: destacado ?? this.destacado,
      esServicio: esServicio ?? this.esServicio,
      aplicaIVA: aplicaIVA ?? this.aplicaIVA,
      disponibleVenta: disponibleVenta ?? this.disponibleVenta,
      pesoGramos: pesoGramos ?? this.pesoGramos,
      garantiaMeses: garantiaMeses ?? this.garantiaMeses,
      imagen: imagen ?? this.imagen,
      fechaCreacion: fechaCreacion ?? this.fechaCreacion,
      fechaActualizacion: fechaActualizacion ?? this.fechaActualizacion,
      fechaUltimaVenta: fechaUltimaVenta ?? this.fechaUltimaVenta,
      codigoBarras: codigoBarras ?? this.codigoBarras,
      sku: sku ?? this.sku,
      precioCosto: precioCosto ?? this.precioCosto,
      utilidad: utilidad ?? this.utilidad,
      usuarioCreacion: usuarioCreacion ?? this.usuarioCreacion,
      usuarioActualizacion: usuarioActualizacion ?? this.usuarioActualizacion,
    );
    nuevoProducto.imagenes.addAll(imagenes);
    return nuevoProducto;
  }

  // MÉTODOS DE UTILIDAD PARA MANEJO DE IMÁGENES
  void agregarImagen(String urlImagen) {
    if (!imagenes.contains(urlImagen)) {
      imagenes.add(urlImagen);
    }
  }

  void eliminarImagen(String urlImagen) {
    imagenes.remove(urlImagen);
  }

  void limpiarImagenes() {
    imagenes.clear();
  }

  // MÉTODOS DE NEGOCIO ESPECÍFICOS PARA TIENDA DE ROPA

  /// Verifica si el producto tiene stock bajo (menor al mínimo)
  @ignore
  bool get tieneStockBajo {
    if (stockMinimo == null || stock == null) return false;
    return stock! <= stockMinimo!;
  }

  /// Verifica si el producto está agotado
  @ignore
  bool get estaAgotado {
    return (stock ?? 0) <= 0;
  }

  /// Verifica si el producto está disponible para venta
  @ignore
  bool get estaDisponible {
    return activo && 
           disponibleVenta && 
           estado == EstadoProducto.activo && 
           !estaAgotado;
  }

  /// Obtiene el porcentaje de stock actual respecto al máximo
  @ignore
  double get porcentajeStock {
    if (stockMaximo == null || stockMaximo == 0) return 0.0;
    return ((stock ?? 0) / stockMaximo!) * 100;
  }

  /// Calcula el margen de ganancia real
  @ignore
  double get margenGanancia {
    if (precio == null || precioCosto == null || precioCosto == 0) return 0.0;
    return ((precio! - precioCosto!) / precioCosto!) * 100;
  }

  /// Obtiene el precio con descuento aplicado
  double precioConDescuento([double descuentoPorcentaje = 0]) {
    if (precio == null) return 0.0;
    return precio! * (1 - descuentoPorcentaje / 100);
  }

  /// Marca el producto como vendido y actualiza la fecha
  void marcarComoVendido() {
    fechaUltimaVenta = DateTime.now();
    fechaActualizacion = DateTime.now();
  }

  /// Actualiza el stock y registra la fecha de modificación
  void actualizarStock(int nuevoStock, [int? usuarioId]) {
    stock = nuevoStock;
    fechaActualizacion = DateTime.now();
    if (usuarioId != null) {
      usuarioActualizacion = usuarioId;
    }
    
    // Actualizar estado según stock
    if (nuevoStock <= 0) {
      estado = EstadoProducto.agotado;
    } else if (estado == EstadoProducto.agotado) {
      estado = EstadoProducto.activo;
    }
  }

  /// Incrementa el stock (por compras o devoluciones)
  void incrementarStock(int cantidad, [int? usuarioId]) {
    actualizarStock((stock ?? 0) + cantidad, usuarioId);
  }

  /// Decrementa el stock (por ventas)
  void decrementarStock(int cantidad, [int? usuarioId]) {
    final nuevoStock = (stock ?? 0) - cantidad;
    actualizarStock(nuevoStock < 0 ? 0 : nuevoStock, usuarioId);
  }

  /// Obtiene la descripción del estado del producto
  @ignore
  String get descripcionEstado {
    if (!activo) return 'Inactivo';
    if (!disponibleVenta) return 'No disponible';
    if (estaAgotado) return 'Agotado';
    if (tieneStockBajo) return 'Stock bajo';
    
    switch (estado) {
      case EstadoProducto.activo:
        return 'Disponible';
      case EstadoProducto.descontinuado:
        return 'Descontinuado';
      case EstadoProducto.agotado:
        return 'Agotado';
      case EstadoProducto.estacional:
        return 'Estacional';
      case EstadoProducto.oculto:
        return 'Oculto';
    }
  }

  /// Obtiene el color que representa el estado del producto
  @ignore
  String get colorEstado {
    if (!estaDisponible) return 'red';
    if (tieneStockBajo) return 'orange';
    if (destacado) return 'gold';
    return 'green';
  }

  /// Verifica si el producto necesita reabastecimiento
  @ignore
  bool get necesitaReabastecimiento {
    return tieneStockBajo || estaAgotado;
  }

  /// Obtiene información resumida del producto para reportes
  @ignore
  Map<String, dynamic> get resumenProducto {
    return {
      'id': id,
      'nombre': nombre,
      'marca': marca,
      'precio': precio,
      'stock': stock,
      'estado': descripcionEstado,
      'disponible': estaDisponible,
      'stockBajo': tieneStockBajo,
      'margenGanancia': '${margenGanancia.toStringAsFixed(2)}%',
      'fechaUltimaVenta': fechaUltimaVenta?.toIso8601String(),
    };
  }
}
