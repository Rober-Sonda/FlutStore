import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tienda_app/models/producto_proveedor.dart';
import 'package:tienda_app/models/proveedor.dart';
import 'package:tienda_app/services/producto_proveedor_service.dart';

class ProveedorSelectorDialog extends ConsumerStatefulWidget {
  final int productoId;
  final String nombreProducto;
  final Function(ProductoProveedor, Proveedor) onProveedorSeleccionado;

  const ProveedorSelectorDialog({
    super.key,
    required this.productoId,
    required this.nombreProducto,
    required this.onProveedorSeleccionado,
  });

  @override
  ConsumerState<ProveedorSelectorDialog> createState() =>
      _ProveedorSelectorDialogState();
}

class _ProveedorSelectorDialogState
    extends ConsumerState<ProveedorSelectorDialog> {
  bool _isLoading = true;
  List<Map<String, dynamic>> _proveedores = [];
  ProductoProveedor? _proveedorSeleccionado;
  Proveedor? _proveedorInfo;

  @override
  void initState() {
    super.initState();
    _cargarProveedores();
  }

  Future<void> _cargarProveedores() async {
    setState(() => _isLoading = true);

    try {
      final productoProveedorService = ref.read(
        productoProveedorServiceProvider,
      );
      final proveedores = await productoProveedorService
          .obtenerProveedoresCompletos(widget.productoId);

      setState(() {
        _proveedores = proveedores;
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al cargar proveedores: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          Icon(Icons.business, color: Colors.blue[700]),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              'Seleccionar Proveedor',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blue[700],
              ),
            ),
          ),
        ],
      ),
      content: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.nombreProducto,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Este producto tiene múltiples proveedores. Selecciona el que prefieras:',
              style: TextStyle(color: Colors.grey[600], fontSize: 14),
            ),
            const SizedBox(height: 16),

            if (_isLoading)
              const Center(child: CircularProgressIndicator())
            else if (_proveedores.isEmpty)
              Center(
                child: Column(
                  children: [
                    Icon(Icons.warning, color: Colors.orange[700], size: 48),
                    const SizedBox(height: 8),
                    Text(
                      'No hay proveedores disponibles',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              )
            else
              Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _proveedores.length,
                  itemBuilder: (context, index) {
                    final proveedor = _proveedores[index];
                    final productoProveedor =
                        proveedor['productoProveedor'] as ProductoProveedor;
                    final proveedorInfo = proveedor['proveedor'] as Proveedor;
                    final estaDisponible = proveedor['estaDisponible'] as bool;
                    final precioFormateado =
                        proveedor['precioFormateado'] as String;
                    final stockFormateado =
                        proveedor['stockFormateado'] as String;

                    return Card(
                      margin: const EdgeInsets.only(bottom: 8),
                      child: RadioListTile<ProductoProveedor>(
                        value: productoProveedor,
                        groupValue: _proveedorSeleccionado,
                        onChanged:
                            estaDisponible
                                ? (value) {
                                  setState(() {
                                    _proveedorSeleccionado = value;
                                    _proveedorInfo = proveedorInfo;
                                  });
                                }
                                : null,
                        title: Row(
                          children: [
                            Expanded(
                              child: Text(
                                proveedorInfo.nombre,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: estaDisponible ? null : Colors.grey,
                                ),
                              ),
                            ),
                            if (productoProveedor.esProveedorPorDefecto)
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.green[100],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  'Por defecto',
                                  style: TextStyle(
                                    color: Colors.green[700],
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                          ],
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Icon(
                                  Icons.attach_money,
                                  size: 16,
                                  color: Colors.green[700],
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  precioFormateado,
                                  style: TextStyle(
                                    color: Colors.green[700],
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Icon(
                                  Icons.inventory,
                                  size: 16,
                                  color: Colors.blue[700],
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  stockFormateado,
                                  style: TextStyle(
                                    color: Colors.blue[700],
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            if (productoProveedor.codigoProveedor != null) ...[
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Icon(
                                    Icons.qr_code,
                                    size: 16,
                                    color: Colors.grey[600],
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    'Código: ${productoProveedor.codigoProveedor}',
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                            if (productoProveedor.observaciones != null) ...[
                              const SizedBox(height: 4),
                              Text(
                                productoProveedor.observaciones!,
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 12,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          ],
                        ),
                        secondary: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color:
                                estaDisponible
                                    ? Colors.green[100]
                                    : Colors.red[100],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            estaDisponible ? 'Disponible' : 'Sin stock',
                            style: TextStyle(
                              color:
                                  estaDisponible
                                      ? Colors.green[700]
                                      : Colors.red[700],
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
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
              _proveedorSeleccionado != null && _proveedorInfo != null
                  ? () {
                    widget.onProveedorSeleccionado(
                      _proveedorSeleccionado!,
                      _proveedorInfo!,
                    );
                    Navigator.of(context).pop();
                  }
                  : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue[700],
            foregroundColor: Colors.white,
          ),
          child: const Text('Seleccionar'),
        ),
      ],
    );
  }
}
