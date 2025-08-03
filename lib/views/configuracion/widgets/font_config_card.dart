import 'package:flutter/material.dart';
import '../../../models/app_theme.dart';
import '../../../models/font_config.dart';

class FontConfigCard extends StatelessWidget {
  final FontConfig config;
  final bool isSelected;
  final Function(FontConfig) onConfigSelected;

  const FontConfigCard({
    super.key,
    required this.config,
    required this.isSelected,
    required this.onConfigSelected,
  });

  String _getFontConfigName(FontConfig config) {
    if (config == FontConfig.modernConfig) return 'Moderno';
    if (config == FontConfig.elegantConfig) return 'Elegante';
    if (config == FontConfig.techConfig) return 'Tecnológico';
    return 'Predeterminado';
  }

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.darkTheme; // Usar tema por defecto para mostrar

    return Card(
      color: theme.surfaceColor,
      elevation: isSelected ? 4 : 2,
      child: InkWell(
        onTap: () => onConfigSelected(config),
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(
              color: isSelected ? theme.accentColor : Colors.transparent,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      _getFontConfigName(config),
                      style: TextStyle(
                        color: theme.textColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  if (isSelected)
                    Icon(
                      Icons.check_circle,
                      color: theme.accentColor,
                      size: 24,
                    ),
                ],
              ),
              const SizedBox(height: 12),

              // Muestra de fuentes
              Text(
                'Título',
                style: TextStyle(
                  fontFamily: config.titleFont,
                  fontSize: config.titleSize,
                  fontWeight: config.titleWeight,
                  color: theme.textColor,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Subtítulo',
                style: TextStyle(
                  fontFamily: config.subtitleFont,
                  fontSize: config.subtitleSize,
                  fontWeight: config.subtitleWeight,
                  color: theme.textColor,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Texto del cuerpo',
                style: TextStyle(
                  fontFamily: config.bodyFont,
                  fontSize: config.bodySize,
                  fontWeight: config.bodyWeight,
                  color: theme.textSecondaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
