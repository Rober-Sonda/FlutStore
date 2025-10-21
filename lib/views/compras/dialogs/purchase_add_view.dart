import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:isar/isar.dart';
import '../../../models/compra.dart';
import '../../../models/producto.dart';
import '../../../models/proveedor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../widgets/permission_widget.dart';

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

  @override
  void dispose() {
    _numeroFacturaController.dispose();
    _observacionesController.dispose();
    super.dispose();
  }

  Future<void> _loadData() async {
    try {
      final isar = Isar.getInstance();
      if (isar != null) {
        final proveedores = await isar.proveedors.where().findAll();
        final productos = await isar.productos.where().findAll();

        setState(() {
          _proveedores = proveedores;
          _productos = productos;
        });
      }
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
    // Verificar si el producto ya estÃ¡ en el carrito
    final existingIndex = _carrito.indexWhere(
      (item) => item.producto.id == producto.id,
    );

    if (existingIndex != -1) {
      // Si ya existe, mostrar diÃ¡logo para actualizar cantidad
      _mostrarDialogoCantidad(producto, existingIndex);
    } else {
      // Si es nuevo, mostrar diÃ¡logo para especificar cantidad
      _mostrarDialogoCantidad(producto, null);
    }
  }

  void _mostrarDialogoCantidad(Producto producto, int? indexExistente) {
    final cantidadController = TextEditingController(text: '1');
    final precioController = TextEditingController(
      text: (producto.precio ?? 0.0).toString(),
    );

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('Agregar ${producto.nombre}'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Stock actual: ${producto.stock ?? 0}'),
                const SizedBox(height: 16),
                TextField(
                  controller: cantidadController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Cantidad',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: precioController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Precio unitario',
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Cancelar'),
              ),
              ElevatedButton(
                onPressed: () {
                  final cantidad = int.tryParse(cantidadController.text);
                  final precio = double.tryParse(precioController.text);

                  if (cantidad != null &&
                      cantidad > 0 &&
                      precio != null &&
                      precio >= 0) {
                    _agregarProductoConCantidad(
                      producto,
                      cantidad,
                      precio,
                      indexExistente,
                    );
                    Navigator.of(context).pop();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Ingrese valores vÃ¡lidos'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                child: const Text('Agregar'),
              ),
            ],
          ),
    );
  }

  void _agregarProductoConCantidad(
    Producto producto,
    int cantidad,
    double precio,
    int? indexExistente,
  ) {
    setState(() {
      if (indexExistente != null) {
        // Actualizar cantidad existente
        _carrito[indexExistente].cantidad = cantidad;
        _carrito[indexExistente].precioUnitario = precio;
      } else {
        // Agregar nuevo producto
        _carrito.add(
          ItemCarritoCompra(
            producto: producto,
            cantidad: cantidad,
            precioUnitario: precio,
          ),
        );
      }
      _calcularTotal();
    });
  }

  // MÃ©todo para agregar producto por cÃ³digo de barras/SKU (preparado para futuro)
  void _agregarPorCodigo(String codigo) {
    // Buscar producto por cÃ³digo (cuando se agreguen los campos)
    // Por ahora, buscar por nombre como fallback
    final producto = _productos.firstWhere(
      (p) => (p.nombre?.toLowerCase().contains(codigo.toLowerCase()) ?? false),
      orElse: () => throw Exception('Producto no encontrado'),
    );

    _agregarAlCarrito(producto);
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

    if (_numeroFacturaController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Debe ingresar un nÃºmero de factura'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      final isar = Isar.getInstance();
      if (isar != null) {
        final compra = Compra(
          numeroFactura: _numeroFacturaController.text.trim(),
          fecha: DateTime.now(),
          total: _totalCarrito,
          proveedorId: _proveedorSeleccionado!.id,
          observaciones: _observacionesController.text.trim(),
          estado: 'pendiente',
        );

        // Agregar productos al carrito de la compra
        for (final item in _carrito) {
          compra.productos.add(
            CompraProducto(
              productoId: item.producto.id,
              nombreProducto: item.producto.nombre ?? 'Producto sin nombre',
              cantidad: item.cantidad,
              precioUnitario: item.precioUnitario,
            ),
          );
        }

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
        backgroundColor: Colors.grey[900],
        foregroundColor: Colors.white,
      ),
      body:
          _isLoading
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // InformaciÃ³n bÃ¡sica de la compra
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'InformaciÃ³n de la Compra',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              const SizedBox(height: 16),

                              // Proveedor
                              DropdownButtonFormField<Proveedor>(
                                value: _proveedorSeleccionado,
                                decoration: const InputDecoration(
                                  labelText: 'Proveedor *',
                                  prefixIcon: Icon(Icons.business),
                                  border: OutlineInputBorder(),
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

                              // NÃºmero de Factura y Observaciones
                              Row(
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      controller: _numeroFacturaController,
                                      decoration: const InputDecoration(
                                        labelText: 'NÃºmero de Factura *',
                                        prefixIcon: Icon(Icons.receipt),
                                        border: OutlineInputBorder(),
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
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // SecciÃ³n de productos
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Productos',
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                  Text(
                                    'Total: \$${_totalCarrito.toStringAsFixed(2)}',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.titleLarge?.copyWith(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),

                              // Campo de bÃºsqueda rÃ¡pida
                              TextField(
                                decoration: InputDecoration(
                                  labelText: 'Buscar producto por nombre',
                                  prefixIcon: const Icon(Icons.search),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  hintText:
                                      'Escriba el nombre del producto y presione Enter',
                                ),
                                onSubmitted: (codigo) {
                                  if (codigo.isNotEmpty) {
                                    try {
                                      _agregarPorCodigo(codigo);
                                    } catch (e) {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Producto no encontrado: $codigo',
                                          ),
                                          backgroundColor: Colors.red,
                                        ),
                                      );
                                    }
                                  }
                                },
                              ),
                              const SizedBox(height: 16),

                              // Lista de productos disponibles
                              Text(
                                'Productos Disponibles:',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const SizedBox(height: 8),
                              SizedBox(
                                height: 200,
                                child: ListView.builder(
                                  itemCount: _productos.length,
                                  itemBuilder: (context, index) {
                                    final producto = _productos[index];
                                    return ListTile(
                                      leading: CircleAvatar(
                                        child: Text(
                                          (producto.nombre?[0] ?? 'P')
                                              .toUpperCase(),
                                        ),
                                      ),
                                      title: Text(
                                        producto.nombre ??
                                            'Producto sin nombre',
                                      ),
                                      subtitle: Text(
                                        'Precio: \$${(producto.precio ?? 0).toStringAsFixed(2)} | Stock: ${producto.stock ?? 0}',
                                      ),
                                      trailing: ElevatedButton.icon(
                                        icon: const Icon(Icons.add),
                                        label: const Text('Agregar'),
                                        onPressed:
                                            () => _agregarAlCarrito(producto),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.indigo[700],
                                          foregroundColor: Colors.white,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Productos en la compra
                      if (_carrito.isNotEmpty)
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Productos en la Compra:',
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                const SizedBox(height: 16),
                                ..._carrito.map((item) {
                                  return Card(
                                    margin: const EdgeInsets.symmetric(
                                      vertical: 4,
                                    ),
                                    child: ListTile(
                                      title: Text(
                                        item.producto.nombre ??
                                            'Producto sin nombre',
                                      ),
                                      subtitle: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
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
                                                    final cantidad =
                                                        int.tryParse(value);
                                                    if (cantidad != null) {
                                                      _actualizarCantidad(
                                                        _carrito.indexOf(item),
                                                        cantidad,
                                                      );
                                                    }
                                                  },
                                                ),
                                              ),
                                              const SizedBox(width: 8),
                                              Expanded(
                                                child: TextFormField(
                                                  initialValue:
                                                      item.precioUnitario
                                                          .toString(),
                                                  decoration:
                                                      const InputDecoration(
                                                        labelText:
                                                            'Precio Unit.',
                                                        isDense: true,
                                                      ),
                                                  keyboardType:
                                                      TextInputType.number,
                                                  onChanged: (value) {
                                                    final precio =
                                                        double.tryParse(value);
                                                    if (precio != null) {
                                                      _actualizarPrecio(
                                                        _carrito.indexOf(item),
                                                        precio,
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
                                            () => _removerDelCarrito(
                                              _carrito.indexOf(item),
                                            ),
                                      ),
                                    ),
                                  );
                                }),
                              ],
                            ),
                          ),
                        ),

                      const SizedBox(height: 32),

                      // BotÃ³n Guardar
                      PermissionWidget(
                        action: 'create',
                        resource: 'compras',
                        child: ElevatedButton(
                          onPressed: _isLoading ? null : _guardarCompra,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.indigo[700],
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                          child:
                              _isLoading
                                  ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                  : const Text(
                                    'Guardar Compra',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
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
