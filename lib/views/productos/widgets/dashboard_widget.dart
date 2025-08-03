import 'package:flutter/material.dart';

class DashboardWidget extends StatelessWidget {
  final Map<String, dynamic> inventoryStats;

  const DashboardWidget({
    super.key,
    required this.inventoryStats,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Calcular el número de columnas basado en el ancho disponible
        final cardWidth = 250.0; // Ancho fijo de cada card
        final spacing = 16.0;
        final crossAxisCount = (constraints.maxWidth / (cardWidth + spacing)).floor();
        final actualCrossAxisCount = crossAxisCount > 0 ? crossAxisCount : 1;

        return GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: actualCrossAxisCount,
          crossAxisSpacing: spacing,
          mainAxisSpacing: spacing,
          childAspectRatio: 2.5,
          children: [
            _buildDashboardCard(
              'Total Productos',
              '${inventoryStats['total']}',
              Icons.inventory,
              Colors.blue,
            ),
            _buildDashboardCard(
              'Con Stock',
              '${inventoryStats['withStock']}',
              Icons.check_circle,
              Colors.green,
            ),
            _buildDashboardCard(
              'Stock Bajo',
              '${inventoryStats['lowStock']}',
              Icons.warning,
              Colors.orange,
            ),
            _buildDashboardCard(
              'Sin Stock',
              '${inventoryStats['outOfStock']}',
              Icons.error,
              Colors.red,
            ),
          ],
        );
      },
    );
  }

  Widget _buildDashboardCard(
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Card(
      color: Colors.grey[850],
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: color, size: 24),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                color: color,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
} 