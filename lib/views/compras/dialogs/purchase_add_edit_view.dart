import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:isar/isar.dart';
import '../../../models/compra.dart';
import '../../../models/producto.dart';
import '../../../models/proveedor.dart';
import '../../../services/isar_service.dart';
import '../../../services/numeracion_service.dart';
import '../../../widgets/permission_widget.dart';

class PurchaseAddEditView extends ConsumerStatefulWidget {
  final int? compraId;

  const PurchaseAddEditView({super.key, this.compraId});

  @override
  ConsumerState<PurchaseAddEditView> createState() =>
      _PurchaseAddEditViewState();
}

class _PurchaseAddEditViewState extends ConsumerState<PurchaseAddEditView> {
  final _formKey = GlobalKey<FormState>();
  final _codigoBarrasController = TextEditingController();
  final _observacionesController = TextEditingController();
  final _referenciaPagoController = TextEditingController();
  final _direccionEntregaController = TextEditingController();
  final _contactoProveedorController = TextEditingController();
  final _telefonoProveedorController = TextEditingController();
  final _emailProveedorController = TextEditingController();
  final _condicionesPagoController = TextEditingController();
  final _plazoEntregaController = TextEditingController();

  // Datos de la compra
  int? _proveedorSeleccionadoId;
  String _metodoPago = 'Efectivo';
  String _estado = 'pendiente';
  double _total = 0.0;
  double _montoPagado = 0.0;
  double _saldoPendiente = 0.0;

  // Números de documento
  String? _numeroFactura;
  String? _numeroOrden;
  String? _numeroRemito;
  String? _numeroGuia;
  String? _referenciaProveedor;

  // Información adicional
  bool _esUrgente = false;
  String? _prioridad;

  // Productos
  List<Producto> _productos = [];
  List<Proveedor> _proveedores = [];
  final List<ItemCarritoCompra> _carrito = [];

  // Estados
  bool _isLoading = true;
  bool _isSaving = false;
  final bool _generarNumerosAutomaticos = true;
  Compra? _compra;

  final List<String> _metodosPago = [
    'Efectivo',
    'Tarjeta de Débito',
    'Tarjeta de Crédito',
    'Transferencia',
    'Cheque',
    'Otro',
  ];

  final List<String> _prioridades = ['Baja', 'Media', 'Alta', 'Urgente'];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  void dispose() {
    _codigoBarrasController.dispose();
    _observacionesController.dispose();
    _referenciaPagoController.dispose();
    _direccionEntregaController.dispose();
    _contactoProveedorController.dispose();
    _telefonoProveedorController.dispose();
    _emailProveedorController.dispose();
    _condicionesPagoController.dispose();
    _plazoEntregaController.dispose();
    super.dispose();
  }

