import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:isar/isar.dart';
import '../../../models/venta.dart';
import '../../../models/producto.dart';
import '../../../models/cliente.dart';
import '../../../services/isar_service.dart';
import '../../../services/numeracion_service.dart';
import '../../../widgets/permission_widget.dart';

class SaleAddEditView extends ConsumerStatefulWidget {
  final int? ventaId;

  const SaleAddEditView({super.key, this.ventaId});

  @override
  ConsumerState<SaleAddEditView> createState() => _SaleAddEditViewState();
}

class _SaleAddEditViewState extends ConsumerState<SaleAddEditView> {
  final _formKey = GlobalKey<FormState>();
  final _codigoBarrasController = TextEditingController();
  final _observacionesController = TextEditingController();
  final _referenciaPagoController = TextEditingController();
  final _direccionEntregaController = TextEditingController();
  final _telefonoClienteController = TextEditingController();
  final _emailClienteController = TextEditingController();
  final _notasInternasController = TextEditingController();

  // Datos de la venta
  int? _clienteSeleccionadoId;
  String _metodoPago = 'Efectivo';
  String _estado = 'completada';
  double _total = 0.0;
  double _montoPagado = 0.0;
  double _cambio = 0.0;

  // Números de documento
  String? _numeroFactura;
  String? _numeroRecibo;
  String? _numeroTicket;
  String? _numeroOrden;

  // Información adicional
  String? _banco;
  String? _numeroTarjeta;
  String? _condicionesVenta;

  // Productos
  List<Producto> _productos = [];
  List<Cliente> _clientes = [];
  final List<ItemCarritoVenta> _carrito = [];

  // Estados
  bool _isLoading = true;
  bool _isSaving = false;
  final bool _generarNumerosAutomaticos = true;
  Venta? _venta;

  final List<String> _metodosPago = [
    'Efectivo',
    'Tarjeta de Débito',
    'Tarjeta de Crédito',
    'Transferencia',
    'Cheque',
    'Otro',
  ];

