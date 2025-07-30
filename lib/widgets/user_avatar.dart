import 'package:flutter/material.dart';
import 'package:tienda_app/models/usuario.dart';

class UserAvatar extends StatelessWidget {
  final Usuario? usuario;
  final double size;
  final bool showBorder;
  final Color? borderColor;

  const UserAvatar({
    super.key,
    this.usuario,
    this.size = 40,
    this.showBorder = false,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border:
            showBorder
                ? Border.all(color: borderColor ?? Colors.blue[600]!, width: 2)
                : null,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipOval(child: _buildAvatarImage()),
    );
  }

  Widget _buildAvatarImage() {
    if (usuario?.avatarUrl != null && usuario!.avatarUrl!.isNotEmpty) {
      // Avatar personalizado
      return Image.network(
        usuario!.avatarUrl!,
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
      child: Icon(Icons.person, size: size * 0.5, color: Colors.grey[600]),
    );
  }
}
