import 'package:flutter/material.dart';
import '../../../models/app_theme.dart';
import '../../../models/font_config.dart';

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;
  final String subtitle;
  final AppTheme? theme;
  final FontConfig? fontConfig;

  const StatCard({
    super.key,
    required this.title,
    required this.value,
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
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [color.withOpacity(0.1), color.withOpacity(0.05)],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(icon, size: 20, color: color),
                ),
                const Spacer(),
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
            const SizedBox(height: 12),
            Text(
              value,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: currentTheme.textColor,
                fontFamily: currentFontConfig.titleFont,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                color: currentTheme.textSecondaryColor,
                fontFamily: currentFontConfig.bodyFont,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
