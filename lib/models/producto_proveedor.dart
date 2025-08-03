import 'package:isar/isar.dart';

part 'producto_proveedor.g.dart';

@Collection()
class ProductoProveedor {
  Id id = Isar.autoIncrement;

  int productoId;
  int proveedorId;

  // Información específica del proveedor para este producto
  double? precioUnitario;
  int? stockDisponible;
  String? codigoProveedor; // Código que usa el proveedor para este producto
  bool esProveedorPorDefecto = false; // Indica si es el proveedor principal
  String? observaciones;
  DateTime fechaCreacion = DateTime.now();
  DateTime? fechaActualizacion;

  ProductoProveedor({
    required this.productoId,
    required this.proveedorId,
    this.precioUnitario,
    this.stockDisponible,
    this.codigoProveedor,
    this.esProveedorPorDefecto = false,
    this.observaciones,
  });

  // Método para actualizar la información
  void actualizarInformacion({
    double? precioUnitario,
    int? stockDisponible,
    String? codigoProveedor,
    bool? esProveedorPorDefecto,
    String? observaciones,
  }) {
    this.precioUnitario = precioUnitario ?? this.precioUnitario;
    this.stockDisponible = stockDisponible ?? this.stockDisponible;
    this.codigoProveedor = codigoProveedor ?? this.codigoProveedor;
    this.esProveedorPorDefecto =
        esProveedorPorDefecto ?? this.esProveedorPorDefecto;
    this.observaciones = observaciones ?? this.observaciones;
    fechaActualizacion = DateTime.now();
  }

  // Método para verificar si está disponible
  bool get estaDisponible {
    return stockDisponible != null && stockDisponible! > 0;
  }

  // Método para verificar si hay stock suficiente (para una cantidad específica)
  bool hayStockSuficiente(int cantidad) {
    if (stockDisponible == null) {
      return true; // Si no hay info de stock, asumir que hay
    }
    return stockDisponible! >= cantidad;
  }

  // Método para obtener el estado de stock
  String get estadoStock {
    if (stockDisponible == null) return 'Stock no disponible';
    if (stockDisponible! > 0) return 'Stock disponible';
    return 'Sin stock';
  }

  // Método para obtener el precio formateado
  String get precioFormateado {
    return precioUnitario != null
        ? '\$${precioUnitario!.toStringAsFixed(2)}'
        : 'Precio no disponible';
  }

  // Método para obtener el stock formateado
  String get stockFormateado {
    return stockDisponible != null
        ? stockDisponible.toString()
        : 'Stock no disponible';
  }
}
