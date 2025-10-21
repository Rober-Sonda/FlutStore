import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:isar/isar.dart';
import '../../models/producto.dart';
import '../../models/categoria.dart';
import '../../services/product_service.dart';
import '../../src/app_routes.dart';
import '../../widgets/permission_widget.dart';
import 'widgets/product_card.dart';
import 'widgets/filters_widget.dart';
import 'widgets/empty_state_widget.dart';

// Corrige la clase para que sea un ConsumerStatefulWidget y permita recargar datos y filtrar correctamente.
class ProductsView extends ConsumerStatefulWidget {
  const ProductsView({super.key});

  @override
  ConsumerState<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends ConsumerState<ProductsView> {
  List<Producto>? productos;
  List<Categoria>? categorias;
  bool isLoading = true;

  // Filtros y controles
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
    final productService = ref.read(productServiceProvider);
    final isar = await productService.db;
    final productosDb = await isar.productos.where().findAll();
    final categoriasDb = await isar.categorias.where().findAll();
    setState(() {
      productos = productosDb;
      categorias = categoriasDb;
      isLoading = false;
    });
  }

  List<Producto> get filteredProducts {
    if (productos == null) return [];
    return productos!.where((producto) {
        final matchesSearch =
            searchQuery.isEmpty ||
            (producto.nombre?.toLowerCase().contains(
                  searchQuery.toLowerCase(),
                ) ??
                false);
        final matchesCategory =
            selectedCategoryId == null ||
            producto.categoriaId == selectedCategoryId;
        final matchesLowStock =
            !showLowStock || (producto.stock != null && producto.stock! <= 10);
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
            comparison = (a.nombre ?? '').compareTo(b.nombre ?? '');
            break;
          case 'precio':
            comparison = (a.precio ?? 0).compareTo(b.precio ?? 0);
            break;
          case 'stock':
            comparison = (a.stock ?? 0).compareTo(b.stock ?? 0);
            break;
          case 'categoria':
            final categoriaA = categorias?.firstWhere(
              (c) => c.id == a.categoriaId,
              orElse: () => Categoria(),
            );
            final categoriaB = categorias?.firstWhere(
              (c) => c.id == b.categoriaId,
              orElse: () => Categoria(),
            );
            comparison = (categoriaA?.nombre ?? '').compareTo(
              categoriaB?.nombre ?? '',
            );
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
    if (categorias == null || categoryId == null) return 'Sin categorÃ­a';
    final categoria = categorias!.firstWhere(
      (c) => c.id == categoryId,
      orElse: () => Categoria()..nombre = 'Sin categorÃ­a',
    );
    return categoria.nombre;
  }

  void _showDeleteDialog(Producto producto) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Confirmar eliminaciÃ³n'),
            content: Text(
              'Â¿EstÃ¡s seguro de que quieres eliminar "${producto.nombre ?? 'Producto sin nombre'}"?',
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos'),
      ),
      body: Column(
        children: [
          // NUEVO: DescripciÃ³n de la secciÃ³n de productos
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              color: Colors.blueGrey[900],
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  'AquÃ­ puedes ver, agregar, editar y eliminar productos de tu tienda. MantÃ©n actualizado tu inventario y consulta detalles de cada producto.',
                  style: const TextStyle(color: Colors.white70, fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          // Filtros y controles
          FiltersWidget(
            searchQuery: searchQuery,
            selectedCategoryId: selectedCategoryId,
            sortBy: sortBy,
            showLowStock: showLowStock,
            showOutOfStock: showOutOfStock,
            categorias: categorias,
            onSearchChanged:
                (value) => setState(() => searchQuery = value),
            onCategoryChanged:
                (value) => setState(() => selectedCategoryId = value),
            onSortChanged: (value) => setState(() => sortBy = value),
            onLowStockChanged:
                (value) => setState(() => showLowStock = value),
            onOutOfStockChanged:
                (value) => setState(() => showOutOfStock = value),
          ),
          const SizedBox(height: 16),
          // Lista de productos ocupa todo el alto disponible
          Expanded(
            child: productos == null || productos!.isEmpty
                ? const EmptyStateWidget()
                : filteredProducts.isEmpty
                    ? const Center(
                        child: Text(
                          'No hay productos que coincidan con los filtros',
                          style: TextStyle(color: Colors.white70),
                        ),
                      )
                    : LayoutBuilder(
                        builder: (context, constraints) {
                          // Calcula el ancho ideal de la card (mÃ¡ximo 320, mÃ­nimo 200)
                          const double minCardWidth = 200;
                          const double maxCardWidth = 320;
                          final double gridWidth = constraints.maxWidth;
                          // Calcula cuÃ¡ntas cards entran por fila segÃºn el ancho disponible
                          int crossAxisCount = (gridWidth / maxCardWidth).floor();
                          if (crossAxisCount < 1) crossAxisCount = 1;
                          // Si hay mucho espacio, reduce el ancho de la card para que entren mÃ¡s
                          double cardWidth = (gridWidth / crossAxisCount).clamp(minCardWidth, maxCardWidth);

                          return GridView.builder(
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: crossAxisCount,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                              childAspectRatio: cardWidth / (cardWidth / 0.7),
                            ),
                            itemCount: filteredProducts.length,
                            itemBuilder: (context, index) {
                              final producto = filteredProducts[index];
                              return ProductCard(
                                producto: producto,
                                categorias: categorias,
                                inventoryStats: inventoryStats, // <-- corrige aquÃ­, antes era 'stats'
                                onEdit: () async {
                                  final result = await context.push(
                                    AppRoutes.productEdit.replaceAll(
                                      ':id',
                                      producto.id.toString(),
                                    ),
                                  );
                                  if (result == true) _loadData();
                                },
                                onDelete: () => _showDeleteDialog(producto),
                                getCategoryName: getCategoryName,
                              );
                            },
                          );
                        },
                      ),
          ),
        ],
      ),
      floatingActionButton: PermissionFAB(
        onPressed: () async {
          final result = await context.push(AppRoutes.productAdd);
          if (result == true) {
            _loadData();
          }
        },
        action: 'create',
        resource: 'productos',
        icon: Icons.add,
        tooltip: 'Agregar Producto',
        backgroundColor: Colors.deepPurpleAccent,
        foregroundColor: Colors.white,
      ),
    );
  }
}
