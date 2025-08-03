import 'package:flutter/material.dart';
import '../../../models/app_theme.dart';
import '../../../models/font_config.dart';

class SalesChart extends StatelessWidget {
  final List<Map<String, dynamic>> salesData;
  final AppTheme? theme;
  final FontConfig? fontConfig;

  const SalesChart({
    super.key,
    required this.salesData,
    this.theme,
    this.fontConfig,
  });

  @override
  Widget build(BuildContext context) {
    if (salesData.isEmpty) {
      return _buildEmptyCard('No hay datos de ventas disponibles');
    }

    final currentTheme = theme ?? AppTheme.darkTheme;
    final currentFontConfig = fontConfig ?? FontConfig.defaultConfig;
    final maxVentas = salesData
        .map((d) => d['ventas'] as double)
        .reduce((a, b) => a > b ? a : b);
    final maxHeight = 120.0;

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
                Icon(
                  Icons.trending_up,
                  color: currentTheme.accentColor,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  'Ventas del Mes',
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
            SizedBox(
              height: maxHeight + 40,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children:
                    salesData.map((data) {
                      final height =
                          maxVentas > 0
                              ? (data['ventas'] as double) /
                                  maxVentas *
                                  maxHeight
                              : 0.0;
                      return Expanded(
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: currentTheme.accentColor,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                height: height,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '${data['dia']}',
                              style: TextStyle(
                                fontSize: 10,
                                color: currentTheme.textSecondaryColor,
                                fontFamily: currentFontConfig.captionFont,
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
              ),
            ),
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
