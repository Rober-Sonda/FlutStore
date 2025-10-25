import 'package:flutter/material.dart';
import 'package:tienda_app/models/categoria.dart';
import 'package:tienda_app/models/producto.dart';
import 'package:tienda_app/views/productos/dialogs/agregar_al_carrito_dialog.dart';
// Elimina la importación de flutter_screenutil si no está en tu proyecto
// import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    final isLowStock =
        producto.stockActual != null && producto.stockActual! <= 10;
    final isOutOfStock =
        producto.stockActual != null && producto.stockActual! == 0;
    final theme = Theme.of(context);

    final imagenUrl =
        (producto.imagenes != null && producto.imagenes!.isNotEmpty)
            ? producto.imagenes!.first
            : null; // Cambia a null si no hay imagen

    // Responsive manual: calcula el ancho máximo/min según el ancho de pantalla
    final screenWidth = MediaQuery.of(context).size.width;
    double maxCardWidth = 320;
    double minCardWidth = 180;
    if (screenWidth < 600) {
      maxCardWidth = 180;
      minCardWidth = 120;
    } else if (screenWidth > 1200) {
      maxCardWidth = 340;
      minCardWidth = 200;
    }

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: maxCardWidth,
          minWidth: minCardWidth,
        ),
        child: AspectRatio(
          aspectRatio: 0.7,
          child: Card(
            color: theme.colorScheme.surface,
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(18),
              onTap: onEdit,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Imagen superior
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(18),
                      topRight: Radius.circular(18),
                    ),
                    child: AspectRatio(
                      aspectRatio: 1.2,
                      child:
                          imagenUrl != null
                              ? Image.network(
                                imagenUrl,
                                fit: BoxFit.cover,
                                errorBuilder:
                                    (context, error, stackTrace) => Container(
                                      color: Colors.grey[800],
                                      child: Image.asset(
                                        'assets/images/backgrounds/najam.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                              )
                              : Image.asset(
                                'assets/images/backgrounds/najam.png',
                                fit: BoxFit.cover,
                              ),
                    ),
                  ),
                  // Info principal
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(14, 10, 14, 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Nombre y acciones
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  producto.nombre ?? 'Producto sin nombre',
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: theme.colorScheme.onSurface,
                                    fontSize: 16,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              PopupMenuButton<String>(
                                icon: const Icon(
                                  Icons.more_vert,
                                  color: Colors.grey,
                                ),
                                onSelected: (value) {
                                  if (value == 'edit') onEdit();
                                  if (value == 'delete') onDelete();
                                },
                                itemBuilder:
                                    (context) => [
                                      const PopupMenuItem(
                                        value: 'edit',
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.edit,
                                              color: Colors.blue,
                                            ),
                                            SizedBox(width: 8),
                                            Text('Editar'),
                                          ],
                                        ),
                                      ),
                                      const PopupMenuItem(
                                        value: 'delete',
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.delete,
                                              color: Colors.red,
                                            ),
                                            SizedBox(width: 8),
                                            Text('Eliminar'),
                                          ],
                                        ),
                                      ),
                                    ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          // Categoría
                          Text(
                            getCategoryName(producto.categoriaId),
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.primary.withOpacity(0.7),
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 6),
                          // Precio
                          Text(
                            producto.precio != null
                                ? '\$${producto.precio!.toStringAsFixed(2)}'
                                : 'Sin precio',
                            style: theme.textTheme.titleMedium?.copyWith(
                              color: Colors.green[400],
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 6),
                          // Stock y propiedades
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 3,
                                ),
                                decoration: BoxDecoration(
                                  color:
                                      isOutOfStock
                                          ? Colors.red
                                          : isLowStock
                                          ? Colors.orange
                                          : Colors.green,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  'Stock: ${producto.stockActual ?? 0}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              if (producto.valoresPropiedades.isNotEmpty)
                                Flexible(
                                  child: Text(
                                    '${producto.valoresPropiedades.length} propiedades',
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      color: Colors.white54,
                                      fontSize: 12,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          const Spacer(),
                          // Botón agregar al carrito
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Tooltip(
                              message: 'Agregar al carrito',
                              child: IconButton(
                                icon: const Icon(
                                  Icons.add_shopping_cart,
                                  color: Colors.deepOrange,
                                  size: 22,
                                ),
                                onPressed: () async {
                                  await showDialog(
                                    context: context,
                                    builder:
                                        (context) => AgregarAlCarritoDialog(
                                          producto: producto,
                                        ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
