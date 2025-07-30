import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/cierre_caja.dart';
import '../services/isar_service.dart';

class CashRegisterView extends ConsumerStatefulWidget {
  const CashRegisterView({super.key});

  @override
  ConsumerState<CashRegisterView> createState() => _CashRegisterViewState();
}

class _CashRegisterViewState extends ConsumerState<CashRegisterView> {
  List<CierreCaja> _cierres = [];
  bool _isLoading = true;
  String _filtroSeleccionado = 'Todos';

  @override
  void initState() {
    super.initState();
    _loadCierres();
  }

  Future<void> _loadCierres() async {
    setState(() => _isLoading = true);
    try {
      // TODO: Implementar carga de cierres cuando el modelo esté listo
      await Future.delayed(const Duration(seconds: 1)); // Simulación de carga
      setState(() {
        _cierres = []; // Lista vacía por ahora
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al cargar cierres: $e')),
        );
      }
    }
  }

  List<CierreCaja> get _cierresFiltrados {
    switch (_filtroSeleccionado) {
      case 'Abiertos':
        return _cierres.where((c) => c.abierto).toList();
      case 'Cerrados':
        return _cierres.where((c) => !c.abierto).toList();
      case 'Anulados':
        return _cierres.where((c) => c.anulado).toList();
      default:
        return _cierres;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cierre de Caja'),
        backgroundColor: Colors.blue[700],
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _crearNuevoCierre(),
          ),
        ],
      ),
      body: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              border: Border(
                bottom: BorderSide(color: Colors.blue[200]!),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Cierre de Caja',
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Colors.blue[800],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Control de caja por método de pago',
                        style: TextStyle(
                          color: Colors.blue[700],
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                PopupMenuButton<String>(
                  icon: Icon(Icons.filter_list, color: Colors.blue[700]),
                  onSelected: (value) {
                    setState(() => _filtroSeleccionado = value);
                  },
                  itemBuilder: (context) => [
                    const PopupMenuItem(value: 'Todos', child: Text('Todos')),
                    const PopupMenuItem(value: 'Abiertos', child: Text('Abiertos')),
                    const PopupMenuItem(value: 'Cerrados', child: Text('Cerrados')),
                    const PopupMenuItem(value: 'Anulados', child: Text('Anulados')),
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
                Expanded(child: _buildStatCard('Abiertos', _cierres.where((c) => c.abierto).length, Colors.green)),
                const SizedBox(width: 12),
                Expanded(child: _buildStatCard('Cerrados', _cierres.where((c) => !c.abierto).length, Colors.blue)),
                const SizedBox(width: 12),
                Expanded(child: _buildStatCard('Anulados', _cierres.where((c) => c.anulado).length, Colors.red)),
              ],
            ),
          ),

          // Lista de cierres
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _cierresFiltrados.isEmpty
                    ? _buildEmptyState()
                    : ListView.builder(
                        padding: const EdgeInsets.all(16),
                        itemCount: _cierresFiltrados.length,
                        itemBuilder: (context, index) {
                          return _buildCierreCard(_cierresFiltrados[index]);
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
            Icon(Icons.point_of_sale, color: color, size: 32),
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
            Icons.point_of_sale_outlined,
            size: 64,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 16),
          Text(
            'No hay cierres de caja',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Crea tu primer cierre de caja para empezar',
            style: TextStyle(color: Colors.grey[500]),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: _crearNuevoCierre,
            icon: const Icon(Icons.add),
            label: const Text('Crear Cierre'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue[700],
              foregroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCierreCard(CierreCaja cierre) {
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
                        'Cierre #${cierre.numeroCierre}',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Cajero: Usuario ${cierre.usuarioId}',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: _getColorForEstado(cierre.estadoCierre),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    cierre.estadoCierre,
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
            
            // Montos por método de pago
            Row(
              children: [
                Expanded(
                  child: _buildMetodoPagoCard('Efectivo', cierre.montoEfectivo, Colors.green),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _buildMetodoPagoCard('Tarjeta', cierre.montoTarjeta, Colors.blue),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _buildMetodoPagoCard('Transferencia', cierre.montoTransferencia, Colors.purple),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: _buildMetodoPagoCard('Cheque', cierre.montoCheque, Colors.orange),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _buildMetodoPagoCard('Pago Móvil', cierre.montoPagoMovil, Colors.teal),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _buildMetodoPagoCard('Otros', cierre.montoOtros, Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 16),
            
            // Totales
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total Ingresos',
                          style: TextStyle(color: Colors.blue[700], fontSize: 12),
                        ),
                        Text(
                          cierre.totalFormateado,
                          style: TextStyle(
                            color: Colors.blue[800],
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Saldo Final',
                          style: TextStyle(color: Colors.blue[700], fontSize: 12),
                        ),
                        Text(
                          cierre.saldoFinalFormateado,
                          style: TextStyle(
                            color: Colors.blue[800],
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (cierre.hayDiferencia)
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Diferencia',
                            style: TextStyle(color: Colors.orange[700], fontSize: 12),
                          ),
                          Text(
                            cierre.diferenciaFormateada,
                            style: TextStyle(
                              color: Colors.orange[800],
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            
            // Información adicional
            Row(
              children: [
                Icon(Icons.access_time, size: 16, color: Colors.grey[600]),
                const SizedBox(width: 4),
                Text(
                  'Duración: ${cierre.duracionFormateada}',
                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                ),
                const Spacer(),
                if (cierre.observaciones != null) ...[
                  Icon(Icons.note, size: 16, color: Colors.grey[600]),
                  const SizedBox(width: 4),
                  Text(
                    'Observaciones',
                    style: TextStyle(color: Colors.grey[600], fontSize: 12),
                  ),
                ],
              ],
            ),
            const SizedBox(height: 16),
            
            // Botones de acción
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => _verDetallesCierre(cierre),
                    icon: const Icon(Icons.visibility, size: 16),
                    label: const Text('Ver Detalles'),
                  ),
                ),
                const SizedBox(width: 8),
                if (cierre.abierto) ...[
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () => _cerrarCaja(cierre),
                      icon: const Icon(Icons.close, size: 16),
                      label: const Text('Cerrar'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[700],
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ),
                ] else ...[
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () => _confirmarCierre(cierre),
                      icon: const Icon(Icons.check, size: 16),
                      label: const Text('Confirmar'),
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

  Widget _buildMetodoPagoCard(String metodo, double monto, Color color) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Icon(
            _getIconoMetodoPago(metodo),
            color: color,
            size: 20,
          ),
          const SizedBox(height: 4),
          Text(
            metodo,
            style: TextStyle(color: color, fontSize: 10, fontWeight: FontWeight.bold),
          ),
          Text(
            '\$${monto.toStringAsFixed(2)}',
            style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  IconData _getIconoMetodoPago(String metodo) {
    switch (metodo.toLowerCase()) {
      case 'efectivo':
        return Icons.money;
      case 'tarjeta':
        return Icons.credit_card;
      case 'transferencia':
        return Icons.account_balance;
      case 'cheque':
        return Icons.receipt;
      case 'pago móvil':
        return Icons.smartphone;
      default:
        return Icons.payment;
    }
  }

  Color _getColorForEstado(String estado) {
    switch (estado) {
      case 'Abierto':
        return Colors.green;
      case 'Cerrado':
        return Colors.blue;
      case 'Anulado':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  void _crearNuevoCierre() {
    // TODO: Implementar creación de nuevo cierre
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Funcionalidad en desarrollo')),
    );
  }

  void _verDetallesCierre(CierreCaja cierre) {
    // TODO: Implementar vista de detalles
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Funcionalidad en desarrollo')),
    );
  }

  void _cerrarCaja(CierreCaja cierre) {
    // TODO: Implementar cierre de caja
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Funcionalidad en desarrollo')),
    );
  }

  void _confirmarCierre(CierreCaja cierre) {
    // TODO: Implementar confirmación de cierre
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Funcionalidad en desarrollo')),
    );
  }
} 