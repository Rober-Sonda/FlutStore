import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../models/pedido_proveedor.dart';
import '../../../models/proveedor.dart';
import '../../../models/producto.dart';
import '../../../services/pedido_compra_service.dart';
import '../../../services/isar_service.dart';
import '../../../widgets/permission_widget.dart';

class ConvertirPedidoCompraView extends ConsumerStatefulWidget {
  final PedidoProveedor pedido;
  final Proveedor proveedor;

  const ConvertirPedidoCompraView({
    super.key,
    required this.pedido,
    required this.proveedor,
  });

  @override
  ConsumerState<ConvertirPedidoCompraView> createState() => _ConvertirPedidoCompraViewState();
}

class _ConvertirPedidoCompraViewState extends ConsumerState<ConvertirPedidoCompraView> {
  final Map<int, TextEditingController> _precioControllers = {};
  final Map<int, Producto> _productos = {};
  bool _isLoading = true;
  bool _isConverting = false;

  @override
  void initState() {
    super.initState();
    _loadProductos();
  }

  @override
  void dispose() {
    for (final controller in _precioControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  Future<void> _loadProductos() async {
    try {
      final isar = await ref.read(isarServiceProvider).db;

      for (final item in widget.pedido.items) {
        final producto = await isar.productos.get(item.productoId);
        if (producto != null) {
          _productos[item.productoId] = producto;
          _precioControllers[item.productoId] = TextEditingController(
            text: (item.precioEstimado ?? 0.0).toStringAsFixed(2),
          );
        }
      }

      setState(() => _isLoading = false);
    } catch (e) {
      setState(() => _isLoading = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al cargar productos: $e')),
        );
      }
    }
  }

  Future<void> _convertirACompra() async {
    if (!_validarPrecios()) return;

    setState(() => _isConverting = true);

    try {
      final preciosFinales = <int, double>{};
      for (final item in widget.pedido.items) {
        final precio = double.tryParse(_precioControllers[item.productoId]?.text ?? '0');
        if (precio != null) {
          preciosFinales[item.productoId] = precio;
        }
      }

      final pedidoCompraService = PedidoCompraService();
      final compra = await pedidoCompraService.convertirPedidoACompra(
        widget.pedido,
        widget.proveedor,
        preciosFinales,
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Pedido convertido a compra #${compra.id} exitosamente'),
            backgroundColor: Colors.green,
          ),
        );
        context.pop(true);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error al convertir pedido: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isConverting = false);
      }
    }
  }

  bool _validarPrecios() {
    for (final item in widget.pedido.items) {
      final precio = double.tryParse(_precioControllers[item.productoId]?.text ?? '');
      if (precio == null || precio <= 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Todos los precios deben ser válidos y mayores a 0'),
            backgroundColor: Colors.red,
          ),
        );
        return false;
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'Convertir a Compra',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          PermissionWidget(
            action: 'create',
            resource: 'compras',
            child: IconButton(
              icon: const Icon(Icons.save, color: Colors.white),
              onPressed: _isConverting ? null : _convertirACompra,
              tooltip: 'Convertir',
            ),
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Pedido #${widget.pedido.id}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text('Proveedor: ${widget.proveedor.nombre}'),
                          Text('Total estimado: \$${widget.pedido.totalEstimado?.toStringAsFixed(2) ?? '0.00'}'),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Precios Finales',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: ListView.builder(
                      itemCount: widget.pedido.items.length,
                      itemBuilder: (context, index) {
                        final item = widget.pedido.items[index];
                        final producto = _productos[item.productoId];
                        final controller = _precioControllers[item.productoId];

                        if (producto == null || controller == null) {
                          return const SizedBox.shrink();
                        }

                        return Card(
                          margin: const EdgeInsets.only(bottom: 8),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  producto.nombre ?? 'Producto sin nombre',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text('Cantidad: ${item.cantidad}'),
                                Text('Precio estimado: \$${item.precioEstimado?.toStringAsFixed(2) ?? '0.00'}'),
                                const SizedBox(height: 8),
                                TextFormField(
                                  controller: controller,
                                  decoration: const InputDecoration(
                                    labelText: 'Precio Final',
                                    border: OutlineInputBorder(),
                                    prefixText: '\$',
                                  ),
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    final precio = double.tryParse(value ?? '');
                                    if (precio == null || precio <= 0) {
                                      return 'Precio debe ser mayor a 0';
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }
} 