import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class ImagePickerWidget extends StatefulWidget {
  final List<String> imagenesExistentes;
  final Function(String) onImagenAgregada;
  final Function(String)? onImagenEliminada;
  final bool permiteMultiplesImagenes;
  final double alturaPreview;
  final double anchoPreview;

  const ImagePickerWidget({
    super.key,
    required this.imagenesExistentes,
    required this.onImagenAgregada,
    this.onImagenEliminada,
    this.permiteMultiplesImagenes = true,
    this.alturaPreview = 120,
    this.anchoPreview = 120,
  });

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  final ImagePicker _picker = ImagePicker();
  final List<File> _imagenesSeleccionadas = [];
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Título de la sección
        Row(
          children: [
            Icon(Icons.photo_library, color: Colors.blue[600], size: 20),
            const SizedBox(width: 8),
            Text(
              'Imágenes del Producto',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.grey[800],
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),

        // Botones para agregar imágenes
        Row(
          children: [
            Expanded(
              child: ElevatedButton.icon(
                onPressed:
                    _isLoading
                        ? null
                        : () => _seleccionarImagen(ImageSource.gallery),
                icon: const Icon(Icons.photo_library, size: 18),
                label: const Text('Galería'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[600],
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ElevatedButton.icon(
                onPressed:
                    _isLoading
                        ? null
                        : () => _seleccionarImagen(ImageSource.camera),
                icon: const Icon(Icons.camera_alt, size: 18),
                label: const Text('Cámara'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[600],
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
          ],
        ),

        if (_isLoading) ...[
          const SizedBox(height: 16),
          const Center(
            child: Column(
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 8),
                Text('Procesando imagen...'),
              ],
            ),
          ),
        ],

        const SizedBox(height: 16),

        // Preview de imágenes existentes
        if (widget.imagenesExistentes.isNotEmpty) ...[
          Text(
            'Imágenes Actuales',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(height: 8),
          _buildImagenesExistentes(),
          const SizedBox(height: 16),
        ],

        // Preview de nuevas imágenes seleccionadas
        if (_imagenesSeleccionadas.isNotEmpty) ...[
          Text(
            'Nuevas Imágenes',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(height: 8),
          _buildImagenesNuevas(),
        ],
      ],
    );
  }

  Widget _buildImagenesExistentes() {
    return SizedBox(
      height: widget.alturaPreview + 20,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.imagenesExistentes.length,
        itemBuilder: (context, index) {
          final imagen = widget.imagenesExistentes[index];
          return Container(
            margin: const EdgeInsets.only(right: 12),
            child: Stack(
              children: [
                // Imagen cuadrada
                Container(
                  width: widget.anchoPreview,
                  height: widget.alturaPreview,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Center(
                      child: AspectRatio(
                        aspectRatio: 1.0,
                        child: _buildImageWidget(imagen),
                      ),
                    ),
                  ),
                ),

                // Botón eliminar
                if (widget.onImagenEliminada != null)
                  Positioned(
                    top: 4,
                    right: 4,
                    child: GestureDetector(
                      onTap: () => _mostrarDialogoEliminar(imagen),
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color: Colors.red[600],
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildImagenesNuevas() {
    return SizedBox(
      height: widget.alturaPreview + 20,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _imagenesSeleccionadas.length,
        itemBuilder: (context, index) {
          final imagen = _imagenesSeleccionadas[index];
          return Container(
            margin: const EdgeInsets.only(right: 12),
            child: Stack(
              children: [
                // Imagen cuadrada
                Container(
                  width: widget.anchoPreview,
                  height: widget.alturaPreview,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Center(
                      child: AspectRatio(
                        aspectRatio: 1.0,
                        child: Image.file(imagen, fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ),

                // Botón eliminar
                Positioned(
                  top: 4,
                  right: 4,
                  child: GestureDetector(
                    onTap: () => _eliminarImagenNueva(index),
                    child: Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: Colors.red[600],
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<void> _seleccionarImagen(ImageSource source) async {
    try {
      setState(() {
        _isLoading = true;
      });

      final XFile? imagen = await _picker.pickImage(
        source: source,
        maxWidth: 1920,
        maxHeight: 1080,
        imageQuality: 85,
      );

      if (imagen != null) {
        final file = File(imagen.path);

        // Crear directorio para imágenes si no existe
        final appDir = await _getApplicationDocumentsDirectory();
        final imagesDir = Directory('${appDir.path}/product_images');
        if (!await imagesDir.exists()) {
          await imagesDir.create(recursive: true);
        }

        // Generar nombre único para la imagen
        final timestamp = DateTime.now().millisecondsSinceEpoch;
        final extension = imagen.path.split('.').last;
        final fileName = 'product_$timestamp.$extension';
        final targetPath = '${imagesDir.path}/$fileName';

        // Copiar la imagen al directorio de la aplicación
        await file.copy(targetPath);

        // Generar URL local real
        final urlImagen = 'file://$targetPath';

        setState(() {
          _imagenesSeleccionadas.add(file);
        });

        // Notificar al padre sobre la nueva imagen
        print('ImagePickerWidget: Notificando imagen agregada: $urlImagen');
        widget.onImagenAgregada(urlImagen);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error al seleccionar imagen: $e'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _eliminarImagenNueva(int index) {
    setState(() {
      _imagenesSeleccionadas.removeAt(index);
    });
  }

  Widget _buildImageWidget(String imagen) {
    // Verificar si es un archivo local (comienza con 'file://')
    if (imagen.startsWith('file://')) {
      final filePath = imagen.substring(7); // Remover 'file://'
      return Image.file(
        File(filePath),
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            color: Colors.grey[200],
            child: const Center(
              child: Icon(Icons.broken_image, color: Colors.grey),
            ),
          );
        },
      );
    } else {
      // Es una URL de red
      return Image.network(
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
              child: Icon(Icons.broken_image, color: Colors.grey),
            ),
          );
        },
      );
    }
  }

  void _mostrarDialogoEliminar(String imagen) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Eliminar Imagen'),
            content: const Text(
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
                    widget.onImagenEliminada!(imagen);
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

  Future<Directory> _getApplicationDocumentsDirectory() async {
    // Obtener el directorio de documentos de la aplicación
    final appDocDir = await getApplicationDocumentsDirectory();
    return appDocDir;
  }
}
