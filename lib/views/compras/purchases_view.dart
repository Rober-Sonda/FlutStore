// lib/views/purchases_view.dart (pantalla dummy para Compras)
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:isar/isar.dart';
import 'package:tienda_app/src/app_routes.dart';
import '../../models/compra.dart';
import '../../models/proveedor.dart';
import '../../services/isar_service.dart';
import '../../widgets/permission_widget.dart';
import 'dialogs/return_purchase_dialog.dart';

class PurchasesView extends ConsumerStatefulWidget {
  const PurchasesView({super.key});

  @override
  ConsumerState<PurchasesView> createState() => _PurchasesViewState();
}

class _PurchasesViewState extends ConsumerState<PurchasesView> {
  bool _isLoading = false;
  String _filtroSeleccionado = 'Todas';
  List<Compra> _compras = [];
  List<Proveedor> _proveedores = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      setState(() => _isLoading = true);

      final isar = await ref.read(isarServiceProvider).db;
      _compras = await isar.compras.where().sortByFecha().findAll();
      _proveedores = await isar.proveedors.where().findAll();

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

  List<Compra> get _comprasFiltradas {
    switch (_filtroSeleccionado) {
      case 'Pendientes':
        return _compras.where((c) => c.estado == 'pendiente').toList();
      case 'Confirmadas':
        return _compras.where((c) => c.estado == 'confirmada').toList();
      case 'Recibidas':
        return _compras.where((c) => c.estado == 'recibida').toList();
      case 'Canceladas':
        return _compras.where((c) => c.estado == 'cancelada').toList();
      case 'Devoluciones':
        return _compras.where((c) => c.esDevolucion).toList();
      default:
        return _compras;
    }
  }

  double get _totalCompras => _compras.fold(0.0, (sum, c) => sum + c.total);
  double get _comprasHoy => _compras
      .where(
        (c) =>
            c.fecha.isAfter(DateTime.now().subtract(const Duration(days: 1))),
      )
      .fold(0.0, (sum, c) => sum + c.total);

  String _obtenerNombreProveedor(int proveedorId) {
    final proveedor = _proveedores.firstWhere(
      (p) => p.id == proveedorId,
      orElse: () {
        final proveedorDefault = Proveedor(nombre: 'Proveedor no encontrado');
        return proveedorDefault;
      },
    );
    return proveedor.nombre;
  }

  void _mostrarDialogoDevolucion(Compra compra) {
    showDialog(
      context: context,
      builder: (context) => ReturnPurchaseDialog(compra: compra),
    ).then((_) => _loadData());
  }

  Widget _buildStatCard(
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Card(
      color: Colors.grey[800],
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(icon, color: color, size: 32),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: TextStyle(
                color: color,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Compras'),
      ),
      body: Column(
        children: [
          // NUEVO: Descripción de la sección de compras
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              color: Colors.blueGrey[900],
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  'Registra y consulta todas las compras realizadas a tus proveedores. Mantén el control de tus egresos y la reposición de productos en tu inventario.',
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
                        'Gestión de Compras',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.green[700],
                        ),
                      ),
                    ),
                    PermissionWidget(
                      resource: 'compras',
                      action: 'create',
                      child: IconButton(
                        onPressed: () {
                          context.push(AppRoutes.purchaseAdd);
                        },
                        icon: const Icon(Icons.add),
                        tooltip: 'Nueva Compra',
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
                              child: Text('Todas las compras'),
                            ),
                            const PopupMenuItem(
                              value: 'Pendientes',
                              child: Text('Pendientes'),
                            ),
                            const PopupMenuItem(
                              value: 'Confirmadas',
                              child: Text('Confirmadas'),
                            ),
                            const PopupMenuItem(
                              value: 'Recibidas',
                              child: Text('Recibidas'),
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

                // Estadísticas rápidas
                Row(
                  children: [
                    Expanded(
                      child: _buildStatCard(
                        'Total Compras',
                        _compras.length.toString(),
                        Icons.shopping_cart,
                        Colors.green,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildStatCard(
                        'Compras Hoy',
                        _compras
                            .where(
                              (c) => c.fecha.isAfter(
                                DateTime.now().subtract(
                                  const Duration(days: 1),
                                ),
                              ),
                            )
                            .length
                            .toString(),
                        Icons.today,
                        Colors.orange,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildStatCard(
                        'Gastos',
                        '\$${_totalCompras.toStringAsFixed(2)}',
                        Icons.attach_money,
                        Colors.red,
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
                    : _comprasFiltradas.isEmpty
                    ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.shopping_cart_outlined,
                            size: 64,
                            color: Colors.grey[600],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'No hay compras registradas',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[400],
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Crea tu primera compra desde el botón +',
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed:
                                () => context.push(AppRoutes.purchaseAdd),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              foregroundColor: Colors.white,
                            ),
                            child: const Text('Nueva Compra'),
                          ),
                        ],
                      ),
                    )
                    : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: _comprasFiltradas.length,
                      itemBuilder: (context, index) {
                        final compra = _comprasFiltradas[index];
                        return Card(
                          margin: const EdgeInsets.only(bottom: 12),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: _getColorEstado(compra.estado),
                              child: Icon(
                                _getIconEstado(compra.estado),
                                color: Colors.white,
                              ),
                            ),
                            title: Text(
                              'Compra #${compra.numeroFactura ?? compra.id.toString()}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Proveedor: ${_obtenerNombreProveedor(compra.proveedorId ?? 0)}',
                                ),
                                Text(
                                  'Total: \$${compra.total.toStringAsFixed(2)}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                  ),
                                ),
                                Text(
                                  'Fecha: ${_formatearFecha(compra.fecha)}',
                                  style: TextStyle(color: Colors.grey[600]),
                                ),
                                if (compra.esDevolucion)
                                  Text(
                                    'DEVOLUCIÓN',
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
                                      '${AppRoutes.purchaseEdit}/${compra.id ?? 0}',
                                    );
                                    break;
                                  case 'devolucion':
                                    if (!compra.esDevolucion) {
                                      _mostrarDialogoDevolucion(compra);
                                    }
                                    break;
                                  case 'eliminar':
                                    _confirmarEliminarCompra(compra);
                                    break;
                                }
                              },
                              itemBuilder:
                                  (context) => [
                                    const PopupMenuItem(
                                      value: 'ver',
                                      child: Text('Ver detalles'),
                                    ),
                                    if (!compra.esDevolucion)
                                      const PopupMenuItem(
                                        value: 'devolucion',
                                        child: Text('Procesar devolución'),
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
      case 'recibida':
        return Colors.green;
      case 'confirmada':
        return Colors.blue;
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
      case 'recibida':
        return Icons.check_circle;
      case 'confirmada':
        return Icons.verified;
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

  void _confirmarEliminarCompra(Compra compra) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Confirmar eliminación'),
            content: Text(
              '¿Está seguro de eliminar la compra #${compra.numeroFactura ?? compra.id}?',
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
                      await isar.compras.delete(compra.id);
                    });
                    Navigator.of(context).pop();
                    _loadData();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Compra eliminada exitosamente'),
                      ),
                    );
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Error al eliminar compra: $e')),
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
