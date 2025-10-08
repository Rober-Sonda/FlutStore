import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../models/venta.dart';
import '../../../services/isar_service.dart';

class ReturnSaleDialog extends ConsumerStatefulWidget {
  final Venta venta;

  const ReturnSaleDialog({super.key, required this.venta});

  @override
  ConsumerState<ReturnSaleDialog> createState() => _ReturnSaleDialogState();
}

class _ReturnSaleDialogState extends ConsumerState<ReturnSaleDialog> {
  final _formKey = GlobalKey<FormState>();
  final _motivoController = TextEditingController();
  final _observacionesController = TextEditingController();

  String _motivoSeleccionado = 'Producto defectuoso';
  bool _isLoading = false;

  final List<String> _motivosDevolucion = [
    'Producto defectuoso',
    'Producto no solicitado',
    'Error en el pedido',
    'Cambio de opinión',
    'Problema de calidad',
    'Otro',
  ];

  @override
  void dispose() {
    _motivoController.dispose();
    _observacionesController.dispose();
    super.dispose();
  }

  Future<void> _procesarDevolucion() async {
    if (!_formKey.currentState!.validate()) return;

    try {
      setState(() => _isLoading = true);

      final isar = await ref.read(isarServiceProvider).db;

      // Crear la devolución
      final devolucion = widget.venta.crearDevolucion(
        motivo: _motivoSeleccionado,
        usuarioId: 1, // TODO: Obtener ID del usuario actual
        observaciones:
            _observacionesController.text.isEmpty
                ? null
                : _observacionesController.text,
      );

      await isar.writeTxn(() async {
        // Guardar la devolución
        await isar.ventas.put(devolucion);

        // Actualizar la venta original como devuelta
        widget.venta.estado = 'devuelta';
        await isar.ventas.put(widget.venta);
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Devolución procesada exitosamente'),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.of(context).pop(true);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error procesando devolución: $e')),
        );
      }
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          const Icon(Icons.assignment_return, color: Colors.red),
          const SizedBox(width: 8),
          Text(
            'Procesar Devolución',
            style: TextStyle(
              color: Colors.red[700],
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Información de la venta original
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.red[50],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.red[200]!),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Venta Original: ${widget.venta.numeroDocumento}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text('Cliente: ${widget.venta.clienteId}'),
                    Text('Total: ${widget.venta.totalFormateado}'),
                    Text('Fecha: ${widget.venta.fechaFormateada}'),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Motivo de devolución
              DropdownButtonFormField<String>(
                value: _motivoSeleccionado,
                decoration: const InputDecoration(
                  labelText: 'Motivo de Devolución *',
                  border: OutlineInputBorder(),
                ),
                items:
                    _motivosDevolucion
                        .map(
                          (motivo) => DropdownMenuItem(
                            value: motivo,
                            child: Text(motivo),
                          ),
                        )
                        .toList(),
                onChanged: (value) {
                  setState(() => _motivoSeleccionado = value!);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Debe seleccionar un motivo';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Observaciones
              TextFormField(
                controller: _observacionesController,
                decoration: const InputDecoration(
                  labelText: 'Observaciones (opcional)',
                  border: OutlineInputBorder(),
                  hintText: 'Detalles adicionales de la devolución...',
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 16),

              // Advertencia
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.orange[50],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.orange[200]!),
                ),
                child: Row(
                  children: [
                    Icon(Icons.warning, color: Colors.orange[700]),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Esta acción creará un registro de devolución y actualizará el estado de la venta original.',
                        style: TextStyle(
                          color: Colors.orange[700],
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
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
          onPressed: _isLoading ? null : _procesarDevolucion,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
          ),
          child:
              _isLoading
                  ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                  : const Text('Procesar Devolución'),
        ),
      ],
    );
  }
}
