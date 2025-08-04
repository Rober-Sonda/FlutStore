import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:isar/isar.dart';
import 'package:tienda_app/models/producto.dart';
import 'package:tienda_app/models/categoria.dart';
import 'package:tienda_app/services/product_service.dart';
import 'package:tienda_app/src/app_routes.dart';
import 'package:tienda_app/widgets/permission_widget.dart';
import 'widgets/product_card.dart';
import 'widgets/dashboard_widget.dart';
import 'widgets/filters_widget.dart';
import 'widgets/empty_state_widget.dart';

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

  // Datos para análisis
  List<Map<String, dynamic>> _productosMasVendidos = [];
  List<Map<String, dynamic>> _tendenciasPorMes = [];
  List<Map<String, dynamic>> _categoriasMasPopulares = [];

  @override
  void initState() {
    super.initState();
    _loadData();
    _generarDatosAnalisis();
  }

  void _generarDatosAnalisis() {
    // Simular datos de productos más vendidos
    _productosMasVendidos = [
      {'nombre': 'Camisa Azul', 'ventas': 45, 'color': Colors.blue},
      {'nombre': 'Pantalón Negro', 'ventas': 38, 'color': Colors.black},
      {'nombre': 'Vestido Rojo', 'ventas': 32, 'color': Colors.red},
      {'nombre': 'Blazer Gris', 'ventas': 28, 'color': Colors.grey},
      {'nombre': 'Falda Verde', 'ventas': 25, 'color': Colors.green},
    ];

    // Simular tendencias por mes
    _tendenciasPorMes = [
      {'mes': 'Ene', 'ventas': 120, 'color': Colors.blue},
      {'mes': 'Feb', 'ventas': 150, 'color': Colors.green},
      {'mes': 'Mar', 'ventas': 180, 'color': Colors.orange},
      {'mes': 'Abr', 'ventas': 200, 'color': Colors.purple},
      {'mes': 'May', 'ventas': 220, 'color': Colors.red},
      {'mes': 'Jun', 'ventas': 250, 'color': Colors.teal},
    ];

    // Simular categorías más populares
    _categoriasMasPopulares = [
      {'nombre': 'Camisas', 'porcentaje': 35, 'color': Colors.blue},
      {'nombre': 'Pantalones', 'porcentaje': 28, 'color': Colors.green},
      {'nombre': 'Vestidos', 'porcentaje': 22, 'color': Colors.purple},
      {'nombre': 'Accesorios', 'porcentaje': 15, 'color': Colors.orange},
    ];
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
        final matchesSearch = (producto.nombre?.toLowerCase().contains(
          searchQuery.toLowerCase(),
        ) ?? false);

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
    if (categorias == null || categoryId == null) return 'Sin categoría';
    final categoria = categorias!.firstWhere(
      (c) => c.id == categoryId,
      orElse: () => Categoria()..nombre = 'Sin categoría',
    );
    return categoria.nombre;
  }

  void _showDeleteDialog(Producto producto) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Confirmar eliminación'),
            content: Text(
              '¿Estás seguro de que quieres eliminar "${producto.nombre ?? 'Producto sin nombre'}"?',
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
      body:
          isLoading
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    // Dashboard con estadísticas
                    if (productos != null && productos!.isNotEmpty) ...[
                      DashboardWidget(inventoryStats: stats),
                      const SizedBox(height: 24),
                    ],

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

                    // Lista de productos
                    SizedBox(
                      height:
                          400, // Altura fija para evitar conflictos de layout
                      child:
                          productos == null || productos!.isEmpty
                              ? const EmptyStateWidget()
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
                                    child: ProductCard(
                                      producto: filteredProducts[index],
                                      categorias: categorias,
                                      inventoryStats: inventoryStats,
                                      onEdit: () async {
                                        final result = await context.push(
                                          AppRoutes.productEdit.replaceAll(
                                            ':id',
                                            filteredProducts[index].id
                                                .toString(),
                                          ),
                                        );
                                        if (result == true) _loadData();
                                      },
                                      onDelete:
                                          () => _showDeleteDialog(
                                            filteredProducts[index],
                                          ),
                                      getCategoryName: getCategoryName,
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
