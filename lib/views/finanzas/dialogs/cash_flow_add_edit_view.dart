import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:isar/isar.dart';
import 'package:tienda_app/models/flujo_caja.dart';
import 'package:tienda_app/widgets/permission_widget.dart';

class CashFlowAddEditView extends ConsumerStatefulWidget {
  final int? flujoId;

  const CashFlowAddEditView({super.key, this.flujoId});

  @override
  ConsumerState<CashFlowAddEditView> createState() =>
      _CashFlowAddEditViewState();
}

class _CashFlowAddEditViewState extends ConsumerState<CashFlowAddEditView> {
  final _formKey = GlobalKey<FormState>();
  final _conceptoController = TextEditingController();
  final _descripcionController = TextEditingController();
  final _montoController = TextEditingController();
  final _numeroComprobanteController = TextEditingController();
  final _observacionesController = TextEditingController();

  String _tipoSeleccionado = 'ingreso';
  String _categoriaSeleccionada = 'general';
  String _metodoPagoSeleccionado = 'efectivo';
  DateTime _fechaSeleccionada = DateTime.now();
  bool _isLoading = false;
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _isEditing = widget.flujoId != null;
    if (_isEditing) {
      _loadFlujoData();
    }
  }

  @override
  void dispose() {
    _conceptoController.dispose();
    _descripcionController.dispose();
    _montoController.dispose();
    _numeroComprobanteController.dispose();
    _observacionesController.dispose();
    super.dispose();
  }

  Future<void> _loadFlujoData() async {
    if (widget.flujoId == null) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final isar = Isar.getInstance();
      if (isar != null) {
        final flujo = await isar.flujoCajas.get(widget.flujoId!);
        if (flujo != null) {
          setState(() {
            _conceptoController.text = flujo.concepto;
            _descripcionController.text = flujo.descripcion ?? '';
            _montoController.text = flujo.monto.toString();
            _numeroComprobanteController.text = flujo.numeroComprobante ?? '';
            _observacionesController.text = flujo.observaciones ?? '';
            _tipoSeleccionado = flujo.tipo;
            _categoriaSeleccionada = flujo.categoria;
            _metodoPagoSeleccionado = flujo.metodoPago ?? 'efectivo';
            _fechaSeleccionada = flujo.fecha;
          });
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al cargar flujo de caja: $e')),
        );
      }
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _guardarFlujo() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final isar = Isar.getInstance();
      if (isar != null) {
        final flujo = FlujoCaja(
          concepto: _conceptoController.text,
          descripcion: _descripcionController.text,
          monto: double.parse(_montoController.text),
          tipo: _tipoSeleccionado,
          categoria: _categoriaSeleccionada,
          fecha: _fechaSeleccionada,
          numeroComprobante: _numeroComprobanteController.text,
          metodoPago: _metodoPagoSeleccionado,
          observaciones: _observacionesController.text,
          usuarioId: 1, // TODO: Obtener usuario actual
        );

        await isar.writeTxn(() async {
          if (_isEditing) {
            flujo.id = widget.flujoId!;
            await isar.flujoCajas.put(flujo);
          } else {
            await isar.flujoCajas.put(flujo);
          }
        });

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                _isEditing
                    ? 'Flujo de caja actualizado'
                    : 'Flujo de caja creado',
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
            content: Text('Error al guardar flujo de caja: $e'),
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
        title: Text(
          _isEditing ? 'Editar Flujo de Caja' : 'Nuevo Flujo de Caja',
        ),
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
                      // Concepto
                      PermissionWidget(
                        action: 'create',
                        resource: 'flujo_caja',
                        child: TextFormField(
                          controller: _conceptoController,
                          decoration: InputDecoration(
                            labelText: 'Concepto',
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
                              return 'Ingrese el concepto';
                            }
                            return null;
                          },
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Descripción
                      PermissionWidget(
                        action: 'create',
                        resource: 'flujo_caja',
                        child: TextFormField(
                          controller: _descripcionController,
                          maxLines: 2,
                          decoration: InputDecoration(
                            labelText: 'Descripción',
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

                      // Tipo
                      PermissionWidget(
                        action: 'create',
                        resource: 'flujo_caja',
                        child: DropdownButtonFormField<String>(
                          value: _tipoSeleccionado,
                          decoration: InputDecoration(
                            labelText: 'Tipo',
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
                              value: 'ingreso',
                              child: Text('Ingreso'),
                            ),
                            DropdownMenuItem(
                              value: 'egreso',
                              child: Text('Egreso'),
                            ),
                          ],
                          onChanged: (value) {
                            setState(() {
                              _tipoSeleccionado = value!;
                            });
                          },
                          validator: (value) {
                            if (value == null) {
                              return 'Seleccione un tipo';
                            }
                            return null;
                          },
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Categoría
                      PermissionWidget(
                        action: 'create',
                        resource: 'flujo_caja',
                        child: DropdownButtonFormField<String>(
                          value: _categoriaSeleccionada,
                          decoration: InputDecoration(
                            labelText: 'Categoría',
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
                              value: 'general',
                              child: Text('General'),
                            ),
                            DropdownMenuItem(
                              value: 'ventas',
                              child: Text('Ventas'),
                            ),
                            DropdownMenuItem(
                              value: 'compras',
                              child: Text('Compras'),
                            ),
                            DropdownMenuItem(
                              value: 'gastos',
                              child: Text('Gastos'),
                            ),
                            DropdownMenuItem(
                              value: 'servicios',
                              child: Text('Servicios'),
                            ),
                            DropdownMenuItem(
                              value: 'salarios',
                              child: Text('Salarios'),
                            ),
                            DropdownMenuItem(
                              value: 'impuestos',
                              child: Text('Impuestos'),
                            ),
                            DropdownMenuItem(
                              value: 'marketing',
                              child: Text('Marketing'),
                            ),
                            DropdownMenuItem(
                              value: 'alquiler',
                              child: Text('Alquiler'),
                            ),
                            DropdownMenuItem(
                              value: 'utilities',
                              child: Text('Servicios Públicos'),
                            ),
                          ],
                          onChanged: (value) {
                            setState(() {
                              _categoriaSeleccionada = value!;
                            });
                          },
                          validator: (value) {
                            if (value == null) {
                              return 'Seleccione una categoría';
                            }
                            return null;
                          },
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Fecha
                      PermissionWidget(
                        action: 'create',
                        resource: 'flujo_caja',
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

                      // Monto
                      PermissionWidget(
                        action: 'create',
                        resource: 'flujo_caja',
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

                      // Número de Comprobante
                      PermissionWidget(
                        action: 'create',
                        resource: 'flujo_caja',
                        child: TextFormField(
                          controller: _numeroComprobanteController,
                          decoration: InputDecoration(
                            labelText: 'Número de Comprobante',
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

                      // Método de Pago
                      PermissionWidget(
                        action: 'create',
                        resource: 'flujo_caja',
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
                        resource: 'flujo_caja',
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
                        resource: 'flujo_caja',
                        child: ElevatedButton(
                          onPressed: _isLoading ? null : _guardarFlujo,
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
                                        ? 'Actualizar Flujo de Caja'
                                        : 'Crear Flujo de Caja',
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
