import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:isar/isar.dart';
import '../../src/app_routes.dart';
import '../../models/venta.dart';
import '../../models/cliente.dart';
import '../../services/isar_service.dart';
import '../../widgets/permission_widget.dart';
import 'dialogs/return_sale_dialog.dart';
import 'widgets/stat_card.dart';
import 'widgets/empty_state.dart';

class SalesView extends ConsumerStatefulWidget {
  const SalesView({super.key});

  @override
  ConsumerState<SalesView> createState() => _SalesViewState();
}

class _SalesViewState extends ConsumerState<SalesView> {
  bool _isLoading = false;
  String _filtroSeleccionado = 'Todas';
  List<Venta> _ventas = [];
  List<Cliente> _clientes = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      setState(() => _isLoading = true);

      final isar = await ref.read(isarServiceProvider).db;
      _ventas = await isar.ventas.where().sortByFecha().findAll();
      _clientes = await isar.clientes.where().findAll();

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

  List<Venta> get _ventasFiltradas {
    switch (_filtroSeleccionado) {
      case 'Pendientes':
        return _ventas.where((v) => v.estado == 'pendiente').toList();
      case 'Completadas':
        return _ventas.where((v) => v.estado == 'completada').toList();
      case 'Canceladas':
        return _ventas.where((v) => v.estado == 'cancelada').toList();
      case 'Devoluciones':
        return _ventas.where((v) => v.esDevolucion).toList();
      default:
        return _ventas;
    }
  }

  double get _totalVentas => _ventas.fold(0.0, (sum, v) => sum + v.total);
  double get _ventasHoy => _ventas
      .where(
        (v) =>
            v.fecha.isAfter(DateTime.now().subtract(const Duration(days: 1))),
      )
      .fold(0.0, (sum, v) => sum + v.total);

  String _obtenerNombreCliente(int clienteId) {
    final cliente = _clientes.firstWhere(
      (c) => c.id == clienteId,
      orElse: () => Cliente(id: 0, nombre: 'Cliente no encontrado'),
    );
    return cliente.nombre;
  }

