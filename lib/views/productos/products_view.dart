import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../models/producto.dart';
import '../../models/categoria.dart';
import '../../services/product_service.dart';

import '../../src/app_routes.dart';
import '../../widgets/permission_widget.dart';
import '../../widgets/fashion_components.dart';
import '../../widgets/app_design_system.dart';

/// Fashion Edition - Vista de Productos con Estilo Moderno
/// Gestión completa de inventario con interfaz elegante y profesional
class ProductsView extends ConsumerStatefulWidget {
  const ProductsView({super.key});

  @override
  ConsumerState<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends ConsumerState<ProductsView>
    with TickerProviderStateMixin {
  List<Producto>? productos;
  List<Categoria>? categorias;
  bool isLoading = true;

  // Animaciones para transiciones elegantes
  late AnimationController _fadeController;
  late AnimationController _slideController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  // Filtros y controles con i18n preparado
  String searchQuery = '';
  int? selectedCategoryId;
  String sortBy = 'nombre';
  bool sortAscending = true;
  bool showLowStock = false;
  bool showOutOfStock = false;
  String error = '';

  // Controller para el campo de búsqueda
  final TextEditingController _searchController = TextEditingController();

  // Constantes de texto para i18n futura
  static const _kSearchHint = 'Buscar productos...';
  static const _kEmptyMessage = 'No hay productos disponibles';
  static const _kFilteredEmptyMessage =
      'No hay productos que coincidan con los filtros';
  static const _kDeleteConfirmTitle = 'Confirmar eliminación';
  static const _kDeleteConfirmContent =
      '¿Estás seguro de que quieres eliminar este producto?';
  static const _kCancel = 'Cancelar';
  static const _kDelete = 'Eliminar';
  static const _kDeleteSuccess = 'Producto eliminado correctamente';
  static const _kDeleteError = 'Error al eliminar producto';
  static const _kNoCategoryText = 'Sin categoría';

  @override
  void initState() {
    super.initState();

    // Configurar animaciones elegantes
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _slideController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _fadeController, curve: Curves.easeOut));
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _slideController, curve: Curves.easeOut));

    _loadData();

    // Iniciar animaciones
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fadeController.forward();
      _slideController.forward();
    });
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _filterProducts() {
    setState(() {
      searchQuery = _searchController.text;
    });
  }

  Future<void> _loadData() async {
    try {
      setState(() => isLoading = true);
      final productService = ProductService();
      final productosDb = await productService.getAll();
      // Por ahora, dejamos categorias vacía hasta que se corrija el servicio
      setState(() {
        productos = productosDb;
        categorias = [];
        isLoading = false;
        error = '';
      });
    } catch (e) {
      setState(() {
        isLoading = false;
        error = e.toString();
      });
    }
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
            !showLowStock ||
            (producto.stockActual != null && producto.stockActual! <= 10);
        final matchesOutOfStock =
            !showOutOfStock ||
            (producto.stockActual != null && producto.stockActual! == 0);
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
            comparison = (a.stockActual ?? 0).compareTo(b.stockActual ?? 0);
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
        productos!
            .where((p) => p.stockActual != null && p.stockActual! > 0)
            .length;
    final lowStockProducts =
        productos!
            .where((p) => p.stockActual != null && p.stockActual! <= 10)
            .length;
    final outOfStockProducts =
        productos!
            .where((p) => p.stockActual != null && p.stockActual! == 0)
            .length;
    final totalValue = productos!.fold<double>(
      0,
      (sum, p) => sum + ((p.precio ?? 0) * (p.stockActual ?? 0)),
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
    if (categorias == null || categoryId == null) return _kNoCategoryText;
    final categoria = categorias!.firstWhere(
      (c) => c.id == categoryId,
      orElse: () => Categoria()..nombre = _kNoCategoryText,
    );
    return categoria.nombre;
  }

  void _showDeleteDialog(Producto producto) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            backgroundColor:
                AppDesignSystem.isDark
                    ? AppDesignSystem.darkSurface
                    : Colors.white,
            title: Row(
              children: [
                Icon(
                  Icons.warning_rounded,
                  color: AppDesignSystem.error,
                  size: 28,
                ),
                const SizedBox(width: 12),
                Text(
                  _kDeleteConfirmTitle,
                  style: AppDesignSystem.headingSm().copyWith(
                    color: AppDesignSystem.error,
                  ),
                ),
              ],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(_kDeleteConfirmContent, style: AppDesignSystem.bodyMd()),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppDesignSystem.error.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: AppDesignSystem.error.withValues(alpha: 0.3),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.inventory_2_rounded,
                        color: AppDesignSystem.error,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          producto.nombre ?? 'Producto sin nombre',
                          style: AppDesignSystem.bodyMd().copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppDesignSystem.error,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            actions: [
              // Botón Cancelar elegante
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                  backgroundColor: AppDesignSystem.textSecondary.withValues(
                    alpha: 0.05,
                  ),
                  foregroundColor: AppDesignSystem.textSecondary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(
                      color: AppDesignSystem.textSecondary.withValues(
                        alpha: 0.2,
                      ),
                    ),
                  ),
                ),
                child: Text(
                  _kCancel,
                  style: AppDesignSystem.bodyMd().copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              // Botón Eliminar elegante
              TextButton(
                onPressed: () async {
                  Navigator.of(context).pop();
                  try {
                    final productService = ref.read(productServiceProvider);
                    final isar = await productService.db;
                    await isar.writeTxn(() async {
                      await isar.collection<Producto>().delete(producto.id);
                    });
                    _loadData();
                    if (mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(_kDeleteSuccess),
                          backgroundColor: AppDesignSystem.success,
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      );
                    }
                  } catch (e) {
                    if (mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('$_kDeleteError: $e'),
                          backgroundColor: AppDesignSystem.error,
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      );
                    }
                  }
                },
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                  backgroundColor: AppDesignSystem.error,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.delete_outline_rounded,
                      size: 16,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      _kDelete,
                      style: AppDesignSystem.bodyMd().copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FashionScaffold(
      backgroundTags: const ['elegante', 'profesional', 'inventario'],
      overlayOpacity: 0.75,
      showBackgroundRotation: true,
      rotationInterval: const Duration(minutes: 5),
      body: AnimatedBuilder(
        animation: Listenable.merge([_fadeAnimation, _slideAnimation]),
        builder: (context, child) {
          return FadeTransition(
            opacity: _fadeAnimation,
            child: SlideTransition(
              position: _slideAnimation,
              child: Column(
                children: [
                  // Header simple y limpio
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Título a la izquierda
                        Text(
                          'Productos',
                          style: AppDesignSystem.headingLg().copyWith(
                            color: AppDesignSystem.textPrimary,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        // Botón agregar estilo premium minimalista
                        PermissionWidget(
                          resource: 'productos',
                          action: 'create',
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.15),
                                  blurRadius: 8,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(8),
                                onTap: () async {
                                  final result = await context.push(
                                    AppRoutes.productAdd,
                                  );
                                  if (result == true) _loadData();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 12,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(
                                        Icons.add_rounded,
                                        color: Colors.white,
                                        size: 18,
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        'Nuevo Producto',
                                        style: AppDesignSystem.bodyMd()
                                            .copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: 0.5,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Sección de estadísticas con glassmorphismo
                  if (!isLoading && productos != null) _buildStatsSection(),

                  // Filtros modernos con estilo
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: AppDesignSystem.surface,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: AppDesignSystem.textSecondary.withValues(
                            alpha: 0.1,
                          ),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.05),
                            blurRadius: 10,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: _buildModernFilters(),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Contenido principal con animaciones
                  Expanded(
                    child:
                        isLoading
                            ? _buildLoadingState()
                            : productos == null || productos!.isEmpty
                            ? _buildEmptyState()
                            : filteredProducts.isEmpty
                            ? _buildFilteredEmptyState()
                            : _buildProductGrid(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildStatsSection() {
    final stats = inventoryStats;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppDesignSystem.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppDesignSystem.textSecondary.withValues(alpha: 0.1),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            _buildStatItem(
              'Total',
              '${stats['total'] ?? 0}',
              Icons.inventory_2_outlined,
              AppDesignSystem.textPrimary,
            ),
            _buildStatItem(
              'En Stock',
              '${stats['withStock'] ?? 0}',
              Icons.check_circle_outline_rounded,
              AppDesignSystem.success,
            ),
            _buildStatItem(
              'Bajo Stock',
              '${stats['lowStock'] ?? 0}',
              Icons.warning_amber_outlined,
              AppDesignSystem.warning,
            ),
            _buildStatItem(
              'Sin Stock',
              '${stats['outOfStock'] ?? 0}',
              Icons.error_outline_rounded,
              AppDesignSystem.error,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(
    String label,
    String value,
    IconData icon,
    Color color,
  ) {
    return Expanded(
      child: Column(
        children: [
          Icon(icon, color: color.withValues(alpha: 0.7), size: 24),
          const SizedBox(height: 12),
          Text(
            value,
            style: AppDesignSystem.headingMd().copyWith(
              color: AppDesignSystem.textPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: AppDesignSystem.bodySm().copyWith(
              color: AppDesignSystem.textSecondary,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildModernFilters() {
    return Column(
      children: [
        // Barra de búsqueda elegante
        TextFormField(
          initialValue: searchQuery,
          onChanged: (value) => setState(() => searchQuery = value),
          decoration: InputDecoration(
            hintText: _kSearchHint,
            hintStyle: AppDesignSystem.bodyMd().copyWith(
              color: AppDesignSystem.textSecondary.withValues(alpha: 0.6),
            ),
            prefixIcon: Icon(
              Icons.search_rounded,
              color: AppDesignSystem.textSecondary.withValues(alpha: 0.7),
              size: 20,
            ),
            filled: true,
            fillColor: AppDesignSystem.textSecondary.withValues(alpha: 0.05),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: AppDesignSystem.textSecondary.withValues(alpha: 0.2),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: AppDesignSystem.textSecondary.withValues(alpha: 0.2),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: AppDesignSystem.textPrimary.withValues(alpha: 0.6),
                width: 1.5,
              ),
            ),
          ),
        ),

        const SizedBox(height: 16),

        // Filtros en fila
        Row(
          children: [
            // Selector de categoría
            _buildCategoryFilter(),
            const SizedBox(width: 12),

            // Filtros de stock
            _buildFilterChip(
              'Stock Bajo',
              showLowStock,
              Icons.warning_amber_outlined,
              AppDesignSystem.warning,
              (value) => setState(() => showLowStock = value),
            ),
            const SizedBox(width: 8),

            _buildFilterChip(
              'Sin Stock',
              showOutOfStock,
              Icons.error_outline_rounded,
              AppDesignSystem.error,
              (value) => setState(() => showOutOfStock = value),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCategoryFilter() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppDesignSystem.textSecondary.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppDesignSystem.textSecondary.withValues(alpha: 0.2),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.category_outlined,
            size: 16,
            color: AppDesignSystem.textSecondary,
          ),
          const SizedBox(width: 8),
          DropdownButton<int?>(
            value: selectedCategoryId,
            hint: Text(
              'Categorías',
              style: AppDesignSystem.bodySm().copyWith(
                color: AppDesignSystem.textSecondary,
                fontWeight: FontWeight.w500,
              ),
            ),
            underline: const SizedBox(),
            icon: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: AppDesignSystem.textSecondary,
              size: 18,
            ),
            style: AppDesignSystem.bodySm().copyWith(
              color: AppDesignSystem.textPrimary,
            ),
            dropdownColor: AppDesignSystem.surface,
            items: [
              DropdownMenuItem<int?>(
                value: null,
                child: Text(
                  'Todas las categorías',
                  style: AppDesignSystem.bodySm().copyWith(
                    color: AppDesignSystem.textPrimary,
                  ),
                ),
              ),
              if (categorias != null)
                ...categorias!.map(
                  (categoria) => DropdownMenuItem<int?>(
                    value: categoria.id,
                    child: Text(
                      categoria.nombre,
                      style: AppDesignSystem.bodySm().copyWith(
                        color: AppDesignSystem.textPrimary,
                      ),
                    ),
                  ),
                ),
            ],
            onChanged: (value) => setState(() => selectedCategoryId = value),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(
    String label,
    bool isSelected,
    IconData icon,
    Color color,
    Function(bool) onChanged,
  ) {
    return GestureDetector(
      onTap: () => onChanged(!isSelected),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color:
              isSelected
                  ? color.withValues(alpha: 0.1)
                  : AppDesignSystem.textSecondary.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color:
                isSelected
                    ? color.withValues(alpha: 0.4)
                    : AppDesignSystem.textSecondary.withValues(alpha: 0.2),
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 14,
              color: isSelected ? color : AppDesignSystem.textSecondary,
            ),
            const SizedBox(width: 6),
            Text(
              label,
              style: AppDesignSystem.bodySm().copyWith(
                color: isSelected ? color : AppDesignSystem.textSecondary,
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoadingState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
              AppDesignSystem.vibrantPink,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Cargando productos...',
            style: AppDesignSystem.bodyMd().copyWith(
              color: AppDesignSystem.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: AppDesignSystem.textSecondary.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Icon(
              Icons.inventory_2_outlined,
              size: 64,
              color: AppDesignSystem.textSecondary.withValues(alpha: 0.4),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            _kEmptyMessage,
            style: AppDesignSystem.headingMd().copyWith(
              color: AppDesignSystem.textPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Utiliza el botón "Nuevo Producto" para comenzar',
            style: AppDesignSystem.bodyMd().copyWith(
              color: AppDesignSystem.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildFilteredEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: AppDesignSystem.textSecondary.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Icon(
              Icons.search_off_rounded,
              size: 64,
              color: AppDesignSystem.textSecondary.withValues(alpha: 0.4),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            _kFilteredEmptyMessage,
            style: AppDesignSystem.headingMd().copyWith(
              color: AppDesignSystem.textPrimary,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Intenta ajustar los filtros de búsqueda',
            style: AppDesignSystem.bodyMd().copyWith(
              color: AppDesignSystem.textSecondary,
            ),
          ),
          const SizedBox(height: 24),
          TextButton(
            onPressed: () {
              setState(() {
                searchQuery = '';
                selectedCategoryId = null;
                showLowStock = false;
                showOutOfStock = false;
              });
            },
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              backgroundColor: AppDesignSystem.textSecondary.withValues(
                alpha: 0.05,
              ),
              foregroundColor: AppDesignSystem.textPrimary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(
                  color: AppDesignSystem.textSecondary.withValues(alpha: 0.2),
                ),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.refresh_rounded,
                  size: 16,
                  color: AppDesignSystem.textSecondary,
                ),
                const SizedBox(width: 8),
                Text(
                  'Limpiar Filtros',
                  style: AppDesignSystem.bodyMd().copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductGrid() {
    return LayoutBuilder(
      builder: (context, constraints) {
        const double minCardWidth = 200;
        const double maxCardWidth = 320;
        final double gridWidth = constraints.maxWidth - 32; // Padding

        int crossAxisCount = (gridWidth / maxCardWidth).floor();
        if (crossAxisCount < 1) crossAxisCount = 1;

        double cardWidth = (gridWidth / crossAxisCount).clamp(
          minCardWidth,
          maxCardWidth,
        );

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: GridView.builder(
            physics: const BouncingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: cardWidth / (cardWidth / 0.75),
            ),
            itemCount: filteredProducts.length,
            itemBuilder: (context, index) {
              final producto = filteredProducts[index];
              return _buildModernProductCard(producto, index);
            },
          ),
        );
      },
    );
  }

  Widget _buildModernProductCard(Producto producto, int index) {
    final categoryName = getCategoryName(producto.categoriaId);
    final hasLowStock =
        (producto.stockActual ?? 0) <= 10 && (producto.stockActual ?? 0) > 0;
    final isOutOfStock = (producto.stockActual ?? 0) == 0;

    return ModernCard(
      glassMorphism: true,
      opacity: 0.95,
      borderColor:
          hasLowStock
              ? AppDesignSystem.warning.withValues(alpha: 0.3)
              : isOutOfStock
              ? AppDesignSystem.error.withValues(alpha: 0.3)
              : AppDesignSystem.electricBlue.withValues(alpha: 0.3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header con estado
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color:
                      hasLowStock
                          ? AppDesignSystem.warning.withValues(alpha: 0.1)
                          : isOutOfStock
                          ? AppDesignSystem.error.withValues(alpha: 0.1)
                          : AppDesignSystem.success.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      hasLowStock
                          ? Icons.warning_rounded
                          : isOutOfStock
                          ? Icons.error_rounded
                          : Icons.check_circle_rounded,
                      size: 14,
                      color:
                          hasLowStock
                              ? AppDesignSystem.warning
                              : isOutOfStock
                              ? AppDesignSystem.error
                              : AppDesignSystem.success,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${producto.stockActual ?? 0}',
                      style: AppDesignSystem.bodySm().copyWith(
                        color:
                            hasLowStock
                                ? AppDesignSystem.warning
                                : isOutOfStock
                                ? AppDesignSystem.error
                                : AppDesignSystem.success,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              PopupMenuButton<String>(
                icon: Icon(
                  Icons.more_vert_rounded,
                  color: AppDesignSystem.textSecondary,
                ),
                onSelected: (value) async {
                  if (value == 'edit') {
                    final result = await context.push(
                      AppRoutes.productEdit.replaceAll(
                        ':id',
                        producto.id.toString(),
                      ),
                    );
                    if (result == true) _loadData();
                  } else if (value == 'delete') {
                    _showDeleteDialog(producto);
                  }
                },
                itemBuilder:
                    (context) => [
                      PopupMenuItem(
                        value: 'edit',
                        child: Row(
                          children: [
                            Icon(Icons.edit_rounded, size: 18),
                            const SizedBox(width: 8),
                            Text('Editar'),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        value: 'delete',
                        child: Row(
                          children: [
                            Icon(
                              Icons.delete_rounded,
                              size: 18,
                              color: AppDesignSystem.error,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Eliminar',
                              style: TextStyle(color: AppDesignSystem.error),
                            ),
                          ],
                        ),
                      ),
                    ],
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Información del producto
          Text(
            producto.nombre ?? 'Producto sin nombre',
            style: AppDesignSystem.headingSm().copyWith(
              color: AppDesignSystem.textPrimary,
              fontWeight: FontWeight.w700,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),

          const SizedBox(height: 4),

          Text(
            categoryName,
            style: AppDesignSystem.bodySm().copyWith(
              color: AppDesignSystem.textSecondary,
            ),
          ),

          const Spacer(),

          // Precio
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppDesignSystem.vibrantPink.withValues(alpha: 0.1),
                  AppDesignSystem.electricBlue.withValues(alpha: 0.1),
                ],
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              '\$${(producto.precio ?? 0).toStringAsFixed(2)}',
              style: AppDesignSystem.headingMd().copyWith(
                color: AppDesignSystem.vibrantPink,
                fontWeight: FontWeight.w800,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
