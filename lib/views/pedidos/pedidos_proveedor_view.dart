import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../models/pedido_proveedor.dart';
import '../../models/proveedor.dart';
import '../../models/business_config.dart';
import '../../services/isar_service.dart';
import '../../services/pdf_service.dart';
import '../../models/app_theme.dart';
import '../../models/font_config.dart';
import '../../services/app_config_service.dart';
import '../../src/app_routes.dart';
import '../../widgets/permission_widget.dart';
import 'dialogs/convertir_pedido_compra_view.dart';

class PedidosProveedorView extends ConsumerStatefulWidget {
  const PedidosProveedorView({super.key});

  @override
  ConsumerState<PedidosProveedorView> createState() =>
      _PedidosProveedorViewState();
}

class _PedidosProveedorViewState extends ConsumerState<PedidosProveedorView> {
  List<PedidoProveedor> _pedidos = [];
  List<Proveedor> _proveedores = [];
  BusinessConfig? _businessConfig;
  AppTheme? _currentTheme;
  FontConfig? _currentFontConfig;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      final isar = await ref.read(isarServiceProvider).db;

      // Cargar pedidos
      final pedidosRaw = await isar.pedidoProveedors.getAll([0]);
      final pedidos = pedidosRaw.whereType<PedidoProveedor>().toList();

      // Cargar proveedores
      final proveedoresRaw = await isar.proveedors.getAll([0]);
      final proveedores = proveedoresRaw.whereType<Proveedor>().toList();

      // Cargar configuración del negocio
      final businessConfigsRaw = await isar.businessConfigs.getAll([0]);
      final businessConfigs =
          businessConfigsRaw.whereType<BusinessConfig>().toList();
      final businessConfig =
          businessConfigs.isNotEmpty ? businessConfigs.first : null;

      // Cargar tema
      final configService = ref.read(appConfigServiceProvider);
      final theme = await configService.getSelectedTheme();
      final fontConfig = await configService.getSelectedFontConfig();

