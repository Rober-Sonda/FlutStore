import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SweepstakesView extends ConsumerStatefulWidget {
  const SweepstakesView({super.key});

  @override
  ConsumerState<SweepstakesView> createState() => _SweepstakesViewState();
}

class _SweepstakesViewState extends ConsumerState<SweepstakesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sorteos'),
        backgroundColor: Colors.purple[700],
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
              color: Colors.purple[50],
              border: Border(bottom: BorderSide(color: Colors.purple[200]!)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sorteos de Instagram',
                        style: Theme.of(
                          context,
                        ).textTheme.headlineSmall?.copyWith(
                          color: Colors.purple[800],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Gestiona sorteos y promociones',
                        style: TextStyle(
                          color: Colors.purple[700],
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
                Expanded(child: _buildStatCard('Activos', '0', Colors.green)),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildStatCard('Finalizados', '0', Colors.blue),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildStatCard('Participantes', '0', Colors.orange),
                ),
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
                    Icons.card_giftcard_outlined,
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
                    'Próximamente podrás gestionar sorteos de Instagram',
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
            Icon(Icons.card_giftcard, color: color, size: 32),
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
