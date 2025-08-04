import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../models/cuenta_corriente.dart';
import '../../models/cliente.dart';
import '../../models/registrofinanciero.dart';
import '../../services/isar_service.dart';
import '../../widgets/permission_widget.dart';

class CuentaCorrienteView extends ConsumerStatefulWidget {
  const CuentaCorrienteView({super.key});

  @override
  ConsumerState<CuentaCorrienteView> createState() =>
      _CuentaCorrienteViewState();
}

class _CuentaCorrienteViewState extends ConsumerState<CuentaCorrienteView> {
  List<CuentaCorriente> _cuentas = [];
  List<Cliente> _clientes = [];
  bool _isLoading = true;
  String _filtroSeleccionado = 'Todas';

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      setState(() => _isLoading = true);

      final isar = await ref.read(isarServiceProvider).db;
      final cuentasRaw = await isar.cuentaCorrientes.getAll([0]);
      final cuentas = cuentasRaw.whereType<CuentaCorriente>().toList();
      final clientesRaw = await isar.clientes.getAll([0]);
      final clientes = clientesRaw.whereType<Cliente>().toList();

      setState(() {
        _cuentas = cuentas;
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

  List<CuentaCorriente> get _cuentasFiltradas {
    switch (_filtroSeleccionado) {
      case 'Activas':
        return _cuentas.where((c) => c.activa && !c.estaPagada).toList();
      case 'Pagadas':
        return _cuentas.where((c) => c.estaPagada).toList();
      case 'Vencidas':
        return _cuentas.where((c) => c.estaVencida).toList();
      case 'Pendientes':
        return _cuentas.where((c) => !c.estaPagada && !c.estaVencida).toList();
      default:
        return _cuentas;
    }
  }

  double get _totalDeuda => _cuentas
      .where((c) => !c.estaPagada)
      .fold(0.0, (total, cuenta) => total + cuenta.saldoPendiente);
  int get _cuentasActivas =>
      _cuentas.where((c) => c.activa && !c.estaPagada).length;
  int get _cuentasVencidas => _cuentas.where((c) => c.estaVencida).length;

  Color _getEstadoColor(CuentaCorriente cuenta) {
    if (cuenta.estaPagada) return Colors.green;
    if (cuenta.estaVencida) return Colors.red;
    if (cuenta.diasAtraso > 0) return Colors.orange;
    return Colors.blue;
  }

  String _getEstadoText(CuentaCorriente cuenta) {
    if (cuenta.estaPagada) return 'Pagada';
    if (cuenta.estaVencida) return 'Vencida';
    if (cuenta.diasAtraso > 0) return 'Atrasada';
    return 'Pendiente';
  }

  Future<void> _registrarPago(CuentaCorriente cuenta) async {
    final montoController = TextEditingController();
    final metodoController = TextEditingController();
    final referenciaController = TextEditingController();

    final result = await showDialog<Map<String, dynamic>>(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Registrar Pago'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: montoController,
                  decoration: const InputDecoration(
                    labelText: 'Monto a pagar',
                    prefixText: '\$',
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: metodoController,
                  decoration: const InputDecoration(
                    labelText: 'Método de pago (opcional)',
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: referenciaController,
                  decoration: const InputDecoration(
                    labelText: 'Referencia (opcional)',
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancelar'),
              ),
              ElevatedButton(
                onPressed: () {
                  final monto = double.tryParse(montoController.text);
                  if (monto != null && monto > 0) {
                    Navigator.pop(context, {
                      'monto': monto,
                      'metodo': metodoController.text,
                      'referencia': referenciaController.text,
                    });
                  }
                },
                child: const Text('Registrar'),
              ),
            ],
          ),
    );

    if (result != null) {
      try {
        final isar = await ref.read(isarServiceProvider).db;

        cuenta.registrarPago(
          result['monto'],
          result['metodo'].isEmpty ? null : result['metodo'],
          result['referencia'].isEmpty ? null : result['referencia'],
        );

        await isar.writeTxn(() async {
          await isar.cuentaCorrientes.put(cuenta);
        });

        // Registrar como registro financiero si es un pago
        final registro = RegistroFinanciero(
          concepto: 'Pago cuenta corriente: ${cuenta.nombreCliente}',
          descripcion: 'Pago recibido de cuenta corriente',
          monto: result['monto'],
          tipo: 'ingreso',
          categoria: 'cuenta_corriente',
          fecha: DateTime.now(),
          clienteId: cuenta.clienteId,
          usuarioId: 1, // TODO: Obtener ID del usuario actual
        );

        await isar.writeTxn(() async {
          await isar.registroFinancieros.put(registro);
        });

        setState(() {});

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Pago registrado: \$${result['monto'].toStringAsFixed(2)}',
              ),
              backgroundColor: Colors.green,
            ),
          );
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error al registrar pago: $e'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    }
  }

  Future<void> _eliminarCuenta(CuentaCorriente cuenta) async {
    final confirmacion = await showDialog<bool>(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Confirmar eliminación'),
            content: Text(
              '¿Estás seguro de que quieres eliminar la cuenta corriente de "${cuenta.nombreCliente}"?',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('Cancelar'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pop(context, true),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text('Eliminar'),
              ),
            ],
          ),
    );

    if (confirmacion == true) {
      try {
        final isar = await ref.read(isarServiceProvider).db;

        await isar.writeTxn(() async {
          await isar.cuentaCorrientes.delete(cuenta.id);
        });

        setState(() {
          _cuentas.remove(cuenta);
        });

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Cuenta corriente eliminada exitosamente'),
              backgroundColor: Colors.green,
            ),
          );
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error al eliminar cuenta: $e'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    }
  }

