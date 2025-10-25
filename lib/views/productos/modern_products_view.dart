import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../src/app_routes.dart';
import '../../widgets/app_design_system.dart';
import '../../widgets/app_widgets.dart';
import '../../widgets/permission_widget.dart';
import '../../providers/productos_provider.dart';
import '../../models/producto.dart';
import '../../utils/context_extensions.dart';

class ModernProductsView extends ConsumerStatefulWidget {
  const ModernProductsView({super.key});

  @override
  ConsumerState<ModernProductsView> createState() => _ModernProductsViewState();
}

class _ModernProductsViewState extends ConsumerState<ModernProductsView> {
  String _searchQuery = '';
  String _selectedFilter = 'Todos';
  String _sortBy = 'Nombre';
  bool _isGridView = true;

  final List<String> _filterOptions = [
    'Todos',
    'Con Stock',
    'Sin Stock',
    'Bajo Stock',
    'Ofertas',
  ];

  final List<String> _sortOptions = [
    'Nombre',
    'Precio Menor',
    'Precio Mayor',
    'Stock',
    'Más Vendidos',
  ];

  @override
  Widget build(BuildContext context) {
    final productosAsync = ref.watch(productosProvider);

    return Scaffold(
      body: Container(
        decoration: AppDesignSystem.getFashionBackgroundDecoration(),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppDesignSystem.background.withOpacity(0.85),
                AppDesignSystem.surface.withOpacity(0.95),
              ],
            ),
          ),
          child: Column(
            children: [
              // Header de la sección
              _buildSectionHeader(),

              // Barra de búsqueda, filtros y ordenamiento
              _buildSearchAndControls(),

              // Contenido principal
              Expanded(
                child: productosAsync.when(
                  data: (productos) => _buildProductsContent(productos),
                  loading:
                      () => AppWidgets.loadingState(
                        message: 'Cargando productos...',
                      ),
                  error:
                      (error, _) => AppWidgets.errorState(
                        title: 'Error al cargar productos',
                        message: error.toString(),
                        actionText: 'Reintentar',
                        onActionPressed: () => ref.refresh(productosProvider),
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: PermissionWidget(
        resource: 'productos',
        action: 'crear',
        child: FloatingActionButton.extended(
          onPressed: () => context.push(AppRoutes.productAdd),
          backgroundColor: AppDesignSystem.goldAccent,
          foregroundColor: Colors.black,
          icon: const Icon(Icons.add_box),
          label: const Text('Nuevo Producto'),
        ),
      ),
    );
  }

  Widget _buildSectionHeader() {
    return AppWidgets.primaryCard(
      margin: const EdgeInsets.all(AppDesignSystem.spaceMd),
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          AppDesignSystem.accentGreen.withValues(alpha: 0.15),
          AppDesignSystem.accentGreen.withValues(alpha: 0.05),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(AppDesignSystem.spaceMd),
            decoration: BoxDecoration(
              color: AppDesignSystem.accentGreen.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(AppDesignSystem.radiusMd),
            ),
            child: Icon(
              Icons.inventory_2_rounded,
              size: 32,
              color: AppDesignSystem.textPrimary,
            ),
          ),
          const SizedBox(width: AppDesignSystem.spaceLg),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Catálogo de Productos',
                  style: AppDesignSystem.headingLg().copyWith(
                    color: AppDesignSystem.textPrimary,
                  ),
                ),
                const SizedBox(height: AppDesignSystem.spaceXs),
                Text(
                  'Gestiona tu inventario, precios, stock y mantén actualizado tu catálogo para maximizar las ventas.',
                  style: AppDesignSystem.bodyMd().copyWith(
                    color: AppDesignSystem.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchAndControls() {
    return AppWidgets.primaryCard(
      margin: const EdgeInsets.symmetric(horizontal: AppDesignSystem.spaceMd),
      child: Column(
        children: [
          // Barra de búsqueda y controles de vista
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppDesignSystem.surfaceLight.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(
                      AppDesignSystem.radiusMd,
                    ),
                    border: Border.all(
                      color: AppDesignSystem.textMuted.withValues(alpha: 0.2),
                      width: 1,
                    ),
                  ),
                  child: TextField(
                    onChanged: (value) => setState(() => _searchQuery = value),
                    style: AppDesignSystem.bodyMd().copyWith(
                      color: AppDesignSystem.textPrimary,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Buscar productos por nombre, código...',
                      hintStyle: AppDesignSystem.bodyMd().copyWith(
                        color: AppDesignSystem.textMuted,
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: AppDesignSystem.textMuted,
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.all(
                        AppDesignSystem.spaceMd,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: AppDesignSystem.spaceMd),

              // Ordenamiento
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDesignSystem.spaceMd,
                ),
                decoration: BoxDecoration(
                  color: AppDesignSystem.surfaceLight.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(AppDesignSystem.radiusMd),
                  border: Border.all(
                    color: AppDesignSystem.textMuted.withValues(alpha: 0.2),
                    width: 1,
                  ),
                ),
                child: DropdownButton<String>(
                  value: _sortBy,
                  onChanged: (value) => setState(() => _sortBy = value!),
                  underline: const SizedBox(),
                  icon: Icon(Icons.sort, color: AppDesignSystem.textMuted),
                  dropdownColor: AppDesignSystem.surface,
                  style: AppDesignSystem.bodyMd().copyWith(
                    color: AppDesignSystem.textPrimary,
                  ),
                  items:
                      _sortOptions.map((option) {
                        return DropdownMenuItem(
                          value: option,
                          child: Text(option),
                        );
                      }).toList(),
                ),
              ),

              const SizedBox(width: AppDesignSystem.spaceMd),

              // Toggle de vista
              Container(
                decoration: BoxDecoration(
                  color: AppDesignSystem.surfaceLight.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(AppDesignSystem.radiusMd),
                  border: Border.all(
                    color: AppDesignSystem.textMuted.withValues(alpha: 0.2),
                    width: 1,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildViewToggleButton(
                      icon: Icons.grid_view,
                      isSelected: _isGridView,
                      onTap: () => setState(() => _isGridView = true),
                    ),
                    _buildViewToggleButton(
                      icon: Icons.view_list,
                      isSelected: !_isGridView,
                      onTap: () => setState(() => _isGridView = false),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: AppDesignSystem.spaceMd),

          // Filtros
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children:
                  _filterOptions.map((filter) {
                    final isSelected = _selectedFilter == filter;
                    return Padding(
                      padding: const EdgeInsets.only(
                        right: AppDesignSystem.spaceSm,
                      ),
                      child: GestureDetector(
                        onTap: () => setState(() => _selectedFilter = filter),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppDesignSystem.spaceMd,
                            vertical: AppDesignSystem.spaceSm,
                          ),
                          decoration: BoxDecoration(
                            color:
                                isSelected
                                    ? AppDesignSystem.accentGreen
                                    : Colors.transparent,
                            borderRadius: BorderRadius.circular(
                              AppDesignSystem.radiusMd,
                            ),
                            border: Border.all(
                              color:
                                  isSelected
                                      ? AppDesignSystem.accentGreen
                                      : AppDesignSystem.textMuted.withValues(
                                        alpha: 0.3,
                                      ),
                              width: 1,
                            ),
                          ),
                          child: Text(
                            filter,
                            style: AppDesignSystem.bodyMd().copyWith(
                              color:
                                  isSelected
                                      ? AppDesignSystem.textPrimary
                                      : AppDesignSystem.textSecondary,
                              fontWeight:
                                  isSelected
                                      ? FontWeight.w600
                                      : FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildViewToggleButton({
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(AppDesignSystem.spaceSm),
        decoration: BoxDecoration(
          color:
              isSelected
                  ? AppDesignSystem.accentGreen.withValues(alpha: 0.2)
                  : Colors.transparent,
          borderRadius: BorderRadius.circular(AppDesignSystem.radiusSm),
        ),
        child: Icon(
          icon,
          size: 20,
          color:
              isSelected
                  ? AppDesignSystem.accentGreen
                  : AppDesignSystem.textMuted,
        ),
      ),
    );
  }

  Widget _buildProductsContent(List<Producto> productos) {
    final filteredAndSorted = _filterAndSortProducts(productos);

    if (filteredAndSorted.isEmpty) {
      return AppWidgets.emptyState(
        icon: Icons.inventory_2_outlined,
        title:
            _searchQuery.isNotEmpty || _selectedFilter != 'Todos'
                ? 'No se encontraron productos'
                : 'No hay productos registrados',
        message:
            _searchQuery.isNotEmpty || _selectedFilter != 'Todos'
                ? 'Intenta ajustar los filtros o la búsqueda.'
                : 'Comienza agregando productos a tu catálogo para gestionar tu inventario.',
        actionText: 'Agregar Producto',
        onActionPressed: () => context.push(AppRoutes.productAdd),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(AppDesignSystem.spaceMd),
      child:
          _isGridView
              ? _buildGridView(filteredAndSorted)
              : _buildListView(filteredAndSorted),
    );
  }

  Widget _buildGridView(List<Producto> productos) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: context.gridColumns,
        crossAxisSpacing: AppDesignSystem.spaceMd,
        mainAxisSpacing: AppDesignSystem.spaceMd,
        childAspectRatio: context.isMobile ? 0.75 : 0.85,
      ),
      itemCount: productos.length,
      itemBuilder: (context, index) {
        final producto = productos[index];
        return _buildProductCard(producto, isGrid: true);
      },
    );
  }

  Widget _buildListView(List<Producto> productos) {
    return ListView.builder(
      itemCount: productos.length,
      itemBuilder: (context, index) {
        final producto = productos[index];
        return _buildProductCard(producto, isGrid: false);
      },
    );
  }

  Widget _buildProductCard(Producto producto, {required bool isGrid}) {
    final stockStatus = _getStockStatus(producto.stockActual);

    return AppWidgets.primaryCard(
      margin: EdgeInsets.only(bottom: isGrid ? 0 : AppDesignSystem.spaceMd),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Imagen del producto
          Container(
            height: isGrid ? 120 : 80,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppDesignSystem.surfaceLight.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(AppDesignSystem.radiusSm),
              image:
                  producto.imagenUrl != null
                      ? DecorationImage(
                        image: NetworkImage(producto.imagenUrl!),
                        fit: BoxFit.cover,
                      )
                      : null,
            ),
            child:
                producto.imagenUrl == null
                    ? Icon(
                      Icons.image_not_supported,
                      size: isGrid ? 40 : 32,
                      color: AppDesignSystem.textMuted,
                    )
                    : null,
          ),

          const SizedBox(height: AppDesignSystem.spaceMd),

          // Información del producto
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      producto.nombre ?? 'Sin nombre',
                      style: AppDesignSystem.headingSm().copyWith(
                        color: AppDesignSystem.textPrimary,
                      ),
                      maxLines: isGrid ? 2 : 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: AppDesignSystem.spaceXs),
                    Text(
                      '\$${producto.precio?.toStringAsFixed(2) ?? '0.00'}',
                      style: AppDesignSystem.bodyMd().copyWith(
                        color: AppDesignSystem.success,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),

              // Status del stock
              AppWidgets.statusChip(
                label: '${producto.stockActual ?? 0}',
                color: stockStatus['color'] as Color,
                icon: stockStatus['icon'] as IconData,
              ),
            ],
          ),

          if (!isGrid) ...[
            const SizedBox(height: AppDesignSystem.spaceSm),

            // Información adicional para vista de lista
            Row(
              children: [
                if (producto.codigo != null) ...[
                  Text(
                    'Código: ${producto.codigo}',
                    style: AppDesignSystem.bodySm().copyWith(
                      color: AppDesignSystem.textSecondary,
                    ),
                  ),
                  const SizedBox(width: AppDesignSystem.spaceLg),
                ],

                Text(
                  'Categoría: ${producto.categoria ?? 'Sin categoría'}',
                  style: AppDesignSystem.bodySm().copyWith(
                    color: AppDesignSystem.textSecondary,
                  ),
                ),
              ],
            ),
          ],

          const SizedBox(height: AppDesignSystem.spaceMd),

          // Acciones
          Row(
            children: [
              Expanded(
                child: AppWidgets.secondaryButton(
                  text: isGrid ? 'Ver' : 'Ver Detalles',
                  icon: Icons.visibility,
                  onPressed: () => _viewProductDetails(producto),
                ),
              ),
              const SizedBox(width: AppDesignSystem.spaceSm),

              PermissionWidget(
                resource: 'productos',
                action: 'editar',
                child: IconButton(
                  onPressed:
                      () => context.push(
                        '${AppRoutes.productEdit}/${producto.id}',
                      ),
                  icon: const Icon(Icons.edit),
                  color: AppDesignSystem.accentGreen,
                  tooltip: 'Editar producto',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<Producto> _filterAndSortProducts(List<Producto> productos) {
    var filtered = productos;

    // Filtrar por búsqueda
    if (_searchQuery.isNotEmpty) {
      filtered =
          filtered.where((producto) {
            final query = _searchQuery.toLowerCase();
            return (producto.nombre?.toLowerCase().contains(query) ?? false) ||
                (producto.codigo?.toLowerCase().contains(query) ?? false) ||
                (producto.descripcion?.toLowerCase().contains(query) ?? false);
          }).toList();
    }

    // Filtrar por categoría
    switch (_selectedFilter) {
      case 'Con Stock':
        filtered = filtered.where((p) => (p.stockActual ?? 0) > 0).toList();
        break;
      case 'Sin Stock':
        filtered = filtered.where((p) => (p.stockActual ?? 0) == 0).toList();
        break;
      case 'Bajo Stock':
        filtered =
            filtered
                .where(
                  (p) =>
                      (p.stockActual ?? 0) > 0 &&
                      (p.stockActual ?? 0) <= (p.stockMinimo ?? 5),
                )
                .toList();
        break;
      case 'Ofertas':
        // Filtrar productos con ofertas activas
        break;
    }

    // Ordenar
    switch (_sortBy) {
      case 'Nombre':
        filtered.sort((a, b) => (a.nombre ?? '').compareTo(b.nombre ?? ''));
        break;
      case 'Precio Menor':
        filtered.sort((a, b) => (a.precio ?? 0).compareTo(b.precio ?? 0));
        break;
      case 'Precio Mayor':
        filtered.sort((a, b) => (b.precio ?? 0).compareTo(a.precio ?? 0));
        break;
      case 'Stock':
        filtered.sort(
          (a, b) => (b.stockActual ?? 0).compareTo(a.stockActual ?? 0),
        );
        break;
    }

    return filtered;
  }

  Map<String, dynamic> _getStockStatus(int? stock) {
    final stockValue = stock ?? 0;

    if (stockValue == 0) {
      return {'color': AppDesignSystem.error, 'icon': Icons.warning};
    } else if (stockValue <= 10) {
      return {'color': AppDesignSystem.warning, 'icon': Icons.warning_amber};
    } else {
      return {'color': AppDesignSystem.success, 'icon': Icons.check_circle};
    }
  }

  void _viewProductDetails(Producto producto) {
    showDialog(
      context: context,
      builder:
          (context) => Dialog(
            backgroundColor: AppDesignSystem.surface,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppDesignSystem.radiusLg),
            ),
            child: Container(
              constraints: const BoxConstraints(maxWidth: 500, maxHeight: 600),
              padding: const EdgeInsets.all(AppDesignSystem.spaceLg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Detalles del Producto',
                    style: AppDesignSystem.headingMd().copyWith(
                      color: AppDesignSystem.textPrimary,
                    ),
                  ),
                  const SizedBox(height: AppDesignSystem.spaceLg),

                  // Imagen
                  if (producto.imagenUrl != null) ...[
                    Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          AppDesignSystem.radiusMd,
                        ),
                        image: DecorationImage(
                          image: NetworkImage(producto.imagenUrl!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: AppDesignSystem.spaceLg),
                  ],

                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          _buildDetailRow(
                            'Nombre',
                            producto.nombre ?? 'No especificado',
                          ),
                          _buildDetailRow(
                            'Precio',
                            '\$${producto.precio?.toStringAsFixed(2) ?? '0.00'}',
                          ),
                          _buildDetailRow(
                            'Stock Actual',
                            '${producto.stockActual ?? 0} unidades',
                          ),
                          _buildDetailRow(
                            'Stock Mínimo',
                            '${producto.stockMinimo ?? 0} unidades',
                          ),
                          _buildDetailRow(
                            'Código',
                            producto.codigo ?? 'No especificado',
                          ),
                          _buildDetailRow(
                            'Categoría',
                            producto.categoria ?? 'Sin categoría',
                          ),
                          if (producto.descripcion != null)
                            _buildDetailRow(
                              'Descripción',
                              producto.descripcion!,
                            ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: AppDesignSystem.spaceLg),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AppWidgets.secondaryButton(
                        text: 'Cerrar',
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      const SizedBox(width: AppDesignSystem.spaceMd),
                      AppWidgets.primaryButton(
                        text: 'Editar',
                        icon: Icons.edit,
                        backgroundColor: AppDesignSystem.accentGreen,
                        onPressed: () {
                          Navigator.of(context).pop();
                          context.push(
                            '${AppRoutes.productEdit}/${producto.id}',
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppDesignSystem.spaceMd),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              '$label:',
              style: AppDesignSystem.bodyMd().copyWith(
                color: AppDesignSystem.textMuted,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: AppDesignSystem.bodyMd().copyWith(
                color: AppDesignSystem.textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