  final List<String> _bancos = [
    'Banco Nación',
    'Banco Provincia',
    'Banco Ciudad',
    'Banco Santander',
    'Banco Galicia',
    'Banco Macro',
    'Banco HSBC',
    'Otro',
  ];

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
    _telefonoClienteController.dispose();
    _emailClienteController.dispose();
    _notasInternasController.dispose();
    super.dispose();
  }

  Future<void> _loadData() async {
    try {
      setState(() => _isLoading = true);

      final isar = await ref.read(isarServiceProvider).db;

      // Cargar productos y clientes
      _productos = await isar.collection<Producto>().where().findAll();
      _clientes = await isar.collection<Cliente>().where().findAll();

      if (widget.ventaId != null) {
        _venta = await isar.collection<Venta>().get(widget.ventaId!);
        if (_venta != null) {
          _loadVentaData();
        }
      } else {
        // Generar números automáticos para nueva venta
        if (_generarNumerosAutomaticos) {
          await _generarNumerosAutomaticosVenta();
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

  Future<void> _generarNumerosAutomaticosVenta() async {
    try {
      final isar = await ref.read(isarServiceProvider).db;
      final numeracionService = NumeracionService();

      final numeroFactura = await numeracionService.generarNumeroFacturaVenta(
        isar,
      );
      final numeroRecibo = await numeracionService.generarNumeroReciboVenta(
        isar,
      );
      final numeroTicket = await numeracionService.generarNumeroTicketVenta(
        isar,
      );

      setState(() {
        _numeroFactura = numeroFactura;
        _numeroRecibo = numeroRecibo;
        _numeroTicket = numeroTicket;
      });
    } catch (e) {
      print('Error generando números automáticos: $e');
    }
  }

  void _loadVentaData() {
    if (_venta == null) return;

    _clienteSeleccionadoId = _venta!.clienteId;
    _metodoPago = _venta!.metodoPago;
    _estado = _venta!.estado;
    _total = _venta!.total;
    _montoPagado = _venta!.montoPagado ?? 0.0;
    _cambio = _venta!.cambio ?? 0.0;
    _numeroFactura = _venta!.numeroFactura;
    _numeroRecibo = _venta!.numeroRecibo;
    _numeroTicket = _venta!.numeroTicket;
    _numeroOrden = _venta!.numeroOrden;
    _banco = _venta!.banco;
    _numeroTarjeta = _venta!.numeroTarjeta;
    _referenciaPagoController.text = _venta!.referenciaPago ?? '';
    _direccionEntregaController.text = _venta!.direccionEntrega ?? '';
    _telefonoClienteController.text = _venta!.telefonoCliente ?? '';
    _emailClienteController.text = _venta!.emailCliente ?? '';
    _condicionesVenta = _venta!.condicionesVenta;
    _notasInternasController.text = _venta!.notasInternas ?? '';
    _observacionesController.text = _venta!.observaciones ?? '';
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
                      'Precio: \$${producto.precio?.toStringAsFixed(2) ?? '0.00'} - '
                      'Stock: ${producto.stockActual ?? 0}',
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
      text: (producto.precio ?? 0.0).toString(),
    );

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Row(
              children: [
                Icon(Icons.add_shopping_cart, color: Colors.blue),
                const SizedBox(width: 8),
                Expanded(
                  child: Text('Agregar ${producto.nombre ?? 'Producto'}'),
                ),
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
                          'Precio sugerido: \$${(producto.precio ?? 0.0).toStringAsFixed(2)}',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                        if (producto.stockActual != null)
                          Text(
                            'Stock disponible: ${producto.stockActual}',
                            style: TextStyle(
                              color:
                                  producto.stockActual! > 0
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
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.blue[200]!),
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
                          color: Colors.blue,
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
                  backgroundColor: Colors.blue,
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
        _carrito[index] = ItemCarritoVenta(
          producto: producto,
          cantidad: cantidad,
          precioUnitario: precio,
          subtotal: subtotal,
        );
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${producto.nombre} actualizado en el carrito'),
          backgroundColor: Colors.blue,
        ),
      );
    } else {
      setState(() {
        _carrito.add(
          ItemCarritoVenta(
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
    _cambio = _montoPagado - _total;
    setState(() {});
  }

  void _removerProducto(int index) {
    setState(() {
      _carrito.removeAt(index);
      _calcularTotal();
    });
  }

  Future<void> _guardarVenta() async {
    if (!_formKey.currentState!.validate()) return;
    if (_carrito.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Debe agregar al menos un producto')),
      );
      return;
    }
    if (_clienteSeleccionadoId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Debe seleccionar un cliente')),
      );
      return;
    }

    try {
      setState(() => _isSaving = true);

      final isar = await ref.read(isarServiceProvider).db;

      final venta =
          _venta ??
          Venta(
            clienteId: _clienteSeleccionadoId!,
            clienteNombre: _clientes.firstWhere((c) => c.id == _clienteSeleccionadoId!, orElse: () => Cliente(id: 0, nombre: '')).nombre ?? '',
            clienteEmail: _emailClienteController.text.isEmpty
                ? (_clientes.firstWhere((c) => c.id == _clienteSeleccionadoId!, orElse: () => Cliente(id: 0, nombre: '')).email ?? '')
                : _emailClienteController.text,
            clienteTelefono: _telefonoClienteController.text.isEmpty
                ? ''
                : _telefonoClienteController.text,
            clienteDocumento: '',
            clienteDireccion: _direccionEntregaController.text.isEmpty
                ? (_clientes.firstWhere((c) => c.id == _clienteSeleccionadoId!, orElse: () => Cliente(id: 0, nombre: '')).direccion ?? '')
                : _direccionEntregaController.text,
            clienteTipoCliente: '',
            fecha: DateTime.now(),
            total: _total,
            metodoPago: _metodoPago,
            observaciones:
                _observacionesController.text.isEmpty
                    ? null
                    : _observacionesController.text,
            estado: _estado,
            numeroFactura: _numeroFactura,
            numeroRecibo: _numeroRecibo,
            numeroTicket: _numeroTicket,
            numeroOrden: _numeroOrden,
            montoPagado: _montoPagado,
            cambio: _cambio,
            referenciaPago:
                _referenciaPagoController.text.isEmpty
                    ? null
                    : _referenciaPagoController.text,
            banco: _banco,
            numeroTarjeta: _numeroTarjeta,
            direccionEntrega:
                _direccionEntregaController.text.isEmpty
                    ? null
                    : _direccionEntregaController.text,
            telefonoCliente:
                _telefonoClienteController.text.isEmpty
                    ? null
                    : _telefonoClienteController.text,
            emailCliente:
                _emailClienteController.text.isEmpty
                    ? null
                    : _emailClienteController.text,
            condicionesVenta: _condicionesVenta,
            notasInternas:
                _notasInternasController.text.isEmpty
                    ? null
                    : _notasInternasController.text,
            usuarioId: 1, // TODO: Obtener ID del usuario actual
          );

      // Actualizar datos de la venta
      venta.clienteId = _clienteSeleccionadoId!;
      venta.fecha = DateTime.now();
      venta.total = _total;
      venta.metodoPago = _metodoPago;
      venta.observaciones =
          _observacionesController.text.isEmpty
              ? null
              : _observacionesController.text;
      venta.estado = _estado;
      venta.numeroFactura = _numeroFactura;
      venta.numeroRecibo = _numeroRecibo;
      venta.numeroTicket = _numeroTicket;
      venta.numeroOrden = _numeroOrden;
      venta.montoPagado = _montoPagado;
      venta.cambio = _cambio;
      venta.referenciaPago =
          _referenciaPagoController.text.isEmpty
              ? null
              : _referenciaPagoController.text;
      venta.banco = _banco;
      venta.numeroTarjeta = _numeroTarjeta;
      venta.direccionEntrega =
          _direccionEntregaController.text.isEmpty
              ? null
              : _direccionEntregaController.text;
      venta.telefonoCliente =
          _telefonoClienteController.text.isEmpty
              ? null
              : _telefonoClienteController.text;
      venta.emailCliente =
          _emailClienteController.text.isEmpty
              ? null
              : _emailClienteController.text;
      venta.condicionesVenta = _condicionesVenta;
      venta.notasInternas =
          _notasInternasController.text.isEmpty
              ? null
              : _notasInternasController.text;

      await isar.writeTxn(() async {
        await isar.collection<Venta>().put(venta);
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Venta guardada exitosamente')),
        );
        context.pop();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error al guardar venta: $e')));
      }
    } finally {
      setState(() => _isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.ventaId == null ? 'Nueva Venta' : 'Editar Venta'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body:
          _isLoading
              ? const Center(child: CircularProgressIndicator())
              : PermissionWidget(
                resource: 'ventas',
                action: widget.ventaId == null ? 'create' : 'update',
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
                onPressed: _isSaving ? null : _guardarVenta,
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
                        : const Text('Guardar Venta'),
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

            // Cliente
            DropdownButtonFormField<int?>(
              value: _clienteSeleccionadoId,
              decoration: const InputDecoration(
                labelText: 'Cliente *',
                border: OutlineInputBorder(),
              ),
              items: [
                const DropdownMenuItem<int?>(
                  value: null,
                  child: Text('Seleccionar cliente...'),
                ),
                ..._clientes.map(
                  (cliente) => DropdownMenuItem<int?>(
                    value: cliente.id,
                    child: Text(cliente.nombre),
                  ),
                ),
              ],
              onChanged: (value) {
                setState(() => _clienteSeleccionadoId = value);
              },
              validator: (value) {
                if (value == null) return 'Debe seleccionar un cliente';
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
                  value: 'completada',
                  child: Text('Completada'),
                ),
                DropdownMenuItem(value: 'cancelada', child: Text('Cancelada')),
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
                    initialValue: _cambio.toString(),
                    decoration: const InputDecoration(
                      labelText: 'Cambio',
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
            const SizedBox(height: 16),

            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String?>(
                    value: _banco,
                    decoration: const InputDecoration(
                      labelText: 'Banco (opcional)',
                      border: OutlineInputBorder(),
                    ),
                    items: [
                      const DropdownMenuItem<String?>(
                        value: null,
                        child: Text('Seleccionar...'),
                      ),
                      ..._bancos.map(
                        (banco) =>
                            DropdownMenuItem(value: banco, child: Text(banco)),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() => _banco = value);
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextFormField(
                    initialValue: _numeroTarjeta,
                    decoration: const InputDecoration(
                      labelText: 'Número de Tarjeta (opcional)',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      _numeroTarjeta = value.isEmpty ? null : value;
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
                    initialValue: _numeroRecibo,
                    decoration: const InputDecoration(
                      labelText: 'Número de Recibo',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      _numeroRecibo = value.isEmpty ? null : value;
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
                    initialValue: _numeroTicket,
                    decoration: const InputDecoration(
                      labelText: 'Número de Ticket',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      _numeroTicket = value.isEmpty ? null : value;
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

            // Información de entrega
            TextFormField(
              controller: _direccionEntregaController,
              decoration: const InputDecoration(
                labelText: 'Dirección de Entrega (opcional)',
                border: OutlineInputBorder(),
              ),
              maxLines: 2,
            ),
            const SizedBox(height: 16),

            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _telefonoClienteController,
                    decoration: const InputDecoration(
                      labelText: 'Teléfono del Cliente',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextFormField(
                    controller: _emailClienteController,
                    decoration: const InputDecoration(
                      labelText: 'Email del Cliente',
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
            const SizedBox(height: 16),

            TextFormField(
              controller: _notasInternasController,
              decoration: const InputDecoration(
                labelText: 'Notas Internas',
                border: OutlineInputBorder(),
              ),
              maxLines: 2,
            ),
          ],
        ),
      ),
    );
  }
}

class ItemCarritoVenta {
  final Producto producto;
  int cantidad;
  double precioUnitario;
  double subtotal;

  ItemCarritoVenta({
    required this.producto,
    required this.cantidad,
    required this.precioUnitario,
    required this.subtotal,
  });
}
