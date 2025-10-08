import 'package:flutter/material.dart';
import '../../../models/app_theme.dart';
import '../../../models/font_config.dart';

class DashboardSection extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<Widget> children;
  final VoidCallback? onTap;
  final AppTheme theme;
  final FontConfig fontConfig;

  const DashboardSection({
    super.key,
    required this.title,
    required this.subtitle,
    required this.children,
    this.onTap,
    required this.theme,
    required this.fontConfig,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // Cambia el color de fondo para que coincida con el dashboard principal
      color: theme.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header de la sección
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: theme.textColor,
                        fontFamily: fontConfig.titleFont,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 14,
                        color: theme.textSecondaryColor,
                        fontFamily: fontConfig.bodyFont,
                      ),
                    ),
                  ],
                ),
              ),
              if (onTap != null) ...[
                Icon(Icons.info_outline, color: theme.accentColor, size: 20),
                const SizedBox(width: 8),
                Text(
                  'Ver detalles',
                  style: TextStyle(
                    fontSize: 12,
                    color: theme.accentColor,
                    fontFamily: fontConfig.bodyFont,
                  ),
                ),
              ],
            ],
          ),
          const SizedBox(height: 16),

          // Contenido de la sección
          ...children,
        ],
      ),
    );
  }
}
