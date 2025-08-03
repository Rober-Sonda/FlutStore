import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:isar/isar.dart';
import 'package:tienda_app/models/venta.dart';
import 'package:tienda_app/models/cliente.dart';
import 'package:tienda_app/models/producto.dart';
import 'package:tienda_app/models/oferta.dart';
import 'package:tienda_app/src/app_routes.dart';
import 'package:tienda_app/widgets/permission_widget.dart';

class SaleAddEditView extends ConsumerStatefulWidget {
  final int? ventaId;

  const SaleAddEditView({super.key, this.ventaId});

  @override
  ConsumerState<SaleAddEditView> createState() => _SaleAddEditViewState();
}

class _SaleAddEditViewState extends ConsumerState<SaleAddEditView> {
  final _formKey = GlobalKey<FormState>();
  final _numeroFacturaController = TextEditingController();
  final _observacionesController = TextEditingController();

  String _metodoPagoSeleccionado = 'efectivo';
  int? _clienteSeleccionado;
  DateTime _fechaSeleccionada = DateTime.now();
  bool _isLoading = false;
  bool _isEditing = false;

  List<Cliente> _clientes = [];
  List<Producto> _productos = [];
  List<Oferta> _ofertas = [];

  // Carrito de venta
  final List<ItemCarritoVenta> _carrito = [];
  double _totalCarrito = 0.0;
  double _descuentoTotal = 0.0;

