import 'package:flutter/material.dart';
import '../../../models/app_theme.dart';
import '../../../models/font_config.dart';
import 'trend_indicator.dart';

class MetricCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;
  final double trend;
  final AppTheme theme;
  final FontConfig fontConfig;
  final VoidCallback? onTap; // Permite interacción

  const MetricCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
    required this.trend,
    required this.theme,
    required this.fontConfig,
    this.onTap, // Nuevo parámetro
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 120,
      child: Card(
        color: theme.surfaceColor,
        elevation: 2,
        child: InkWell(
          onTap: onTap ?? () {},
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Header con icono y tendencia
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: color.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Icon(icon, color: color, size: 16),
                    ),
                    const Spacer(),
                    if (trend != 0) TrendIndicator(value: trend),
                  ],
                ),
                const SizedBox(height: 4),

                // Valor principal
                SizedBox(
                  height: 32,
                  child: Center(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        value,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: theme.textColor,
                          fontFamily: fontConfig.titleFont,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 4),

                // Título
                SizedBox(
                  height: 18,
                  child: Center(
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 10,
                        color: theme.textSecondaryColor,
                        fontFamily: fontConfig.bodyFont,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Ya está correcto: width y height fijos, layout consistente.
