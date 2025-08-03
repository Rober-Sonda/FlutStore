import 'package:flutter/material.dart';
import '../../../models/app_theme.dart';
import '../../../models/font_config.dart';
import 'font_config_card.dart';

class FontConfigSection extends StatelessWidget {
  final FontConfig? selectedFontConfig;
  final Function(FontConfig) onFontConfigChanged;

  const FontConfigSection({
    super.key,
    required this.selectedFontConfig,
    required this.onFontConfigChanged,
  });

  @override
  Widget build(BuildContext context) {
    final currentTheme =
        selectedFontConfig != null
            ? AppTheme
                .darkTheme // Usar un tema por defecto para mostrar
            : AppTheme.darkTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Configuración de Fuentes',
          style: TextStyle(
            color: currentTheme.textColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),

        LayoutBuilder(
          builder: (context, constraints) {
            final cardWidth = 320.0;
            final spacing = 16.0;
            final crossAxisCount =
                (constraints.maxWidth / (cardWidth + spacing)).floor();
            final actualCrossAxisCount =
                crossAxisCount > 0 ? crossAxisCount : 1;

            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: actualCrossAxisCount,
                crossAxisSpacing: spacing,
                mainAxisSpacing: spacing,
                childAspectRatio: 1.5,
              ),
              itemCount: FontConfig.availableConfigs.length,
              itemBuilder: (context, index) {
                return FontConfigCard(
                  config: FontConfig.availableConfigs[index],
                  isSelected:
                      selectedFontConfig == FontConfig.availableConfigs[index],
                  onConfigSelected: onFontConfigChanged,
                );
              },
            );
          },
        ),
      ],
    );
  }
}
