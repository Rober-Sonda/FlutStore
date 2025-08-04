import 'package:flutter/material.dart';
import '../../../models/producto.dart';
import '../../../models/categoria.dart';
import '../../../widgets/product_image_carousel.dart';
import '../dialogs/agregar_al_carrito_dialog.dart';

class ProductCard extends StatelessWidget {
  final Producto producto;
  final List<Categoria>? categorias;
  final Map<String, dynamic> inventoryStats;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final String Function(int?) getCategoryName;

  const ProductCard({
    super.key,
    required this.producto,
    required this.categorias,
    required this.inventoryStats,
    required this.onEdit,
    required this.onDelete,
    required this.getCategoryName,
  });

  @override
  Widget build(BuildContext context) {
    final isLowStock = producto.stock != null && producto.stock! <= 10;
    final isOutOfStock = producto.stock != null && producto.stock! == 0;

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
                  child: Text(
                    producto.nombre ?? 'Producto sin nombre',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.add_shopping_cart,
                        color: Colors.orange,
                      ),
                      onPressed: () async {
                        await showDialog(
                          context: context,
                          builder: (context) =>
                              AgregarAlCarritoDialog(producto: producto),
                        );
                      },
                      tooltip: 'Agregar al carrito de compras',
                    ),
                    PopupMenuButton<String>(
                      icon: const Icon(Icons.more_vert, color: Colors.white70),
                      onSelected: (value) async {
                        switch (value) {
                          case 'edit':
                            onEdit();
                            break;
                          case 'delete':
                            onDelete();
                            break;
                        }
                      },
                      itemBuilder: (context) => [
                        const PopupMenuItem(
                          value: 'edit',
                          child: Row(
                            children: [
                              Icon(Icons.edit, color: Colors.blue),
                              SizedBox(width: 8),
                              Text('Editar'),
                            ],
                          ),
                        ),
                        const PopupMenuItem(
                          value: 'delete',
                          child: Row(
                            children: [
                              Icon(Icons.delete, color: Colors.red),
                              SizedBox(width: 8),
                              Text('Eliminar'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Carrusel de imágenes del producto
            if (producto.imagenes.isNotEmpty)
              Container(
                height: 150,
                margin: const EdgeInsets.only(bottom: 12),
                child: ProductImageCarousel(
                  imagenes: producto.imagenes,
                  imagenPrincipal: producto.imagenPrincipal,
                  esEditable: false,
                  altura: 150,
                  ancho: double.infinity,
                ),
              ),

            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Categoría: ${getCategoryName(producto.categoriaId)}',
                        style: const TextStyle(color: Colors.white70),
                      ),
                      const SizedBox(height: 4),
                      if (producto.precio != null)
                        Text(
                          '\$${producto.precio!.toStringAsFixed(2)}',
                          style: const TextStyle(
                            color: Colors.green,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: isOutOfStock
                            ? Colors.red
                            : isLowStock
                                ? Colors.orange
                                : Colors.green,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'Stock: ${producto.stock ?? 0}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    if (producto.valoresPropiedades.isNotEmpty) ...[
                      const SizedBox(height: 4),
                      Text(
                        '${producto.valoresPropiedades.length} propiedades',
                        style: const TextStyle(
                          color: Colors.white54,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
} 