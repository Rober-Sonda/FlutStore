import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

class ProductImageCarousel extends StatefulWidget {
  final List<String> imagenes;
  final String? imagenPrincipal;
  final Function(String)? onImagenSeleccionada;
  final Function(String)? onImagenEliminada;
  final Function()? onAgregarImagen;
  final bool esEditable;
  final double altura;
  final double ancho;

  const ProductImageCarousel({
    super.key,
    required this.imagenes,
    this.imagenPrincipal,
    this.onImagenSeleccionada,
    this.onImagenEliminada,
    this.onAgregarImagen,
    this.esEditable = false,
    this.altura = 300,
    this.ancho = double.infinity,
  });

  @override
  State<ProductImageCarousel> createState() => _ProductImageCarouselState();
}

class _ProductImageCarouselState extends State<ProductImageCarousel> {
  int _indiceActual = 0;
  late SwiperController _swiperController;

  @override
  void initState() {
    super.initState();
    _swiperController = SwiperController();
    // Establecer el índice inicial basado en la imagen principal
    if (widget.imagenPrincipal != null) {
      final indicePrincipal = widget.imagenes.indexOf(widget.imagenPrincipal!);
      if (indicePrincipal != -1) {
        _indiceActual = indicePrincipal;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.imagenes.isEmpty) {
      return _buildImagenVacia();
    }

    return Column(
      children: [
        // Carrusel principal
        SizedBox(
          height: widget.altura,
          width: widget.ancho,
          child: Swiper(
            controller: _swiperController,
            itemCount: widget.imagenes.length,
            itemBuilder: (context, index) {
              return _buildImagenCarousel(widget.imagenes[index]);
            },
            onIndexChanged: (index) {
              setState(() {
                _indiceActual = index;
              });
              if (widget.onImagenSeleccionada != null) {
                widget.onImagenSeleccionada!(widget.imagenes[index]);
              }
            },
            loop: false,
            autoplay: false,
            pagination: const SwiperPagination(),
            control: const SwiperControl(),
          ),
        ),

        const SizedBox(height: 16),

        // Indicadores y controles
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Indicadores de puntos
            ...widget.imagenes.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => _swiperController.move(entry.key),
                child: Container(
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        _indiceActual == entry.key
                            ? Colors.blue[600]
                            : Colors.grey[300],
                  ),
                ),
              );
            }),

            const SizedBox(width: 16),

            // Contador de imágenes
            Text(
              '${_indiceActual + 1} de ${widget.imagenes.length}',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),

        // Controles adicionales si es editable
        if (widget.esEditable) ...[
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Botón para agregar imagen
              if (widget.onAgregarImagen != null)
                ElevatedButton.icon(
                  onPressed: widget.onAgregarImagen,
                  icon: const Icon(Icons.add_photo_alternate, size: 18),
                  label: const Text('Agregar Imagen'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[600],
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                  ),
                ),

              const SizedBox(width: 8),

              // Botón para eliminar imagen actual
              if (widget.onImagenEliminada != null &&
                  widget.imagenes.isNotEmpty)
                ElevatedButton.icon(
                  onPressed: () {
                    _mostrarDialogoConfirmacion();
                  },
                  icon: const Icon(Icons.delete, size: 18),
                  label: const Text('Eliminar'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red[600],
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ],
    );
  }

  Widget _buildImagenCarousel(String imagen) {
    return Container(
      width: widget.ancho,
      height: widget.altura,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            // Imagen principal
            Positioned.fill(
              child: Image.network(
                imagen,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    color: Colors.grey[200],
                    child: Center(
                      child: CircularProgressIndicator(
                        value:
                            loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null,
                        color: Colors.blue[600],
                      ),
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[200],
                    child: const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.broken_image,
                            size: 48,
                            color: Colors.grey,
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Error al cargar imagen',
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            // Overlay para información adicional
            if (widget.esEditable)
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    'Imagen ${_indiceActual + 1}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildImagenVacia() {
    return Container(
      width: widget.ancho,
      height: widget.altura,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.grey[300]!,
          width: 2,
          style: BorderStyle.solid,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.photo_library, size: 64, color: Colors.grey[400]),
          const SizedBox(height: 16),
          Text(
            'Sin imágenes',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Agrega imágenes para este producto',
            style: TextStyle(color: Colors.grey[500], fontSize: 14),
          ),
          if (widget.esEditable && widget.onAgregarImagen != null) ...[
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: widget.onAgregarImagen,
              icon: const Icon(Icons.add_photo_alternate),
              label: const Text('Agregar Primera Imagen'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[600],
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ],
      ),
    );
  }

  void _mostrarDialogoConfirmacion() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Eliminar Imagen'),
            content: Text(
              '¿Estás seguro de que quieres eliminar esta imagen? '
              'Esta acción no se puede deshacer.',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancelar'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  if (widget.onImagenEliminada != null) {
                    widget.onImagenEliminada!(widget.imagenes[_indiceActual]);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[600],
                  foregroundColor: Colors.white,
                ),
                child: const Text('Eliminar'),
              ),
            ],
          ),
    );
  }
}
