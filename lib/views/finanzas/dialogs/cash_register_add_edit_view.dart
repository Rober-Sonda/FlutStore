import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CashRegisterAddEditView extends ConsumerStatefulWidget {
  final int? cashRegisterId;

  const CashRegisterAddEditView({super.key, this.cashRegisterId});

  @override
  ConsumerState<CashRegisterAddEditView> createState() =>
      _CashRegisterAddEditViewState();
}

class _CashRegisterAddEditViewState
    extends ConsumerState<CashRegisterAddEditView> {
  final _formKey = GlobalKey<FormState>();
  final _observacionesController = TextEditingController();

  bool _isLoading = false;
  bool _isEditing = false;

  // Valores del cierre
  DateTime _fecha = DateTime.now();
  double _montoEfectivo = 0.0;
  double _montoTarjeta = 0.0;
  double _montoTransferencia = 0.0;
  double _montoCheque = 0.0;
  double _montoPagoMovil = 0.0;
  double _montoOtros = 0.0;
  bool _confirmado = false;

  @override
  void initState() {
    super.initState();
    _isEditing = widget.cashRegisterId != null;
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() => _isLoading = true);
    try {
      // TODO: Cargar datos del cierre cuando se implemente
      await Future.delayed(const Duration(seconds: 1)); // Simulación

      setState(() => _isLoading = false);
      if (_isEditing) {
        _loadCashRegisterData();
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

  void _loadCashRegisterData() {
    // TODO: Cargar datos del cierre cuando se implemente
  }

  double get _totalCierre {
    return _montoEfectivo +
        _montoTarjeta +
        _montoTransferencia +
        _montoCheque +
        _montoPagoMovil +
        _montoOtros;
  }

  Future<void> _guardarCierre() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);
    try {
      // TODO: Implementar guardado de cierre
      await Future.delayed(const Duration(seconds: 1)); // Simulación

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              _isEditing ? 'Cierre actualizado' : 'Cierre registrado',
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
          _isEditing ? 'Editar Cierre' : 'Nuevo Cierre de Caja',
          style: TextStyle(
            color: Colors.blue[700],
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        actions: [
          if (_isEditing)
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: _eliminarCierre,
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
                                color: Colors.blue[700],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 16),
                            ListTile(
                              title: const Text('Fecha del Cierre'),
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
                                    const Duration(days: 1),
                                  ),
                                );
                                if (fecha != null) {
                                  setState(() => _fecha = fecha);
                                }
                              },
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              controller: _observacionesController,
                              decoration: const InputDecoration(
                                labelText: 'Observaciones',
                                border: OutlineInputBorder(),
                                hintText:
                                    'Observaciones sobre el cierre de caja',
                              ),
                              maxLines: 3,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Montos por método de pago
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Montos por Método de Pago',
                              style: Theme.of(
                                context,
                              ).textTheme.titleLarge?.copyWith(
                                color: Colors.blue[700],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 16),
                            _buildMontoField(
                              'Efectivo',
                              _montoEfectivo,
                              (value) => setState(() => _montoEfectivo = value),
                              Colors.green,
                              Icons.money,
                            ),
                            const SizedBox(height: 16),
                            _buildMontoField(
                              'Tarjeta',
                              _montoTarjeta,
                              (value) => setState(() => _montoTarjeta = value),
                              Colors.blue,
                              Icons.credit_card,
                            ),
                            const SizedBox(height: 16),
                            _buildMontoField(
                              'Transferencia',
                              _montoTransferencia,
                              (value) =>
                                  setState(() => _montoTransferencia = value),
                              Colors.purple,
                              Icons.account_balance,
                            ),
                            const SizedBox(height: 16),
                            _buildMontoField(
                              'Cheque',
                              _montoCheque,
                              (value) => setState(() => _montoCheque = value),
                              Colors.orange,
                              Icons.receipt,
                            ),
                            const SizedBox(height: 16),
                            _buildMontoField(
                              'Pago Móvil',
                              _montoPagoMovil,
                              (value) =>
                                  setState(() => _montoPagoMovil = value),
                              Colors.teal,
                              Icons.smartphone,
                            ),
                            const SizedBox(height: 16),
                            _buildMontoField(
                              'Otros',
                              _montoOtros,
                              (value) => setState(() => _montoOtros = value),
                              Colors.grey,
                              Icons.more_horiz,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Resumen del cierre
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Resumen del Cierre',
                              style: Theme.of(
                                context,
                              ).textTheme.titleLarge?.copyWith(
                                color: Colors.blue[700],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.blue[50],
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.blue[200]!),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Total del Cierre:',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        '\$${_totalCierre.toStringAsFixed(2)}',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue[700],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Fecha: ${_fecha.day}/${_fecha.month}/${_fecha.year}',
                                    style: TextStyle(
                                      color: Colors.blue[600],
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Configuración
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Configuración',
                              style: Theme.of(
                                context,
                              ).textTheme.titleLarge?.copyWith(
                                color: Colors.blue[700],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 16),
                            SwitchListTile(
                              title: const Text('Cierre confirmado'),
                              subtitle: const Text(
                                'Marcar como cierre final del día',
                              ),
                              value: _confirmado,
                              onChanged: (value) {
                                setState(() => _confirmado = value);
                              },
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
                            onPressed: _isLoading ? null : _guardarCierre,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue[700],
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
                                    : Text(
                                      _isEditing ? 'Actualizar' : 'Registrar',
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
    );
  }

  Widget _buildMontoField(
    String label,
    double value,
    Function(double) onChanged,
    Color color,
    IconData icon,
  ) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: color, size: 24),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(
              labelText: label,
              border: const OutlineInputBorder(),
              prefixText: '\$',
            ),
            keyboardType: TextInputType.number,
            onChanged: (text) {
              final newValue = double.tryParse(text) ?? 0.0;
              onChanged(newValue);
            },
            validator: (value) {
              if (double.tryParse(value ?? '') == null) {
                return 'Monto inválido';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  void _eliminarCierre() {
    // TODO: Implementar eliminación de cierre
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Funcionalidad en desarrollo')),
    );
  }
}
