import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tienda_app/models/carrito_compra.dart';
import 'package:tienda_app/services/carrito_compra_service.dart';

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
      final estadisticasData = await carritoService.obtenerEstadisticasCarrito();
      
      setState(() {
        carrito = carritoData;
        estadisticas = estadisticasData;
        isLoading = false;
      });
    } catch (e) {
      setState(() => isLoading = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al cargar carrito: $e')),
        );
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
            content: Text('Pedido procesado correctamente'),
            backgroundColor: Colors.green,
          ),
        );
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

  Widget _buildEstadisticasCard() {
    return Card(
      color: Colors.grey[850],
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Resumen del Carrito',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _buildStatItem(
                    'Total Items',
                    '${estadisticas['totalItems'] ?? 0}',
                    Icons.shopping_cart,
                    Colors.blue,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildStatItem(
                    'Valor Total',
                    '\$${(estadisticas['totalValor'] ?? 0).toStringAsFixed(2)}',
                    Icons.attach_money,
                    Colors.green,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildStatItem(
                    'Urgentes',
                    '${estadisticas['itemsUrgentes'] ?? 0}',
                    Icons.warning,
                    Colors.orange,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String title, String value, IconData icon, Color color) {
    return Column(
      children: [
        Icon(icon, color: color, size: 24),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            color: color,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildCarritoItem(CarritoCompra item) {
    return Card(
      color: Colors.grey[850],
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.nombreProducto,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Proveedor: ${item.nombreProveedor}',
                        style: const TextStyle(color: Colors.white70),
                      ),
                      Text(
                        'Precio: \$${(item.precioUnitario ?? 0).toStringAsFixed(2)}',
                        style: const TextStyle(color: Colors.green),
                      ),
                    ],
                  ),
                ),
                if (item.esUrgente)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      'URGENTE',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove, color: Colors.white),
                        onPressed: () {
                          if (item.cantidad > 1) {
                            _actualizarCantidad(item.id, item.cantidad - 1);
                          }
                        },
                      ),
                      Text(
                        '${item.cantidad}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.add, color: Colors.white),
                        onPressed: () {
                          _actualizarCantidad(item.id, item.cantidad + 1);
                        },
                      ),
                    ],
                  ),
                ),
                Text(
                  'Total: \$${(item.precioTotal ?? 0).toStringAsFixed(2)}',
                  style: const TextStyle(
                    color: Colors.green,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () => _eliminarItem(item.id),
                ),
              ],
            ),
            if (item.notas != null && item.notas!.isNotEmpty) ...[
              const SizedBox(height: 8),
              Text(
                'Notas: ${item.notas}',
                style: const TextStyle(color: Colors.white70, fontSize: 12),
              ),
            ],
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Carrito de Compras', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.white),
            onPressed: _cargarCarrito,
            tooltip: 'Actualizar',
          ),
        ],
      ),
      body: isLoading
        ? const Center(child: CircularProgressIndicator())
        : Column(
            children: [
              // Estadísticas
              Padding(
                padding: const EdgeInsets.all(16),
                child: _buildEstadisticasCard(),
              ),
              
              // Lista del carrito
              Expanded(
                child: carrito.isEmpty
                  ? const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.shopping_cart_outlined,
                            size: 64,
                            color: Colors.white54,
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Carrito vacío',
                            style: TextStyle(
                              color: Colors.white54,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Agrega productos desde la lista de productos',
                            style: TextStyle(
                              color: Colors.white38,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: carrito.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: _buildCarritoItem(carrito[index]),
                        );
                      },
                    ),
              ),
              
              // Botón de procesar pedido
              if (carrito.isNotEmpty)
                Container(
                  padding: const EdgeInsets.all(16),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: _procesarPedido,
                      icon: const Icon(Icons.shopping_bag),
                      label: const Text('Procesar Pedido de Compra'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurpleAccent,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                    ),
                  ),
                ),
            ],
          ),
    );
  }
} 