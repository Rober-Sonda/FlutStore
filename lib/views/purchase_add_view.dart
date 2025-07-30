import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:isar/isar.dart';
import 'package:tienda_app/src/app_routes.dart';
import 'package:tienda_app/models/compra.dart';
import 'package:tienda_app/models/producto.dart';
import 'package:tienda_app/models/proveedor.dart';
import 'package:tienda_app/services/isar_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PurchaseAddView extends ConsumerStatefulWidget {
  const PurchaseAddView({super.key});

  @override
  ConsumerState<PurchaseAddView> createState() => _PurchaseAddViewState();
}

class _PurchaseAddViewState extends ConsumerState<PurchaseAddView> {
  final _formKey = GlobalKey<FormState>();
  final _numeroFacturaController = TextEditingController();
  final _observacionesController = TextEditingController();

  bool _isLoading = false;
  Proveedor? _proveedorSeleccionado;
  List<Proveedor> _proveedores = [];
  List<Producto> _productos = [];

  // Carrito de compra
  final List<ItemCarritoCompra> _carrito = [];
  double _totalCarrito = 0.0;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      final isar = await ref.read(isarServiceProvider).db;
      final proveedores = await isar.proveedors.where().findAll();
      final productos = await isar.productos.where().findAll();

      setState(() {
        _proveedores = proveedores;
        _productos = productos;
      });
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error cargando datos: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  void _agregarAlCarrito(Producto producto) {
    final existingIndex = _carrito.indexWhere(
      (item) => item.producto.id == producto.id,
    );

    if (existingIndex != -1) {
      setState(() {
        _carrito[existingIndex].cantidad++;
        _calcularTotal();
      });
    } else {
      setState(() {
        _carrito.add(
          ItemCarritoCompra(
            producto: producto,
            cantidad: 1,
            precioUnitario: producto.precio ?? 0.0,
          ),
        );
        _calcularTotal();
      });
    }
  }

  void _removerDelCarrito(int index) {
    setState(() {
      _carrito.removeAt(index);
      _calcularTotal();
    });
  }

  void _actualizarCantidad(int index, int nuevaCantidad) {
    if (nuevaCantidad > 0) {
      setState(() {
        _carrito[index].cantidad = nuevaCantidad;
        _calcularTotal();
      });
    }
  }

  void _actualizarPrecio(int index, double nuevoPrecio) {
    setState(() {
      _carrito[index].precioUnitario = nuevoPrecio;
      _calcularTotal();
    });
  }

  void _calcularTotal() {
    _totalCarrito = _carrito.fold(
      0.0,
      (total, item) => total + (item.precioUnitario * item.cantidad),
    );
  }

