import 'package:flutter/material.dart';

class FiltersAndStatsWidget extends StatelessWidget {
  final String searchQuery;
  final String filterStatus;
  final double totalDeuda;
  final double totalPagado;
  final int totalCuentas;
  final Function(String) onSearchChanged;
  final Function(String) onFilterChanged;
  final VoidCallback? onNuevaDeuda;

  const FiltersAndStatsWidget({
    super.key,
    required this.searchQuery,
    required this.filterStatus,
    required this.totalDeuda,
    required this.totalPagado,
    required this.totalCuentas,
    required this.onSearchChanged,
    required this.onFilterChanged,
    this.onNuevaDeuda,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        border: Border(bottom: BorderSide(color: Colors.grey[700]!)),
      ),
      child: Column(
        children: [
          // Barra de búsqueda y botón de nueva deuda
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Buscar por cliente...',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onChanged: onSearchChanged,
                ),
              ),
              if (onNuevaDeuda != null) ...[
                const SizedBox(width: 8),
                IconButton(
                  onPressed: onNuevaDeuda,
                  icon: const Icon(Icons.add),
                  tooltip: 'Nueva Deuda',
                ),
              ],
            ],
          ),
          const SizedBox(height: 16),

          // Filtros de estado
          Row(
            children: [
              Expanded(
                child: DropdownButtonFormField<String>(
                  value: filterStatus,
                  decoration: const InputDecoration(
                    labelText: 'Filtrar por estado',
                    border: OutlineInputBorder(),
                  ),
                  items: const [
                    DropdownMenuItem(value: 'todas', child: Text('Todas')),
                    DropdownMenuItem(value: 'activas', child: Text('Activas')),
                    DropdownMenuItem(
                      value: 'vencidas',
                      child: Text('Vencidas'),
                    ),
                    DropdownMenuItem(value: 'pagadas', child: Text('Pagadas')),
                  ],
                  onChanged: (value) => onFilterChanged(value!),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Estadísticas
          Row(
            children: [
              Expanded(
                child: _buildStatCard(
                  'Deuda Total',
                  '\$${totalDeuda.toStringAsFixed(2)}',
                  Colors.red,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildStatCard(
                  'Pagado',
                  '\$${totalPagado.toStringAsFixed(2)}',
                  Colors.green,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildStatCard(
                  'Cuentas',
                  totalCuentas.toString(),
                  Colors.blue,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String title, String value, Color color) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.5)),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              color: color,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
