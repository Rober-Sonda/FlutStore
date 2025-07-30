import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfitLossView extends ConsumerStatefulWidget {
  const ProfitLossView({super.key});

  @override
  ConsumerState<ProfitLossView> createState() => _ProfitLossViewState();
}

class _ProfitLossViewState extends ConsumerState<ProfitLossView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ganancias y Pérdidas'),
        backgroundColor: Colors.pink[700],
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Funcionalidad en desarrollo')),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.pink[50],
              border: Border(
                bottom: BorderSide(color: Colors.pink[200]!),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ganancias y Pérdidas',
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Colors.pink[800],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Análisis financiero del negocio',
                        style: TextStyle(
                          color: Colors.pink[700],
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          // Estadísticas
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Row(
              children: [
                Expanded(child: _buildStatCard('Ganancias', '0', Colors.green)),
                const SizedBox(width: 12),
                Expanded(child: _buildStatCard('Pérdidas', '0', Colors.red)),
                const SizedBox(width: 12),
                Expanded(child: _buildStatCard('Neto', '0', Colors.blue)),
              ],
            ),
          ),

          // Contenido
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.trending_up_outlined,
                    size: 64,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Funcionalidad en desarrollo',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Próximamente podrás analizar ganancias y pérdidas',
                    style: TextStyle(color: Colors.grey[500]),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String title, String value, Color color) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(Icons.trending_up, color: color, size: 32),
            const SizedBox(height: 8),
            Text(
              value,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: color,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              title,
              style: TextStyle(color: color.withOpacity(0.7), fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
} 