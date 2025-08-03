import 'package:flutter/material.dart';
import '../../../models/app_theme.dart';
import '../../../models/font_config.dart';

class TopProductsList extends StatelessWidget {
  final List<Map<String, dynamic>> topProducts;
  final AppTheme? theme;
  final FontConfig? fontConfig;

  const TopProductsList({
    super.key,
    required this.topProducts,
    this.theme,
    this.fontConfig,
  });

  @override
  Widget build(BuildContext context) {
    if (topProducts.isEmpty) {
      return _buildEmptyCard('No hay productos vendidos');
    }

    final currentTheme = theme ?? AppTheme.darkTheme;
    final currentFontConfig = fontConfig ?? FontConfig.defaultConfig;

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.star, color: currentTheme.accentColor, size: 20),
                const SizedBox(width: 8),
                Text(
                  'Productos Más Vendidos',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: currentTheme.textColor,
                    fontFamily: currentFontConfig.titleFont,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ...topProducts.asMap().entries.map((entry) {
              final index = entry.key;
              final product = entry.value;
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: currentTheme.accentColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          '${index + 1}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            fontFamily: currentFontConfig.captionFont,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product['nombre'],
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: currentTheme.textColor,
                              fontFamily: currentFontConfig.bodyFont,
                            ),
                          ),
                          Text(
                            'Stock: ${product['stock']}',
                            style: TextStyle(
                              fontSize: 12,
                              color: currentTheme.textSecondaryColor,
                              fontFamily: currentFontConfig.captionFont,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: currentTheme.accentColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        '${product['ventas']} ventas',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: currentTheme.accentColor,
                          fontFamily: currentFontConfig.captionFont,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyCard(String message) {
    final currentTheme = theme ?? AppTheme.darkTheme;
    final currentFontConfig = fontConfig ?? FontConfig.defaultConfig;

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Text(
            message,
            style: TextStyle(
              color: currentTheme.textSecondaryColor,
              fontFamily: currentFontConfig.bodyFont,
            ),
          ),
        ),
      ),
    );
  }
}
