import 'package:flutter/material.dart';
import '../../../models/cuenta_corriente.dart';
import '../../../models/cliente.dart';

class CuentaCorrienteCard extends StatelessWidget {
  final CuentaCorriente cuenta;
  final Cliente cliente;
  final VoidCallback onPagoPressed;
  final VoidCallback onDetallesPressed;
  final VoidCallback onEliminarPressed;

  const CuentaCorrienteCard({
    super.key,
    required this.cuenta,
    required this.cliente,
    required this.onPagoPressed,
    required this.onDetallesPressed,
    required this.onEliminarPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header con nombre del cliente y estado
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cuenta.nombreCliente,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        cliente.w ?? 'Sin teléfono',
                        style: TextStyle(color: Colors.grey[600], fontSize: 14),
                      ),
                    ],
                  ),
                ),
                _buildStatusChip(cuenta),
              ],
            ),
            const SizedBox(height: 16),

            // Información de la deuda
            Row(
              children: [
                Expanded(
                  child: _buildInfoItem(
                    'Deuda Total',
                    '\$${cuenta.montoTotal.toStringAsFixed(2)}',
                    Colors.red,
                  ),
                ),
                Expanded(
                  child: _buildInfoItem(
                    'Pagado',
                    '\$${cuenta.montoPagado.toStringAsFixed(2)}',
                    Colors.green,
                  ),
                ),
                Expanded(
                  child: _buildInfoItem(
                    'Pendiente',
                    '\$${cuenta.saldoPendiente.toStringAsFixed(2)}',
                    Colors.orange,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Información de cuotas
            Row(
              children: [
                Expanded(
                  child: _buildInfoItem(
                    'Cuotas',
                    '${cuenta.cuotasPagadas}/${cuenta.totalCuotas}',
                    Colors.blue,
                  ),
                ),
                Expanded(
                  child: _buildInfoItem(
                    'Próxima Cuota',
                    '\$${cuenta.montoProximaCuota.toStringAsFixed(2)}',
                    Colors.purple,
                  ),
                ),
                Expanded(
                  child: _buildInfoItem(
                    'Vencimiento',
                    '${cuenta.fechaVencimiento.day}/${cuenta.fechaVencimiento.month}/${cuenta.fechaVencimiento.year}',
                    cuenta.estaVencida ? Colors.red : Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Barra de progreso
            LinearProgressIndicator(
              value: cuenta.porcentajePagado / 100,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(
                cuenta.estaPagada ? Colors.green : Colors.amber[700]!,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '${cuenta.porcentajePagado.toStringAsFixed(1)}% pagado',
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
            ),
            const SizedBox(height: 16),

            // Botones de acción
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: onPagoPressed,
                    icon: const Icon(Icons.payment),
                    label: const Text('Registrar Pago'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: onDetallesPressed,
                    icon: const Icon(Icons.info),
                    label: const Text('Detalles'),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  onPressed: onEliminarPressed,
                  icon: const Icon(Icons.delete, color: Colors.red),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusChip(CuentaCorriente cuenta) {
    Color color;
    String text;
    IconData icon;

    if (cuenta.estaPagada) {
      color = Colors.green;
      text = 'Pagada';
      icon = Icons.check_circle;
    } else if (cuenta.estaVencida) {
      color = Colors.red;
      text = 'Vencida';
      icon = Icons.warning;
    } else {
      color = Colors.amber;
      text = 'Activa';
      icon = Icons.schedule;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: color),
          const SizedBox(width: 4),
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem(String label, String value, Color color) {
    return Column(
      children: [
        Text(label, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }
} 