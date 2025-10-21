import 'package:flutter/material.dart';
import '../../../models/producto.dart';
import '../../../models/proveedor.dart';
import 'package:isar/isar.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers/carrito_provider.dart'; // Nuevo import para provider global

class AgregarAlCarritoDialog extends ConsumerStatefulWidget {
  final Producto producto;

  const AgregarAlCarritoDialog({super.key, required this.producto});

  @override
  ConsumerState<AgregarAlCarritoDialog> createState() => _AgregarAlCarritoDialogState();
}

class _AgregarAlCarritoDialogState extends ConsumerState<AgregarAlCarritoDialog> {
  int cantidad = 1;
  final _cantidadController = TextEditingController(text: '1');
  Proveedor? proveedorSeleccionado;
  List<Proveedor> proveedores = [];
  bool loading = true;

  @override
  void dispose() {
    _cantidadController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _cantidadController.text = cantidad.toString();
    _loadProveedores();
  }

  Future<void> _loadProveedores() async {
    final isar = Isar.getInstance();
    if (isar != null) {
      proveedores = await isar.proveedors.where().findAll();
      if (proveedores.isNotEmpty) {
        proveedorSeleccionado = proveedores.first;
      }
    }
    setState(() {
      loading = false;
    });
  }

  void _agregarAlCarrito() {
    // Usa ref.read para acceder al provider global (corregido)
    final carrito = ref.read(carritoProvider.notifier);
    carrito.agregar({
      'producto': widget.producto,
      'proveedor': proveedorSeleccionado,
      'cantidad': cantidad,
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Producto agregado al carrito (${widget.producto.nombre ?? 'Producto'}) x$cantidad',
        ),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 2),
      ),
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final dialogWidth = screenWidth < 400
        ? screenWidth * 0.98
        : screenWidth < 600
            ? 340.0
            : screenWidth < 900
                ? 400.0
                : 420.0;

    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: (screenWidth - dialogWidth) / 2),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: dialogWidth,
          minWidth: 260,
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: loading
              ? const SizedBox(
                  height: 120,
                  child: Center(child: CircularProgressIndicator()),
                )
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Agregar al carrito',
                      style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      widget.producto.nombre ?? 'Producto sin nombre',
                      style: theme.textTheme.titleMedium,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 16),
                    // Selector de proveedor
                    if (proveedores.isNotEmpty)
                      DropdownButtonFormField<Proveedor>(
                        value: proveedorSeleccionado,
                        decoration: const InputDecoration(
                          labelText: 'Proveedor',
                          border: OutlineInputBorder(),
                          isDense: true,
                        ),
                        items: proveedores
                            .map(
                              (prov) => DropdownMenuItem(
                                value: prov,
                                child: Text(prov.nombre ?? 'Proveedor'),
                              ),
                            )
                            .toList(),
                        onChanged: (prov) => setState(() => proveedorSeleccionado = prov),
                      ),
                    if (proveedores.isEmpty)
                      const Text(
                        'No hay proveedores asociados a este producto.',
                        style: TextStyle(color: Colors.redAccent, fontSize: 13),
                      ),
                    const SizedBox(height: 16),
                    // Selector de cantidad
                    Row(
                      children: [
                        const Text('Cantidad:', style: TextStyle(fontWeight: FontWeight.w500)),
                        const SizedBox(width: 12),
                        IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: cantidad > 1
                              ? () {
                                  setState(() {
                                    cantidad--;
                                    _cantidadController.text = cantidad.toString();
                                  });
                                }
                              : null,
                        ),
                        SizedBox(
                          width: 48,
                          child: TextFormField(
                            controller: _cantidadController,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            decoration: const InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(vertical: 8),
                              border: OutlineInputBorder(),
                            ),
                            inputFormatters: [
                              // Solo permite nÃºmeros positivos
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            onChanged: (val) {
                              final n = int.tryParse(val);
                              if (n != null && n > 0) {
                                setState(() => cantidad = n);
                              } else {
                                // Si el valor es invÃ¡lido, vuelve a poner el valor anterior
                                _cantidadController.text = cantidad.toString();
                              }
                            },
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            setState(() {
                              cantidad++;
                              _cantidadController.text = cantidad.toString();
                            });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('Cancelar'),
                        ),
                        const SizedBox(width: 8),
                        ElevatedButton.icon(
                          onPressed: proveedores.isEmpty ? null : _agregarAlCarrito,
                          icon: const Icon(Icons.add_shopping_cart),
                          label: const Text('Agregar'),
                        ),
                      ],
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
