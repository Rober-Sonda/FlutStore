import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/app_design_system.dart';
import '../widgets/fashion_components.dart';
import '../components/shared/professional_app_bar.dart';
import '../models/producto.dart';
import '../providers/producto_provider.dart';

class ProductosView extends StatefulWidget {
  @override
  _ProductosViewState createState() => _ProductosViewState();
}

class _ProductosViewState extends State<ProductosView>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _slideController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  String _selectedFilter = 'Todos';
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Animaciones
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _slideController = AnimationController(
      duration: const Duration(milliseconds: 600),
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

    // Inicializar datos de prueba cuando se carga la pantalla
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<ProductoProvider>(context, listen: false);
      provider.initializeTestData();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfessionalAppBar(
        title: '🛍️ Productos',
        actions: [
          FashionButton(
            text: 'Buscar',
            icon: Icons.search_rounded,
            style: FashionButtonStyle.ghost,
            onPressed: () => _showSearchDialog(),
          ),
          const SizedBox(width: 8),
          FashionButton(
            text: 'Filtros',
            icon: Icons.tune_rounded,
            style: FashionButtonStyle.ghost,
            onPressed: () => _showFilterDialog(),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: AnimatedBuilder(
        animation: Listenable.merge([_fadeAnimation, _slideAnimation]),
        builder: (context, child) {
          return FadeTransition(
            opacity: _fadeAnimation,
            child: SlideTransition(
              position: _slideAnimation,
              child: Consumer<ProductoProvider>(
                builder: (context, provider, child) {
                  if (provider.isLoading) {
                    return const FashionLoader(
                      message: 'Cargando productos con estilo...',
                      size: 60,
                    );
                  }

                  if (provider.productos.isEmpty) {
                    return _buildEmptyState();
                  }

                  return RefreshIndicator(
                    onRefresh: () => provider.cargarProductos(),
                    color: AppDesignSystem.vibrantPink,
                    child: Column(
                      children: [
                        // Barra de búsqueda moderna
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: ModernCard(
                            glassMorphism: true,
                            opacity: 0.9,
                            borderColor: AppDesignSystem.vibrantPink
                                .withOpacity(0.2),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.search_rounded,
                                      color: AppDesignSystem.vibrantPink,
                                      size: 20,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      'Buscar productos',
                                      style: AppDesignSystem.bodyMd().copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: AppDesignSystem.vibrantPink,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                FashionTextField(
                                  controller: _searchController,
                                  hint: 'Nombre del producto...',
                                  prefixIcon: Icons.inventory_2_rounded,
                                  suffixIcon: Icons.clear_rounded,
                                  onSuffixIconTap: () {
                                    _searchController.clear();
                                    provider.limpiarFiltros();
                                  },
                                ),
                                const SizedBox(height: 16),
                                // Filtros modernos
                                Text(
                                  'Filtros rápidos',
                                  style: AppDesignSystem.bodySm().copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: AppDesignSystem.textSecondary,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      FashionChip(
                                        label: 'Todos',
                                        isSelected: _selectedFilter == 'Todos',
                                        onTap: () => _setFilter('Todos'),
                                        icon: Icons.inventory_rounded,
                                      ),
                                      const SizedBox(width: 8),
                                      FashionChip(
                                        label: 'Disponibles',
                                        isSelected:
                                            _selectedFilter == 'Disponibles',
                                        onTap: () => _setFilter('Disponibles'),
                                        icon: Icons.check_circle_rounded,
                                        selectedColor: AppDesignSystem.success,
                                      ),
                                      const SizedBox(width: 8),
                                      FashionChip(
                                        label: 'Sin Stock',
                                        isSelected:
                                            _selectedFilter == 'Sin Stock',
                                        onTap: () => _setFilter('Sin Stock'),
                                        icon: Icons.warning_rounded,
                                        selectedColor: AppDesignSystem.warning,
                                      ),
                                      const SizedBox(width: 8),
                                      FashionChip(
                                        label: 'Destacados',
                                        isSelected:
                                            _selectedFilter == 'Destacados',
                                        onTap: () => _setFilter('Destacados'),
                                        icon: Icons.star_rounded,
                                        selectedColor:
                                            AppDesignSystem.sunsetOrange,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Grid de productos con animación escalonada
                        Expanded(
                          child: GridView.builder(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.72,
                                  crossAxisSpacing: 16,
                                  mainAxisSpacing: 16,
                                ),
                            itemCount: provider.productosFiltrados.length,
                            itemBuilder: (context, index) {
                              final producto =
                                  provider.productosFiltrados[index];
                              return TweenAnimationBuilder<double>(
                                duration: Duration(
                                  milliseconds: 300 + (index * 100),
                                ),
                                tween: Tween(begin: 0.0, end: 1.0),
                                builder: (context, value, child) {
                                  return Transform.scale(
                                    scale: value,
                                    child: Opacity(
                                      opacity: value,
                                      child: _buildProductCard(producto),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FashionButton(
        text: 'Nuevo Producto',
        icon: Icons.add_rounded,
        onPressed: () => _navigateToAddProduct(),
        style: FashionButtonStyle.primary,
      ),
    );
  }

  Widget _buildProductCard(Producto producto) {
    final stockStatus = (producto.stockActual ?? 0) > 5;

    return ModernCard(
      onTap: () => _navigateToProductDetail(producto),
      glassMorphism: true,
      opacity: 0.95,
      borderColor:
          stockStatus
              ? AppDesignSystem.success.withOpacity(0.3)
              : AppDesignSystem.warning.withOpacity(0.3),
      boxShadow: [
        BoxShadow(
          color: (stockStatus
                  ? AppDesignSystem.success
                  : AppDesignSystem.warning)
              .withOpacity(0.2),
          blurRadius: 12,
          offset: const Offset(0, 4),
        ),
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Imagen del producto con overlay juvenil
          Expanded(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppDesignSystem.vibrantPink.withOpacity(0.1),
                          AppDesignSystem.electricBlue.withOpacity(0.1),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child:
                        producto.imagen != null
                            ? Image.asset(
                              producto.imagen!,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              errorBuilder: (context, error, stackTrace) {
                                return Center(
                                  child: Icon(
                                    Icons.inventory_2_rounded,
                                    size: 48,
                                    color: AppDesignSystem.vibrantPink
                                        .withOpacity(0.6),
                                  ),
                                );
                              },
                            )
                            : Center(
                              child: Icon(
                                Icons.inventory_2_rounded,
                                size: 48,
                                color: AppDesignSystem.vibrantPink.withOpacity(
                                  0.6,
                                ),
                              ),
                            ),
                  ),
                ),
                // Badge de estado en la esquina
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color:
                          stockStatus
                              ? AppDesignSystem.success
                              : AppDesignSystem.warning,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: (stockStatus
                                  ? AppDesignSystem.success
                                  : AppDesignSystem.warning)
                              .withOpacity(0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          stockStatus
                              ? Icons.check_circle_rounded
                              : Icons.warning_rounded,
                          size: 12,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${producto.stockActual ?? 0}',
                          style: AppDesignSystem.bodySm().copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),

          // Información del producto
          Text(
            producto.nombre ?? 'Sin nombre',
            style: AppDesignSystem.bodyMd().copyWith(
              fontWeight: FontWeight.w600,
              color: AppDesignSystem.textPrimary,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 6),

          // Precio con efecto gradiente
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppDesignSystem.vibrantPink.withOpacity(0.1),
                  AppDesignSystem.electricBlue.withOpacity(0.1),
                ],
              ),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: AppDesignSystem.vibrantPink.withOpacity(0.3),
                width: 1,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$${(producto.precio ?? 0.0).toStringAsFixed(2)}',
                  style: AppDesignSystem.bodyMd().copyWith(
                    fontWeight: FontWeight.w800,
                    color: AppDesignSystem.vibrantPink,
                    fontSize: 16,
                  ),
                ),
                Icon(
                  Icons.shopping_cart_rounded,
                  size: 16,
                  color: AppDesignSystem.electricBlue,
                ),
              ],
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
          Icon(
            Icons.inventory_2_outlined,
            size: 100,
            color: AppDesignSystem.textSecondary.withValues(alpha: 0.5),
          ),
          const SizedBox(height: 24),
          Text(
            'No hay productos disponibles',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AppDesignSystem.textSecondary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Agrega tu primer producto para comenzar',
            style: TextStyle(
              fontSize: 16,
              color: AppDesignSystem.textSecondary,
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () => _navigateToAddProduct(),
            icon: const Icon(Icons.add),
            label: const Text('Agregar Producto'),
          ),
        ],
      ),
    );
  }

  void _showSearchDialog() {
    showDialog(
      context: context,
      builder: (context) {
        String searchText = '';
        return AlertDialog(
          title: const Text('Buscar productos'),
          content: TextField(
            onChanged: (value) => searchText = value,
            decoration: const InputDecoration(
              hintText: 'Escribe el nombre del producto...',
              prefixIcon: Icon(Icons.search),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                Provider.of<ProductoProvider>(
                  context,
                  listen: false,
                ).filtrarPorTexto(searchText);
                Navigator.pop(context);
              },
              child: const Text('Buscar'),
            ),
          ],
        );
      },
    );
  }

  void _showFilterDialog() {
    final provider = Provider.of<ProductoProvider>(context, listen: false);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Filtrar por categoría'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('Todas las categorías'),
                onTap: () {
                  provider.limpiarFiltros();
                  Navigator.pop(context);
                },
              ),
              ...provider.categorias.map(
                (categoria) => ListTile(
                  title: Text(categoria),
                  onTap: () {
                    provider.filtrarPorCategoria(categoria);
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _navigateToAddProduct() {
    // TODO: Implementar navegación a pantalla de agregar producto
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Función en desarrollo')));
  }

  void _navigateToProductDetail(Producto producto) {
    // TODO: Implementar navegación a detalle del producto
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Ver detalles de: ${producto.nombre}'),
        backgroundColor: AppDesignSystem.vibrantPink,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  void _setFilter(String filter) {
    final provider = Provider.of<ProductoProvider>(context, listen: false);
    setState(() {
      _selectedFilter = filter;
    });

    switch (filter) {
      case 'Todos':
        provider.limpiarFiltros();
        break;
      case 'Disponibles':
        // TODO: Implementar filtro por disponibles
        break;
      case 'Sin Stock':
        // TODO: Implementar filtro por sin stock
        break;
      case 'Destacados':
        // TODO: Implementar filtro por destacados
        break;
    }
  }
}
