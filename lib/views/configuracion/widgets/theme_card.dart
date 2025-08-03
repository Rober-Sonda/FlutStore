import 'package:flutter/material.dart';
import '../../../models/app_theme.dart';

class ThemeCard extends StatelessWidget {
  final AppTheme theme;
  final bool isSelected;
  final Function(AppTheme) onThemeSelected;
  final bool isCustom;

  const ThemeCard({
    super.key,
    required this.theme,
    required this.isSelected,
    required this.onThemeSelected,
    this.isCustom = false,
  });

  Widget _buildColorPreview(Color color, String label, AppTheme currentTheme) {
    return Column(
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: currentTheme.textSecondaryColor.withOpacity(0.3),
            ),
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 10,
            color: currentTheme.textSecondaryColor,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentTheme = theme;

    return Card(
      color: currentTheme.surfaceColor,
      elevation: isSelected ? 4 : 2,
      child: InkWell(
        onTap: () => onThemeSelected(theme),
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(
              color: isSelected ? currentTheme.accentColor : Colors.transparent,
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
                      theme.name,
                      style: TextStyle(
                        color: currentTheme.textColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  if (isSelected)
                    Icon(
                      Icons.check_circle,
                      color: currentTheme.accentColor,
                      size: 24,
                    ),
                  if (isCustom)
                    Icon(
                      Icons.person,
                      color: currentTheme.textSecondaryColor,
                      size: 16,
                    ),
                ],
              ),
              const SizedBox(height: 12),

              // Muestra de colores
              Row(
                children: [
                  _buildColorPreview(
                    theme.primaryColor,
                    'Primario',
                    currentTheme,
                  ),
                  const SizedBox(width: 8),
                  _buildColorPreview(
                    theme.secondaryColor,
                    'Secundario',
                    currentTheme,
                  ),
                  const SizedBox(width: 8),
                  _buildColorPreview(theme.accentColor, 'Acento', currentTheme),
                ],
              ),

              const SizedBox(height: 8),
              Text(
                theme.isDark ? 'Tema Oscuro' : 'Tema Claro',
                style: TextStyle(
                  color: currentTheme.textSecondaryColor,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
