import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:isar/isar.dart';
import 'package:tienda_app/models/pedido.dart';
import 'package:tienda_app/models/compra.dart';
import 'package:tienda_app/models/producto.dart';
import 'package:tienda_app/models/cliente.dart';
import 'package:tienda_app/models/categoria.dart';
import 'package:tienda_app/models/proveedor.dart';
import 'package:tienda_app/src/app_routes.dart';
import 'package:tienda_app/services/app_config_service.dart';
import 'package:tienda_app/services/isar_service.dart';
import 'package:tienda_app/models/app_theme.dart';
import 'package:tienda_app/models/font_config.dart';
import 'widgets/stat_card.dart';
import 'widgets/action_button.dart';
import 'widgets/sales_chart.dart';
import 'widgets/top_products_list.dart';
import 'widgets/recent_orders_list.dart';
import 'widgets/alert_card.dart';

class DashboardView extends ConsumerStatefulWidget {
  const DashboardView({super.key});

  @override
  ConsumerState<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends ConsumerState<DashboardView> {
  Map<String, dynamic> stats = {};
  List<Map<String, dynamic>> salesData = [];
  List<Map<String, dynamic>> inventoryData = [];
  List<Map<String, dynamic>> topProducts = [];
  List<Map<String, dynamic>> recentOrders = [];
  AppTheme? _currentTheme;
  FontConfig? _currentFontConfig;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadThemeAndData();
  }

  Future<void> _loadThemeAndData() async {
    final configService = ref.read(appConfigServiceProvider);
    final theme = await configService.getSelectedTheme();
    final fontConfig = await configService.getSelectedFontConfig();

    setState(() {
      _currentTheme = theme;
      _currentFontConfig = fontConfig;
    });

    await _loadData();
  }

  Future<void> _loadData() async {
    final isarService = ref.read(isarServiceProvider);
    final isar = await isarService.db;

    await _calculateStats(isar);
    await _generateChartData(isar);
    await _loadTopProducts(isar);
    await _loadRecentOrders(isar);

    setState(() {
      _isLoading = false;
    });
  }

  Future<void> _calculateStats(Isar isar) async {
    final now = DateTime.now();
    final startOfMonth = DateTime(now.year, now.month, 1);
    final endOfMonth = DateTime(now.year, now.month + 1, 0);
    final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    final endOfWeek = startOfWeek.add(const Duration(days: 6));

    final pedidosMes =
        await isar.pedidos
            .filter()
            .fechaBetween(startOfMonth, endOfMonth)
            .findAll();

    final pedidosSemana =
        await isar.pedidos
            .filter()
            .fechaBetween(startOfWeek, endOfWeek)
            .findAll();

    final comprasMes =
        await isar.compras
            .filter()
            .fechaBetween(startOfMonth, endOfMonth)
            .findAll();

    final productos = await isar.productos.where().findAll();
    final clientes = await isar.clientes.where().findAll();
    final categorias = await isar.categorias.where().findAll();
    final proveedores = await isar.proveedors.where().findAll();

    double totalVentasMes = pedidosMes.fold(
      0,
      (sum, p) => sum + (p.total ?? 0),
    );
    double totalVentasSemana = pedidosSemana.fold(
      0,
      (sum, p) => sum + (p.total ?? 0),
    );
    double totalComprasMes = comprasMes.fold(
      0,
      (sum, c) => sum + (c.total ?? 0),
    );

    int productosBajoStock = productos.where((p) => (p.stock ?? 0) < 10).length;
    int productosSinStock = productos.where((p) => (p.stock ?? 0) == 0).length;
    int productosCriticos = productos.where((p) => (p.stock ?? 0) < 5).length;

    // Calcular productos más vendidos
    Map<int, int> ventasPorProducto = {};
    for (final pedido in pedidosMes) {
      for (final productoId in pedido.productos) {
        ventasPorProducto[productoId] =
            (ventasPorProducto[productoId] ?? 0) + 1;
      }
    }

    setState(() {
      stats = {
        'totalVentasMes': totalVentasMes,
        'totalVentasSemana': totalVentasSemana,
        'totalComprasMes': totalComprasMes,
        'gananciaMes': totalVentasMes - totalComprasMes,
        'pedidosMes': pedidosMes.length,
        'pedidosSemana': pedidosSemana.length,
        'comprasMes': comprasMes.length,
        'productos': productos.length,
        'clientes': clientes.length,
        'categorias': categorias.length,
        'proveedores': proveedores.length,
        'productosBajoStock': productosBajoStock,
        'productosSinStock': productosSinStock,
        'productosCriticos': productosCriticos,
        'promedioVenta':
            pedidosMes.isNotEmpty ? totalVentasMes / pedidosMes.length : 0,
        'tasaConversion':
            clientes.isNotEmpty
                ? (pedidosMes.length / clientes.length) * 100
                : 0,
      };
    });
  }

