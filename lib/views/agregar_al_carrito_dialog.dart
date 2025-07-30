import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tienda_app/models/producto.dart';
import 'package:tienda_app/models/proveedor.dart';
import 'package:tienda_app/services/carrito_compra_service.dart';
import 'package:tienda_app/services/product_service.dart';

class AgregarAlCarritoDialog extends ConsumerStatefulWidget {
  final Producto producto;

  const AgregarAlCarritoDialog({
    super.key,
    required this.producto,
  });

  @override
  ConsumerState<AgregarAlCarritoDialog> createState() => _AgregarAlCarritoDialogState();
}

class _AgregarAlCarritoDialogState extends ConsumerState<AgregarAlCarritoDialog> {
  bool isLoading = true;
  List<Proveedor> proveedores = [];
  Proveedor? proveedorSeleccionado;
  Proveedor? proveedorMasEconomico;
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
      final carritoService = ref.read(carritoCompraServiceProvider);
      final proveedoresData = await carritoService.obtenerProveedoresParaProducto(widget.producto.id);
      final proveedorEconomico = await carritoService.obtenerProveedorMasEconomico(widget.producto.id);
      
      setState(() {
        proveedores = proveedoresData;
        proveedorMasEconomico = proveedorEconomico;
        proveedorSeleccionado = proveedorEconomico ?? (proveedores.isNotEmpty ? proveedores.first : null);
        isLoading = false;
      });
    } catch (e) {
      setState(() => isLoading = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al cargar proveedores: $e')),
        );
      }
    }
  }

  Future<void> _agregarAlCarrito() async {
    if (proveedorSeleccionado == null) {
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
        nombreProducto: widget.producto.nombre,
        productoId: widget.producto.id,
        proveedorId: proveedorSeleccionado!.id,
        nombreProveedor: proveedorSeleccionado!.nombre,
        cantidad: cantidad,
        precioUnitario: widget.producto.precio ?? 0,
        esUrgente: esUrgente,
        notas: _notasController.text.isNotEmpty ? _notasController.text : null,
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
      backgroundColor: Colors.grey[850],
      title: Text(
        'Agregar al Carrito',
        style: const TextStyle(color: Colors.white),
      ),
      content: isLoading
        ? const Center(child: CircularProgressIndicator())
        : SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Información del producto
                Card(
                  color: Colors.grey[800],
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.producto.nombre,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Precio: \$${(widget.producto.precio ?? 0).toStringAsFixed(2)}',
                          style: const TextStyle(color: Colors.green),
                        ),
                        Text(
                          'Stock actual: ${widget.producto.stock ?? 0}',
                          style: const TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Selección de proveedor
                const Text(
                  'Seleccionar Proveedor',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                DropdownButtonFormField<Proveedor>(
                  value: proveedorSeleccionado,
                  style: const TextStyle(color: Colors.white),
                  dropdownColor: Colors.grey[800],
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[800],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  items: proveedores.map((proveedor) {
                    final isEconomico = proveedor.id == proveedorMasEconomico?.id;
                    return DropdownMenuItem(
                      value: proveedor,
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              proveedor.nombre,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                          if (isEconomico)
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Text(
                                'MEJOR PRECIO',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                        ],
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      proveedorSeleccionado = value;
                    });
                  },
                ),
                if (proveedorMasEconomico != null) ...[
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.green),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.info, color: Colors.green, size: 16),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            '${proveedorMasEconomico!.nombre} es el proveedor más económico para este producto',
                            style: const TextStyle(color: Colors.green, fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
                const SizedBox(height: 16),

                // Cantidad
                const Text(
                  'Cantidad',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove, color: Colors.white),
                      onPressed: () {
                        if (cantidad > 1) {
                          setState(() => cantidad--);
                        }
                      },
                    ),
                    Expanded(
                      child: Text(
                        '$cantidad',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add, color: Colors.white),
                      onPressed: () {
                        setState(() => cantidad++);
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Checkbox urgente
                Row(
                  children: [
                    Checkbox(
                      value: esUrgente,
                      onChanged: (value) {
                        setState(() => esUrgente = value ?? false);
                      },
                      fillColor: MaterialStateProperty.resolveWith((states) => Colors.orange),
                    ),
                    const Text(
                      'Pedido urgente',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Notas
                const Text(
                  'Notas (opcional)',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _notasController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Agregar notas...',
                    hintStyle: const TextStyle(color: Colors.white54),
                    filled: true,
                    fillColor: Colors.grey[800],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  maxLines: 2,
                ),
              ],
            ),
          ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancelar', style: TextStyle(color: Colors.white70)),
        ),
        ElevatedButton(
          onPressed: _agregarAlCarrito,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurpleAccent,
            foregroundColor: Colors.white,
          ),
          child: const Text('Agregar al Carrito'),
        ),
      ],
    );
  }
} 