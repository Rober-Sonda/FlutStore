import 'package:flutter/material.dart';
import '../../../models/app_theme.dart';
import '../../../models/font_config.dart';

class ActionButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final Color color;
  final AppTheme? theme;
  final FontConfig? fontConfig;

  const ActionButton({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    required this.color,
    this.theme,
    this.fontConfig,
  });

  @override
  Widget build(BuildContext context) {
    final currentTheme = theme ?? AppTheme.darkTheme;
    final currentFontConfig = fontConfig ?? FontConfig.defaultConfig;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: currentTheme.surfaceColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Row(
          children: [
            Icon(icon, size: 20, color: color),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: currentTheme.textColor,
                  fontFamily: currentFontConfig.bodyFont,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: currentTheme.textSecondaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
