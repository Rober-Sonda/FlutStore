import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:isar/isar.dart';
import 'package:tienda_app/models/compra.dart';
import 'package:tienda_app/models/proveedor.dart';
import 'package:tienda_app/src/app_routes.dart';
import 'package:tienda_app/widgets/permission_widget.dart';

class PurchaseAddEditView extends ConsumerStatefulWidget {
  final int? compraId;

  const PurchaseAddEditView({super.key, this.compraId});

  @override
  ConsumerState<PurchaseAddEditView> createState() =>
      _PurchaseAddEditViewState();
}

class _PurchaseAddEditViewState extends ConsumerState<PurchaseAddEditView> {
  final _formKey = GlobalKey<FormState>();
  final _numeroFacturaController = TextEditingController();
  final _montoController = TextEditingController();
  final _observacionesController = TextEditingController();

  String _metodoPagoSeleccionado = 'efectivo';
  String _estadoSeleccionado = 'pendiente';
  int? _proveedorSeleccionado;
  DateTime _fechaSeleccionada = DateTime.now();
  bool _isLoading = false;
  bool _isEditing = false;

  List<Proveedor> _proveedores = [];

  @override
  void initState() {
    super.initState();
    _isEditing = widget.compraId != null;
    if (_isEditing) {
      _loadCompraData();
    }
    _loadProveedores();
  }

  @override
  void dispose() {
    _numeroFacturaController.dispose();
    _montoController.dispose();
    _observacionesController.dispose();
    super.dispose();
  }

  Future<void> _loadProveedores() async {
    try {
      final isar = Isar.getInstance();
      if (isar != null) {
        final proveedores = await isar.proveedors.where().findAll();
        setState(() {
          _proveedores = proveedores;
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al cargar proveedores: $e')),
        );
      }
    }
  }

  Future<void> _loadCompraData() async {
    if (widget.compraId == null) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final isar = Isar.getInstance();
      if (isar != null) {
        final compra = await isar.compras.get(widget.compraId!);
        if (compra != null) {
          setState(() {
            _numeroFacturaController.text = compra.numeroFactura;
            _montoController.text = compra.total.toString();
            _observacionesController.text = compra.observaciones ?? '';
            _metodoPagoSeleccionado = compra.metodoPago;
            _estadoSeleccionado = compra.estado;
            _proveedorSeleccionado = compra.proveedorId;
            _fechaSeleccionada = compra.fecha;
          });
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error al cargar compra: $e')));
      }
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _guardarCompra() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final isar = Isar.getInstance();
      if (isar != null) {
        final compra = Compra(
          numeroFactura: _numeroFacturaController.text,
          fecha: _fechaSeleccionada,
          total: double.parse(_montoController.text),
          observaciones: _observacionesController.text,
          estado: _estadoSeleccionado,
          proveedorId: _proveedorSeleccionado,
          usuarioId: 1, // TODO: Obtener usuario actual
          metodoPago: _metodoPagoSeleccionado,
        );

        await isar.writeTxn(() async {
          if (_isEditing) {
            compra.id = widget.compraId!;
            await isar.compras.put(compra);
          } else {
            await isar.compras.put(compra);
          }
        });

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                _isEditing ? 'Compra actualizada' : 'Compra creada',
              ),
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
            content: Text('Error al guardar compra: $e'),
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
        title: Text(_isEditing ? 'Editar Compra' : 'Nueva Compra'),
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
                      // Proveedor
                      PermissionWidget(
                        action: 'create',
                        resource: 'compras',
                        child: DropdownButtonFormField<int>(
                          value: _proveedorSeleccionado,
                          decoration: InputDecoration(
                            labelText: 'Proveedor',
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
                              _proveedores.map((proveedor) {
                                return DropdownMenuItem(
                                  value: proveedor.id,
                                  child: Text(proveedor.nombre),
                                );
                              }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _proveedorSeleccionado = value;
                            });
                          },
                          validator: (value) {
                            if (value == null) {
                              return 'Seleccione un proveedor';
                            }
                            return null;
                          },
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Fecha
                      PermissionWidget(
                        action: 'create',
                        resource: 'compras',
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
                        resource: 'compras',
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Ingrese el número de factura';
                            }
                            return null;
                          },
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Monto
                      PermissionWidget(
                        action: 'create',
                        resource: 'compras',
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
                        resource: 'compras',
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

                      // Estado
                      PermissionWidget(
                        action: 'create',
                        resource: 'compras',
                        child: DropdownButtonFormField<String>(
                          value: _estadoSeleccionado,
                          decoration: InputDecoration(
                            labelText: 'Estado',
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
                              value: 'pendiente',
                              child: Text('Pendiente'),
                            ),
                            DropdownMenuItem(
                              value: 'confirmada',
                              child: Text('Confirmada'),
                            ),
                            DropdownMenuItem(
                              value: 'cancelada',
                              child: Text('Cancelada'),
                            ),
                            DropdownMenuItem(
                              value: 'recibida',
                              child: Text('Recibida'),
                            ),
                          ],
                          onChanged: (value) {
                            setState(() {
                              _estadoSeleccionado = value!;
                            });
                          },
                          validator: (value) {
                            if (value == null) {
                              return 'Seleccione un estado';
                            }
                            return null;
                          },
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Observaciones
                      PermissionWidget(
                        action: 'create',
                        resource: 'compras',
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
                        resource: 'compras',
                        child: ElevatedButton(
                          onPressed: _isLoading ? null : _guardarCompra,
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
                                        ? 'Actualizar Compra'
                                        : 'Crear Compra',
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
