import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/registrofinanciero.dart';
import '../../services/isar_service.dart';
import '../../widgets/permission_widget.dart';

class CashRegisterView extends ConsumerStatefulWidget {
  const CashRegisterView({super.key});

  @override
  ConsumerState<CashRegisterView> createState() => _CashRegisterViewState();
}

class _CashRegisterViewState extends ConsumerState<CashRegisterView> {
  List<RegistroFinanciero> _registros = [];
  bool _isLoading = true;
  double _totalIngresos = 0.0;
  double _totalEgresos = 0.0;
  double _saldoCaja = 0.0;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      setState(() => _isLoading = true);

      final isar = await ref.read(isarServiceProvider).db;
      final registrosRaw = await isar.registroFinancieros.getAll([0]);
      final registros = registrosRaw.whereType<RegistroFinanciero>().toList();

      // Calcular totales
      double ingresos = 0.0;
      double egresos = 0.0;

      for (final registro in registros) {
        if (registro.tipo == 'ingreso') {
          ingresos += registro.monto ?? 0.0;
        } else if (registro.tipo == 'egreso') {
          egresos += registro.monto ?? 0.0;
        }
      }

      setState(() {
        _registros = registros;
        _totalIngresos = ingresos;
        _totalEgresos = egresos;
        _saldoCaja = ingresos - egresos;
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al cargar datos: $e')),
        );
      }
    }
  }

  Future<void> _realizarCierreCaja() async {
    final confirmacion = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirmar Cierre de Caja'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Total Ingresos: \$${_totalIngresos.toStringAsFixed(2)}'),
            Text('Total Egresos: \$${_totalEgresos.toStringAsFixed(2)}'),
            Text(
              'Saldo en Caja: \$${_saldoCaja.toStringAsFixed(2)}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: _saldoCaja >= 0 ? Colors.green : Colors.red,
              ),
            ),
            const SizedBox(height: 16),
            const Text('¿Desea realizar el cierre de caja?'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Confirmar'),
          ),
        ],
      ),
    );

    if (confirmacion == true) {
      try {
        final isar = await ref.read(isarServiceProvider).db;

        // Crear registro de cierre de caja
        final cierreCaja = RegistroFinanciero(
          concepto: 'Cierre de Caja',
          monto: _saldoCaja,
          tipo: 'cierre',
          categoria: 'general',
          fecha: DateTime.now(),
        );

        await isar.writeTxn(() async {
          await isar.registroFinancieros.put(cierreCaja);
        });

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Cierre de caja realizado exitosamente'),
              backgroundColor: Colors.green,
            ),
          );
          await _loadData();
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error al realizar cierre de caja: $e'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'Cierre de Caja',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // Resumen de caja
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          const Text(
                            'Resumen de Caja',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Total Ingresos:'),
                              Text(
                                '\$${_totalIngresos.toStringAsFixed(2)}',
                                style: const TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Total Egresos:'),
                              Text(
                                '\$${_totalEgresos.toStringAsFixed(2)}',
                                style: const TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Saldo en Caja:',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '\$${_saldoCaja.toStringAsFixed(2)}',
                                style: TextStyle(
                                  color: _saldoCaja >= 0 ? Colors.green : Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Botón de cierre de caja
                  PermissionWidget(
                    action: 'create',
                    resource: 'finanzas',
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton.icon(
                        onPressed: _realizarCierreCaja,
                        icon: const Icon(Icons.account_balance_wallet),
                        label: const Text('Realizar Cierre de Caja'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Lista de registros recientes
                  const Text(
                    'Registros Recientes',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: _registros.isEmpty
                        ? const Center(
                            child: Text(
                              'No hay registros financieros',
                              style: TextStyle(color: Colors.white70),
                            ),
                          )
                        : ListView.builder(
                            itemCount: _registros.length,
                            itemBuilder: (context, index) {
                              final registro = _registros[index];
                              return Card(
                                margin: const EdgeInsets.only(bottom: 8),
                                child: ListTile(
                                  leading: Icon(
                                    registro.tipo == 'ingreso'
                                        ? Icons.trending_up
                                        : Icons.trending_down,
                                    color: registro.tipo == 'ingreso'
                                        ? Colors.green
                                        : Colors.red,
                                  ),
                                  title: Text('Registro #${registro.id}'),
                                  subtitle: registro.fecha != null
                                      ? Text(
                                          '${registro.fecha.day}/${registro.fecha.month}/${registro.fecha.year}',
                                        )
                                      : const Text('Sin fecha'),
                                  trailing: Text(
                                    '\$${(registro.monto ?? 0.0).toStringAsFixed(2)}',
                                    style: TextStyle(
                                      color: registro.tipo == 'ingreso'
                                          ? Colors.green
                                          : Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                  ),
                ],
              ),
            ),
    );
  }
}
