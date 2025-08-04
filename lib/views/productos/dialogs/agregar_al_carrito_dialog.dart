import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tienda_app/models/producto.dart';
import 'package:tienda_app/models/proveedor.dart';
import 'package:tienda_app/models/producto_proveedor.dart';
import 'package:tienda_app/services/carrito_compra_service.dart';
import 'package:tienda_app/services/producto_proveedor_service.dart';
import 'package:tienda_app/widgets/proveedor_selector_dialog.dart';

class AgregarAlCarritoDialog extends ConsumerStatefulWidget {
  final Producto producto;

  const AgregarAlCarritoDialog({super.key, required this.producto});

  @override
  ConsumerState<AgregarAlCarritoDialog> createState() =>
      _AgregarAlCarritoDialogState();
}

class _AgregarAlCarritoDialogState
    extends ConsumerState<AgregarAlCarritoDialog> {
  bool isLoading = true;
  List<Map<String, dynamic>> proveedores = [];
  ProductoProveedor? productoProveedorSeleccionado;
  Proveedor? proveedorSeleccionado;
  int cantidad = 1;
  bool esUrgente = false;
  final TextEditingController _notasController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _cargarProveedores();
  }

  Future<void> _cargarProveedores() async {
    setState(() => isLoading = true);

    try {
      final productoProveedorService = ref.read(
        productoProveedorServiceProvider,
      );
      final proveedoresData = await productoProveedorService
          .obtenerProveedoresCompletos(widget.producto.id);

      setState(() {
        proveedores = proveedoresData;
        isLoading = false;
      });

      // Si hay múltiples proveedores, mostrar el selector
      if (proveedores.length > 1) {
        _mostrarSelectorProveedores();
      } else if (proveedores.isNotEmpty) {
        // Si solo hay un proveedor, seleccionarlo automáticamente
        final proveedor = proveedores.first;
        _seleccionarProveedor(
          proveedor['productoProveedor'] as ProductoProveedor,
          proveedor['proveedor'] as Proveedor,
        );
      }
    } catch (e) {
      setState(() => isLoading = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al cargar proveedores: $e')),
        );
      }
    }
  }

  void _mostrarSelectorProveedores() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder:
          (context) => ProveedorSelectorDialog(
            productoId: widget.producto.id,
            nombreProducto: widget.producto.nombre ?? 'Producto sin nombre',
            onProveedorSeleccionado: _seleccionarProveedor,
          ),
    );
  }

  void _seleccionarProveedor(
    ProductoProveedor productoProveedor,
    Proveedor proveedor,
  ) {
    setState(() {
      productoProveedorSeleccionado = productoProveedor;
      proveedorSeleccionado = proveedor;
    });
  }

  Future<void> _agregarAlCarrito() async {
    if (productoProveedorSeleccionado == null ||
        proveedorSeleccionado == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Debes seleccionar un proveedor'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    try {
      final carritoService = ref.read(carritoCompraServiceProvider);
      await carritoService.agregarAlCarrito(
        nombreProducto: widget.producto.nombre ?? 'Producto sin nombre',
        productoId: widget.producto.id,
        proveedorId: proveedorSeleccionado!.id,
        nombreProveedor: proveedorSeleccionado!.nombre,
        cantidad: cantidad,
        precioUnitario:
            productoProveedorSeleccionado!.precioUnitario ??
            widget.producto.precio ??
            0,
        esUrgente: esUrgente,
        notas: _notasController.text.isNotEmpty ? _notasController.text : null,
        codigoProveedor: productoProveedorSeleccionado!.codigoProveedor,
        stockDisponible: productoProveedorSeleccionado!.stockDisponible,
        observacionesProveedor: productoProveedorSeleccionado!.observaciones,
      );

      if (mounted) {
        Navigator.of(context).pop(true);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Producto agregado al carrito'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error al agregar al carrito: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          Icon(Icons.add_shopping_cart, color: Colors.green[700]),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              'Agregar al Carrito',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.green[700],
              ),
            ),
          ),
        ],
      ),
      content:
          isLoading
              ? const Center(child: CircularProgressIndicator())
              : SizedBox(
                width: double.maxFinite,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Información del producto
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.producto.nombre ?? 'Producto sin nombre',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            if (widget.producto.precio != null)
                              Text(
                                'Precio: \$${widget.producto.precio!.toStringAsFixed(2)}',
                                style: TextStyle(
                                  color: Colors.green[700],
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Información del proveedor seleccionado
                    if (proveedorSeleccionado != null) ...[
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.business, color: Colors.blue[700]),
                                  const SizedBox(width: 8),
                                  Text(
                                    'Proveedor Seleccionado',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue[700],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(
                                proveedorSeleccionado!.nombre,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              if (productoProveedorSeleccionado
                                      ?.precioUnitario !=
                                  null) ...[
                                const SizedBox(height: 4),
                                Text(
                                  'Precio: \$${productoProveedorSeleccionado!.precioUnitario!.toStringAsFixed(2)}',
                                  style: TextStyle(
                                    color: Colors.green[700],
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                              if (productoProveedorSeleccionado
                                      ?.stockDisponible !=
                                  null) ...[
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    Icon(
                                      productoProveedorSeleccionado!
                                              .hayStockSuficiente(cantidad)
                                          ? Icons.check_circle
                                          : Icons.warning,
                                      size: 16,
                                      color:
                                          productoProveedorSeleccionado!
                                                  .hayStockSuficiente(cantidad)
                                              ? Colors.green[700]
                                              : Colors.orange[700],
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      productoProveedorSeleccionado!
                                          .estadoStock,
                                      style: TextStyle(
                                        color:
                                            productoProveedorSeleccionado!
                                                    .hayStockSuficiente(
                                                      cantidad,
                                                    )
                                                ? Colors.green[700]
                                                : Colors.orange[700],
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                              if (proveedores.length > 1) ...[
                                const SizedBox(height: 8),
                                TextButton.icon(
                                  onPressed: _mostrarSelectorProveedores,
                                  icon: const Icon(Icons.swap_horiz),
                                  label: const Text('Cambiar Proveedor'),
                                  style: TextButton.styleFrom(
                                    foregroundColor: Colors.blue[700],
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],

                    // Cantidad
                    Row(
                      children: [
                        const Text('Cantidad:'),
                        const SizedBox(width: 16),
                        IconButton(
                          onPressed:
                              cantidad > 1
                                  ? () => setState(() => cantidad--)
                                  : null,
                          icon: const Icon(Icons.remove),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            cantidad.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () => setState(() => cantidad++),
                          icon: const Icon(Icons.add),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Opciones adicionales
                    Row(
                      children: [
                        Checkbox(
                          value: esUrgente,
                          onChanged:
                              (value) =>
                                  setState(() => esUrgente = value ?? false),
                        ),
                        const Text('Marcar como urgente'),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Notas
                    TextField(
                      controller: _notasController,
                      decoration: const InputDecoration(
                        labelText: 'Notas (opcional)',
                        border: OutlineInputBorder(),
                      ),
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancelar'),
        ),
        ElevatedButton(
          onPressed:
              productoProveedorSeleccionado != null ? _agregarAlCarrito : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green[700],
            foregroundColor: Colors.white,
          ),
          child: const Text('Agregar al Carrito'),
        ),
      ],
    );
  }
}
