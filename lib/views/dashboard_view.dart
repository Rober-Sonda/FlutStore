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
import 'package:fl_chart/fl_chart.dart';

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

  Widget _buildResponsiveStatCard(
    String title,
    String value,
    IconData icon,
    Color color,
    String subtitle,
  ) {
    final theme = _currentTheme ?? AppTheme.darkTheme;
    final fontConfig = _currentFontConfig ?? FontConfig.defaultConfig;

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [color.withOpacity(0.1), color.withOpacity(0.05)],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(icon, size: 20, color: color),
                ),
                const Spacer(),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12,
                    color: theme.textSecondaryColor,
                    fontFamily: fontConfig.captionFont,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              value,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: theme.textColor,
                fontFamily: fontConfig.titleFont,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                color: theme.textSecondaryColor,
                fontFamily: fontConfig.bodyFont,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCompactActionButton(
    String title,
    IconData icon,
    VoidCallback onTap,
    Color color,
  ) {
    final theme = _currentTheme ?? AppTheme.darkTheme;
    final fontConfig = _currentFontConfig ?? FontConfig.defaultConfig;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: theme.surfaceColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Row(
          children: [
            Icon(icon, size: 20, color: color),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: theme.textColor,
                  fontFamily: fontConfig.bodyFont,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: theme.textSecondaryColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSalesChart() {
    if (salesData.isEmpty) {
      return _buildEmptyCard('No hay datos de ventas disponibles');
    }

    final theme = _currentTheme ?? AppTheme.darkTheme;
    final fontConfig = _currentFontConfig ?? FontConfig.defaultConfig;
    final maxVentas = salesData
        .map((d) => d['ventas'] as double)
        .reduce((a, b) => a > b ? a : b);
    final maxHeight = 120.0;

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.trending_up, color: theme.accentColor, size: 20),
                const SizedBox(width: 8),
                Text(
                  'Ventas del Mes',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: theme.textColor,
                    fontFamily: fontConfig.titleFont,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: maxHeight + 40,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children:
                    salesData.map((data) {
                      final height =
                          maxVentas > 0
                              ? (data['ventas'] as double) /
                                  maxVentas *
                                  maxHeight
                              : 0.0;
                      return Expanded(
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: theme.accentColor,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                height: height,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '${data['dia']}',
                              style: TextStyle(
                                fontSize: 10,
                                color: theme.textSecondaryColor,
                                fontFamily: fontConfig.captionFont,
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopProductsList() {
    if (topProducts.isEmpty) {
      return _buildEmptyCard('No hay productos vendidos');
    }

    final theme = _currentTheme ?? AppTheme.darkTheme;
    final fontConfig = _currentFontConfig ?? FontConfig.defaultConfig;

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.star, color: theme.accentColor, size: 20),
                const SizedBox(width: 8),
                Text(
                  'Productos Más Vendidos',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: theme.textColor,
                    fontFamily: fontConfig.titleFont,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ...topProducts.asMap().entries.map((entry) {
              final index = entry.key;
              final product = entry.value;
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: theme.accentColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          '${index + 1}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            fontFamily: fontConfig.captionFont,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product['nombre'],
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: theme.textColor,
                              fontFamily: fontConfig.bodyFont,
                            ),
                          ),
                          Text(
                            'Stock: ${product['stock']}',
                            style: TextStyle(
                              fontSize: 12,
                              color: theme.textSecondaryColor,
                              fontFamily: fontConfig.captionFont,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: theme.accentColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        '${product['ventas']} ventas',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: theme.accentColor,
                          fontFamily: fontConfig.captionFont,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentOrdersList() {
    if (recentOrders.isEmpty) {
      return _buildEmptyCard('No hay pedidos recientes');
    }

    final theme = _currentTheme ?? AppTheme.darkTheme;
    final fontConfig = _currentFontConfig ?? FontConfig.defaultConfig;

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.receipt, color: theme.accentColor, size: 20),
                const SizedBox(width: 8),
                Text(
                  'Pedidos Recientes',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: theme.textColor,
                    fontFamily: fontConfig.titleFont,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ...recentOrders.map((order) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: theme.accentColor.withOpacity(0.2),
                      child: Icon(
                        Icons.shopping_bag,
                        size: 16,
                        color: theme.accentColor,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            order['cliente'],
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: theme.textColor,
                              fontFamily: fontConfig.bodyFont,
                            ),
                          ),
                          Text(
                            '\$${order['total'].toStringAsFixed(2)}',
                            style: TextStyle(
                              fontSize: 12,
                              color: theme.textSecondaryColor,
                              fontFamily: fontConfig.captionFont,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: _getStatusColor(
                          order['estado'],
                        ).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        order['estado'],
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: _getStatusColor(order['estado']),
                          fontFamily: fontConfig.captionFont,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'completado':
        return Colors.green;
      case 'pendiente':
        return Colors.orange;
      case 'cancelado':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  Widget _buildEmptyCard(String message) {
    final theme = _currentTheme ?? AppTheme.darkTheme;
    final fontConfig = _currentFontConfig ?? FontConfig.defaultConfig;

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Text(
            message,
            style: TextStyle(
              color: theme.textSecondaryColor,
              fontFamily: fontConfig.bodyFont,
            ),
          ),
        ),
      ),
    );
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
      appBar: AppBar(
        title: Text(
          'Dashboard',
          style: TextStyle(
            color: theme.textColor,
            fontFamily: fontConfig.titleFont,
            fontSize: 20,
          ),
        ),
        backgroundColor: theme.surfaceColor,
        elevation: 0,
        iconTheme: IconThemeData(color: theme.textColor),
      ),
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
                // Calcular el número de columnas basado en el ancho disponible
                final cardWidth = 280.0; // Ancho fijo de cada card
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
                    _buildResponsiveStatCard(
                      'Ventas del Mes',
                      '\$${stats['totalVentasMes']?.toStringAsFixed(2) ?? '0.00'}',
                      Icons.attach_money,
                      Colors.green,
                      'Este mes',
                    ),
                    _buildResponsiveStatCard(
                      'Ganancia',
                      '\$${stats['gananciaMes']?.toStringAsFixed(2) ?? '0.00'}',
                      Icons.trending_up,
                      Colors.blue,
                      'Este mes',
                    ),
                    _buildResponsiveStatCard(
                      'Productos',
                      '${stats['productos'] ?? 0}',
                      Icons.inventory,
                      Colors.orange,
                      'Total',
                    ),
                    _buildResponsiveStatCard(
                      'Clientes',
                      '${stats['clientes'] ?? 0}',
                      Icons.people,
                      Colors.purple,
                      'Activos',
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
                    _buildAlertCard(
                      '${stats['productosCriticos']} productos críticos',
                      Icons.error,
                      Colors.red,
                      'Stock < 5',
                    ),
                  if ((stats['productosBajoStock'] ?? 0) > 0)
                    _buildAlertCard(
                      '${stats['productosBajoStock']} productos con stock bajo',
                      Icons.warning,
                      Colors.orange,
                      'Stock < 10',
                    ),
                  if ((stats['productosSinStock'] ?? 0) > 0)
                    _buildAlertCard(
                      '${stats['productosSinStock']} productos sin stock',
                      Icons.remove_shopping_cart,
                      Colors.red,
                      'Sin stock',
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
                  Expanded(flex: 2, child: _buildSalesChart()),
                  const SizedBox(width: 16),
                  Expanded(child: _buildTopProductsList()),
                ],
              ),
            ] else ...[
              _buildSalesChart(),
              const SizedBox(height: 16),
              _buildTopProductsList(),
            ],
            const SizedBox(height: 16),
            _buildRecentOrdersList(),
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
                _buildCompactActionButton(
                  'Agregar Nuevo Producto',
                  Icons.add_shopping_cart,
                  () => context.push(AppRoutes.productAdd),
                  Colors.green,
                ),
                const SizedBox(height: 12),
                _buildCompactActionButton(
                  'Crear Nuevo Pedido',
                  Icons.shopping_bag,
                  () => context.push(AppRoutes.orderAdd),
                  Colors.blue,
                ),
                const SizedBox(height: 12),
                _buildCompactActionButton(
                  'Registrar Nuevo Cliente',
                  Icons.person_add,
                  () => context.push(AppRoutes.clientAdd),
                  Colors.purple,
                ),
                const SizedBox(height: 12),
                _buildCompactActionButton(
                  'Ver Reportes Detallados',
                  Icons.analytics,
                  () => context.push(AppRoutes.reports),
                  Colors.orange,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAlertCard(
    String message,
    IconData icon,
    Color color,
    String subtitle,
  ) {
    final theme = _currentTheme ?? AppTheme.darkTheme;
    final fontConfig = _currentFontConfig ?? FontConfig.defaultConfig;

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: color.withOpacity(0.1),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Row(
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    message,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: theme.textColor,
                      fontFamily: fontConfig.bodyFont,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 12,
                      color: theme.textSecondaryColor,
                      fontFamily: fontConfig.captionFont,
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
}
