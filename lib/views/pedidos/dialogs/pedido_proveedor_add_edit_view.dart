import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:isar/isar.dart';
import '../../../models/pedido_proveedor.dart';
import '../../../models/proveedor.dart';
import '../../../models/producto.dart';
import '../../../services/isar_service.dart';
import '../../../models/app_theme.dart';
import '../../../models/font_config.dart';
import '../../../services/app_config_service.dart';

class PedidoProveedorAddEditView extends ConsumerStatefulWidget {
  final int? pedidoId;

  const PedidoProveedorAddEditView({super.key, this.pedidoId});

  @override
  ConsumerState<PedidoProveedorAddEditView> createState() =>
      _PedidoProveedorAddEditViewState();
}

class _PedidoProveedorAddEditViewState
    extends ConsumerState<PedidoProveedorAddEditView> {
  final _formKey = GlobalKey<FormState>();
  final _observacionesController = TextEditingController();

  List<Proveedor> _proveedores = [];
  List<Producto> _productos = [];
  PedidoProveedor? _pedido;
  Proveedor? _proveedorSeleccionado;
  AppTheme? _currentTheme;
  FontConfig? _currentFontConfig;
  bool _isLoading = true;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  void dispose() {
    _observacionesController.dispose();
    super.dispose();
  }

  Future<void> _loadData() async {
    try {
      final isar = await ref.read(isarServiceProvider).db;

      // Cargar proveedores y productos
      final proveedores = await isar.collection<Proveedor>().where().findAll();
      _proveedores = proveedores;

      final productos = await isar.collection<Producto>().where().findAll();
      _productos = productos;

      // Cargar tema
      final configService = ref.read(appConfigServiceProvider);
      final theme = await configService.getSelectedTheme();
      final fontConfig = await configService.getSelectedFontConfig();

      // Si es edición, cargar el pedido
      if (widget.pedidoId != null) {
        _pedido = await isar.collection<PedidoProveedor>().get(
          widget.pedidoId!,
        );
        if (_pedido != null) {
          _proveedorSeleccionado = _proveedores.firstWhere(
            (p) => p.id == _pedido!.proveedorId,
            orElse: () => _proveedores.first,
          );
          _observacionesController.text = _pedido!.observaciones ?? '';
        }
      }

      setState(() {
        _currentTheme = theme;
        _currentFontConfig = fontConfig;
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error al cargar datos: $e')));
      }
    }
  }

  Future<void> _savePedido() async {
    if (!_formKey.currentState!.validate()) return;
    if (_proveedorSeleccionado == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Debes seleccionar un proveedor')),
      );
      return;
    }

    setState(() => _isSaving = true);

    try {
      final isar = await ref.read(isarServiceProvider).db;

      _pedido ??= PedidoProveedor();
      _pedido!.proveedorId = _proveedorSeleccionado!.id;
      _pedido!.observaciones = _observacionesController.text.trim();
      _pedido!.totalEstimado = _pedido!.calcularTotalEstimado();

      await isar.writeTxn(() async {
        await isar.collection<PedidoProveedor>().put(_pedido!);
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Pedido guardado exitosamente'),
            backgroundColor: Colors.green,
          ),
        );
        context.pop();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error al guardar: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isSaving = false);
      }
    }
  }

  void _agregarProducto() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Agregar Producto'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DropdownButtonFormField<Producto>(
                  decoration: const InputDecoration(labelText: 'Producto'),
                  items:
                      _productos.map((producto) {
                        return DropdownMenuItem(
                          value: producto,
                          child: Text(producto.nombre ?? 'Producto sin nombre'),
                        );
                      }).toList(),
                  onChanged: (producto) {
                    // TODO: Implementar selección de producto
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Cantidad'),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Precio Estimado',
                  ),
                  keyboardType: TextInputType.number,
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
                  // TODO: Implementar agregar producto
                  Navigator.of(context).pop();
                },
                child: const Text('Agregar'),
              ),
            ],
          ),
    );
  }

  Widget _buildProductoItem(ItemPedidoProveedor item) {
    final theme = _currentTheme ?? AppTheme.darkTheme;
    final fontConfig = _currentFontConfig ?? FontConfig.defaultConfig;

    return Card(
      color: theme.surfaceColor,
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        title: Text(
          item.nombreProducto,
          style: TextStyle(
            color: theme.textColor,
            fontFamily: fontConfig.bodyFont,
          ),
        ),
        subtitle: Text(
          'Cantidad: ${item.cantidad} - Precio: \$${item.precioEstimado?.toStringAsFixed(2) ?? 'N/A'}',
          style: TextStyle(
            color: theme.textSecondaryColor,
            fontFamily: fontConfig.bodyFont,
          ),
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete, color: Colors.red),
          onPressed: () {
            // TODO: Implementar eliminar producto
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      final theme = _currentTheme ?? AppTheme.darkTheme;
      return Scaffold(
        backgroundColor: theme.backgroundColor,
        body: Center(
          child: CircularProgressIndicator(color: theme.primaryColor),
        ),
      );
    }

    final theme = _currentTheme ?? AppTheme.darkTheme;
    final fontConfig = _currentFontConfig ?? FontConfig.defaultConfig;

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: theme.backgroundColor,
        title: Text(
          widget.pedidoId != null ? 'Editar Pedido' : 'Nuevo Pedido',
          style: TextStyle(color: theme.textColor),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: theme.textColor),
          onPressed: () => context.pop(),
        ),
        actions: [
          if (!_isSaving)
            TextButton(
              onPressed: _savePedido,
              child: Text(
                'Guardar',
                style: TextStyle(color: theme.primaryColor),
              ),
            ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Selección de proveedor
              Card(
                color: theme.surfaceColor,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Proveedor',
                        style: TextStyle(
                          color: theme.textColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: fontConfig.titleFont,
                        ),
                      ),
                      const SizedBox(height: 16),
                      DropdownButtonFormField<Proveedor>(
                        value: _proveedorSeleccionado,
                        decoration: InputDecoration(
                          labelText: 'Seleccionar Proveedor',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          filled: true,
                          fillColor: theme.backgroundColor,
                        ),
                        items:
                            _proveedores.map((proveedor) {
                              return DropdownMenuItem(
                                value: proveedor,
                                child: Text(proveedor.nombre),
                              );
                            }).toList(),
                        onChanged: (proveedor) {
                          setState(() {
                            _proveedorSeleccionado = proveedor;
                          });
                        },
                        validator: (value) {
                          if (value == null) {
                            return 'Debes seleccionar un proveedor';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Productos del pedido
              Card(
                color: theme.surfaceColor,
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
                            style: TextStyle(
                              color: theme.textColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: fontConfig.titleFont,
                            ),
                          ),
                          ElevatedButton.icon(
                            onPressed: _agregarProducto,
                            icon: const Icon(Icons.add),
                            label: const Text('Agregar'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: theme.primaryColor,
                              foregroundColor: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      if (_pedido?.items.isEmpty ?? true)
                        Center(
                          child: Column(
                            children: [
                              Icon(
                                Icons.inventory_2_outlined,
                                size: 48,
                                color: theme.textSecondaryColor,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'No hay productos agregados',
                                style: TextStyle(
                                  color: theme.textSecondaryColor,
                                  fontFamily: fontConfig.bodyFont,
                                ),
                              ),
                            ],
                          ),
                        )
                      else
                        ...(_pedido?.items.map(
                              (item) => _buildProductoItem(item),
                            ) ??
                            []),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Observaciones
              Card(
                color: theme.surfaceColor,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Observaciones',
                        style: TextStyle(
                          color: theme.textColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: fontConfig.titleFont,
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _observacionesController,
                        decoration: InputDecoration(
                          labelText: 'Observaciones del pedido',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          filled: true,
                          fillColor: theme.backgroundColor,
                        ),
                        maxLines: 4,
                        style: TextStyle(
                          color: theme.textColor,
                          fontFamily: fontConfig.bodyFont,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Botón guardar
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _isSaving ? null : _savePedido,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.primaryColor,
                    foregroundColor: Colors.white,
                  ),
                  child:
                      _isSaving
                          ? const CircularProgressIndicator(color: Colors.white)
                          : Text(
                            'Guardar Pedido',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: fontConfig.bodyFont,
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
