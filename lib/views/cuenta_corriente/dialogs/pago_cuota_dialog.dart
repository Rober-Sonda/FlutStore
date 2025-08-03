import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../models/cuenta_corriente.dart';
import '../../../models/pago_cuota.dart';
import '../../../models/ganancia_perdida.dart';
import '../../../services/isar_service.dart';

class PagoCuotaDialog extends ConsumerStatefulWidget {
  final CuentaCorriente cuentaCorriente;

  const PagoCuotaDialog({super.key, required this.cuentaCorriente});

  @override
  ConsumerState<PagoCuotaDialog> createState() => _PagoCuotaDialogState();
}

class _PagoCuotaDialogState extends ConsumerState<PagoCuotaDialog> {
  final _formKey = GlobalKey<FormState>();
  final _montoController = TextEditingController();
  final _observacionesController = TextEditingController();

  String _metodoPago = 'Efectivo';
  String? _referenciaPago;
  bool _registrarEnGanancias = true;
  bool _isLoading = false;

  final List<String> _metodosPago = [
    'Efectivo',
    'Transferencia',
    'Tarjeta de Débito',
    'Tarjeta de Crédito',
    'Cheque',
    'Otro',
  ];

  @override
  void initState() {
    super.initState();
    _montoController.text = widget.cuentaCorriente.montoProximaCuota
        .toStringAsFixed(2);
  }

  @override
  void dispose() {
    _montoController.dispose();
    _observacionesController.dispose();
    super.dispose();
  }

  Future<void> _registrarPago() async {
    if (!_formKey.currentState!.validate()) return;

    final monto = double.parse(_montoController.text);
    if (monto <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('El monto debe ser mayor a 0')),
      );
      return;
    }

    if (monto > widget.cuentaCorriente.saldoPendiente) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('El monto no puede ser mayor al saldo pendiente'),
        ),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      final isar = await ref.read(isarServiceProvider).db;

      await isar.writeTxn(() async {
        // 1. Crear el registro de pago
        final pagoCuota = PagoCuota(
          cuentaCorrienteId: widget.cuentaCorriente.id,
          monto: monto,
          fechaPago: DateTime.now(),
          metodoPago: _metodoPago,
          referenciaPago: _referenciaPago,
          observaciones:
              _observacionesController.text.isEmpty
                  ? null
                  : _observacionesController.text,
          clienteId: widget.cuentaCorriente.clienteId,
          nombreCliente: widget.cuentaCorriente.nombreCliente,
        );

        await isar.pagoCuotas.put(pagoCuota);

        // 2. Actualizar la cuenta corriente
        widget.cuentaCorriente.registrarPago(
          monto,
          _metodoPago,
          _referenciaPago,
        );

        await isar.cuentaCorrientes.put(widget.cuentaCorriente);

        // 3. Registrar en ganancias y pérdidas si está habilitado
        if (_registrarEnGanancias) {
          final ganancia = GananciaPerdida(
            concepto: 'Pago de cuota - ${widget.cuentaCorriente.nombreCliente}',
            descripcion:
                _observacionesController.text.isEmpty
                    ? null
                    : _observacionesController.text,
            monto: monto,
            tipo: 'ganancia',
            categoria: 'Pagos de Cuotas',
            fecha: DateTime.now(),
            numeroComprobante: _referenciaPago,
            clienteId: widget.cuentaCorriente.clienteId,
            observaciones:
                _observacionesController.text.isEmpty
                    ? null
                    : _observacionesController.text,
            usuarioId: 1, // TODO: Obtener ID del usuario actual
          );

          await isar.gananciaPerdidas.put(ganancia);

          // Marcar el pago como registrado en ganancias
          pagoCuota.marcarComoRegistradoEnGanancias();
          await isar.pagoCuotas.put(pagoCuota);
        }
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Pago registrado exitosamente'),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.of(context).pop(true);
      }
    } catch (e) {
      setState(() => _isLoading = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error registrando pago: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Registrar Pago',
        style: TextStyle(color: Colors.amber[700], fontWeight: FontWeight.bold),
      ),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Información del cliente
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.amber[50],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.cuentaCorriente.nombreCliente,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Saldo pendiente: \$${widget.cuentaCorriente.saldoPendiente.toStringAsFixed(2)}',
                      style: TextStyle(color: Colors.grey[600], fontSize: 14),
                    ),
                    Text(
                      'Próxima cuota: \$${widget.cuentaCorriente.montoProximaCuota.toStringAsFixed(2)}',
                      style: TextStyle(color: Colors.grey[600], fontSize: 14),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Monto del pago
              TextFormField(
                controller: _montoController,
                decoration: const InputDecoration(
                  labelText: 'Monto del pago',
                  border: OutlineInputBorder(),
                  prefixText: '\$',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'El monto es requerido';
                  }
                  final monto = double.tryParse(value!);
                  if (monto == null || monto <= 0) {
                    return 'Monto inválido';
                  }
                  if (monto > widget.cuentaCorriente.saldoPendiente) {
                    return 'Monto mayor al saldo pendiente';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Método de pago
              DropdownButtonFormField<String>(
                value: _metodoPago,
                decoration: const InputDecoration(
                  labelText: 'Método de pago',
                  border: OutlineInputBorder(),
                ),
                items: _metodosPago.map((metodo) {
                  return DropdownMenuItem(
                    value: metodo,
                    child: Text(metodo),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() => _metodoPago = value!);
                },
              ),
              const SizedBox(height: 16),

              // Referencia de pago (opcional)
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Referencia de pago (opcional)',
                  border: OutlineInputBorder(),
                  hintText: 'Número de transferencia, cheque, etc.',
                ),
                onChanged: (value) => _referenciaPago = value.isEmpty ? null : value,
              ),
              const SizedBox(height: 16),

              // Observaciones
              TextFormField(
                controller: _observacionesController,
                decoration: const InputDecoration(
                  labelText: 'Observaciones (opcional)',
                  border: OutlineInputBorder(),
                ),
                maxLines: 2,
              ),
              const SizedBox(height: 16),

              // Checkbox para registrar en ganancias
              CheckboxListTile(
                title: const Text('Registrar como ganancia'),
                subtitle: const Text(
                  'Registrar este pago en la sección de ganancias y pérdidas',
                ),
                value: _registrarEnGanancias,
                onChanged: (value) {
                  setState(() => _registrarEnGanancias = value!);
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: _isLoading ? null : () => Navigator.of(context).pop(),
          child: const Text('Cancelar'),
        ),
        ElevatedButton(
          onPressed: _isLoading ? null : _registrarPago,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.amber[700],
            foregroundColor: Colors.white,
          ),
          child: _isLoading
              ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Text('Registrar Pago'),
        ),
      ],
    );
  }
} 