  Future<void> _loadData() async {
    try {
      setState(() => _isLoading = true);

      final isar = await ref.read(isarServiceProvider).db;

      // Cargar productos y proveedores
      _productos = await isar.productos.where().findAll();
      _proveedores = await isar.proveedors.where().findAll();

      if (widget.compraId != null) {
        _compra = await isar.compras.get(widget.compraId!);
        if (_compra != null) {
          _loadCompraData();
        }
      } else {
        // Generar números automáticos para nueva compra
        if (_generarNumerosAutomaticos) {
          await _generarNumerosAutomaticosCompra();
        }
      }

      setState(() => _isLoading = false);
    } catch (e) {
      setState(() => _isLoading = false);
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error al cargar datos: $e')));
      }
    }
  }

  Future<void> _generarNumerosAutomaticosCompra() async {
    try {
      final isar = await ref.read(isarServiceProvider).db;
      final numeracionService = NumeracionService();

      final numeroFactura = await numeracionService.generarNumeroFacturaCompra(
        isar,
      );
      final numeroOrden = await numeracionService.generarNumeroOrdenCompra(
        isar,
      );
      final numeroRemito = await numeracionService.generarNumeroRemitoCompra(
        isar,
      );
      final numeroGuia = await numeracionService.generarNumeroGuiaCompra(isar);

      setState(() {
        _numeroFactura = numeroFactura;
        _numeroOrden = numeroOrden;
        _numeroRemito = numeroRemito;
        _numeroGuia = numeroGuia;
      });
    } catch (e) {
      print('Error generando números automáticos: $e');
    }
  }

  void _loadCompraData() {
    if (_compra == null) return;

    _proveedorSeleccionadoId = _compra!.proveedorId;
    _metodoPago = _compra!.metodoPago;
    _estado = _compra!.estado;
    _total = _compra!.total;
    _montoPagado = _compra!.montoPagado;
    _saldoPendiente = _compra!.saldoPendiente;
    _numeroFactura = _compra!.numeroFactura;
    _numeroOrden = _compra!.numeroOrden;
    _numeroRemito = _compra!.numeroRemito;
    _numeroGuia = _compra!.numeroGuia;
    _referenciaProveedor = _compra!.referenciaProveedor;
    _esUrgente = _compra!.esUrgente;
    _prioridad = _compra!.prioridad;
    _observacionesController.text = _compra!.observaciones ?? '';
    _direccionEntregaController.text = _compra!.direccionEntrega ?? '';
    _contactoProveedorController.text = _compra!.contactoProveedor ?? '';
    _telefonoProveedorController.text = _compra!.telefonoProveedor ?? '';
    _emailProveedorController.text = _compra!.emailProveedor ?? '';
    _condicionesPagoController.text = _compra!.condicionesPago ?? '';
    _plazoEntregaController.text = _compra!.plazoEntrega ?? '';
  }

  void _buscarPorCodigoBarras() {
    final codigo = _codigoBarrasController.text.trim();
    if (codigo.isEmpty) return;

    // Buscar por código de barras, SKU o nombre
    final producto = _productos.firstWhere(
      (p) =>
          (p.codigoBarras?.toLowerCase() == codigo.toLowerCase()) ||
          (p.sku?.toLowerCase() == codigo.toLowerCase()) ||
          (p.nombre?.toLowerCase().contains(codigo.toLowerCase()) ?? false),
      orElse: () => Producto(),
    );

    if (producto.id != 0) {
      _mostrarDialogoCantidad(producto);
      _codigoBarrasController.clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Producto no encontrado: $codigo'),
          backgroundColor: Colors.red,
          action: SnackBarAction(
            label: 'Buscar',
            textColor: Colors.white,
            onPressed: () => _mostrarBusquedaAvanzada(codigo),
          ),
        ),
      );
    }
  }

  void _mostrarBusquedaAvanzada(String codigo) {
    final productosEncontrados =
        _productos
            .where(
              (p) =>
                  (p.nombre?.toLowerCase().contains(codigo.toLowerCase()) ??
                      false) ||
                  (p.codigoBarras?.toLowerCase().contains(
                        codigo.toLowerCase(),
                      ) ??
                      false) ||
                  (p.sku?.toLowerCase().contains(codigo.toLowerCase()) ??
                      false),
            )
            .toList();

    if (productosEncontrados.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'No se encontraron productos que coincidan con: $codigo',
          ),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('Productos encontrados para "$codigo"'),
            content: SizedBox(
              width: double.maxFinite,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: productosEncontrados.length,
                itemBuilder: (context, index) {
                  final producto = productosEncontrados[index];
                  return ListTile(
                    title: Text(producto.nombre ?? 'Producto sin nombre'),
                    subtitle: Text(
                      'Costo: \$${producto.precioCosto?.toStringAsFixed(2) ?? '0.00'} - '
                      'Stock: ${producto.stock ?? 0}',
                    ),
                    trailing:
                        producto.codigoBarras != null || producto.sku != null
                            ? Text(
                              '${producto.codigoBarras ?? ''} ${producto.sku ?? ''}',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            )
                            : null,
                    onTap: () {
                      Navigator.of(context).pop();
                      _mostrarDialogoCantidad(producto);
                    },
                  );
                },
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Cancelar'),
              ),
            ],
          ),
    );
  }

  void _mostrarDialogoCantidad(Producto producto) {
    final cantidadController = TextEditingController(text: '1');
    final precioController = TextEditingController(
      text: (producto.precioCosto ?? 0.0).toString(),
    );

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Row(
              children: [
                Icon(Icons.add_shopping_cart, color: Colors.green),
                const SizedBox(width: 8),
                Expanded(child: Text('Agregar ${producto.nombre}')),
              ],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Información del producto
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          producto.nombre ?? 'Producto sin nombre',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Costo sugerido: \$${(producto.precioCosto ?? 0.0).toStringAsFixed(2)}',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                        if (producto.stock != null)
                          Text(
                            'Stock disponible: ${producto.stock}',
                            style: TextStyle(
                              color:
                                  producto.stock! > 0
                                      ? Colors.green
                                      : Colors.red,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Campos de entrada
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: cantidadController,
                        decoration: const InputDecoration(
                          labelText: 'Cantidad',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.numbers),
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          final cantidad = int.tryParse(value) ?? 1;
                          final precio =
                              double.tryParse(precioController.text) ?? 0.0;
                          // Actualizar el precio total en tiempo real
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextFormField(
                        controller: precioController,
                        decoration: const InputDecoration(
                          labelText: 'Precio Unitario',
                          border: OutlineInputBorder(),
                          prefixText: '\$',
                          prefixIcon: Icon(Icons.attach_money),
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          final cantidad =
                              int.tryParse(cantidadController.text) ?? 1;
                          final precio = double.tryParse(value) ?? 0.0;
                          // Actualizar el precio total en tiempo real
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Resumen del total
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.green[50],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.green[200]!),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Subtotal:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '\$${((int.tryParse(cantidadController.text) ?? 1) * (double.tryParse(precioController.text) ?? 0.0)).toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.green,
                        ),
                      ),
                    ],
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
                  final cantidad = int.tryParse(cantidadController.text) ?? 1;
                  final precio = double.tryParse(precioController.text) ?? 0.0;

                  if (cantidad <= 0) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('La cantidad debe ser mayor a 0'),
                        backgroundColor: Colors.red,
                      ),
                    );
                    return;
                  }

                  if (precio < 0) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('El precio no puede ser negativo'),
                        backgroundColor: Colors.red,
                      ),
                    );
                    return;
                  }

                  _agregarProductoConCantidad(producto, cantidad, precio);
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Agregar al Carrito'),
              ),
            ],
          ),
    );
  }

  void _agregarProductoConCantidad(
    Producto producto,
    int cantidad,
    double precio,
  ) {
    final subtotal = cantidad * precio;

    // Buscar si el producto ya está en el carrito
    final index = _carrito.indexWhere(
      (item) => item.producto.id == producto.id,
    );

    if (index != -1) {
      setState(() {
        _carrito[index] = ItemCarritoCompra(
          producto: producto,
          cantidad: cantidad,
          precioUnitario: precio,
          subtotal: subtotal,
        );
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${producto.nombre} actualizado en el carrito'),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      setState(() {
        _carrito.add(
          ItemCarritoCompra(
            producto: producto,
            cantidad: cantidad,
            precioUnitario: precio,
            subtotal: subtotal,
          ),
        );
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${producto.nombre} agregado al carrito'),
          backgroundColor: Colors.green,
        ),
      );
    }

    _calcularTotal();
  }

  void _calcularTotal() {
    _total = _carrito.fold(0.0, (sum, item) => sum + item.subtotal);
    _saldoPendiente = _total - _montoPagado;
    setState(() {});
  }

  void _removerProducto(int index) {
    setState(() {
      _carrito.removeAt(index);
      _calcularTotal();
    });
  }

  Future<void> _guardarCompra() async {
    if (!_formKey.currentState!.validate()) return;
    if (_carrito.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Debe agregar al menos un producto')),
      );
      return;
    }
    if (_proveedorSeleccionadoId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Debe seleccionar un proveedor')),
      );
      return;
    }

    try {
      setState(() => _isSaving = true);

      final isar = await ref.read(isarServiceProvider).db;

      final compra =
          _compra ??
          Compra(
            numeroFactura:
                _numeroFactura ?? 'FAC-COMP-${DateTime.now().year}-000001',
            fecha: DateTime.now(),
            total: _total,
            observaciones:
                _observacionesController.text.isEmpty
                    ? null
                    : _observacionesController.text,
            estado: _estado,
            proveedorId: _proveedorSeleccionadoId,
            metodoPago: _metodoPago,
            montoPagado: _montoPagado,
            saldoPendiente: _saldoPendiente,
            numeroOrden: _numeroOrden,
            numeroRemito: _numeroRemito,
            numeroGuia: _numeroGuia,
            referenciaProveedor: _referenciaProveedor,
            condicionesPago:
                _condicionesPagoController.text.isEmpty
                    ? null
                    : _condicionesPagoController.text,
            plazoEntrega:
                _plazoEntregaController.text.isEmpty
                    ? null
                    : _plazoEntregaController.text,
            direccionEntrega:
                _direccionEntregaController.text.isEmpty
                    ? null
                    : _direccionEntregaController.text,
            contactoProveedor:
                _contactoProveedorController.text.isEmpty
                    ? null
                    : _contactoProveedorController.text,
            telefonoProveedor:
                _telefonoProveedorController.text.isEmpty
                    ? null
                    : _telefonoProveedorController.text,
            emailProveedor:
                _emailProveedorController.text.isEmpty
                    ? null
                    : _emailProveedorController.text,
            esUrgente: _esUrgente,
            prioridad: _prioridad,
            usuarioId: 1, // TODO: Obtener ID del usuario actual
          );

      // Actualizar datos de la compra
      compra.numeroFactura =
          _numeroFactura ?? 'FAC-COMP-${DateTime.now().year}-000001';
      compra.fecha = DateTime.now();
      compra.total = _total;
      compra.observaciones =
          _observacionesController.text.isEmpty
              ? null
              : _observacionesController.text;
      compra.estado = _estado;
      compra.proveedorId = _proveedorSeleccionadoId;
      compra.metodoPago = _metodoPago;
      compra.montoPagado = _montoPagado;
      compra.saldoPendiente = _saldoPendiente;
      compra.numeroOrden = _numeroOrden;
      compra.numeroRemito = _numeroRemito;
      compra.numeroGuia = _numeroGuia;
      compra.referenciaProveedor = _referenciaProveedor;
      compra.condicionesPago =
          _condicionesPagoController.text.isEmpty
              ? null
              : _condicionesPagoController.text;
      compra.plazoEntrega =
          _plazoEntregaController.text.isEmpty
              ? null
              : _plazoEntregaController.text;
      compra.direccionEntrega =
          _direccionEntregaController.text.isEmpty
              ? null
              : _direccionEntregaController.text;
      compra.contactoProveedor =
          _contactoProveedorController.text.isEmpty
              ? null
              : _contactoProveedorController.text;
      compra.telefonoProveedor =
          _telefonoProveedorController.text.isEmpty
              ? null
              : _telefonoProveedorController.text;
      compra.emailProveedor =
          _emailProveedorController.text.isEmpty
              ? null
              : _emailProveedorController.text;
      compra.esUrgente = _esUrgente;
      compra.prioridad = _prioridad;

      // Agregar productos a la compra
      compra.productos =
          _carrito
              .map(
                (item) => CompraProducto(
                  productoId: item.producto.id,
                  nombreProducto: item.producto.nombre ?? 'Producto sin nombre',
                  cantidad: item.cantidad,
                  precioUnitario: item.precioUnitario,
                  observaciones: item.observaciones,
                ),
              )
              .toList();

      await isar.writeTxn(() async {
        await isar.compras.put(compra);
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Compra guardada exitosamente')),
        );
        context.pop();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error al guardar compra: $e')));
      }
    } finally {
      setState(() => _isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.compraId == null ? 'Nueva Compra' : 'Editar Compra'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body:
          _isLoading
              ? const Center(child: CircularProgressIndicator())
              : PermissionWidget(
                resource: 'compras',
                action: widget.compraId == null ? 'create' : 'update',
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Información básica
                        _buildInformacionBasica(),
                        const SizedBox(height: 16),

                        // Búsqueda de productos
                        _buildBusquedaProductos(),
                        const SizedBox(height: 16),

                        // Carrito de productos
                        _buildCarritoProductos(),
                        const SizedBox(height: 16),

                        // Información de pago
                        _buildInformacionPago(),
                        const SizedBox(height: 16),

                        // Información adicional
                        _buildInformacionAdicional(),
                      ],
                    ),
                  ),
                ),
              ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: _isSaving ? null : _guardarCompra,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child:
                    _isSaving
                        ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                        : const Text('Guardar Compra'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInformacionBasica() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Información Básica',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // Proveedor
            DropdownButtonFormField<int?>(
              value: _proveedorSeleccionadoId,
              decoration: const InputDecoration(
                labelText: 'Proveedor *',
                border: OutlineInputBorder(),
              ),
              items: [
                const DropdownMenuItem<int?>(
                  value: null,
                  child: Text('Seleccionar proveedor...'),
                ),
                ..._proveedores.map(
                  (proveedor) => DropdownMenuItem<int?>(
                    value: proveedor.id,
                    child: Text(proveedor.nombre),
                  ),
                ),
              ],
              onChanged: (value) {
                setState(() => _proveedorSeleccionadoId = value);
              },
              validator: (value) {
                if (value == null) return 'Debe seleccionar un proveedor';
                return null;
              },
            ),
            const SizedBox(height: 16),

            // Estado
            DropdownButtonFormField<String>(
              value: _estado,
              decoration: const InputDecoration(
                labelText: 'Estado',
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(value: 'pendiente', child: Text('Pendiente')),
                DropdownMenuItem(
                  value: 'confirmada',
                  child: Text('Confirmada'),
                ),
                DropdownMenuItem(value: 'cancelada', child: Text('Cancelada')),
                DropdownMenuItem(value: 'recibida', child: Text('Recibida')),
              ],
              onChanged: (value) {
                setState(() => _estado = value!);
              },
            ),
            const SizedBox(height: 16),

            // Método de pago
            DropdownButtonFormField<String>(
              value: _metodoPago,
              decoration: const InputDecoration(
                labelText: 'Método de Pago',
                border: OutlineInputBorder(),
              ),
              items:
                  _metodosPago
                      .map(
                        (metodo) => DropdownMenuItem(
                          value: metodo,
                          child: Text(metodo),
                        ),
                      )
                      .toList(),
              onChanged: (value) {
                setState(() => _metodoPago = value!);
              },
            ),
            const SizedBox(height: 16),

            // Urgente y Prioridad
            Row(
              children: [
                Expanded(
                  child: CheckboxListTile(
                    title: const Text('Es Urgente'),
                    value: _esUrgente,
                    onChanged: (value) {
                      setState(() => _esUrgente = value!);
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                ),
                Expanded(
                  child: DropdownButtonFormField<String?>(
                    value: _prioridad,
                    decoration: const InputDecoration(
                      labelText: 'Prioridad',
                      border: OutlineInputBorder(),
                    ),
                    items: [
                      const DropdownMenuItem<String?>(
                        value: null,
                        child: Text('Seleccionar...'),
                      ),
                      ..._prioridades.map(
                        (prioridad) => DropdownMenuItem(
                          value: prioridad,
                          child: Text(prioridad),
                        ),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() => _prioridad = value);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBusquedaProductos() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Búsqueda de Productos',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _codigoBarrasController,
                    decoration: const InputDecoration(
                      labelText: 'Código de Barras, SKU o Nombre',
                      border: OutlineInputBorder(),
                      hintText: 'Escanear código o escribir...',
                    ),
                    onFieldSubmitted: (_) => _buscarPorCodigoBarras(),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  onPressed: _buscarPorCodigoBarras,
                  icon: const Icon(Icons.search),
                  tooltip: 'Buscar Producto',
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Presiona Enter o el botón de búsqueda para agregar productos',
              style: TextStyle(color: Colors.grey[600], fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCarritoProductos() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Productos',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Total: \$${_total.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            if (_carrito.isEmpty)
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(32),
                  child: Text(
                    'No hay productos en el carrito',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              )
            else
              ...List.generate(_carrito.length, (index) {
                final item = _carrito[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: ListTile(
                    title: Text(item.producto.nombre ?? 'Producto sin nombre'),
                    subtitle: Text(
                      'Cantidad: ${item.cantidad} x \$${item.precioUnitario.toStringAsFixed(2)}',
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '\$${item.subtotal.toStringAsFixed(2)}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          onPressed: () => _removerProducto(index),
                          icon: const Icon(
                            Icons.remove_circle,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
          ],
        ),
      ),
    );
  }

  Widget _buildInformacionPago() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Información de Pago',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    initialValue: _montoPagado.toString(),
                    decoration: const InputDecoration(
                      labelText: 'Monto Pagado',
                      border: OutlineInputBorder(),
                      prefixText: '\$',
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      _montoPagado = double.tryParse(value) ?? 0.0;
                      _calcularTotal();
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextFormField(
                    initialValue: _saldoPendiente.toString(),
                    decoration: const InputDecoration(
                      labelText: 'Saldo Pendiente',
                      border: OutlineInputBorder(),
                      prefixText: '\$',
                    ),
                    keyboardType: TextInputType.number,
                    readOnly: true,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            TextFormField(
              controller: _referenciaPagoController,
              decoration: const InputDecoration(
                labelText: 'Referencia de Pago (opcional)',
                border: OutlineInputBorder(),
                hintText: 'Número de transferencia, cheque, etc.',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInformacionAdicional() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Información Adicional',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // Números de documento
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    initialValue: _numeroFactura,
                    decoration: const InputDecoration(
                      labelText: 'Número de Factura',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      _numeroFactura = value.isEmpty ? null : value;
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextFormField(
                    initialValue: _numeroOrden,
                    decoration: const InputDecoration(
                      labelText: 'Número de Orden',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      _numeroOrden = value.isEmpty ? null : value;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    initialValue: _numeroRemito,
                    decoration: const InputDecoration(
                      labelText: 'Número de Remito',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      _numeroRemito = value.isEmpty ? null : value;
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextFormField(
                    initialValue: _numeroGuia,
                    decoration: const InputDecoration(
                      labelText: 'Número de Guía',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      _numeroGuia = value.isEmpty ? null : value;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Información del proveedor
            TextFormField(
              initialValue: _referenciaProveedor,
              decoration: const InputDecoration(
                labelText: 'Referencia del Proveedor',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                _referenciaProveedor = value.isEmpty ? null : value;
              },
            ),
            const SizedBox(height: 16),

            // Información de entrega
            TextFormField(
              controller: _direccionEntregaController,
              decoration: const InputDecoration(
                labelText: 'Dirección de Entrega',
                border: OutlineInputBorder(),
              ),
              maxLines: 2,
            ),
            const SizedBox(height: 16),

            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _contactoProveedorController,
                    decoration: const InputDecoration(
                      labelText: 'Contacto del Proveedor',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextFormField(
                    controller: _telefonoProveedorController,
                    decoration: const InputDecoration(
                      labelText: 'Teléfono del Proveedor',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            TextFormField(
              controller: _emailProveedorController,
              decoration: const InputDecoration(
                labelText: 'Email del Proveedor',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _condicionesPagoController,
                    decoration: const InputDecoration(
                      labelText: 'Condiciones de Pago',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextFormField(
                    controller: _plazoEntregaController,
                    decoration: const InputDecoration(
                      labelText: 'Plazo de Entrega',
                      border: OutlineInputBorder(),
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
                labelText: 'Observaciones',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
          ],
        ),
      ),
    );
  }
}

class ItemCarritoCompra {
  final Producto producto;
  int cantidad;
  double precioUnitario;
  double subtotal;
  String? observaciones;

  ItemCarritoCompra({
    required this.producto,
    required this.cantidad,
    required this.precioUnitario,
    required this.subtotal,
    this.observaciones,
  });
}
