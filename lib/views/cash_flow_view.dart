import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/flujo_caja.dart';

class CashFlowView extends ConsumerStatefulWidget {
  const CashFlowView({super.key});

  @override
  ConsumerState<CashFlowView> createState() => _CashFlowViewState();
}

class _CashFlowViewState extends ConsumerState<CashFlowView> {
  String _filtroSeleccionado = 'Todos';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flujo de Caja'),
        backgroundColor: Colors.green[700],
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
              color: Colors.green[50],
              border: Border(
                bottom: BorderSide(color: Colors.green[200]!),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Flujo de Caja',
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Colors.green[800],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Control de ingresos y egresos',
                        style: TextStyle(
                          color: Colors.green[700],
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                PopupMenuButton<String>(
                  icon: Icon(Icons.filter_list, color: Colors.green[700]),
                  onSelected: (value) {
                    setState(() => _filtroSeleccionado = value);
                  },
                  itemBuilder: (context) => [
                    const PopupMenuItem(value: 'Todos', child: Text('Todos')),
                    const PopupMenuItem(value: 'Ingresos', child: Text('Ingresos')),
                    const PopupMenuItem(value: 'Egresos', child: Text('Egresos')),
                  ],
                ),
              ],
            ),
          ),
          
          // Estadísticas
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Row(
              children: [
                Expanded(child: _buildStatCard('Ingresos', '0', Colors.green)),
                const SizedBox(width: 12),
                Expanded(child: _buildStatCard('Egresos', '0', Colors.red)),
                const SizedBox(width: 12),
                Expanded(child: _buildStatCard('Balance', '0', Colors.blue)),
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
                    Icons.account_balance_outlined,
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
                    'Próximamente podrás gestionar el flujo de caja',
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
            Icon(Icons.account_balance, color: color, size: 32),
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