  Future<void> _generateChartData(Isar isar) async {
    final now = DateTime.now();
    final startOfMonth = DateTime(now.year, now.month, 1);
    final endOfMonth = DateTime(now.year, now.month + 1, 0);

    final pedidos =
        await isar.pedidos
            .filter()
            .fechaBetween(startOfMonth, endOfMonth)
            .findAll();

    final productos = await isar.productos.where().findAll();

    // Datos de ventas por día
    Map<int, double> ventasPorDia = {};
    for (int i = 1; i <= endOfMonth.day; i++) {
      ventasPorDia[i] = 0;
    }

    for (final pedido in pedidos) {
      if (pedido.fecha != null) {
        final dia = pedido.fecha!.day;
        ventasPorDia[dia] = (ventasPorDia[dia] ?? 0) + (pedido.total ?? 0);
      }
    }

    setState(() {
      salesData =
          ventasPorDia.entries
              .map((e) => {'dia': e.key, 'ventas': e.value})
              .toList();

      // Datos de inventario por categoría
      Map<String, int> stockPorCategoria = {};
      for (final producto in productos) {
        final categoria = 'Sin categoría';
        stockPorCategoria[categoria] =
            (stockPorCategoria[categoria] ?? 0) + (producto.stock ?? 0);
      }

      inventoryData =
          stockPorCategoria.entries
              .map((e) => {'categoria': e.key, 'stock': e.value})
              .toList();
    });
  }

  Future<void> _loadTopProducts(Isar isar) async {
    final now = DateTime.now();
    final startOfMonth = DateTime(now.year, now.month, 1);
    final endOfMonth = DateTime(now.year, now.month + 1, 0);

    final pedidos =
        await isar.pedidos
            .filter()
            .fechaBetween(startOfMonth, endOfMonth)
            .findAll();

    final productos = await isar.productos.where().findAll();

    Map<int, int> ventasPorProducto = {};
    for (final pedido in pedidos) {
      for (final productoId in pedido.productos) {
        ventasPorProducto[productoId] =
            (ventasPorProducto[productoId] ?? 0) + 1;
      }
    }

    final sortedProducts =
        ventasPorProducto.entries.toList()
          ..sort((a, b) => b.value.compareTo(a.value));

    setState(() {
      topProducts =
          sortedProducts.take(5).map((entry) {
            final producto = productos.firstWhere(
              (p) => p.id == entry.key,
              orElse: () => Producto()..nombre = 'Producto no encontrado',
            );
            return {
              'id': entry.key,
              'nombre': producto.nombre,
              'ventas': entry.value,
              'stock': producto.stock ?? 0,
            };
          }).toList();
    });
  }

