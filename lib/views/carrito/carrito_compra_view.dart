import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../providers/carrito_provider.dart';
// NUEVO: Importa provider para notificaciones de pedidos
import 'package:flutter_riverpod/flutter_riverpod.dart';

// NUEVO: Provider para notificaciones de pedidos pendientes
final pedidosNotificacionProvider = StateProvider<bool>((ref) => false);

class CarritoCompraView extends ConsumerWidget {
  const CarritoCompraView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final carrito = ref.watch(carritoProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrito de Compras'),
      ),
      body: Column(
        children: [
          // NUEVO: Descripción de la sección de carrito
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              color: Colors.blueGrey[900],
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  'Aquí puedes agregar productos para crear un pedido rápido. Modifica cantidades, elimina productos y confirma tu pedido cuando estés listo.',
                  style: const TextStyle(color: Colors.white70, fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Expanded(
            child: carrito.isEmpty
                ? const Center(child: Text('No hay productos en el carrito.'))
                : ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemCount: carrito.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final item = carrito[index];
                      return Card(
                        elevation: 2,
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.grey[200],
                            child: Icon(Icons.shopping_bag, color: Colors.grey[600]),
                          ),
                          title: Text(item['producto'].nombre ?? 'Producto'),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Proveedor: ${item['proveedor']?.nombre ?? 'N/A'}'),
                              Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.remove),
                                    tooltip: 'Disminuir cantidad',
                                    onPressed: () {
                                      if (item['cantidad'] > 1) {
                                        ref.read(carritoProvider.notifier).decrementarCantidad(index);
                                      }
                                    },
                                  ),
                                  Text('${item['cantidad']}', style: const TextStyle(fontWeight: FontWeight.bold)),
                                  IconButton(
                                    icon: const Icon(Icons.add),
                                    tooltip: 'Aumentar cantidad',
                                    onPressed: () {
                                      ref.read(carritoProvider.notifier).incrementarCantidad(index);
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                          trailing: PopupMenuButton<String>(
                            icon: const Icon(Icons.more_vert),
                            onSelected: (value) async {
                              if (value == 'edit') {
                                // Diálogo para editar proveedor y cantidad
                                final result = await showDialog<Map<String, dynamic>>(
                                  context: context,
                                  builder: (context) {
                                    final cantidadController = TextEditingController(text: item['cantidad'].toString());
                                    String? proveedorSeleccionadoId = item['proveedor']?.id?.toString();
                                    final proveedores = carrito
                                        .map((e) => e['proveedor'])
                                        .where((p) => p != null)
                                        .toSet()
                                        .toList();
                                    return AlertDialog(
                                      backgroundColor: const Color(0xFF23272A), // gris oscuro
                                      title: const Text('Editar producto en carrito', style: TextStyle(color: Colors.black)),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          TextFormField(
                                            controller: cantidadController,
                                            keyboardType: TextInputType.number,
                                            decoration: const InputDecoration(
                                              labelText: 'Cantidad',
                                              filled: true,
                                              fillColor: Colors.white,
                                              labelStyle: TextStyle(color: Colors.black),
                                            ),
                                            style: const TextStyle(color: Colors.black),
                                          ),
                                          const SizedBox(height: 16),
                                          DropdownButtonFormField<String>(
                                            value: proveedorSeleccionadoId,
                                            items: proveedores.map<DropdownMenuItem<String>>((prov) {
                                              return DropdownMenuItem<String>(
                                                value: prov.id.toString(),
                                                child: Text(prov.nombre ?? 'Proveedor', style: const TextStyle(color: Colors.black)),
                                              );
                                            }).toList(),
                                            onChanged: (value) {
                                              proveedorSeleccionadoId = value;
                                            },
                                            decoration: const InputDecoration(
                                              labelText: 'Proveedor',
                                              filled: true,
                                              fillColor: Colors.white,
                                              labelStyle: TextStyle(color: Colors.black),
                                            ),
                                            style: const TextStyle(color: Colors.black),
                                            dropdownColor: Colors.white,
                                          ),
                                        ],
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () => Navigator.pop(context),
                                          child: const Text('Cancelar', style: TextStyle(color: Colors.black)),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            final nuevaCantidad = int.tryParse(cantidadController.text) ?? item['cantidad'];
                                            Navigator.pop(context, {
                                              'cantidad': nuevaCantidad,
                                              'proveedorId': proveedorSeleccionadoId,
                                            });
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.white,
                                            foregroundColor: Colors.black,
                                          ),
                                          child: const Text('Guardar', style: TextStyle(color: Colors.black)),
                                        ),
                                      ],
                                    );
                                  },
                                );
                                if (result != null) {
                                  // Actualiza cantidad
                                  if (result['cantidad'] != null && result['cantidad'] > 0) {
                                    ref.read(carritoProvider.notifier).actualizarCantidad(index, result['cantidad']);
                                  }
                                  // Actualiza proveedor
                                  if (result['proveedorId'] != null) {
                                    final nuevoProveedor = carrito
                                        .map((e) => e['proveedor'])
                                        .firstWhere(
                                          (p) => p != null && p.id.toString() == result['proveedorId'],
                                          orElse: () => item['proveedor'],
                                        );
                                    ref.read(carritoProvider.notifier).actualizarProveedor(index, nuevoProveedor);
                                  }
                                }
                              }
                              if (value == 'delete') {
                                ref.read(carritoProvider.notifier).eliminarItem(index);
                              }
                            },
                            itemBuilder: (context) => [
                              const PopupMenuItem(
                                value: 'edit',
                                child: ListTile(
                                  leading: Icon(Icons.edit, color: Colors.blue),
                                  title: Text('Editar'),
                                ),
                              ),
                              const PopupMenuItem(
                                value: 'delete',
                                child: ListTile(
                                  leading: Icon(Icons.delete, color: Colors.red),
                                  title: Text('Eliminar'),
                                ),
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
      bottomNavigationBar: carrito.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.add_shopping_cart),
                      label: const Text('Agregar más productos'),
                      onPressed: () {
                        context.go('/products');
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.send),
                      label: const Text('Crear pedido'),
                      onPressed: () async {
                        // Aquí deberías crear el pedido en la base de datos
                        // ...lógica para crear el pedido desde el carrito...

                        // Limpia el carrito
                        ref.read(carritoProvider.notifier).limpiar();

                        // Marca la notificación de pedidos como pendiente
                        // El punto rojo y la lógica de notificación deben estar SOLO en la sección de pedidos,
                        // no aquí en el carrito de compras.
                        // Elimina o comenta la siguiente línea si la tienes:
                        // ref.read(pedidosNotificacionProvider.notifier).state = true;

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Pedido creado y carrito limpiado')),
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          : null,
    );
  }
}