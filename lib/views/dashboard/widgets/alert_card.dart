import 'package:flutter/material.dart';
import '../../../models/app_theme.dart';
import '../../../models/font_config.dart';

class AlertCard extends StatelessWidget {
  final String message;
  final IconData icon;
  final Color color;
  final String subtitle;
  final AppTheme? theme;
  final FontConfig? fontConfig;

  const AlertCard({
    super.key,
    required this.message,
    required this.icon,
    required this.color,
    required this.subtitle,
    this.theme,
    this.fontConfig,
  });

  @override
  Widget build(BuildContext context) {
    final currentTheme = theme ?? AppTheme.darkTheme;
    final currentFontConfig = fontConfig ?? FontConfig.defaultConfig;

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: color.withOpacity(0.1),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Row(
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    message,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: currentTheme.textColor,
                      fontFamily: currentFontConfig.bodyFont,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 12,
                      color: currentTheme.textSecondaryColor,
                      fontFamily: currentFontConfig.captionFont,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
