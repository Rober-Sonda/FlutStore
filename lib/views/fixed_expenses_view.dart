import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/gasto_fijo.dart';
import '../services/isar_service.dart';

class FixedExpensesView extends ConsumerStatefulWidget {
  const FixedExpensesView({super.key});

  @override
  ConsumerState<FixedExpensesView> createState() => _FixedExpensesViewState();
}

class _FixedExpensesViewState extends ConsumerState<FixedExpensesView> {
  List<GastoFijo> _gastosFijos = [];
  bool _isLoading = true;
  String _filtroSeleccionado = 'Todos';

  @override
  void initState() {
    super.initState();
    _loadGastosFijos();
  }

  Future<void> _loadGastosFijos() async {
    setState(() => _isLoading = true);
    try {
      // TODO: Implementar carga de gastos fijos cuando el modelo esté listo
      await Future.delayed(const Duration(seconds: 1)); // Simulación de carga
      setState(() {
        _gastosFijos = []; // Lista vacía por ahora
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al cargar gastos fijos: $e')),
        );
      }
    }
  }

  List<GastoFijo> get _gastosFiltrados {
    switch (_filtroSeleccionado) {
      case 'Activos':
        return _gastosFijos.where((g) => g.activo).toList();
      case 'Vencidos':
        return _gastosFijos.where((g) => g.estaVencido).toList();
      case 'Próximos a vencer':
        return _gastosFijos.where((g) => g.estaProximoAVencer).toList();
      case 'Inactivos':
        return _gastosFijos.where((g) => !g.activo).toList();
      default:
        return _gastosFijos;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gastos Fijos'),
        backgroundColor: Colors.teal[700],
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _crearNuevoGastoFijo(),
          ),
        ],
      ),
      body: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.teal[50],
              border: Border(
                bottom: BorderSide(color: Colors.teal[200]!),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Gastos Fijos',
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Colors.teal[800],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Configuración de gastos recurrentes',
                        style: TextStyle(
                          color: Colors.teal[700],
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                PopupMenuButton<String>(
                  icon: Icon(Icons.filter_list, color: Colors.teal[700]),
                  onSelected: (value) {
                    setState(() => _filtroSeleccionado = value);
                  },
                  itemBuilder: (context) => [
                    const PopupMenuItem(value: 'Todos', child: Text('Todos')),
                    const PopupMenuItem(value: 'Activos', child: Text('Activos')),
                    const PopupMenuItem(value: 'Vencidos', child: Text('Vencidos')),
                    const PopupMenuItem(value: 'Próximos a vencer', child: Text('Próximos a vencer')),
                    const PopupMenuItem(value: 'Inactivos', child: Text('Inactivos')),
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
                Expanded(child: _buildStatCard('Activos', _gastosFijos.where((g) => g.activo).length, Colors.green)),
                const SizedBox(width: 12),
                Expanded(child: _buildStatCard('Vencidos', _gastosFijos.where((g) => g.estaVencido).length, Colors.red)),
                const SizedBox(width: 12),
                Expanded(child: _buildStatCard('Próximos', _gastosFijos.where((g) => g.estaProximoAVencer).length, Colors.orange)),
              ],
            ),
          ),

          // Lista de gastos fijos
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _gastosFiltrados.isEmpty
                    ? _buildEmptyState()
                    : ListView.builder(
                        padding: const EdgeInsets.all(16),
                        itemCount: _gastosFiltrados.length,
                        itemBuilder: (context, index) {
                          return _buildGastoFijoCard(_gastosFiltrados[index]);
                        },
                      ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String title, int value, Color color) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(Icons.schedule, color: color, size: 32),
            const SizedBox(height: 8),
            Text(
              value.toString(),
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

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.schedule_outlined,
            size: 64,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 16),
          Text(
            'No hay gastos fijos configurados',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Configura tus gastos recurrentes para empezar',
            style: TextStyle(color: Colors.grey[500]),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: _crearNuevoGastoFijo,
            icon: const Icon(Icons.add),
            label: const Text('Crear Gasto Fijo'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal[700],
              foregroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGastoFijoCard(GastoFijo gasto) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        gasto.nombre,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (gasto.descripcion != null) ...[
                        const SizedBox(height: 4),
                        Text(
                          gasto.descripcion!,
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: _getColorForEstado(gasto.estadoGasto),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    gasto.estadoGasto,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            
            // Información del gasto
            Row(
              children: [
                Expanded(
                  child: _buildGastoInfo('Monto', gasto.montoFormateado, Icons.attach_money),
                ),
                Expanded(
                  child: _buildGastoInfo('Frecuencia', gasto.frecuenciaFormateada, Icons.repeat),
                ),
                Expanded(
                  child: _buildGastoInfo('Categoría', gasto.categoriaFormateada, Icons.category),
                ),
              ],
            ),
            const SizedBox(height: 16),
            
            // Información de vencimiento
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: _getColorForEstado(gasto.estadoGasto).withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: _getColorForEstado(gasto.estadoGasto).withOpacity(0.3)),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.calendar_today,
                    color: _getColorForEstado(gasto.estadoGasto),
                    size: 20,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Próximo Vencimiento',
                          style: TextStyle(color: _getColorForEstado(gasto.estadoGasto), fontSize: 12),
                        ),
                        Text(
                          '${gasto.proximoVencimiento.day}/${gasto.proximoVencimiento.month}/${gasto.proximoVencimiento.year}',
                          style: TextStyle(
                            color: _getColorForEstado(gasto.estadoGasto),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          'Día ${gasto.diaVencimiento} de cada ${gasto.frecuenciaFormateada.toLowerCase()}',
                          style: TextStyle(color: _getColorForEstado(gasto.estadoGasto), fontSize: 11),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: _getColorForEstado(gasto.estadoGasto),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      '${gasto.diasHastaVencimiento} días',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            
            // Información adicional
            if (gasto.proveedor != null || gasto.numeroCuenta != null) ...[
              Row(
                children: [
                  if (gasto.proveedor != null) ...[
                    Expanded(
                      child: _buildGastoInfo('Proveedor', gasto.proveedor!, Icons.business),
                    ),
                  ],
                  if (gasto.numeroCuenta != null) ...[
                    Expanded(
                      child: _buildGastoInfo('Cuenta', gasto.numeroCuenta!, Icons.account_balance),
                    ),
                  ],
                ],
              ),
              const SizedBox(height: 16),
            ],
            
            // Estadísticas de pagos
            Row(
              children: [
                Expanded(
                  child: _buildGastoStat('Promedio Mensual', gasto.promedioMensualFormateado, Icons.trending_up),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildGastoStat('Total Último Año', gasto.totalPagadoUltimoAnoFormateado, Icons.calendar_view_month),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildGastoStat('Próximo Estimado', gasto.proximoMontoEstimadoFormateado, Icons.forward),
                ),
              ],
            ),
            const SizedBox(height: 16),
            
            // Configuración de notificaciones
            if (gasto.notificarVencimiento) ...[
              Row(
                children: [
                  Icon(Icons.notifications, size: 16, color: Colors.blue[600]),
                  const SizedBox(width: 4),
                  Text(
                    'Notificar ${gasto.diasAnticipacionNotificacion} días antes',
                    style: TextStyle(color: Colors.blue[600], fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
            
            // Botones de acción
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => _verDetallesGasto(gasto),
                    icon: const Icon(Icons.visibility, size: 16),
                    label: const Text('Ver Detalles'),
                  ),
                ),
                const SizedBox(width: 8),
                if (gasto.activo) ...[
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () => _registrarPago(gasto),
                      icon: const Icon(Icons.payment, size: 16),
                      label: const Text('Registrar Pago'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal[700],
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ),
                ] else ...[
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () => _activarGasto(gasto),
                      icon: const Icon(Icons.play_arrow, size: 16),
                      label: const Text('Activar'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green[700],
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGastoInfo(String title, String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.teal[50],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.teal[700], size: 20),
          const SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(color: Colors.teal[700], fontSize: 10),
            textAlign: TextAlign.center,
          ),
          Text(
            value,
            style: TextStyle(
              color: Colors.teal[800],
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildGastoStat(String title, String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.grey[700], size: 16),
          const SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(color: Colors.grey[600], fontSize: 9),
            textAlign: TextAlign.center,
          ),
          Text(
            value,
            style: TextStyle(
              color: Colors.grey[800],
              fontWeight: FontWeight.bold,
              fontSize: 11,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Color _getColorForEstado(String estado) {
    switch (estado) {
      case 'Al día':
        return Colors.green;
      case 'Próximo a vencer':
        return Colors.orange;
      case 'Vencido':
        return Colors.red;
      case 'Inactivo':
        return Colors.grey;
      default:
        return Colors.grey;
    }
  }

  void _crearNuevoGastoFijo() {
    // TODO: Implementar creación de nuevo gasto fijo
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Funcionalidad en desarrollo')),
    );
  }

  void _verDetallesGasto(GastoFijo gasto) {
    // TODO: Implementar vista de detalles
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Funcionalidad en desarrollo')),
    );
  }

  void _registrarPago(GastoFijo gasto) {
    // TODO: Implementar registro de pago
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Funcionalidad en desarrollo')),
    );
  }

  void _activarGasto(GastoFijo gasto) {
    // TODO: Implementar activación de gasto
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Funcionalidad en desarrollo')),
    );
  }
} 