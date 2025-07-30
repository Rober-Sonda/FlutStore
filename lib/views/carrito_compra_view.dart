import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tienda_app/models/carrito_compra.dart';
import 'package:tienda_app/services/carrito_compra_service.dart';
import 'package:tienda_app/src/app_routes.dart';

class CarritoCompraView extends ConsumerStatefulWidget {
  const CarritoCompraView({super.key});

  @override
  ConsumerState<CarritoCompraView> createState() => _CarritoCompraViewState();
}

class _CarritoCompraViewState extends ConsumerState<CarritoCompraView> {
  bool isLoading = true;
  List<CarritoCompra> carrito = [];
  Map<String, dynamic> estadisticas = {};

  @override
  void initState() {
    super.initState();
    _cargarCarrito();
  }

  Future<void> _cargarCarrito() async {
    setState(() => isLoading = true);

    try {
      final carritoService = ref.read(carritoCompraServiceProvider);
      final carritoData = await carritoService.obtenerCarrito();
      final estadisticasData =
          await carritoService.obtenerEstadisticasCarrito();

      setState(() {
        carrito = carritoData;
        estadisticas = estadisticasData;
        isLoading = false;
      });
    } catch (e) {
      setState(() => isLoading = false);
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error al cargar carrito: $e')));
      }
    }
  }

  Future<void> _eliminarItem(int id) async {
    try {
      final carritoService = ref.read(carritoCompraServiceProvider);
      await carritoService.eliminarDelCarrito(id);
      _cargarCarrito();

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Producto eliminado del carrito'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error al eliminar: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _actualizarCantidad(int id, int nuevaCantidad) async {
    try {
      final carritoService = ref.read(carritoCompraServiceProvider);
      await carritoService.actualizarCantidad(id, nuevaCantidad);
      _cargarCarrito();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error al actualizar cantidad: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _procesarPedido() async {
    try {
      final carritoService = ref.read(carritoCompraServiceProvider);

      // Marcar todos los items como procesados
      for (final item in carrito) {
        await carritoService.marcarComoProcesado(item.id);
      }

      _cargarCarrito();

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Pedido procesado exitosamente'),
            backgroundColor: Colors.green,
          ),
        );
        context.pop();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error al procesar pedido: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _crearPedidoDesdeCarrito() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Crear Pedido'),
            content: const Text(
              '¿Deseas crear un pedido con todos los productos del carrito?',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('Cancelar'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('Crear Pedido'),
              ),
            ],
          ),
    );

    if (confirmed == true) {
      try {
        // Aquí iría la lógica para crear el pedido
        await Future.delayed(const Duration(seconds: 1)); // Simulación

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Pedido creado exitosamente'),
              backgroundColor: Colors.green,
            ),
          );
          context.push(AppRoutes.orders);
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error al crear pedido: $e'),
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
      appBar: AppBar(
        title: const Text('Carrito de Compras'),
        backgroundColor: Colors.blue[700],
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              context.push(AppRoutes.products);
            },
            icon: const Icon(Icons.add_shopping_cart),
            tooltip: 'Agregar Productos',
          ),
        ],
      ),
      body:
          isLoading
              ? const Center(child: CircularProgressIndicator())
              : carrito.isEmpty
              ? _buildEmptyCart()
              : _buildCartContent(),
    );
  }

  Widget _buildEmptyCart() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.shopping_cart_outlined, size: 64, color: Colors.grey[400]),
          const SizedBox(height: 16),
          Text(
            'Carrito vacío',
            style: TextStyle(fontSize: 18, color: Colors.grey[600]),
          ),
          const SizedBox(height: 8),
          Text(
            'Agrega productos al carrito para comenzar',
            style: TextStyle(color: Colors.grey[500]),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () {
              context.push(AppRoutes.products);
            },
            icon: const Icon(Icons.add_shopping_cart),
            label: const Text('Ver Productos'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue[700],
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCartContent() {
    final total = carrito.fold<double>(
      0,
      (sum, item) => sum + ((item.precioUnitario ?? 0) * (item.cantidad)),
    );

    return Column(
      children: [
        // Header con estadísticas
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey[50],
            border: Border(bottom: BorderSide(color: Colors.grey[300]!)),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Carrito de Compras',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[700],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue[100],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      '${carrito.length} productos',
                      style: TextStyle(
                        color: Colors.blue[700],
                        fontWeight: FontWeight.bold,
                      ),
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
                      'Total',
                      '\$${total.toStringAsFixed(2)}',
                      Icons.attach_money,
                      Colors.green,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildStatCard(
                      'Productos',
                      '${carrito.length}',
                      Icons.inventory,
                      Colors.blue,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildStatCard(
                      'Cantidad',
                      '${carrito.fold<int>(0, (sum, item) => sum + item.cantidad)}',
                      Icons.shopping_bag,
                      Colors.orange,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        // Lista de productos
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: carrito.length,
            itemBuilder: (context, index) {
              return _buildCartItem(carrito[index]);
            },
          ),
        ),

        // Footer con acciones
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(top: BorderSide(color: Colors.grey[300]!)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 3,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: Column(
            children: [
              // Resumen del total
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green[50],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.green[200]!),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total a Pagar:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green[700],
                      ),
                    ),
                    Text(
                      '\$${total.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.green[700],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Botones de acción
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: _crearPedidoDesdeCarrito,
                      icon: const Icon(Icons.receipt_long),
                      label: const Text('Crear Pedido'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange[700],
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: _procesarPedido,
                      icon: const Icon(Icons.check_circle),
                      label: const Text('Procesar'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green[700],
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCartItem(CarritoCompra item) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            // Imagen del producto
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(Icons.image, color: Colors.grey[400]),
            ),
            const SizedBox(width: 12),

            // Información del producto
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.nombreProducto,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '\$${(item.precioUnitario ?? 0).toStringAsFixed(2)}',
                    style: TextStyle(
                      color: Colors.green[700],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            // Controles de cantidad
            Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        final nuevaCantidad = item.cantidad - 1;
                        if (nuevaCantidad > 0) {
                          _actualizarCantidad(item.id, nuevaCantidad);
                        }
                      },
                      icon: const Icon(Icons.remove),
                      tooltip: 'Reducir cantidad',
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        '${item.cantidad}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        final nuevaCantidad = item.cantidad + 1;
                        _actualizarCantidad(item.id, nuevaCantidad);
                      },
                      icon: const Icon(Icons.add),
                      tooltip: 'Aumentar cantidad',
                    ),
                  ],
                ),
                Text(
                  '\$${((item.precioUnitario ?? 0) * item.cantidad).toStringAsFixed(2)}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green[700],
                  ),
                ),
              ],
            ),

            // Botón eliminar
            IconButton(
              onPressed: () => _eliminarItem(item.id),
              icon: const Icon(Icons.delete),
              color: Colors.red,
              tooltip: 'Eliminar del carrito',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(height: 4),
            Text(
              value,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            Text(
              title,
              style: TextStyle(fontSize: 10, color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