  Future<void> _loadRecentOrders(Isar isar) async {
    final pedidos = await isar.pedidos.where().sortByFecha().limit(5).findAll();
    final clientes = await isar.clientes.where().findAll();

    setState(() {
      recentOrders =
          pedidos.map((pedido) {
            final cliente = clientes.firstWhere(
              (c) => c.id == pedido.clienteId,
              orElse: () => Cliente()..nombre = 'Cliente no encontrado',
            );
            return {
              'id': pedido.id,
              'cliente': cliente.nombre,
              'total': pedido.total ?? 0,
              'fecha': pedido.fecha,
              'estado': pedido.estado ?? 'Pendiente',
            };
          }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        backgroundColor: _currentTheme?.backgroundColor ?? Colors.grey[900],
        body: Center(
          child: CircularProgressIndicator(
            color: _currentTheme?.accentColor ?? Colors.blue,
          ),
        ),
      );
    }

    final theme = _currentTheme ?? AppTheme.darkTheme;
    final fontConfig = _currentFontConfig ?? FontConfig.defaultConfig;
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600;
    final isDesktop = screenWidth > 900;

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(isDesktop ? 24 : 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Título principal
            Text(
              'Resumen del Negocio',
              style: TextStyle(
                fontSize: isDesktop ? 32 : 24,
                fontWeight: FontWeight.bold,
                color: theme.textColor,
                fontFamily: fontConfig.titleFont,
              ),
            ),
            const SizedBox(height: 24),

            // Estadísticas principales
            LayoutBuilder(
              builder: (context, constraints) {
                final cardWidth = 280.0;
                final spacing = 16.0;
                final crossAxisCount =
                    (constraints.maxWidth / (cardWidth + spacing)).floor();
                final actualCrossAxisCount =
                    crossAxisCount > 0 ? crossAxisCount : 1;

                return GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: actualCrossAxisCount,
                  crossAxisSpacing: spacing,
                  mainAxisSpacing: spacing,
                  childAspectRatio: 1.5,
                  children: [
                    StatCard(
                      title: 'Ventas del Mes',
                      value:
                          '\$${stats['totalVentasMes']?.toStringAsFixed(2) ?? '0.00'}',
                      icon: Icons.attach_money,
                      color: Colors.green,
                      subtitle: 'Este mes',
                      theme: theme,
                      fontConfig: fontConfig,
                    ),
                    StatCard(
                      title: 'Ganancia',
                      value:
                          '\$${stats['gananciaMes']?.toStringAsFixed(2) ?? '0.00'}',
                      icon: Icons.trending_up,
                      color: Colors.blue,
                      subtitle: 'Este mes',
                      theme: theme,
                      fontConfig: fontConfig,
                    ),
                    StatCard(
                      title: 'Productos',
                      value: '${stats['productos'] ?? 0}',
                      icon: Icons.inventory,
                      color: Colors.orange,
                      subtitle: 'Total',
                      theme: theme,
                      fontConfig: fontConfig,
                    ),
                    StatCard(
                      title: 'Clientes',
                      value: '${stats['clientes'] ?? 0}',
                      icon: Icons.people,
                      color: Colors.purple,
                      subtitle: 'Activos',
                      theme: theme,
                      fontConfig: fontConfig,
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 24),

            // Alertas de stock
            if ((stats['productosBajoStock'] ?? 0) > 0 ||
                (stats['productosSinStock'] ?? 0) > 0 ||
                (stats['productosCriticos'] ?? 0) > 0) ...[
              Text(
                'Alertas de Stock',
                style: TextStyle(
                  fontSize: isDesktop ? 24 : 20,
                  fontWeight: FontWeight.bold,
                  color: theme.textColor,
                  fontFamily: fontConfig.titleFont,
                ),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  if ((stats['productosCriticos'] ?? 0) > 0)
                    AlertCard(
                      message:
                          '${stats['productosCriticos']} productos críticos',
                      icon: Icons.error,
                      color: Colors.red,
                      subtitle: 'Stock < 5',
                      theme: theme,
                      fontConfig: fontConfig,
                    ),
                  if ((stats['productosBajoStock'] ?? 0) > 0)
                    AlertCard(
                      message:
                          '${stats['productosBajoStock']} productos con stock bajo',
                      icon: Icons.warning,
                      color: Colors.orange,
                      subtitle: 'Stock < 10',
                      theme: theme,
                      fontConfig: fontConfig,
                    ),
                  if ((stats['productosSinStock'] ?? 0) > 0)
                    AlertCard(
                      message:
                          '${stats['productosSinStock']} productos sin stock',
                      icon: Icons.remove_shopping_cart,
                      color: Colors.red,
                      subtitle: 'Sin stock',
                      theme: theme,
                      fontConfig: fontConfig,
                    ),
                ],
              ),
              const SizedBox(height: 24),
            ],

            // Gráficos y datos
            if (isDesktop) ...[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: SalesChart(
                      salesData: salesData,
                      theme: theme,
                      fontConfig: fontConfig,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TopProductsList(
                      topProducts: topProducts,
                      theme: theme,
                      fontConfig: fontConfig,
                    ),
                  ),
                ],
              ),
            ] else ...[
              SalesChart(
                salesData: salesData,
                theme: theme,
                fontConfig: fontConfig,
              ),
              const SizedBox(height: 16),
              TopProductsList(
                topProducts: topProducts,
                theme: theme,
                fontConfig: fontConfig,
              ),
            ],
            const SizedBox(height: 16),
            RecentOrdersList(
              recentOrders: recentOrders,
              theme: theme,
              fontConfig: fontConfig,
            ),
            const SizedBox(height: 24),

            // Acciones rápidas
            Text(
              'Acciones Rápidas',
              style: TextStyle(
                fontSize: isDesktop ? 24 : 20,
                fontWeight: FontWeight.bold,
                color: theme.textColor,
                fontFamily: fontConfig.titleFont,
              ),
            ),
            const SizedBox(height: 16),
            Column(
              children: [
                ActionButton(
                  title: 'Agregar Nuevo Producto',
                  icon: Icons.add_shopping_cart,
                  onTap: () => context.push(AppRoutes.productAdd),
                  color: Colors.green,
                  theme: theme,
                  fontConfig: fontConfig,
                ),
                const SizedBox(height: 12),
                ActionButton(
                  title: 'Crear Nuevo Pedido',
                  icon: Icons.shopping_bag,
                  onTap: () => context.push(AppRoutes.orderAdd),
                  color: Colors.blue,
                  theme: theme,
                  fontConfig: fontConfig,
                ),
                const SizedBox(height: 12),
                ActionButton(
                  title: 'Registrar Nuevo Cliente',
                  icon: Icons.person_add,
                  onTap: () => context.push(AppRoutes.clientAdd),
                  color: Colors.purple,
                  theme: theme,
                  fontConfig: fontConfig,
                ),
                const SizedBox(height: 12),
                ActionButton(
                  title: 'Ver Reportes Detallados',
                  icon: Icons.analytics,
                  onTap: () => context.push(AppRoutes.reports),
                  color: Colors.orange,
                  theme: theme,
                  fontConfig: fontConfig,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
