import 'package:isar/isar.dart';

part 'carrito_compra.g.dart';

@Collection()
class CarritoCompra {
  Id id = Isar.autoIncrement;

  late String nombreProducto;
  int? productoId;
  int? proveedorId;
  String? nombreProveedor;
  int cantidad = 1;
  double? precioUnitario;
  double? precioTotal;
  DateTime fechaAgregado = DateTime.now();
  bool esUrgente = false;
  String? notas;
  String estado = 'pendiente'; // pendiente, procesado, cancelado

  // Nuevos campos para manejo de múltiples proveedores
  bool proveedorSeleccionado =
      false; // Indica si el usuario seleccionó un proveedor específico
  String? codigoProveedor; // Código del proveedor para este producto
  int?
  stockDisponibleProveedor; // Stock disponible en el proveedor seleccionado
  String? observacionesProveedor; // Observaciones específicas del proveedor

  // Método para calcular el precio total
  void calcularPrecioTotal() {
    if (precioUnitario != null && cantidad > 0) {
      precioTotal = precioUnitario! * cantidad;
    }
  }

  // Método para actualizar la cantidad y recalcular el total
  void actualizarCantidad(int nuevaCantidad) {
    cantidad = nuevaCantidad;
    calcularPrecioTotal();
  }

  // Método para establecer información del proveedor
  void establecerProveedor({
    required int proveedorId,
    required String nombreProveedor,
    double? precioUnitario,
    String? codigoProveedor,
    int? stockDisponible,
    String? observaciones,
  }) {
    this.proveedorId = proveedorId;
    this.nombreProveedor = nombreProveedor;
    this.precioUnitario = precioUnitario ?? this.precioUnitario;
    this.codigoProveedor = codigoProveedor;
    stockDisponibleProveedor = stockDisponible;
    observacionesProveedor = observaciones;
    proveedorSeleccionado = true;
    calcularPrecioTotal();
  }

  // Método para verificar si hay stock suficiente
  bool get hayStockSuficiente {
    if (stockDisponibleProveedor == null) {
      return true; // Si no hay info de stock, asumir que hay
    }
    return stockDisponibleProveedor! >= cantidad;
  }

  // Método para obtener el estado de stock
  String get estadoStock {
    if (stockDisponibleProveedor == null) return 'Stock no disponible';
    if (stockDisponibleProveedor! >= cantidad) return 'Stock suficiente';
    if (stockDisponibleProveedor! > 0) return 'Stock insuficiente';
    return 'Sin stock';
  }

  // Método para obtener el color del estado de stock
  String get colorEstadoStock {
    if (stockDisponibleProveedor == null) return 'grey';
    if (stockDisponibleProveedor! >= cantidad) return 'green';
    if (stockDisponibleProveedor! > 0) return 'orange';
    return 'red';
  }
}
