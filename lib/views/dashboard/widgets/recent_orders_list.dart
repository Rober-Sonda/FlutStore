import 'package:flutter/material.dart';
import '../../../models/app_theme.dart';
import '../../../models/font_config.dart';

class RecentOrdersList extends StatelessWidget {
  final List<Map<String, dynamic>> recentOrders;
  final AppTheme? theme;
  final FontConfig? fontConfig;

  const RecentOrdersList({
    super.key,
    required this.recentOrders,
    this.theme,
    this.fontConfig,
  });

  @override
  Widget build(BuildContext context) {
    if (recentOrders.isEmpty) {
      return _buildEmptyCard('No hay pedidos recientes');
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
                Icon(Icons.receipt, color: currentTheme.accentColor, size: 20),
                const SizedBox(width: 8),
                Text(
                  'Pedidos Recientes',
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
            ...recentOrders.map((order) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: currentTheme.accentColor.withOpacity(
                        0.2,
                      ),
                      child: Icon(
                        Icons.shopping_bag,
                        size: 16,
                        color: currentTheme.accentColor,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            order['cliente'],
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: currentTheme.textColor,
                              fontFamily: currentFontConfig.bodyFont,
                            ),
                          ),
                          Text(
                            '\$${order['total'].toStringAsFixed(2)}',
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
                        color: _getStatusColor(
                          order['estado'],
                        ).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        order['estado'],
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: _getStatusColor(order['estado']),
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

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'completado':
        return Colors.green;
      case 'pendiente':
        return Colors.orange;
      case 'cancelado':
        return Colors.red;
      default:
        return Colors.grey;
    }
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