  Future<void> _guardarCompra() async {
    if (!_formKey.currentState!.validate()) return;

    if (_proveedorSeleccionado == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Debe seleccionar un proveedor'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (_carrito.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Debe agregar productos al carrito'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      final isar = await ref.read(isarServiceProvider).db;

      final compra = Compra();
      compra.proveedorId = _proveedorSeleccionado!.id;
      compra.numeroFactura = _numeroFacturaController.text.trim();
      compra.observaciones = _observacionesController.text.trim();
      compra.total = _totalCarrito;
      compra.fecha = DateTime.now();
      compra.estado = 'pendiente';

      await isar.writeTxn(() async {
        await isar.compras.put(compra);

        // Actualizar stock de productos
        for (final item in _carrito) {
          final producto = item.producto;
          producto.stock = (producto.stock ?? 0) + item.cantidad;
          await isar.productos.put(producto);
        }
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Compra guardada exitosamente'),
            backgroundColor: Colors.green,
          ),
        );
        context.pop();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e'), backgroundColor: Colors.red),
        );
      }
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nueva Compra'),
        actions: [
          if (_carrito.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () => _mostrarCarrito(),
              tooltip: 'Ver Carrito',
            ),
        ],
      ),
      body: Row(
        children: [
          // Panel izquierdo - Formulario y productos
          Expanded(
            flex: 2,
            child: Column(
              children: [
                // Formulario de compra
                Card(
                  margin: const EdgeInsets.all(16),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Información de la Compra',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const SizedBox(height: 16),
                          DropdownButtonFormField<Proveedor>(
                            value: _proveedorSeleccionado,
                            decoration: const InputDecoration(
                              labelText: 'Proveedor *',
                              prefixIcon: Icon(Icons.business),
                            ),
                            items:
                                _proveedores.map((proveedor) {
                                  return DropdownMenuItem(
                                    value: proveedor,
                                    child: Text(proveedor.nombre),
                                  );
                                }).toList(),
                            onChanged: (Proveedor? value) {
                              setState(() {
                                _proveedorSeleccionado = value;
                              });
                            },
                            validator: (value) {
                              if (value == null) {
                                return 'Debe seleccionar un proveedor';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: _numeroFacturaController,
                                  decoration: const InputDecoration(
                                    labelText: 'Número de Factura',
                                    prefixIcon: Icon(Icons.receipt),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: TextFormField(
                                  controller: _observacionesController,
                                  decoration: const InputDecoration(
                                    labelText: 'Observaciones',
                                    prefixIcon: Icon(Icons.note),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Lista de productos
                Expanded(
                  child: Card(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Productos Disponibles',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              Text(
                                '${_productos.length} productos',
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: _productos.length,
                            itemBuilder: (context, index) {
                              final producto = _productos[index];
                              return ListTile(
                                leading: CircleAvatar(
                                  child: Text(producto.nombre[0].toUpperCase()),
                                ),
                                title: Text(producto.nombre),
                                subtitle: Text(
                                  'Precio: \$${(producto.precio ?? 0).toStringAsFixed(2)} | Stock: ${producto.stock ?? 0}',
                                ),
                                trailing: IconButton(
                                  icon: const Icon(Icons.add_shopping_cart),
                                  onPressed: () => _agregarAlCarrito(producto),
                                  tooltip: 'Agregar al carrito',
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Panel derecho - Carrito
          Expanded(
            flex: 1,
            child: Card(
              margin: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Carrito de Compra',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Text(
                          '\$${_totalCarrito.toStringAsFixed(2)}',
                          style: Theme.of(
                            context,
                          ).textTheme.titleLarge?.copyWith(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child:
                        _carrito.isEmpty
                            ? const Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.shopping_cart_outlined,
                                    size: 64,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(height: 16),
                                  Text(
                                    'Carrito vacío',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  Text(
                                    'Agrega productos desde la lista',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            )
                            : ListView.builder(
                              itemCount: _carrito.length,
                              itemBuilder: (context, index) {
                                final item = _carrito[index];
                                return Card(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  child: ListTile(
                                    title: Text(item.producto.nombre),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: TextFormField(
                                                initialValue:
                                                    item.precioUnitario
                                                        .toString(),
                                                decoration:
                                                    const InputDecoration(
                                                      labelText: 'Precio',
                                                      isDense: true,
                                                    ),
                                                keyboardType:
                                                    TextInputType.number,
                                                onChanged: (value) {
                                                  final precio =
                                                      double.tryParse(value);
                                                  if (precio != null) {
                                                    _actualizarPrecio(
                                                      index,
                                                      precio,
                                                    );
                                                  }
                                                },
                                              ),
                                            ),
                                            const SizedBox(width: 8),
                                            Expanded(
                                              child: TextFormField(
                                                initialValue:
                                                    item.cantidad.toString(),
                                                decoration:
                                                    const InputDecoration(
                                                      labelText: 'Cantidad',
                                                      isDense: true,
                                                    ),
                                                keyboardType:
                                                    TextInputType.number,
                                                onChanged: (value) {
                                                  final cantidad = int.tryParse(
                                                    value,
                                                  );
                                                  if (cantidad != null) {
                                                    _actualizarCantidad(
                                                      index,
                                                      cantidad,
                                                    );
                                                  }
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          'Subtotal: \$${(item.precioUnitario * item.cantidad).toStringAsFixed(2)}',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    trailing: IconButton(
                                      icon: const Icon(
                                        Icons.remove_circle,
                                        color: Colors.red,
                                      ),
                                      onPressed:
                                          () => _removerDelCarrito(index),
                                    ),
                                  ),
                                );
                              },
                            ),
                  ),
                  if (_carrito.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: _isLoading ? null : _guardarCompra,
                          child:
                              _isLoading
                                  ? const CircularProgressIndicator()
                                  : const Text('Guardar Compra'),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _mostrarCarrito() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Carrito de Compra'),
            content: SizedBox(
              width: double.maxFinite,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ..._carrito.map(
                    (item) => ListTile(
                      title: Text(item.producto.nombre),
                      subtitle: Text(
                        'Cantidad: ${item.cantidad} | Precio: \$${item.precioUnitario}',
                      ),
                      trailing: Text(
                        '\$${(item.precioUnitario * item.cantidad).toStringAsFixed(2)}',
                      ),
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    title: const Text(
                      'Total',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(
                      '\$${_totalCarrito.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Cerrar'),
              ),
            ],
          ),
    );
  }
}

class ItemCarritoCompra {
  final Producto producto;
  int cantidad;
  double precioUnitario;

  ItemCarritoCompra({
    required this.producto,
    required this.cantidad,
    required this.precioUnitario,
  });
}
