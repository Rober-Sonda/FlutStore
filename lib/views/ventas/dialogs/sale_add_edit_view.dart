import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:isar/isar.dart';
import 'package:tienda_app/models/venta.dart';
import 'package:tienda_app/models/cliente.dart';
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
  final _conceptoController = TextEditingController();
  final _descripcionController = TextEditingController();
  final _montoController = TextEditingController();
  final _numeroFacturaController = TextEditingController();
  final _observacionesController = TextEditingController();

  String _tipoSeleccionado = 'ingreso';
  String _metodoPagoSeleccionado = 'efectivo';
  int? _clienteSeleccionado;
  DateTime _fechaSeleccionada = DateTime.now();
  bool _isLoading = false;
  bool _isEditing = false;

  List<Cliente> _clientes = [];

  @override
  void initState() {
    super.initState();
    _isEditing = widget.ventaId != null;
    if (_isEditing) {
      _loadVentaData();
    }
    _loadClientes();
  }

  @override
  void dispose() {
    _conceptoController.dispose();
    _descripcionController.dispose();
    _montoController.dispose();
    _numeroFacturaController.dispose();
    _observacionesController.dispose();
    super.dispose();
  }

  Future<void> _loadClientes() async {
    try {
      final isar = Isar.getInstance();
      if (isar != null) {
        final clientes = await isar.clientes.where().findAll();
        setState(() {
          _clientes = clientes;
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error al cargar clientes: $e')));
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
            _conceptoController.text = venta.numeroFactura ?? '';
            _descripcionController.text = venta.observaciones ?? '';
            _montoController.text = venta.total.toString();
            _numeroFacturaController.text = venta.numeroFactura ?? '';
            _observacionesController.text = venta.observaciones ?? '';
            _tipoSeleccionado = 'ingreso';
            _metodoPagoSeleccionado = venta.metodoPago;
            _clienteSeleccionado = venta.clienteId;
            _fechaSeleccionada = venta.fecha;
          });
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error al cargar venta: $e')));
      }
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _guardarVenta() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final isar = Isar.getInstance();
      if (isar != null) {
        final venta = Venta(
          clienteId: _clienteSeleccionado ?? 1,
          fecha: _fechaSeleccionada,
          total: double.parse(_montoController.text),
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
          SnackBar(
            content: Text('Error al guardar venta: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _selectDate() async {
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
                      // Cliente
                      PermissionWidget(
                        action: 'create',
                        resource: 'ventas',
                        child: DropdownButtonFormField<int>(
                          value: _clienteSeleccionado,
                          decoration: InputDecoration(
                            labelText: 'Cliente',
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
                              borderSide: BorderSide(
                                color: Colors.indigo[700]!,
                              ),
                            ),
                          ),
                          items:
                              _clientes.map((cliente) {
                                return DropdownMenuItem(
                                  value: cliente.id,
                                  child: Text(cliente.nombre),
                                );
                              }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _clienteSeleccionado = value;
                            });
                          },
                          validator: (value) {
                            if (value == null) {
                              return 'Seleccione un cliente';
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
                          onTap: _selectDate,
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey[700]!),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.calendar_today,
                                  color: Colors.grey[400],
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  'Fecha: ${_fechaSeleccionada.day}/${_fechaSeleccionada.month}/${_fechaSeleccionada.year}',
                                  style: TextStyle(color: Colors.grey[300]),
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
                              borderSide: BorderSide(
                                color: Colors.indigo[700]!,
                              ),
                            ),
                          ),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Monto
                      PermissionWidget(
                        action: 'create',
                        resource: 'ventas',
                        child: TextFormField(
                          controller: _montoController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'Monto',
                            labelStyle: TextStyle(color: Colors.grey[400]),
                            prefixText: '\$ ',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Colors.grey[700]!),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: Colors.indigo[700]!,
                              ),
                            ),
                          ),
                          style: const TextStyle(color: Colors.white),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Ingrese el monto';
                            }
                            if (double.tryParse(value) == null) {
                              return 'Ingrese un monto válido';
                            }
                            return null;
                          },
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
                              borderSide: BorderSide(
                                color: Colors.indigo[700]!,
                              ),
                            ),
                          ),
                          items: const [
                            DropdownMenuItem(
                              value: 'efectivo',
                              child: Text('Efectivo'),
                            ),
                            DropdownMenuItem(
                              value: 'tarjeta',
                              child: Text('Tarjeta'),
                            ),
                            DropdownMenuItem(
                              value: 'transferencia',
                              child: Text('Transferencia'),
                            ),
                            DropdownMenuItem(
                              value: 'cheque',
                              child: Text('Cheque'),
                            ),
                            DropdownMenuItem(
                              value: 'pago_movil',
                              child: Text('Pago Móvil'),
                            ),
                          ],
                          onChanged: (value) {
                            setState(() {
                              _metodoPagoSeleccionado = value!;
                            });
                          },
                          validator: (value) {
                            if (value == null) {
                              return 'Seleccione un método de pago';
                            }
                            return null;
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
                              borderSide: BorderSide(
                                color: Colors.indigo[700]!,
                              ),
                            ),
                          ),
                          style: const TextStyle(color: Colors.white),
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
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child:
                              _isLoading
                                  ? const SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.white,
                                      ),
                                    ),
                                  )
                                  : Text(
                                    _isEditing
                                        ? 'Actualizar Venta'
                                        : 'Crear Venta',
                                    style: const TextStyle(
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
