import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserAvatarPicker extends StatefulWidget {
  final String? avatarUrl;
  final Function(String) onAvatarChanged;
  final Function()? onAvatarRemoved;
  final double size;
  final bool isEditable;

  const UserAvatarPicker({
    super.key,
    this.avatarUrl,
    required this.onAvatarChanged,
    this.onAvatarRemoved,
    this.size = 120,
    this.isEditable = true,
  });

  @override
  State<UserAvatarPicker> createState() => _UserAvatarPickerState();
}

class _UserAvatarPickerState extends State<UserAvatarPicker> {
  final ImagePicker _picker = ImagePicker();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Avatar principal
        GestureDetector(
          onTap: widget.isEditable ? _mostrarOpcionesAvatar : null,
          child: Container(
            width: widget.size,
            height: widget.size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ClipOval(child: _buildAvatarImage()),
          ),
        ),

        if (widget.isEditable) ...[
          const SizedBox(height: 12),

          // Botones de acción
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Botón cambiar avatar
              ElevatedButton.icon(
                onPressed: _isLoading ? null : _seleccionarAvatar,
                icon: const Icon(Icons.camera_alt, size: 16),
                label: const Text('Cambiar'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[600],
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                ),
              ),

              if (widget.avatarUrl != null && widget.avatarUrl!.isNotEmpty) ...[
                const SizedBox(width: 8),

                // Botón eliminar avatar
                ElevatedButton.icon(
                  onPressed: _isLoading ? null : _eliminarAvatar,
                  icon: const Icon(Icons.delete, size: 16),
                  label: const Text('Eliminar'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red[600],
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ],

        if (_isLoading) ...[
          const SizedBox(height: 8),
          const SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
        ],
      ],
    );
  }

  Widget _buildAvatarImage() {
    if (widget.avatarUrl != null && widget.avatarUrl!.isNotEmpty) {
      // Avatar personalizado
      return Image.network(
        widget.avatarUrl!,
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
          return _buildAvatarPorDefecto();
        },
      );
    } else {
      // Avatar por defecto
      return _buildAvatarPorDefecto();
    }
  }

  Widget _buildAvatarPorDefecto() {
    return Container(
      color: Colors.grey[100],
      child: Icon(
        Icons.person,
        size: widget.size * 0.5,
        color: Colors.grey[600],
      ),
    );
  }

  void _mostrarOpcionesAvatar() {
    showModalBottomSheet(
      context: context,
      builder:
          (context) => Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: const Icon(Icons.camera_alt),
                  title: const Text('Tomar foto'),
                  onTap: () {
                    Navigator.pop(context);
                    _seleccionarAvatar(source: ImageSource.camera);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: const Text('Seleccionar de galería'),
                  onTap: () {
                    Navigator.pop(context);
                    _seleccionarAvatar(source: ImageSource.gallery);
                  },
                ),
                if (widget.avatarUrl != null && widget.avatarUrl!.isNotEmpty)
                  ListTile(
                    leading: const Icon(Icons.delete, color: Colors.red),
                    title: const Text(
                      'Eliminar avatar',
                      style: TextStyle(color: Colors.red),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      _eliminarAvatar();
                    },
                  ),
              ],
            ),
          ),
    );
  }

  Future<void> _seleccionarAvatar({ImageSource? source}) async {
    try {
      setState(() {
        _isLoading = true;
      });

      final ImageSource imageSource = source ?? ImageSource.gallery;
      final XFile? imagen = await _picker.pickImage(
        source: imageSource,
        maxWidth: 512,
        maxHeight: 512,
        imageQuality: 85,
      );

      if (imagen != null) {
        // Simular subida de imagen
        await Future.delayed(const Duration(seconds: 1));

        // Generar URL simulada
        final urlAvatar =
            'https://ejemplo.com/avatars/${DateTime.now().millisecondsSinceEpoch}.jpg';

        widget.onAvatarChanged(urlAvatar);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error al seleccionar avatar: $e'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _eliminarAvatar() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Eliminar Avatar'),
            content: const Text(
              '¿Estás seguro de que quieres eliminar tu avatar? '
              'Se usará la imagen por defecto.',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancelar'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  if (widget.onAvatarRemoved != null) {
                    widget.onAvatarRemoved!();
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
