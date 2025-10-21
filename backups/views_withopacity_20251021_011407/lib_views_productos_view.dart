import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/custom_card.dart';
import '../widgets/loading_indicator.dart';
import '../utils/app_theme.dart';
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
      appBar: AppBar(
        title: const Text('Productos'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => _showSearchDialog(),
          ),
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () => _showFilterDialog(),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppTheme.backgroundColor,
              AppTheme.backgroundColor.withOpacity(0.8),
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
              child: GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
    return CustomCard(
      onTap: () => _navigateToProductDetail(producto),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppTheme.backgroundColor,
              ),
              child:
                  producto.imagen != null
                      ? ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          producto.imagen!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(
                              Icons.inventory,
                              size: 48,
                              color: AppTheme.textSecondary,
                            );
                          },
                        ),
                      )
                      : const Icon(
                        Icons.inventory,
                        size: 48,
                        color: AppTheme.textSecondary,
                      ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            producto.nombre ?? 'Sin nombre',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: AppTheme.textPrimary,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            '\$${(producto.precio ?? 0.0).toStringAsFixed(2)}',
            style: const TextStyle(
              color: AppTheme.primaryColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Icon(
                Icons.inventory_2,
                size: 16,
                color:
                    (producto.stock ?? 0) > 5
                        ? AppTheme.successColor
                        : AppTheme.errorColor,
              ),
              const SizedBox(width: 4),
              Text(
                'Stock: ${producto.stock ?? 0}',
                style: TextStyle(
                  color:
                      (producto.stock ?? 0) > 5
                          ? AppTheme.successColor
                          : AppTheme.errorColor,
                  fontSize: 12,
                ),
              ),
            ],
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
            color: AppTheme.textSecondary.withOpacity(0.5),
          ),
          const SizedBox(height: 24),
          const Text(
            'No hay productos disponibles',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AppTheme.textSecondary,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Agrega tu primer producto para comenzar',
            style: TextStyle(fontSize: 16, color: AppTheme.textSecondary),
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
}
