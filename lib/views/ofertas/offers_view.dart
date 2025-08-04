import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../models/oferta.dart';
import '../../models/producto.dart';
import '../../models/registrofinanciero.dart';
import '../../services/isar_service.dart';
import '../../widgets/permission_widget.dart';

class OffersView extends ConsumerStatefulWidget {
  const OffersView({super.key});

  @override
  ConsumerState<OffersView> createState() => _OffersViewState();
}

class _OffersViewState extends ConsumerState<OffersView> {
  List<Oferta> _ofertas = [];
  List<Producto> _productos = [];
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
      final ofertasRaw = await isar.ofertas.getAll([0]);
      final ofertas = ofertasRaw.whereType<Oferta>().toList();
      final productosRaw = await isar.productos.getAll([0]);
      final productos = productosRaw.whereType<Producto>().toList();

      setState(() {
        _ofertas = ofertas;
        _productos = productos;
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

  List<Oferta> get _ofertasFiltradas {
    switch (_filtroSeleccionado) {
      case 'Activas':
        return _ofertas.where((o) => o.estaActiva).toList();
      case 'Próximamente':
        return _ofertas.where((o) => o.estaPorComenzar).toList();
      case 'Expiradas':
        return _ofertas.where((o) => o.haExpirado).toList();
      case 'Agotadas':
        return _ofertas.where((o) => o.estadoOferta == 'Agotada').toList();
      default:
        return _ofertas;
    }
  }

  int get _totalOfertas => _ofertas.length;
  int get _ofertasActivas => _ofertas.where((o) => o.estaActiva).length;
  int get _ofertasExpiradas => _ofertas.where((o) => o.haExpirado).length;

  double get _totalPerdidasOfertas {
    double perdidas = 0.0;
    for (final oferta in _ofertas) {
      if (oferta.ventasRealizadas > 0) {
        // Calcular pérdida por venta con descuento
        final perdidaPorVenta = oferta.ahorroEnPesos * oferta.ventasRealizadas;
        perdidas += perdidaPorVenta;
      }
    }
    return perdidas;
  }

  Color _getEstadoColor(Oferta oferta) {
    switch (oferta.estadoOferta) {
      case 'Activa':
        return Colors.green;
      case 'Próximamente':
        return Colors.blue;
      case 'Expirada':
      case 'Inactiva':
        return Colors.red;
      case 'Agotada':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  Producto? _getProducto(Oferta oferta) {
    try {
      return _productos.firstWhere((p) => p.id == oferta.productoId);
    } catch (e) {
      return null;
    }
  }

  Future<void> _activarOferta(Oferta oferta) async {
    try {
      final isar = await ref.read(isarServiceProvider).db;

      oferta.activa = true;
      oferta.fechaActualizacion = DateTime.now();

      await isar.writeTxn(() async {
        await isar.ofertas.put(oferta);
      });

      setState(() {});

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Oferta activada exitosamente'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error al activar oferta: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _desactivarOferta(Oferta oferta) async {
    try {
      final isar = await ref.read(isarServiceProvider).db;

      oferta.activa = false;
      oferta.fechaActualizacion = DateTime.now();

      await isar.writeTxn(() async {
        await isar.ofertas.put(oferta);
      });

      setState(() {});

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Oferta desactivada exitosamente'),
            backgroundColor: Colors.orange,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error al desactivar oferta: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _eliminarOferta(Oferta oferta) async {
    final confirmacion = await showDialog<bool>(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Confirmar eliminación'),
            content: Text(
              '¿Estás seguro de que quieres eliminar la oferta "${oferta.nombre}"?',
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
          await isar.ofertas.delete(oferta.id);
        });

        setState(() {
          _ofertas.remove(oferta);
        });

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Oferta eliminada exitosamente'),
              backgroundColor: Colors.green,
            ),
          );
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error al eliminar oferta: $e'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    }
  }

  Future<void> _registrarPerdidaOferta(Oferta oferta) async {
    try {
      final isar = await ref.read(isarServiceProvider).db;

      // Crear registro de pérdida por ofertas
      final perdidaOferta = RegistroFinanciero(
        concepto: 'Pérdida por oferta: ${oferta.nombre}',
        descripcion: 'Pérdida generada por descuento en oferta',
        monto: oferta.ahorroEnPesos * oferta.ventasRealizadas,
        tipo: 'egreso',
        categoria: 'descuentos',
        fecha: DateTime.now(),
        usuarioId: 1, // TODO: Obtener ID del usuario actual
      );

      await isar.writeTxn(() async {
        await isar.registroFinancieros.put(perdidaOferta);
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Pérdida registrada: \$${perdidaOferta.monto.toStringAsFixed(2)}',
            ),
            backgroundColor: Colors.orange,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error al registrar pérdida: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Widget _buildOfertaCard(Oferta oferta) {
    final producto = _getProducto(oferta);

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
                        oferta.nombre,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (oferta.descripcion != null) ...[
                        const SizedBox(height: 4),
                        Text(
                          oferta.descripcion!,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                      if (producto != null) ...[
                        const SizedBox(height: 4),
                        Text(
                          'Producto: ${producto.nombre}',
                          style: const TextStyle(
                            color: Colors.blue,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: _getEstadoColor(oferta).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: _getEstadoColor(oferta),
                      width: 1,
                    ),
                  ),
                  child: Text(
                    oferta.estadoOferta,
                    style: TextStyle(
                      color: _getEstadoColor(oferta),
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
                    'Precio Original',
                    oferta.precioOriginalFormateado,
                    Icons.attach_money,
                    Colors.grey,
                  ),
                ),
                Expanded(
                  child: _buildStatItem(
                    'Precio Oferta',
                    oferta.precioOfertaFormateado,
                    Icons.local_offer,
                    Colors.green,
                  ),
                ),
                Expanded(
                  child: _buildStatItem(
                    'Descuento',
                    oferta.porcentajeDescuentoFormateado,
                    Icons.discount,
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
                    'Ventas',
                    oferta.ventasRealizadas.toString(),
                    Icons.shopping_cart,
                    Colors.blue,
                  ),
                ),
                Expanded(
                  child: _buildStatItem(
                    'Ingresos',
                    '\$${oferta.ingresosGenerados.toStringAsFixed(2)}',
                    Icons.trending_up,
                    Colors.green,
                  ),
                ),
                Expanded(
                  child: _buildStatItem(
                    'Días Restantes',
                    oferta.diasRestantes.toString(),
                    Icons.schedule,
                    Colors.purple,
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
                      context.push('/offers/edit/${oferta.id}');
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

                // Botón Activar/Desactivar
                if (oferta.activa)
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () => _desactivarOferta(oferta),
                      icon: const Icon(Icons.pause, size: 16),
                      label: const Text('Pausar'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  )
                else
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () => _activarOferta(oferta),
                      icon: const Icon(Icons.play_arrow, size: 16),
                      label: const Text('Activar'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ),

                const SizedBox(width: 8),

                // Botón Registrar Pérdida
                if (oferta.ventasRealizadas > 0)
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () => _registrarPerdidaOferta(oferta),
                      icon: const Icon(Icons.account_balance_wallet, size: 16),
                      label: const Text('Registrar Pérdida'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.red,
                        side: const BorderSide(color: Colors.red),
                      ),
                    ),
                  ),

                const SizedBox(width: 8),

                // Botón Eliminar
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => _eliminarOferta(oferta),
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
        title: const Text('Ofertas', style: TextStyle(color: Colors.white)),
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
                  const PopupMenuItem(
                    value: 'Próximamente',
                    child: Text('Próximamente'),
                  ),
                  const PopupMenuItem(
                    value: 'Expiradas',
                    child: Text('Expiradas'),
                  ),
                  const PopupMenuItem(
                    value: 'Agotadas',
                    child: Text('Agotadas'),
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
                  // Resumen de ofertas
                  Card(
                    margin: const EdgeInsets.all(16),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          const Text(
                            'Resumen de Ofertas',
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
                                  'Total',
                                  _totalOfertas.toDouble(),
                                  Colors.blue,
                                  Icons.list,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: _buildStatCard(
                                  'Activas',
                                  _ofertasActivas.toDouble(),
                                  Colors.green,
                                  Icons.local_offer,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: _buildStatCard(
                                  'Pérdidas',
                                  _totalPerdidasOfertas,
                                  Colors.red,
                                  Icons.trending_down,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Lista de ofertas
                  Expanded(
                    child:
                        _ofertasFiltradas.isEmpty
                            ? const Center(
                              child: Text(
                                'No hay ofertas registradas',
                                style: TextStyle(color: Colors.white70),
                              ),
                            )
                            : ListView.builder(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              itemCount: _ofertasFiltradas.length,
                              itemBuilder: (context, index) {
                                return _buildOfertaCard(
                                  _ofertasFiltradas[index],
                                );
                              },
                            ),
                  ),
                ],
              ),
      floatingActionButton: PermissionFAB(
        onPressed: () {
          context.push('/offers/add');
        },
        action: 'create',
        resource: 'ofertas',
        icon: Icons.add,
        tooltip: 'Nueva Oferta',
        backgroundColor: Colors.orange,
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
            title == 'Pérdidas'
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
