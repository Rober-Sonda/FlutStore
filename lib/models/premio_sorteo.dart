import 'package:isar/isar.dart';

part 'premio_sorteo.g.dart';

@embedded
class PremioSorteo {
  int? productoId; // ID del producto seleccionado
  String? nombreProducto; // Nombre del producto (para mostrar)
  int cantidad = 1; // Cantidad del producto
  double valorManual = 0.0; // Valor manual del premio
  String? descripcion; // Descripción adicional del premio

  PremioSorteo({
    this.productoId,
    this.nombreProducto,
    this.cantidad = 1,
    this.valorManual = 0.0,
    this.descripcion,
  });

  // Método para calcular el valor total del premio
  double get valorTotal => valorManual;

  // Método para obtener la descripción del premio
  String get descripcionPremio {
    if (productoId != null && nombreProducto != null) {
      return '$nombreProducto (x$cantidad) - \$${valorManual.toStringAsFixed(2)}';
    }
    return descripcion ?? 'Premio sin especificar';
  }
} 