      setState(() {
        _pedidos = pedidos;
        _proveedores = proveedores;
        _businessConfig = businessConfig;
        _currentTheme = theme;
        _currentFontConfig = fontConfig;
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

  // Método para obtener nombre del proveedor (se usará cuando se implemente la carga de datos)
  // @pragma('vm:never-inline')
  // String _getProveedorNombre(int proveedorId) {
  //   final proveedor = _proveedores.firstWhere(
  //     (p) => p.id == proveedorId,
  //     orElse: () => Proveedor()..nombre = 'Proveedor no encontrado',
  //   );
  //   return proveedor.nombre;
  // }

  Color _getEstadoColor(String estado) {
    switch (estado) {
      case PedidoProveedor.estadoBorrador:
        return Colors.orange;
      case PedidoProveedor.estadoEnviado:
        return Colors.blue;
      case PedidoProveedor.estadoRecibido:
        return Colors.green;
      case PedidoProveedor.estadoCancelado:
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  String _getEstadoText(String estado) {
    switch (estado) {
      case PedidoProveedor.estadoBorrador:
        return 'Borrador';
      case PedidoProveedor.estadoEnviado:
        return 'Enviado';
      case PedidoProveedor.estadoRecibido:
        return 'Recibido';
      case PedidoProveedor.estadoCancelado:
        return 'Cancelado';
      default:
        return 'Desconocido';
    }
  }

  Future<void> _cambiarEstado(
    PedidoProveedor pedido,
    String nuevoEstado,
  ) async {
    try {
      final isar = await ref.read(isarServiceProvider).db;

      pedido.cambiarEstado(nuevoEstado);

      await isar.writeTxn(() async {
        await isar.pedidoProveedors.put(pedido);
      });

      setState(() {});

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Estado actualizado a: ${_getEstadoText(nuevoEstado)}',
            ),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error al actualizar estado: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _compartirPedido(PedidoProveedor pedido) async {
    try {
      final proveedor = _proveedores.firstWhere(
        (p) => p.id == pedido.proveedorId,
      );

      if (_businessConfig == null) {
        throw Exception('Configuración del negocio no encontrada');
      }

      await PdfService.sharePdf(
        pedido: pedido,
        proveedor: proveedor,
        businessConfig: _businessConfig!,
      );

      // Cambiar estado a enviado después de compartir
      await _cambiarEstado(pedido, PedidoProveedor.estadoEnviado);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error al compartir pedido: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _eliminarPedido(PedidoProveedor pedido) async {
    final confirmacion = await showDialog<bool>(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Confirmar eliminación'),
            content: Text(
              '¿Estás seguro de que quieres eliminar el pedido #${pedido.id}?',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('Cancelar'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('Eliminar'),
              ),
            ],
          ),
    );

    if (confirmacion == true) {
      try {
        final isar = await ref.read(isarServiceProvider).db;

        await isar.writeTxn(() async {
          await isar.pedidoProveedors.delete(pedido.id);
        });

        setState(() {
          _pedidos.remove(pedido);
        });

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Pedido eliminado exitosamente'),
              backgroundColor: Colors.green,
            ),
          );
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error al eliminar pedido: $e'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    }
  }

  Future<void> _convertirACompra(PedidoProveedor pedido) async {
    final proveedor = _proveedores.firstWhere(
      (p) => p.id == pedido.proveedorId,
      orElse: () => Proveedor(nombre: 'Proveedor no encontrado'),
    );

    final result = await showDialog(
      context: context,
      builder:
          (context) =>
              ConvertirPedidoCompraView(pedido: pedido, proveedor: proveedor),
    );

    if (result == true) {
      await _loadData(); // Recargar datos para reflejar el cambio
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Pedido convertido a Compra exitosamente'),
            backgroundColor: Colors.green,
          ),
        );
      }
    }
  }

  Widget _buildPedidoCard(PedidoProveedor pedido) {
    final theme = _currentTheme ?? AppTheme.darkTheme;
    final fontConfig = _currentFontConfig ?? FontConfig.defaultConfig;
    final proveedor = _proveedores.firstWhere(
      (p) => p.id == pedido.proveedorId,
      orElse: () => Proveedor(nombre: 'Proveedor no encontrado'),
    );

    return Card(
      color: theme.surfaceColor,
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
                        'Pedido #${pedido.id}',
                        style: TextStyle(
                          color: theme.textColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: fontConfig.titleFont,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        proveedor.nombre,
                        style: TextStyle(
                          color: theme.textSecondaryColor,
                          fontSize: 14,
                          fontFamily: fontConfig.bodyFont,
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
                    color: _getEstadoColor(
                      pedido.estado,
                    ).withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: _getEstadoColor(pedido.estado),
                      width: 1,
                    ),
                  ),
                  child: Text(
                    _getEstadoText(pedido.estado),
                    style: TextStyle(
                      color: _getEstadoColor(pedido.estado),
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      fontFamily: fontConfig.bodyFont,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            Row(
              children: [
                Icon(
                  Icons.calendar_today,
                  size: 16,
                  color: theme.textSecondaryColor,
                ),
                const SizedBox(width: 8),
                Text(
                  'Creado: ${_formatDate(pedido.fechaCreacion)}',
                  style: TextStyle(
                    color: theme.textSecondaryColor,
                    fontSize: 12,
                    fontFamily: fontConfig.bodyFont,
                  ),
                ),
              ],
            ),

            if (pedido.fechaEnvio != null) ...[
              const SizedBox(height: 4),
              Row(
                children: [
                  Icon(Icons.send, size: 16, color: theme.textSecondaryColor),
                  const SizedBox(width: 8),
                  Text(
                    'Enviado: ${_formatDate(pedido.fechaEnvio!)}',
                    style: TextStyle(
                      color: theme.textSecondaryColor,
                      fontSize: 12,
                      fontFamily: fontConfig.bodyFont,
                    ),
                  ),
                ],
              ),
            ],

            const SizedBox(height: 12),

            Text(
              '${pedido.items.length} artículos',
              style: TextStyle(
                color: theme.textSecondaryColor,
                fontSize: 14,
                fontFamily: fontConfig.bodyFont,
              ),
            ),

            if (pedido.totalEstimado != null) ...[
              const SizedBox(height: 4),
              Text(
                'Total estimado: \$${pedido.totalEstimado!.toStringAsFixed(2)}',
                style: TextStyle(
                  color: theme.primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: fontConfig.bodyFont,
                ),
              ),
            ],

            const SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Botón Ver Detalles
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      context.push(
                        '${AppRoutes.pedidosProveedor}/edit/${pedido.id}',
                      );
                    },
                    icon: Icon(Icons.visibility, size: 16),
                    label: const Text('Ver'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: theme.primaryColor,
                      side: BorderSide(color: theme.primaryColor),
                    ),
                  ),
                ),

                const SizedBox(width: 8),

                // Botón Compartir (solo si es borrador)
                if (pedido.estado == PedidoProveedor.estadoBorrador)
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () => _compartirPedido(pedido),
                      icon: Icon(Icons.share, size: 16),
                      label: const Text('Compartir'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ),

                // Botón Marcar como Recibido (solo si está enviado)
                if (pedido.estado == PedidoProveedor.estadoEnviado)
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed:
                          () => _cambiarEstado(
                            pedido,
                            PedidoProveedor.estadoRecibido,
                          ),
                      icon: Icon(Icons.check, size: 16),
                      label: const Text('Recibido'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ),

                // Botón Convertir a Compra (solo si está recibido)
                if (pedido.estado == PedidoProveedor.estadoRecibido)
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () => _convertirACompra(pedido),
                      icon: Icon(Icons.shopping_cart, size: 16),
                      label: const Text('Convertir'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ),

                const SizedBox(width: 8),

                // Botón Eliminar (solo si es borrador o cancelado)
                if (pedido.estado == PedidoProveedor.estadoBorrador ||
                    pedido.estado == PedidoProveedor.estadoCancelado)
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () => _eliminarPedido(pedido),
                      icon: Icon(Icons.delete, size: 16),
                      label: const Text('Eliminar'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.red,
                        side: BorderSide(color: Colors.red),
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

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    final theme = _currentTheme ?? AppTheme.darkTheme;
    final fontConfig = _currentFontConfig ?? FontConfig.defaultConfig;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pedidos a Proveedores'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh, color: theme.textColor),
            onPressed: _loadData,
            tooltip: 'Actualizar',
          ),
        ],
      ),
      body: Column(
        children: [
          // Descripción de la sección de pedidos a proveedores
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              color: Colors.blueGrey[900],
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  'En esta sección puedes gestionar los pedidos realizados a proveedores. Aquí puedes registrar nuevos pedidos, consultar el estado de los pedidos existentes y llevar el control de las compras y abastecimiento de tu tienda.',
                  style: const TextStyle(color: Colors.white70, fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Expanded(
            child:
                _pedidos.isEmpty
                    ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.inventory_2_outlined,
                            size: 64,
                            color: theme.textSecondaryColor,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'No hay pedidos a proveedores',
                            style: TextStyle(
                              color: theme.textSecondaryColor,
                              fontSize: 18,
                              fontFamily: fontConfig.titleFont,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Crea tu primer pedido para comenzar',
                            style: TextStyle(
                              color: theme.textSecondaryColor,
                              fontSize: 14,
                              fontFamily: fontConfig.bodyFont,
                            ),
                          ),
                        ],
                      ),
                    )
                    : ListView.builder(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      itemCount: _pedidos.length,
                      itemBuilder: (context, index) {
                        return _buildPedidoCard(_pedidos[index]);
                      },
                    ),
          ),
        ],
      ),
      floatingActionButton: PermissionFAB(
        onPressed: () {
          context.push(AppRoutes.pedidoProveedorAdd);
        },
        action: 'create',
        resource: 'pedidos',
        icon: Icons.add,
        tooltip: 'Nuevo Pedido',
        backgroundColor: theme.primaryColor,
        foregroundColor: Colors.white,
      ),
    );
  }
}
