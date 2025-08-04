import 'package:isar/isar.dart';
import 'valor_propiedad_producto.dart';

part 'producto.g.dart';

@Collection()
class Producto {
  Id id = Isar.autoIncrement;

  String? nombre;
  String? codigoBarras; // Código de barras del producto
  String? sku; // SKU del producto
  double? precio;
  double? precioCosto; // Precio de costo para calcular utilidad
  double? utilidad; // Porcentaje de utilidad
  int? stock;
  int? categoriaId;
  List<ValorPropiedadProducto> valoresPropiedades = [];

  // Nuevas propiedades para múltiples imágenes
  List<String> imagenes = [];
  String? imagenPrincipal; // URL de la imagen principal

  // Método para agregar una imagen
  void agregarImagen(String urlImagen) {
    if (!imagenes.contains(urlImagen)) {
      imagenes.add(urlImagen);
      // Si es la primera imagen, establecerla como principal
      imagenPrincipal ??= urlImagen;
    }
  }

  // Método para eliminar una imagen
  void eliminarImagen(String urlImagen) {
    imagenes.remove(urlImagen);
    // Si se elimina la imagen principal, establecer la primera como principal
    if (imagenPrincipal == urlImagen) {
      imagenPrincipal = imagenes.isNotEmpty ? imagenes.first : null;
    }
  }

  // Método para establecer imagen principal
  void establecerImagenPrincipal(String urlImagen) {
    if (imagenes.contains(urlImagen)) {
      imagenPrincipal = urlImagen;
    }
  }

  // Método para obtener la imagen principal o una por defecto
  String? get imagenPrincipalOpcional {
    return imagenPrincipal ?? (imagenes.isNotEmpty ? imagenes.first : null);
  }

  // Método para limpiar todas las imágenes
  void limpiarImagenes() {
    imagenes.clear();
    imagenPrincipal = null;
  }
}
