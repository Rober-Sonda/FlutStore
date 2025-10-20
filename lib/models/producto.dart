import 'package:isar/isar.dart';
import 'valor_propiedad_producto.dart';

part 'producto.g.dart';

@Collection()
class Producto {
  Id id = Isar.autoIncrement;

  String? nombre;
  String? descripcion;
  String? codigoBarras; // Código de barras del producto
  String? sku; // SKU del producto
  double? precio;
  double? precioCosto; // Precio de costo para calcular utilidad
  double? utilidad; // Porcentaje de utilidad
  int? stock;
  int? categoriaId;
  String? categoria;
  String? imagen;
  DateTime? fechaCreacion;
  List<ValorPropiedadProducto> valoresPropiedades = [];

  // Propiedades para múltiples imágenes
  List<String> imagenes = [];

  Producto({
    this.id = Isar.autoIncrement,
    this.nombre,
    this.descripcion,
    this.precio,
    this.stock,
    this.categoria,
    this.imagen,
    this.fechaCreacion,
    this.codigoBarras,
    this.sku,
    this.precioCosto,
    this.utilidad,
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
      'categoria': categoria,
      'imagen': imagen,
      'fechaCreacion': fechaCreacion?.toIso8601String(),
      'codigoBarras': codigoBarras,
      'sku': sku,
      'precioCosto': precioCosto,
      'utilidad': utilidad,
      'imagenes': imagenes,
    };
  }

  factory Producto.fromJson(Map<String, dynamic> json) {
    final producto = Producto(
      id: json['id'] ?? Isar.autoIncrement,
      nombre: json['nombre'],
      descripcion: json['descripcion'],
      precio: json['precio']?.toDouble(),
      stock: json['stock'],
      categoria: json['categoria'],
      imagen: json['imagen'],
      fechaCreacion: json['fechaCreacion'] != null
          ? DateTime.parse(json['fechaCreacion'])
          : null,
      codigoBarras: json['codigoBarras'],
      sku: json['sku'],
      precioCosto: json['precioCosto']?.toDouble(),
      utilidad: json['utilidad']?.toDouble(),
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
    String? categoria,
    String? imagen,
    DateTime? fechaCreacion,
    String? codigoBarras,
    String? sku,
    double? precioCosto,
    double? utilidad,
  }) {
    final nuevoProducto = Producto(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
      descripcion: descripcion ?? this.descripcion,
      precio: precio ?? this.precio,
      stock: stock ?? this.stock,
      categoria: categoria ?? this.categoria,
      imagen: imagen ?? this.imagen,
      fechaCreacion: fechaCreacion ?? this.fechaCreacion,
      codigoBarras: codigoBarras ?? this.codigoBarras,
      sku: sku ?? this.sku,
      precioCosto: precioCosto ?? this.precioCosto,
      utilidad: utilidad ?? this.utilidad,
    );
    nuevoProducto.imagenes.addAll(imagenes);
    return nuevoProducto;
  }

  // Métodos de utilidad para manejo de imágenes
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
}