  Widget _buildCuentaCard(CuentaCorriente cuenta) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cuenta.nombreCliente,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Cuenta #${cuenta.id}',
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: _getEstadoColor(cuenta).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: _getEstadoColor(cuenta),
                      width: 1,
                    ),
                  ),
                  child: Text(
                    _getEstadoText(cuenta),
                    style: TextStyle(
                      color: _getEstadoColor(cuenta),
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildStatItem(
                    'Total',
                    '\$${cuenta.montoTotal.toStringAsFixed(2)}',
                    Icons.attach_money,
                    Colors.blue,
                  ),
                ),
                Expanded(
                  child: _buildStatItem(
                    'Pagado',
                    '\$${cuenta.montoPagado.toStringAsFixed(2)}',
                    Icons.check_circle,
                    Colors.green,
                  ),
                ),
                Expanded(
                  child: _buildStatItem(
                    'Pendiente',
                    '\$${cuenta.saldoPendiente.toStringAsFixed(2)}',
                    Icons.pending,
                    Colors.orange,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildStatItem(
                    'Cuotas',
                    '${cuenta.cuotasPagadas}/${cuenta.totalCuotas}',
                    Icons.receipt_long,
                    Colors.purple,
                  ),
                ),
                Expanded(
                  child: _buildStatItem(
                    'Progreso',
                    '${cuenta.porcentajePagado.toStringAsFixed(0)}%',
                    Icons.trending_up,
                    Colors.teal,
                  ),
                ),
                if (cuenta.diasAtraso > 0)
                  Expanded(
                    child: _buildStatItem(
                      'Atraso',
                      '${cuenta.diasAtraso} días',
                      Icons.warning,
                      Colors.red,
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Botón Ver Detalles
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      context.push('/account-balance/edit/${cuenta.id}');
                    },
                    icon: const Icon(Icons.visibility, size: 16),
                    label: const Text('Ver'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.blue,
                      side: const BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
                const SizedBox(width: 8),

                // Botón Registrar Pago
                if (!cuenta.estaPagada)
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () => _registrarPago(cuenta),
                      icon: const Icon(Icons.payment, size: 16),
                      label: const Text('Pagar'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ),

                const SizedBox(width: 8),

                // Botón Eliminar
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => _eliminarCuenta(cuenta),
                    icon: const Icon(Icons.delete, size: 16),
                    label: const Text('Eliminar'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.red,
                      side: const BorderSide(color: Colors.red),
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

  Widget _buildStatItem(
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Column(
      children: [
        Icon(icon, size: 20, color: color),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        Text(title, style: const TextStyle(fontSize: 10, color: Colors.grey)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'Cuenta Corriente',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.filter_list, color: Colors.white),
            onSelected: (value) {
              setState(() => _filtroSeleccionado = value);
            },
            itemBuilder:
                (context) => [
                  const PopupMenuItem(value: 'Todas', child: Text('Todas')),
                  const PopupMenuItem(value: 'Activas', child: Text('Activas')),
                  const PopupMenuItem(value: 'Pagadas', child: Text('Pagadas')),
                  const PopupMenuItem(
                    value: 'Vencidas',
                    child: Text('Vencidas'),
                  ),
                  const PopupMenuItem(
                    value: 'Pendientes',
                    child: Text('Pendientes'),
                  ),
                ],
          ),
        ],
      ),
      body:
          _isLoading
              ? const Center(child: CircularProgressIndicator())
              : Column(
                children: [
                  // Resumen de cuentas corrientes
                  Card(
                    margin: const EdgeInsets.all(16),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          const Text(
                            'Resumen de Cuentas Corrientes',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: _buildStatCard(
                                  'Total Deuda',
                                  _totalDeuda,
                                  Colors.red,
                                  Icons.money_off,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: _buildStatCard(
                                  'Activas',
                                  _cuentasActivas.toDouble(),
                                  Colors.blue,
                                  Icons.account_balance_wallet,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: _buildStatCard(
                                  'Vencidas',
                                  _cuentasVencidas.toDouble(),
                                  Colors.orange,
                                  Icons.warning,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Lista de cuentas corrientes
                  Expanded(
                    child:
                        _cuentasFiltradas.isEmpty
                            ? const Center(
                              child: Text(
                                'No hay cuentas corrientes registradas',
                                style: TextStyle(color: Colors.white70),
                              ),
                            )
                            : ListView.builder(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              itemCount: _cuentasFiltradas.length,
                              itemBuilder: (context, index) {
                                return _buildCuentaCard(
                                  _cuentasFiltradas[index],
                                );
                              },
                            ),
                  ),
                ],
              ),
      floatingActionButton: PermissionFAB(
        onPressed: () {
          context.push('/account-balance/add');
        },
        action: 'create',
        resource: 'cuenta_corriente',
        icon: Icons.add,
        tooltip: 'Nueva Cuenta Corriente',
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
    );
  }

  Widget _buildStatCard(
    String title,
    double amount,
    Color color,
    IconData icon,
  ) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              color: color,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title == 'Total Deuda'
                ? '\$${amount.toStringAsFixed(2)}'
                : amount.toInt().toString(),
            style: TextStyle(
              color: color,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
