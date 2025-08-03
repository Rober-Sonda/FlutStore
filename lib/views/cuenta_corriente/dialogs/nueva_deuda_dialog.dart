import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../models/cuenta_corriente.dart';
import '../../../models/cliente.dart';
import '../../../services/isar_service.dart';

class NuevaDeudaDialog extends ConsumerStatefulWidget {
  const NuevaDeudaDialog({super.key});

  @override
  ConsumerState<NuevaDeudaDialog> createState() => _NuevaDeudaDialogState();
}

class _NuevaDeudaDialogState extends ConsumerState<NuevaDeudaDialog> {
  final _formKey = GlobalKey<FormState>();
  final _montoController = TextEditingController();
  final _observacionesController = TextEditingController();

  List<Cliente> _clientes = [];
  Cliente? _clienteSeleccionado;
  DateTime _fechaVencimiento = DateTime.now().add(const Duration(days: 30));
  int _totalCuotas = 1;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadClientes();
  }

  @override
  void dispose() {
    _montoController.dispose();
    _observacionesController.dispose();
    super.dispose();
  }

  Future<void> _loadClientes() async {
    try {
      final isar = await ref.read(isarServiceProvider).db;
      final clientes = await isar.clientes.getAll([]);
      setState(() => _clientes = clientes.whereType<Cliente>().toList());
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error cargando clientes: $e')),
        );
      }
    }
  }

  Future<void> _crearDeuda() async {
    if (!_formKey.currentState!.validate()) return;
    if (_clienteSeleccionado == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Debes seleccionar un cliente')),
      );
      return;
    }

    final monto = double.parse(_montoController.text);
    if (monto <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('El monto debe ser mayor a 0')),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      final isar = await ref.read(isarServiceProvider).db;

      final cuentaCorriente = CuentaCorriente(
        clienteId: _clienteSeleccionado!.id,
        nombreCliente: _clienteSeleccionado!.nombre,
        montoTotal: monto,
        fechaCreacion: DateTime.now(),
        fechaVencimiento: _fechaVencimiento,
        totalCuotas: _totalCuotas,
        observaciones: _observacionesController.text.isEmpty
            ? null
            : _observacionesController.text,
      );

      await isar.writeTxn(() async {
        await isar.cuentaCorrientes.put(cuentaCorriente);
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Deuda creada exitosamente'),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.of(context).pop(true);
      }
    } catch (e) {
      setState(() => _isLoading = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error creando deuda: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Nueva Deuda',
        style: TextStyle(color: Colors.amber[700], fontWeight: FontWeight.bold),
      ),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Selección de cliente
              DropdownButtonFormField<Cliente>(
                value: _clienteSeleccionado,
                decoration: const InputDecoration(
                  labelText: 'Cliente',
                  border: OutlineInputBorder(),
                ),
                items: _clientes.map((cliente) {
                  return DropdownMenuItem(
                    value: cliente,
                    child: Text(cliente.nombre),
                  );
                }).toList(),
                onChanged: (cliente) {
                  setState(() => _clienteSeleccionado = cliente);
                },
                validator: (value) {
                  if (value == null) {
                    return 'Debes seleccionar un cliente';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Monto de la deuda
              TextFormField(
                controller: _montoController,
                decoration: const InputDecoration(
                  labelText: 'Monto de la deuda',
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
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Fecha de vencimiento
              ListTile(
                title: const Text('Fecha de vencimiento'),
                subtitle: Text(
                  '${_fechaVencimiento.day}/${_fechaVencimiento.month}/${_fechaVencimiento.year}',
                ),
                trailing: const Icon(Icons.calendar_today),
                onTap: () async {
                  final fecha = await showDatePicker(
                    context: context,
                    initialDate: _fechaVencimiento,
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 365)),
                  );
                  if (fecha != null) {
                    setState(() => _fechaVencimiento = fecha);
                  }
                },
              ),
              const SizedBox(height: 16),

              // Número de cuotas
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Número de cuotas',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      initialValue: _totalCuotas.toString(),
                      onChanged: (value) {
                        _totalCuotas = int.tryParse(value) ?? 1;
                      },
                      validator: (value) {
                        final cuotas = int.tryParse(value ?? '');
                        if (cuotas == null || cuotas <= 0) {
                          return 'Número de cuotas inválido';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey[300]!),
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Monto por cuota',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '\$${_calcularMontoPorCuota().toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Observaciones
              TextFormField(
                controller: _observacionesController,
                decoration: const InputDecoration(
                  labelText: 'Observaciones (opcional)',
                  border: OutlineInputBorder(),
                  hintText: 'Motivo de la deuda, condiciones especiales, etc.',
                ),
                maxLines: 3,
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
          onPressed: _isLoading ? null : _crearDeuda,
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
              : const Text('Crear Deuda'),
        ),
      ],
    );
  }

  double _calcularMontoPorCuota() {
    final monto = double.tryParse(_montoController.text) ?? 0.0;
    return monto / _totalCuotas;
  }
} 