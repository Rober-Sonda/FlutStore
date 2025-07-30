import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:isar/isar.dart';
import 'package:tienda_app/models/producto.dart';
import 'package:tienda_app/models/categoria.dart';
import 'package:tienda_app/services/product_service.dart';
import 'package:tienda_app/src/app_routes.dart';
import 'package:tienda_app/widgets/product_image_carousel.dart';
import 'agregar_al_carrito_dialog.dart';

class ProductsView extends ConsumerStatefulWidget {
  const ProductsView({super.key});

  @override
  _ProductsViewState createState() => _ProductsViewState();
}

class _ProductsViewState extends ConsumerState<ProductsView> {
  List<Producto>? productos;
  List<Categoria>? categorias;
  bool isLoading = true;
  String searchQuery = '';
  int? selectedCategoryId;
  String sortBy = 'nombre';
  bool sortAscending = true;
  bool showLowStock = false;
  bool showOutOfStock = false;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() => isLoading = true);

    try {
      final productService = ref.read(productServiceProvider);
      final isar = await productService.db;

      final productosData = await isar.productos.where().findAll();
      final categoriasData = await isar.categorias.where().findAll();

      setState(() {
        productos = productosData;
        categorias = categoriasData;
        isLoading = false;
      });
    } catch (e) {
      setState(() => isLoading = false);
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error al cargar datos: $e')));
      }
    }
  }

  List<Producto> get filteredProducts {
    if (productos == null) return [];

    return productos!.where((producto) {
        // Filtro por búsqueda
        final matchesSearch = producto.nombre.toLowerCase().contains(
          searchQuery.toLowerCase(),
        );

        // Filtro por categoría
        final matchesCategory =
            selectedCategoryId == null ||
            producto.categoriaId == selectedCategoryId;

        // Filtro por stock bajo
        final matchesLowStock =
            !showLowStock || (producto.stock != null && producto.stock! <= 10);

        // Filtro por sin stock
        final matchesOutOfStock =
            !showOutOfStock || (producto.stock != null && producto.stock! == 0);

        return matchesSearch &&
            matchesCategory &&
            matchesLowStock &&
            matchesOutOfStock;
      }).toList()
      ..sort((a, b) {
        int comparison = 0;
        switch (sortBy) {
          case 'nombre':
            comparison = a.nombre.compareTo(b.nombre);
            break;
          case 'precio':
            comparison = (a.precio ?? 0).compareTo(b.precio ?? 0);
            break;
          case 'stock':
            comparison = (a.stock ?? 0).compareTo(b.stock ?? 0);
            break;
          case 'categoria':
            comparison = (a.categoriaId ?? 0).compareTo(b.categoriaId ?? 0);
            break;
        }
        return sortAscending ? comparison : -comparison;
      });
  }

  Map<String, dynamic> get inventoryStats {
    if (productos == null) return {};

    final totalProducts = productos!.length;
    final productsWithStock =
        productos!.where((p) => p.stock != null && p.stock! > 0).length;
    final lowStockProducts =
        productos!.where((p) => p.stock != null && p.stock! <= 10).length;
    final outOfStockProducts =
        productos!.where((p) => p.stock != null && p.stock! == 0).length;
    final totalValue = productos!.fold<double>(
      0,
      (sum, p) => sum + ((p.precio ?? 0) * (p.stock ?? 0)),
    );

    return {
      'total': totalProducts,
      'withStock': productsWithStock,
      'lowStock': lowStockProducts,
      'outOfStock': outOfStockProducts,
      'totalValue': totalValue,
    };
  }

  String getCategoryName(int? categoryId) {
    if (categorias == null || categoryId == null) return 'Sin categoría';
    final categoria = categorias!.firstWhere(
      (c) => c.id == categoryId,
      orElse: () => Categoria()..nombre = 'Sin categoría',
    );
    return categoria.nombre;
  }

  Widget _buildDashboardCard(
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Card(
      color: Colors.grey[850],
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: color, size: 24),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                color: color,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCard(Producto producto) {
    final stats = inventoryStats;
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
                    producto.nombre,
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
                          builder:
                              (context) =>
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
                            final result = await context.push(
                              AppRoutes.productEdit.replaceAll(
                                ':id',
                                producto.id.toString(),
                              ),
                            );
                            if (result == true) _loadData();
                            break;
                          case 'delete':
                            _showDeleteDialog(producto);
                            break;
                        }
                      },
                      itemBuilder:
                          (context) => [
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
                        color:
                            isOutOfStock
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

  void _showDeleteDialog(Producto producto) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Confirmar eliminación'),
            content: Text(
              '¿Estás seguro de que quieres eliminar "${producto.nombre}"?',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Cancelar'),
              ),
              TextButton(
                onPressed: () async {
                  Navigator.of(context).pop();
                  try {
                    final productService = ref.read(productServiceProvider);
                    final isar = await productService.db;
                    await isar.writeTxn(() async {
                      await isar.productos.delete(producto.id);
                    });
                    _loadData();
                    if (mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Producto eliminado correctamente'),
                        ),
                      );
                    }
                  } catch (e) {
                    if (mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Error al eliminar: $e')),
                      );
                    }
                  }
                },
                child: const Text(
                  'Eliminar',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final stats = inventoryStats;
    final filteredProducts = this.filteredProducts;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Productos', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.white),
            onPressed: _loadData,
            tooltip: 'Actualizar',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurpleAccent,
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: () async {
          final result = await context.push(AppRoutes.productAdd);
          if (result == true) {
            _loadData();
          }
        },
      ),
      body:
          isLoading
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    // Dashboard con estadísticas
                    if (productos != null && productos!.isNotEmpty) ...[
                      LayoutBuilder(
                        builder: (context, constraints) {
                          // Calcular el número de columnas basado en el ancho disponible
                          final cardWidth = 250.0; // Ancho fijo de cada card
                          final spacing = 16.0;
                          final crossAxisCount =
                              (constraints.maxWidth / (cardWidth + spacing))
                                  .floor();
                          final actualCrossAxisCount =
                              crossAxisCount > 0 ? crossAxisCount : 1;

                          return GridView.count(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            crossAxisCount: actualCrossAxisCount,
                            crossAxisSpacing: spacing,
                            mainAxisSpacing: spacing,
                            childAspectRatio: 2.5,
                            children: [
                              _buildDashboardCard(
                                'Total Productos',
                                '${stats['total']}',
                                Icons.inventory,
                                Colors.blue,
                              ),
                              _buildDashboardCard(
                                'Con Stock',
                                '${stats['withStock']}',
                                Icons.check_circle,
                                Colors.green,
                              ),
                              _buildDashboardCard(
                                'Stock Bajo',
                                '${stats['lowStock']}',
                                Icons.warning,
                                Colors.orange,
                              ),
                              _buildDashboardCard(
                                'Sin Stock',
                                '${stats['outOfStock']}',
                                Icons.error,
                                Colors.red,
                              ),
                            ],
                          );
                        },
                      ),
                      const SizedBox(height: 24),
                    ],

                    // Filtros y controles
                    Card(
                      color: Colors.grey[850],
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            // Barra de búsqueda
                            TextField(
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                hintText: 'Buscar productos...',
                                hintStyle: const TextStyle(
                                  color: Colors.white54,
                                ),
                                prefixIcon: const Icon(
                                  Icons.search,
                                  color: Colors.white54,
                                ),
                                filled: true,
                                fillColor: Colors.grey[800],
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              onChanged:
                                  (value) =>
                                      setState(() => searchQuery = value),
                            ),
                            const SizedBox(height: 16),

                            // Filtros
                            Row(
                              children: [
                                Expanded(
                                  child: DropdownButtonFormField<int?>(
                                    value: selectedCategoryId,
                                    decoration: const InputDecoration(
                                      labelText: 'Categoría',
                                      labelStyle: TextStyle(
                                        color: Colors.white70,
                                      ),
                                    ),
                                    style: const TextStyle(color: Colors.white),
                                    dropdownColor: Colors.grey[850],
                                    items: [
                                      const DropdownMenuItem(
                                        value: null,
                                        child: Text('Todas las categorías'),
                                      ),
                                      ...(categorias ?? []).map(
                                        (cat) => DropdownMenuItem(
                                          value: cat.id,
                                          child: Text(cat.nombre),
                                        ),
                                      ),
                                    ],
                                    onChanged:
                                        (value) => setState(
                                          () => selectedCategoryId = value,
                                        ),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: DropdownButtonFormField<String>(
                                    value: sortBy,
                                    decoration: const InputDecoration(
                                      labelText: 'Ordenar por',
                                      labelStyle: TextStyle(
                                        color: Colors.white70,
                                      ),
                                    ),
                                    style: const TextStyle(color: Colors.white),
                                    dropdownColor: Colors.grey[850],
                                    items: const [
                                      DropdownMenuItem(
                                        value: 'nombre',
                                        child: Text('Nombre'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'precio',
                                        child: Text('Precio'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'stock',
                                        child: Text('Stock'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'categoria',
                                        child: Text('Categoría'),
                                      ),
                                    ],
                                    onChanged:
                                        (value) =>
                                            setState(() => sortBy = value!),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),

                            // Checkboxes de filtros
                            Row(
                              children: [
                                Checkbox(
                                  value: showLowStock,
                                  onChanged:
                                      (value) =>
                                          setState(() => showLowStock = value!),
                                ),
                                const Text(
                                  'Mostrar solo stock bajo',
                                  style: TextStyle(color: Colors.white),
                                ),
                                const SizedBox(width: 16),
                                Checkbox(
                                  value: showOutOfStock,
                                  onChanged:
                                      (value) => setState(
                                        () => showOutOfStock = value!,
                                      ),
                                ),
                                const Text(
                                  'Mostrar solo sin stock',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Lista de productos
                    SizedBox(
                      height:
                          400, // Altura fija para evitar conflictos de layout
                      child:
                          productos == null || productos!.isEmpty
                              ? const Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.inventory_2_outlined,
                                      size: 64,
                                      color: Colors.white54,
                                    ),
                                    SizedBox(height: 16),
                                    Text(
                                      'No hay productos registrados',
                                      style: TextStyle(
                                        color: Colors.white54,
                                        fontSize: 18,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      'Toca el botón + para agregar tu primer producto',
                                      style: TextStyle(
                                        color: Colors.white38,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                              : filteredProducts.isEmpty
                              ? const Center(
                                child: Text(
                                  'No hay productos que coincidan con los filtros',
                                  style: TextStyle(color: Colors.white70),
                                ),
                              )
                              : ListView.builder(
                                itemCount: filteredProducts.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 12),
                                    child: _buildProductCard(
                                      filteredProducts[index],
                                    ),
                                  );
                                },
                              ),
                    ),
                  ],
                ),
              ),
    );
  }
}
