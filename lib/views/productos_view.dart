import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/loading_indicator.dart';
import '../widgets/app_design_system.dart';
import '../components/shared/professional_app_bar.dart';
import '../components/shared/glass_containers.dart';
import '../models/producto.dart';
import '../providers/producto_provider.dart';

class ProductosView extends StatefulWidget {
  @override
  _ProductosViewState createState() => _ProductosViewState();
}

class _ProductosViewState extends State<ProductosView> {
  @override
  void initState() {
    super.initState();
    // Inicializar datos de prueba cuando se carga la pantalla
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<ProductoProvider>(context, listen: false);
      provider.initializeTestData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfessionalAppBar(
        title: 'Productos',
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => _showSearchDialog(),
            tooltip: 'Buscar productos',
          ),
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () => _showFilterDialog(),
            tooltip: 'Filtrar productos',
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppDesignSystem.surface,
              AppDesignSystem.surface.withValues(alpha: 0.8),
            ],
          ),
        ),
        child: Consumer<ProductoProvider>(
          builder: (context, provider, child) {
            if (provider.isLoading) {
              return const LoadingIndicator(message: 'Cargando productos...');
            }

            if (provider.productos.isEmpty) {
              return _buildEmptyState();
            }

            return RefreshIndicator(
              onRefresh: () => provider.cargarProductos(),
              child: Column(
                children: [
                  // Contenedor con filtros rápidos con efecto glass
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: GlassFormContainer(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Filtros rápidos',
                            style: AppDesignSystem.bodyMd().copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 12),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                _buildFilterChip('Todos', true),
                                const SizedBox(width: 8),
                                _buildFilterChip('Disponibles', false),
                                const SizedBox(width: 8),
                                _buildFilterChip('Sin Stock', false),
                                const SizedBox(width: 8),
                                _buildFilterChip('Destacados', false),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Cuadrícula de productos
                  Expanded(
                    child: GridView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.75,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                          ),
                      itemCount: provider.productosFiltrados.length,
                      itemBuilder: (context, index) {
                        final producto = provider.productosFiltrados[index];
                        return _buildProductCard(producto);
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _navigateToAddProduct(),
        icon: const Icon(Icons.add),
        label: const Text('Agregar'),
      ),
    );
  }

  Widget _buildProductCard(Producto producto) {
    return GestureDetector(
      onTap: () => _navigateToProductDetail(producto),
      child: GlassCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppDesignSystem.surface.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(8),
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
                                  Icons.inventory,
                                  size: 48,
                                  color: AppDesignSystem.textSecondary,
                                ),
                              );
                            },
                          )
                          : Center(
                            child: Icon(
                              Icons.inventory,
                              size: 48,
                              color: AppDesignSystem.textSecondary,
                            ),
                          ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              producto.nombre ?? 'Sin nombre',
              style: AppDesignSystem.bodyMd().copyWith(
                fontWeight: FontWeight.w600,
                color: AppDesignSystem.textPrimary,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Text(
              '\$${(producto.precio ?? 0.0).toStringAsFixed(2)}',
              style: AppDesignSystem.bodyMd().copyWith(
                fontWeight: FontWeight.w700,
                color: AppDesignSystem.navAccent,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color:
                    (producto.stockActual ?? 0) > 5
                        ? AppDesignSystem.success.withOpacity(0.1)
                        : AppDesignSystem.error.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color:
                      (producto.stockActual ?? 0) > 5
                          ? AppDesignSystem.success
                          : AppDesignSystem.error,
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.inventory_2,
                    size: 12,
                    color:
                        (producto.stockActual ?? 0) > 5
                            ? AppDesignSystem.success
                            : AppDesignSystem.error,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Stock: ${producto.stockActual ?? 0}',
                    style: AppDesignSystem.bodyMd().copyWith(
                      color:
                          (producto.stockActual ?? 0) > 5
                              ? AppDesignSystem.success
                              : AppDesignSystem.error,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
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
      SnackBar(content: Text('Ver detalles de: ${producto.nombre}')),
    );
  }

  Widget _buildFilterChip(String label, bool isSelected) {
    return GestureDetector(
      onTap: () {
        // TODO: Implementar lógica de filtrado
        setState(() {
          // Aquí se implementaría la lógica de selección de filtros
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color:
              isSelected
                  ? AppDesignSystem.navAccent
                  : (AppDesignSystem.isDark
                      ? Colors.white.withOpacity(0.05)
                      : Colors.black.withOpacity(0.03)),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color:
                isSelected
                    ? AppDesignSystem.navAccent
                    : AppDesignSystem.navAccent.withOpacity(0.2),
            width: 1,
          ),
          boxShadow:
              isSelected
                  ? [
                    BoxShadow(
                      color: AppDesignSystem.navAccent.withOpacity(0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ]
                  : null,
        ),
        child: Text(
          label,
          style: AppDesignSystem.bodyMd().copyWith(
            color: isSelected ? Colors.white : AppDesignSystem.textSecondary,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
