import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../models/cuenta_corriente.dart';
import '../../../models/cliente.dart';
import '../../../services/isar_service.dart';
import '../../../widgets/permission_widget.dart';

class CuentaCorrienteAddEditView extends ConsumerStatefulWidget {
  final int? cuentaId;

  const CuentaCorrienteAddEditView({super.key, this.cuentaId});

  @override
  ConsumerState<CuentaCorrienteAddEditView> createState() =>
      _CuentaCorrienteAddEditViewState();
}

class _CuentaCorrienteAddEditViewState
    extends ConsumerState<CuentaCorrienteAddEditView> {
  final _formKey = GlobalKey<FormState>();
  final _montoController = TextEditingController();
  final _observacionesController = TextEditingController();
  final _metodoPagoController = TextEditingController();
  final _referenciaController = TextEditingController();

  DateTime? _fechaCreacion;
  DateTime? _fechaVencimiento;
  bool _activa = true;
  int _totalCuotas = 1;
  List<Cliente> _clientes = [];
  Cliente? _clienteSeleccionado;

  bool _isLoading = true;
  bool _isSaving = false;
  CuentaCorriente? _cuenta;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  void dispose() {
    _montoController.dispose();
    _observacionesController.dispose();
    _metodoPagoController.dispose();
    _referenciaController.dispose();
    super.dispose();
  }

  Future<void> _loadData() async {
    try {
      setState(() => _isLoading = true);

      final isar = await ref.read(isarServiceProvider).db;

      // Cargar clientes
      final clientesRaw = await isar.clientes.getAll([0]);
      final clientes = clientesRaw.whereType<Cliente>().toList();

      if (widget.cuentaId != null) {
        _cuenta = await isar.cuentaCorrientes.get(widget.cuentaId!);

        if (_cuenta != null) {
          _loadCuentaData();
        }
      } else {
        // Valores por defecto para nueva cuenta
        _fechaCreacion = DateTime.now();
        _fechaVencimiento = DateTime.now().add(const Duration(days: 30));
        _activa = true;
        _totalCuotas = 1;
      }

      setState(() {
        _clientes = clientes;
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

  void _loadCuentaData() {
    if (_cuenta == null) return;

    _montoController.text = _cuenta!.montoTotal.toString();
    _observacionesController.text = _cuenta!.observaciones ?? '';
    _metodoPagoController.text = _cuenta!.metodoPago ?? '';
    _referenciaController.text = _cuenta!.referenciaPago ?? '';
    _fechaCreacion = _cuenta!.fechaCreacion;
    _fechaVencimiento = _cuenta!.fechaVencimiento;
    _activa = _cuenta!.activa;
    _totalCuotas = _cuenta!.totalCuotas;

    // Buscar el cliente asociado
    _clienteSeleccionado = _clientes.firstWhere(
      (c) => c.id == _cuenta!.clienteId,
      orElse: () => Cliente(id: 0, nombre: 'Cliente no encontrado'),
    );
  }

  Future<void> _saveCuenta() async {
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

    setState(() => _isSaving = true);

    try {
      final isar = await ref.read(isarServiceProvider).db;

      if (_cuenta == null) {
        // Crear nueva cuenta corriente
        _cuenta = CuentaCorriente(
          clienteId: _clienteSeleccionado!.id,
          nombreCliente: _clienteSeleccionado!.nombre,
          montoTotal: double.parse(_montoController.text),
          fechaCreacion: _fechaCreacion!,
          fechaVencimiento: _fechaVencimiento!,
          totalCuotas: _totalCuotas,
          observaciones:
              _observacionesController.text.trim().isEmpty
                  ? null
                  : _observacionesController.text.trim(),
          metodoPago:
              _metodoPagoController.text.trim().isEmpty
                  ? null
                  : _metodoPagoController.text.trim(),
          referenciaPago:
              _referenciaController.text.trim().isEmpty
                  ? null
                  : _referenciaController.text.trim(),
        );
      } else {
        // Actualizar cuenta existente
        _cuenta!.clienteId = _clienteSeleccionado!.id;
        _cuenta!.nombreCliente = _clienteSeleccionado!.nombre;
        _cuenta!.montoTotal = double.parse(_montoController.text);
        _cuenta!.fechaCreacion = _fechaCreacion!;
        _cuenta!.fechaVencimiento = _fechaVencimiento!;
        _cuenta!.activa = _activa;
        _cuenta!.totalCuotas = _totalCuotas;
        _cuenta!.observaciones =
            _observacionesController.text.trim().isEmpty
                ? null
                : _observacionesController.text.trim();
        _cuenta!.metodoPago =
            _metodoPagoController.text.trim().isEmpty
                ? null
                : _metodoPagoController.text.trim();
        _cuenta!.referenciaPago =
            _referenciaController.text.trim().isEmpty
                ? null
                : _referenciaController.text.trim();
      }

      await isar.writeTxn(() async {
        await isar.cuentaCorrientes.put(_cuenta!);
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Cuenta corriente guardada exitosamente'),
            backgroundColor: Colors.green,
          ),
        );
        context.pop(true);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error al guardar cuenta: $e'),
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

  Future<void> _selectDate(bool isCreacion) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate:
          isCreacion
              ? (_fechaCreacion ?? DateTime.now())
              : (_fechaVencimiento ?? DateTime.now()),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365 * 5)),
    );

    if (picked != null) {
      setState(() {
        if (isCreacion) {
          _fechaCreacion = picked;
        } else {
          _fechaVencimiento = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          widget.cuentaId == null
              ? 'Nueva Cuenta Corriente'
              : 'Editar Cuenta Corriente',
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          PermissionWidget(
            action: widget.cuentaId == null ? 'create' : 'update',
            resource: 'cuenta_corriente',
            child: IconButton(
              icon: const Icon(Icons.save, color: Colors.white),
              onPressed: _isSaving ? null : _saveCuenta,
              tooltip: 'Guardar',
            ),
          ),
        ],
      ),
      body:
          _isLoading
              ? const Center(child: CircularProgressIndicator())
              : Form(
                key: _formKey,
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    // Información básica
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Información Básica',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 16),
                            DropdownButtonFormField<Cliente>(
                              value: _clienteSeleccionado,
                              decoration: const InputDecoration(
                                labelText: 'Cliente *',
                                border: OutlineInputBorder(),
                              ),
                              items:
                                  _clientes.map((cliente) {
                                    return DropdownMenuItem(
                                      value: cliente,
                                      child: Text(cliente.nombre),
                                    );
                                  }).toList(),
                              onChanged: (Cliente? cliente) {
                                setState(() {
                                  _clienteSeleccionado = cliente;
                                });
                              },
                              validator: (value) {
                                if (value == null) {
                                  return 'Debe seleccionar un cliente';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              controller: _montoController,
                              decoration: const InputDecoration(
                                labelText: 'Monto Total *',
                                border: OutlineInputBorder(),
                                prefixText: '\$',
                              ),
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                final monto = double.tryParse(value ?? '');
                                if (monto == null || monto <= 0) {
                                  return 'Debe ser un monto válido';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Fechas
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Fechas',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                Expanded(
                                  child: ListTile(
                                    title: const Text('Fecha de Creación'),
                                    subtitle: Text(
                                      _fechaCreacion != null
                                          ? '${_fechaCreacion!.day}/${_fechaCreacion!.month}/${_fechaCreacion!.year}'
                                          : 'No seleccionada',
                                    ),
                                    trailing: const Icon(Icons.calendar_today),
                                    onTap: () => _selectDate(true),
                                  ),
                                ),
                                Expanded(
                                  child: ListTile(
                                    title: const Text('Fecha de Vencimiento'),
                                    subtitle: Text(
                                      _fechaVencimiento != null
                                          ? '${_fechaVencimiento!.day}/${_fechaVencimiento!.month}/${_fechaVencimiento!.year}'
                                          : 'No seleccionada',
                                    ),
                                    trailing: const Icon(Icons.calendar_today),
                                    onTap: () => _selectDate(false),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Configuración de cuotas
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Configuración de Cuotas',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'Total de Cuotas',
                                      border: OutlineInputBorder(),
                                    ),
                                    keyboardType: TextInputType.number,
                                    onChanged: (value) {
                                      setState(() {
                                        _totalCuotas = int.tryParse(value) ?? 1;
                                      });
                                    },
                                    validator: (value) {
                                      final cuotas = int.tryParse(value ?? '');
                                      if (cuotas == null || cuotas <= 0) {
                                        return 'Debe ser un número válido';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      color: Colors.blue.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: Colors.blue.withOpacity(0.3),
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        const Text(
                                          'Monto por Cuota',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          '\$${(double.tryParse(_montoController.text) ?? 0.0) / _totalCuotas}',
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue,
                                          ),
                                        ),
                                      ],
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

                    // Configuración adicional
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Configuración Adicional',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 16),
                            SwitchListTile(
                              title: const Text('Cuenta Activa'),
                              subtitle: const Text(
                                'La cuenta estará disponible',
                              ),
                              value: _activa,
                              onChanged: (value) {
                                setState(() => _activa = value);
                              },
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              controller: _metodoPagoController,
                              decoration: const InputDecoration(
                                labelText: 'Método de Pago (opcional)',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              controller: _referenciaController,
                              decoration: const InputDecoration(
                                labelText: 'Referencia (opcional)',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              controller: _observacionesController,
                              decoration: const InputDecoration(
                                labelText: 'Observaciones (opcional)',
                                border: OutlineInputBorder(),
                              ),
                              maxLines: 3,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
    );
  }
}