  void _mostrarDialogoDevolucion(Venta venta) {
    showDialog(
      context: context,
      builder: (context) => ReturnSaleDialog(venta: venta),
    ).then((_) => _loadData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ventas')),
      body: Column(
        children: [
          // NUEVO: DescripciÃ³n de la secciÃ³n de ventas
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              color: Colors.blueGrey[900],
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  'Consulta todas las ventas realizadas en tu negocio. Filtra por fechas y clientes para analizar el rendimiento de tus productos y tu equipo de ventas.',
                  style: const TextStyle(color: Colors.white70, fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          // Header con filtros
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[900],
              border: Border(bottom: BorderSide(color: Colors.grey[700]!)),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'GestiÃ³n de Ventas',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[700],
                        ),
                      ),
                    ),
                    PermissionWidget(
                      resource: 'ventas',
                      action: 'create',
                      child: IconButton(
                        onPressed: () {
                          context.push(AppRoutes.saleAdd);
                        },
                        icon: const Icon(Icons.add),
                        tooltip: 'Nueva Venta',
                      ),
                    ),
                    PopupMenuButton<String>(
                      onSelected: (value) {
                        setState(() {
                          _filtroSeleccionado = value;
                        });
                      },
                      itemBuilder:
                          (context) => [
                            const PopupMenuItem(
                              value: 'Todas',
                              child: Text('Todas las ventas'),
                            ),
                            const PopupMenuItem(
                              value: 'Pendientes',
                              child: Text('Pendientes'),
                            ),
                            const PopupMenuItem(
                              value: 'Completadas',
                              child: Text('Completadas'),
                            ),
                            const PopupMenuItem(
                              value: 'Canceladas',
                              child: Text('Canceladas'),
                            ),
                            const PopupMenuItem(
                              value: 'Devoluciones',
                              child: Text('Devoluciones'),
                            ),
                          ],
                      child: Chip(
                        label: Text(_filtroSeleccionado),
                        avatar: const Icon(Icons.filter_list),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // EstadÃ­sticas rÃ¡pidas
                Row(
                  children: [
                    Expanded(
                      child: StatCard(
                        title: 'Total Ventas',
                        value: _ventas.length.toString(),
                        icon: Icons.point_of_sale,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: StatCard(
                        title: 'Ventas Hoy',
                        value:
                            _ventas
                                .where(
                                  (v) => v.fecha.isAfter(
                                    DateTime.now().subtract(
                                      const Duration(days: 1),
                                    ),
                                  ),
                                )
                                .length
                                .toString(),
                        icon: Icons.today,
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: StatCard(
                        title: 'Ingresos',
                        value: '\$${_totalVentas.toStringAsFixed(2)}',
                        icon: Icons.attach_money,
                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Contenido principal
          Expanded(
            child:
                _isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : _ventasFiltradas.isEmpty
                    ? EmptyState(
                      title: 'No hay ventas registradas',
                      subtitle: 'Crea tu primera venta desde el botÃ³n +',
                      actionText: 'Nueva Venta',
                      icon: Icons.point_of_sale_outlined,
                      color: Colors.blue[700]!,
                      onAction: () => context.push(AppRoutes.saleAdd),
                    )
                    : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: _ventasFiltradas.length,
                      itemBuilder: (context, index) {
                        final venta = _ventasFiltradas[index];
                        return Card(
                          margin: const EdgeInsets.only(bottom: 12),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: _getColorEstado(venta.estado),
                              child: Icon(
                                _getIconEstado(venta.estado),
                                color: Colors.white,
                              ),
                            ),
                            title: Text(
                              'Venta #${venta.numeroFactura ?? venta.id.toString()}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Cliente: ${_obtenerNombreCliente(venta.clienteId)}',
                                ),
                                Text(
                                  'Total: \$${venta.total.toStringAsFixed(2)}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                ),
                                Text(
                                  'Fecha: ${_formatearFecha(venta.fecha)}',
                                  style: TextStyle(color: Colors.grey[600]),
                                ),
                                if (venta.esDevolucion)
                                  Text(
                                    'DEVOLUCIÃ“N',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                              ],
                            ),
                            trailing: PopupMenuButton<String>(
                              onSelected: (value) {
                                switch (value) {
                                  case 'ver':
                                    context.push(
                                      '${AppRoutes.saleEdit}/${venta.id}',
                                    );
                                    break;
                                  case 'devolucion':
                                    if (!venta.esDevolucion) {
                                      _mostrarDialogoDevolucion(venta);
                                    }
                                    break;
                                  case 'eliminar':
                                    _confirmarEliminarVenta(venta);
                                    break;
                                }
                              },
                              itemBuilder:
                                  (context) => [
                                    const PopupMenuItem(
                                      value: 'ver',
                                      child: Text('Ver detalles'),
                                    ),
                                    if (!venta.esDevolucion)
                                      const PopupMenuItem(
                                        value: 'devolucion',
                                        child: Text('Procesar devoluciÃ³n'),
                                      ),
                                    const PopupMenuItem(
                                      value: 'eliminar',
                                      child: Text('Eliminar'),
                                    ),
                                  ],
                            ),
                          ),
                        );
                      },
                    ),
          ),
        ],
      ),
    );
  }

  Color _getColorEstado(String estado) {
    switch (estado) {
      case 'completada':
        return Colors.green;
      case 'pendiente':
        return Colors.orange;
      case 'cancelada':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  IconData _getIconEstado(String estado) {
    switch (estado) {
      case 'completada':
        return Icons.check_circle;
      case 'pendiente':
        return Icons.schedule;
      case 'cancelada':
        return Icons.cancel;
      default:
        return Icons.help;
    }
  }

  String _formatearFecha(DateTime fecha) {
    return '${fecha.day.toString().padLeft(2, '0')}/${fecha.month.toString().padLeft(2, '0')}/${fecha.year}';
  }

  void _confirmarEliminarVenta(Venta venta) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Confirmar eliminaciÃ³n'),
            content: Text(
              'Â¿EstÃ¡ seguro de eliminar la venta #${venta.numeroFactura ?? venta.id}?',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Cancelar'),
              ),
              ElevatedButton(
                onPressed: () async {
                  try {
                    final isar = await ref.read(isarServiceProvider).db;
                    await isar.writeTxn(() async {
                      await isar.ventas.delete(venta.id);
                    });
                    Navigator.of(context).pop();
                    _loadData();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Venta eliminada exitosamente'),
                      ),
                    );
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Error al eliminar venta: $e')),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text('Eliminar'),
              ),
            ],
          ),
    );
  }
}

