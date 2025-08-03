import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProfitLossAddEditView extends ConsumerStatefulWidget {
  final int? profitLossId;

  const ProfitLossAddEditView({super.key, this.profitLossId});

  @override
  ConsumerState<ProfitLossAddEditView> createState() =>
      _ProfitLossAddEditViewState();
}

class _ProfitLossAddEditViewState extends ConsumerState<ProfitLossAddEditView> {
  final _formKey = GlobalKey<FormState>();
  final _conceptoController = TextEditingController();
  final _descripcionController = TextEditingController();
  final _observacionesController = TextEditingController();

  bool _isLoading = false;
  bool _isEditing = false;

  // Valores del registro
  double _monto = 0.0;
  String _tipo = 'ganancia'; // 'ganancia' o 'perdida'
  String _categoria = 'ventas';
  DateTime _fecha = DateTime.now();
  String _metodoPago = 'efectivo';
  bool _confirmado = true;

  final List<String> _categorias = [
    'ventas',
    'compras',
    'gastos_fijos',
    'sorteos',
    'servicios',
    'impuestos',
    'salarios',
    'marketing',
    'alquiler',
    'utilities',
    'mantenimiento',
    'seguros',
    'intereses',
    'otros',
  ];

  final List<String> _metodosPago = [
    'efectivo',
    'tarjeta',
    'transferencia',
    'cheque',
    'pago_movil',
  ];

  @override
  void initState() {
    super.initState();
    _isEditing = widget.profitLossId != null;
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() => _isLoading = true);
    try {
      // TODO: Cargar datos del registro cuando se implemente
      await Future.delayed(const Duration(seconds: 1)); // Simulación

      setState(() => _isLoading = false);
      if (_isEditing) {
        _loadProfitLossData();
      }
    } catch (e) {
      setState(() => _isLoading = false);
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error cargando datos: $e')));
      }
    }
  }

  void _loadProfitLossData() {
    // TODO: Cargar datos del registro cuando se implemente
  }

  Future<void> _guardarRegistro() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);
    try {
      // TODO: Implementar guardado de registro
      await Future.delayed(const Duration(seconds: 1)); // Simulación

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              _isEditing ? 'Registro actualizado' : 'Registro creado',
            ),
            backgroundColor: Colors.green,
          ),
        );
        context.pop();
      }
    } catch (e) {
      setState(() => _isLoading = false);
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error: $e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _isEditing ? 'Editar Registro' : 'Nuevo Registro',
          style: TextStyle(
            color: Colors.pink[700],
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        actions: [
          if (_isEditing)
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: _eliminarRegistro,
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
                            Text(
                              'Información Básica',
                              style: Theme.of(
                                context,
                              ).textTheme.titleLarge?.copyWith(
                                color: Colors.pink[700],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              controller: _conceptoController,
                              decoration: const InputDecoration(
                                labelText: 'Concepto',
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value?.isEmpty ?? true) {
                                  return 'El concepto es requerido';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              controller: _descripcionController,
                              decoration: const InputDecoration(
                                labelText: 'Descripción',
                                border: OutlineInputBorder(),
                              ),
                              maxLines: 3,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Tipo y monto
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Tipo y Monto',
                              style: Theme.of(
                                context,
                              ).textTheme.titleLarge?.copyWith(
                                color: Colors.pink[700],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                Expanded(
                                  child: RadioListTile<String>(
                                    title: const Text('Ganancia'),
                                    value: 'ganancia',
                                    groupValue: _tipo,
                                    onChanged: (value) {
                                      setState(() => _tipo = value!);
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: RadioListTile<String>(
                                    title: const Text('Pérdida'),
                                    value: 'perdida',
                                    groupValue: _tipo,
                                    onChanged: (value) {
                                      setState(() => _tipo = value!);
                                    },
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Monto',
                                border: const OutlineInputBorder(),
                                prefixText: '\$',
                                prefixIcon: Icon(
                                  _tipo == 'ganancia'
                                      ? Icons.trending_up
                                      : Icons.trending_down,
                                  color:
                                      _tipo == 'ganancia'
                                          ? Colors.green
                                          : Colors.red,
                                ),
                              ),
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                _monto = double.tryParse(value) ?? 0.0;
                              },
                              validator: (value) {
                                if (double.tryParse(value ?? '') == null ||
                                    double.parse(value!) <= 0) {
                                  return 'Monto inválido';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Categoría y fecha
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Categoría y Fecha',
                              style: Theme.of(
                                context,
                              ).textTheme.titleLarge?.copyWith(
                                color: Colors.pink[700],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 16),
                            DropdownButtonFormField<String>(
                              value: _categoria,
                              decoration: const InputDecoration(
                                labelText: 'Categoría',
                                border: OutlineInputBorder(),
                              ),
                              items:
                                  _categorias.map((categoria) {
                                    return DropdownMenuItem(
                                      value: categoria,
                                      child: Text(
                                        categoria
                                            .replaceAll('_', ' ')
                                            .toUpperCase(),
                                      ),
                                    );
                                  }).toList(),
                              onChanged: (value) {
                                setState(() => _categoria = value!);
                              },
                            ),
                            const SizedBox(height: 16),
                            ListTile(
                              title: const Text('Fecha'),
                              subtitle: Text(
                                '${_fecha.day}/${_fecha.month}/${_fecha.year}',
                              ),
                              trailing: const Icon(Icons.calendar_today),
                              onTap: () async {
                                final fecha = await showDatePicker(
                                  context: context,
                                  initialDate: _fecha,
                                  firstDate: DateTime.now().subtract(
                                    const Duration(days: 365),
                                  ),
                                  lastDate: DateTime.now().add(
                                    const Duration(days: 365),
                                  ),
                                );
                                if (fecha != null) {
                                  setState(() => _fecha = fecha);
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Método de pago y configuración
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Método de Pago y Configuración',
                              style: Theme.of(
                                context,
                              ).textTheme.titleLarge?.copyWith(
                                color: Colors.pink[700],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 16),
                            DropdownButtonFormField<String>(
                              value: _metodoPago,
                              decoration: const InputDecoration(
                                labelText: 'Método de Pago',
                                border: OutlineInputBorder(),
                              ),
                              items:
                                  _metodosPago.map((metodo) {
                                    return DropdownMenuItem(
                                      value: metodo,
                                      child: Text(metodo.toUpperCase()),
                                    );
                                  }).toList(),
                              onChanged: (value) {
                                setState(() => _metodoPago = value!);
                              },
                            ),
                            const SizedBox(height: 16),
                            SwitchListTile(
                              title: const Text('Registro confirmado'),
                              value: _confirmado,
                              onChanged: (value) {
                                setState(() => _confirmado = value);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Observaciones
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Observaciones',
                              style: Theme.of(
                                context,
                              ).textTheme.titleLarge?.copyWith(
                                color: Colors.pink[700],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              controller: _observacionesController,
                              decoration: const InputDecoration(
                                labelText: 'Observaciones adicionales',
                                border: OutlineInputBorder(),
                                hintText:
                                    'Información adicional sobre el registro',
                              ),
                              maxLines: 3,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),

                    // Botones de acción
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () => context.pop(),
                            child: const Text('Cancelar'),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: _isLoading ? null : _guardarRegistro,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.pink[700],
                              foregroundColor: Colors.white,
                            ),
                            child:
                                _isLoading
                                    ? const SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                      ),
                                    )
                                    : Text(_isEditing ? 'Actualizar' : 'Crear'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
    );
  }

  void _eliminarRegistro() {
    // TODO: Implementar eliminación de registro
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Funcionalidad en desarrollo')),
    );
  }
}