  @override
  void initState() {
    super.initState();
    _isEditing = widget.ventaId != null;
    if (_isEditing) {
      _loadVentaData();
    }
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
        final clientes = await isar.clientes.where().findAll();
        final productos = await isar.productos.where().findAll();
        final ofertas = await isar.ofertas.where().findAll();

        setState(() {
          _clientes = clientes;
          _productos = productos;
          _ofertas = ofertas;
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al cargar datos: $e')),
        );
      }
    }
  }

  Future<void> _loadVentaData() async {
    if (widget.ventaId == null) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final isar = Isar.getInstance();
      if (isar != null) {
        final venta = await isar.ventas.get(widget.ventaId!);
        if (venta != null) {
          setState(() {
            _numeroFacturaController.text = venta.numeroFactura ?? '';
            _observacionesController.text = venta.observaciones ?? '';
            _metodoPagoSeleccionado = venta.metodoPago;
            _clienteSeleccionado = venta.clienteId;
            _fechaSeleccionada = venta.fecha;
            _totalCarrito = venta.total;
          });
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al cargar venta: $e')),
        );
      }
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _agregarAlCarrito(Producto producto) {
    // Verificar si el producto ya está en el carrito
    final existingIndex = _carrito.indexWhere(
      (item) => item.producto.id == producto.id,
    );

    if (existingIndex != -1) {
      // Si ya existe, mostrar diálogo para actualizar cantidad
      _mostrarDialogoCantidad(producto, existingIndex);
    } else {
      // Si es nuevo, mostrar diálogo para especificar cantidad
      _mostrarDialogoCantidad(producto, null);
    }
  }

  void _mostrarDialogoCantidad(Producto producto, int? indexExistente) {
    final cantidadController = TextEditingController(text: '1');
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Agregar ${producto.nombre}'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Precio: \$${(producto.precio ?? 0).toStringAsFixed(2)}'),
            Text('Stock disponible: ${producto.stock ?? 0}'),
            const SizedBox(height: 16),
            TextField(
              controller: cantidadController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Cantidad',
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
              if (cantidad != null && cantidad > 0) {
                if (cantidad > (producto.stock ?? 0)) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('La cantidad excede el stock disponible'),
                      backgroundColor: Colors.red,
                    ),
                  );
                  return;
                }
                
                _agregarProductoConCantidad(producto, cantidad, indexExistente);
                Navigator.of(context).pop();
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Ingrese una cantidad válida'),
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

  void _agregarProductoConCantidad(Producto producto, int cantidad, int? indexExistente) {
    // Buscar ofertas aplicables
    final ofertasAplicables = _ofertas.where((oferta) =>
      oferta.productoId == producto.id &&
      oferta.activa &&
      oferta.fechaInicio.isBefore(DateTime.now()) &&
      oferta.fechaFin.isAfter(DateTime.now())
    ).toList();

    double precioFinal = producto.precio ?? 0.0;
    double descuento = 0.0;

    if (ofertasAplicables.isNotEmpty) {
      final oferta = ofertasAplicables.first;
      descuento = (precioFinal * oferta.porcentajeDescuento) / 100;
      precioFinal -= descuento;
    }

    setState(() {
      if (indexExistente != null) {
        // Actualizar cantidad existente
        _carrito[indexExistente].cantidad = cantidad;
        _carrito[indexExistente].precioFinal = precioFinal;
        _carrito[indexExistente].descuento = descuento;
      } else {
        // Agregar nuevo producto
        _carrito.add(
          ItemCarritoVenta(
            producto: producto,
            cantidad: cantidad,
            precioUnitario: producto.precio ?? 0.0,
            precioFinal: precioFinal,
            descuento: descuento,
          ),
        );
      }
      _calcularTotal();
    });
  }

  // Método para agregar producto por código de barras/SKU (preparado para futuro)
  void _agregarPorCodigo(String codigo) {
    // Buscar producto por código (cuando se agreguen los campos)
    // Por ahora, buscar por nombre como fallback
    final producto = _productos.firstWhere(
      (p) => p.nombre.toLowerCase().contains(codigo.toLowerCase()),
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

  void _calcularTotal() {
    _totalCarrito = _carrito.fold(
      0.0,
      (total, item) => total + (item.precioFinal * item.cantidad),
    );
    _descuentoTotal = _carrito.fold(
      0.0,
      (total, item) => total + (item.descuento * item.cantidad),
    );
  }

  Future<void> _guardarVenta() async {
    if (!_formKey.currentState!.validate()) return;

    if (_clienteSeleccionado == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Debe seleccionar un cliente'),
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

    setState(() {
      _isLoading = true;
    });

    try {
      final isar = Isar.getInstance();
      if (isar != null) {
        final venta = Venta(
          clienteId: _clienteSeleccionado ?? 1,
          fecha: _fechaSeleccionada,
          total: _totalCarrito,
          metodoPago: _metodoPagoSeleccionado,
          observaciones: _observacionesController.text,
          estado: 'completada',
          numeroFactura: _numeroFacturaController.text,
          usuarioId: 1, // TODO: Obtener usuario actual
        );

        await isar.writeTxn(() async {
          if (_isEditing) {
            venta.id = widget.ventaId!;
            await isar.ventas.put(venta);
          } else {
            await isar.ventas.put(venta);
          }

          // Actualizar stock de productos
          for (final item in _carrito) {
            final producto = item.producto;
            producto.stock = (producto.stock ?? 0) - item.cantidad;
            await isar.productos.put(producto);
          }
        });

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(_isEditing ? 'Venta actualizada' : 'Venta creada'),
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
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(_isEditing ? 'Editar Venta' : 'Nueva Venta'),
        backgroundColor: Colors.grey[900],
        foregroundColor: Colors.white,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Información básica de la venta
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Información de la Venta',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const SizedBox(height: 16),
                            
                            // Cliente
                            PermissionWidget(
                              action: 'create',
                              resource: 'ventas',
                              child: DropdownButtonFormField<int>(
                                value: _clienteSeleccionado,
                                decoration: InputDecoration(
                                  labelText: 'Cliente *',
                                  labelStyle: TextStyle(color: Colors.grey[400]),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(color: Colors.grey[700]!),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(color: Colors.indigo[700]!),
                                  ),
                                ),
                                items: _clientes.map((cliente) {
                                  return DropdownMenuItem(
                                    value: cliente.id,
                                    child: Text(cliente.nombre),
                                  );
                                }).toList(),
                                onChanged: (int? value) {
                                  setState(() {
                                    _clienteSeleccionado = value;
                                  });
                                },
                                validator: (value) {
                                  if (value == null) {
                                    return 'Debe seleccionar un cliente';
                                  }
                                  return null;
                                },
                              ),
                            ),

                            const SizedBox(height: 16),

                            // Fecha
                            PermissionWidget(
                              action: 'create',
                              resource: 'ventas',
                              child: InkWell(
                                onTap: () async {
                                  final DateTime? picked = await showDatePicker(
                                    context: context,
                                    initialDate: _fechaSeleccionada,
                                    firstDate: DateTime(2020),
                                    lastDate: DateTime(2030),
                                  );
                                  if (picked != null && picked != _fechaSeleccionada) {
                                    setState(() {
                                      _fechaSeleccionada = picked;
                                    });
                                  }
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey[700]!),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(Icons.calendar_today, color: Colors.grey[400]),
                                      const SizedBox(width: 8),
                                      Text(
                                        'Fecha: ${_fechaSeleccionada.toString().split(' ')[0]}',
                                        style: TextStyle(color: Colors.grey[400]),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: 16),

                            // Número de Factura
                            PermissionWidget(
                              action: 'create',
                              resource: 'ventas',
                              child: TextFormField(
                                controller: _numeroFacturaController,
                                decoration: InputDecoration(
                                  labelText: 'Número de Factura',
                                  labelStyle: TextStyle(color: Colors.grey[400]),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(color: Colors.grey[700]!),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(color: Colors.indigo[700]!),
                                  ),
                                ),
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),

                            const SizedBox(height: 16),

                            // Método de Pago
                            PermissionWidget(
                              action: 'create',
                              resource: 'ventas',
                              child: DropdownButtonFormField<String>(
                                value: _metodoPagoSeleccionado,
                                decoration: InputDecoration(
                                  labelText: 'Método de Pago',
                                  labelStyle: TextStyle(color: Colors.grey[400]),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(color: Colors.grey[700]!),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(color: Colors.indigo[700]!),
                                  ),
                                ),
                                items: const [
                                  DropdownMenuItem(value: 'efectivo', child: Text('Efectivo')),
                                  DropdownMenuItem(value: 'tarjeta', child: Text('Tarjeta')),
                                  DropdownMenuItem(value: 'transferencia', child: Text('Transferencia')),
                                  DropdownMenuItem(value: 'cheque', child: Text('Cheque')),
                                ],
                                onChanged: (String? value) {
                                  setState(() {
                                    _metodoPagoSeleccionado = value ?? 'efectivo';
                                  });
                                },
                              ),
                            ),

                            const SizedBox(height: 16),

                            // Observaciones
                            PermissionWidget(
                              action: 'create',
                              resource: 'ventas',
                              child: TextFormField(
                                controller: _observacionesController,
                                maxLines: 3,
                                decoration: InputDecoration(
                                  labelText: 'Observaciones',
                                  labelStyle: TextStyle(color: Colors.grey[400]),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(color: Colors.grey[700]!),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(color: Colors.indigo[700]!),
                                  ),
                                ),
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Sección de productos
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Productos',
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                Text(
                                  'Total: \$${_totalCarrito.toStringAsFixed(2)}',
                                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            
                            // Campo de búsqueda rápida
                            TextField(
                              decoration: InputDecoration(
                                labelText: 'Buscar producto por nombre',
                                prefixIcon: const Icon(Icons.search),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                hintText: 'Escriba el nombre del producto y presione Enter',
                              ),
                              onSubmitted: (codigo) {
                                if (codigo.isNotEmpty) {
                                  try {
                                    _agregarPorCodigo(codigo);
                                  } catch (e) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('Producto no encontrado: $codigo'),
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
                                      child: Text(producto.nombre[0].toUpperCase()),
                                    ),
                                    title: Text(producto.nombre),
                                    subtitle: Text(
                                      'Precio: \$${(producto.precio ?? 0).toStringAsFixed(2)} | Stock: ${producto.stock ?? 0}',
                                    ),
                                    trailing: ElevatedButton.icon(
                                      icon: const Icon(Icons.add),
                                      label: const Text('Agregar'),
                                      onPressed: () => _agregarAlCarrito(producto),
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

                    // Carrito de venta
                    if (_carrito.isNotEmpty)
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Productos en la Venta:',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              const SizedBox(height: 16),
                              ..._carrito.map((item) {
                                return Card(
                                  margin: const EdgeInsets.symmetric(vertical: 4),
                                  child: ListTile(
                                    title: Text(item.producto.nombre),
                                    subtitle: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: TextFormField(
                                                initialValue: item.cantidad.toString(),
                                                decoration: const InputDecoration(
                                                  labelText: 'Cantidad',
                                                  isDense: true,
                                                ),
                                                keyboardType: TextInputType.number,
                                                onChanged: (value) {
                                                  final cantidad = int.tryParse(value);
                                                  if (cantidad != null) {
                                                    _actualizarCantidad(
                                                      _carrito.indexOf(item),
                                                      cantidad,
                                                    );
                                                  }
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          'Precio: \$${item.precioFinal.toStringAsFixed(2)}',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        if (item.descuento > 0)
                                          Text(
                                            'Descuento: \$${item.descuento.toStringAsFixed(2)}',
                                            style: const TextStyle(
                                              color: Colors.green,
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
                                      onPressed: () => _removerDelCarrito(
                                        _carrito.indexOf(item),
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                              if (_descuentoTotal > 0)
                                Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Text(
                                    'Descuento Total: \$${_descuentoTotal.toStringAsFixed(2)}',
                                    style: const TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),

                    const SizedBox(height: 32),

                    // Botón Guardar
                    PermissionWidget(
                      action: 'create',
                      resource: 'ventas',
                      child: ElevatedButton(
                        onPressed: _isLoading ? null : _guardarVenta,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigo[700],
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: _isLoading
                            ? const CircularProgressIndicator(color: Colors.white)
                            : const Text(
                                'Guardar Venta',
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

class ItemCarritoVenta {
  final Producto producto;
  int cantidad;
  double precioUnitario;
  double precioFinal;
  double descuento;

  ItemCarritoVenta({
    required this.producto,
    required this.cantidad,
    required this.precioUnitario,
    required this.precioFinal,
    required this.descuento,
  });
}
