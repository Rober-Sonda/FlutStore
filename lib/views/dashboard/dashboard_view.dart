import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../services/app_config_service.dart';
import '../../services/isar_service.dart';
import '../../services/theme_service.dart';
import '../../models/app_theme.dart';
import '../../models/font_config.dart';
import '../../services/dashboard_data_service.dart';
import '../../widgets/transparent_scaffold.dart';
import 'sections/financial_metrics_section.dart';
import 'sections/operations_section.dart';
import 'sections/inventory_alerts_section.dart';
import 'sections/category_performance_section.dart';
import 'sections/sales_analysis_section.dart';
import 'sections/recent_orders_section.dart';
import 'sections/quick_actions_section.dart';

// Agrega los providers para stats y stockAlerts al inicio del archivo
final statsProvider = Provider<Map<String, dynamic>>((ref) {
  // AquÃ­ deberÃ­as obtener los datos desde DashboardDataService usando Isar
  // Este es un ejemplo bÃ¡sico, ajusta segÃºn tu arquitectura y contexto
  final isarService = ref.watch(isarServiceProvider);
  // Este provider debe ser async si usas FutureProvider, aquÃ­ es solo ejemplo
  // Reemplaza por FutureProvider si necesitas datos asÃ­ncronos
  return {};
});

final stockAlertsProvider = Provider<List<Map<String, dynamic>>>((ref) {
  // Igual que arriba, obtÃ©n los datos desde DashboardDataService
  return [];
});

class DashboardView extends ConsumerStatefulWidget {
  const DashboardView({super.key});

  @override
  ConsumerState<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends ConsumerState<DashboardView> {
  AppTheme? _currentTheme;
  FontConfig? _currentFontConfig;
  bool _isLoading = true;

  Map<String, dynamic> stats = {};
  List<Map<String, dynamic>> salesData = [];
  List<Map<String, dynamic>> topProducts = [];
  List<Map<String, dynamic>> recentOrders = [];
  List<Map<String, dynamic>> categoryPerformance = [];
  List<Map<String, dynamic>> stockAlerts = [];
  List<Map<String, dynamic>> customerInsights = [];
  List<Map<String, dynamic>> supplierData = [];

  // KPIs y notificaciones simuladas para el dashboard
  int ventasHoy = 12;
  double ingresosHoy = 35000;
  int productosBajoStock = 5;
  int clientesNuevos = 3;
  List<String> notificaciones = [
    'Â¡Tienes productos bajo stock!',
    'Recuerda revisar los pedidos pendientes.',
    'Hay un sorteo activo, promociona en Instagram.',
    'Cierre de caja pendiente para hoy.',
  ];

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

    // ObtÃ©n todos los datos desde los seeds usando los servicios
    final statsData = await DashboardDataService.calculateStats(isar);
    final salesDataResult = await DashboardDataService.generateChartData(isar);
    final topProductsResult = await DashboardDataService.loadTopProducts(isar);
    final recentOrdersResult = await DashboardDataService.loadRecentOrders(
      isar,
    );
    final categoryPerformanceResult =
        await DashboardDataService.loadCategoryPerformance(isar);
    final stockAlertsResult = await DashboardDataService.loadStockAlerts(isar);
    final customerInsightsResult =
        await DashboardDataService.loadCustomerInsights(isar);
    final supplierDataResult = await DashboardDataService.loadSupplierData(
      isar,
    );

    setState(() {
      // Todos los datos provienen de los seeds inicializados en la base de datos
      stats = statsData;
      salesData = salesDataResult;
      topProducts = topProductsResult;
      recentOrders = recentOrdersResult;
      categoryPerformance = categoryPerformanceResult;
      stockAlerts = stockAlertsResult;
      customerInsights = customerInsightsResult;
      supplierData = supplierDataResult;
      _isLoading = false;
    });
  }

  void _showDetailedAnalysis(String section, Map<String, dynamic> data) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('AnÃ¡lisis Detallado - $section'),
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Datos del perÃ­odo actual:'),
                  const SizedBox(height: 8),
                  ...data.entries.map(
                    (entry) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Text('${entry.key}: ${entry.value}'),
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cerrar'),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Usa los datos seeds a travÃ©s de los providers
    final stats = ref.watch(statsProvider); // datos seeds
    final stockAlerts = ref.watch(stockAlertsProvider); // datos seeds

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

    return FashionBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: BoxDecoration(
            color:
                theme.isDark
                    ? const Color(0xFF0F172A).withOpacity(0.93)
                    : const Color(0xFFF8FAFC).withOpacity(0.93),
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.all(isDesktop ? 24 : 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header principal
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Dashboard de Negocio',
                        style: TextStyle(
                          fontSize: isDesktop ? 32 : 24,
                          fontWeight: FontWeight.bold,
                          color: theme.textColor,
                          fontFamily: fontConfig.titleFont,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () => _loadData(),
                      icon: Icon(Icons.refresh, color: theme.textColor),
                      tooltip: 'Actualizar datos',
                    ),
                    // Elimina cualquier IconButton de carrito aquÃ­.
                    // El icono de carrito con punto rojo ya estÃ¡ en modern_title_bar.dart.
                  ],
                ),
                // NUEVO: DescripciÃ³n general del dashboard
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 16),
                  child: Card(
                    color: Colors.blueGrey[900],
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        'AquÃ­ puedes ver un resumen de tu negocio: ventas, productos, pedidos, inventario y alertas importantes. Usa este panel para tomar decisiones rÃ¡pidas y controlar el estado general de tu tienda.',
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // SECCIÃ“N 1: MÃ©tricas Financieras
                FinancialMetricsSection(
                  stats: stats,
                  theme: theme,
                  fontConfig: fontConfig,
                  onTap:
                      () => _showDetailedAnalysis('MÃ©tricas Financieras', {
                        'Ventas del mes':
                            '\$${stats['totalVentasMes']?.toStringAsFixed(2) ?? '0.00'}',
                        'Ganancia del mes':
                            '\$${stats['gananciaMes']?.toStringAsFixed(2) ?? '0.00'}',
                        'Margen de ganancia':
                            '${stats['margenGanancia']?.toStringAsFixed(1) ?? '0.0'}%',
                        'Crecimiento vs mes anterior':
                            '${stats['crecimientoVentas']?.toStringAsFixed(1) ?? '0.0'}%',
                        'Valor del inventario':
                            '\$${stats['valorInventario']?.toStringAsFixed(2) ?? '0.00'}',
                      }),
                  isDesktop: isDesktop,
                  isTablet: isTablet,
                ),
                const SizedBox(height: 24),

                // SECCIÃ“N 2: Operaciones y Productividad
                OperationsSection(
                  stats: stats,
                  theme: theme,
                  fontConfig: fontConfig,
                  onTap:
                      () => _showDetailedAnalysis('Operaciones', {
                        'Pedidos del mes': '${stats['pedidosMes'] ?? 0}',
                        'Pedidos de la semana':
                            '${stats['pedidosSemana'] ?? 0}',
                        'Compras del mes': '${stats['comprasMes'] ?? 0}',
                        'Promedio por venta':
                            '\$${stats['promedioVenta']?.toStringAsFixed(2) ?? '0.00'}',
                        'Tasa de conversiÃ³n':
                            '${stats['tasaConversion']?.toStringAsFixed(1) ?? '0.0'}%',
                      }),
                  isDesktop: isDesktop,
                  isTablet: isTablet,
                ),
                const SizedBox(height: 24),

                // SECCIÃ“N 3: Alertas de Inventario
                InventoryAlertsSection(
                  stats: stats,
                  stockAlerts: stockAlerts,
                  theme: theme,
                  fontConfig: fontConfig,
                  onTap:
                      null, // Corrige el error pasando null o una funciÃ³n vÃ¡lida
                  isDesktop: isDesktop,
                  isTablet: isTablet,
                ),
                const SizedBox(height: 24),

                // SECCIÃ“N 4: Rendimiento por CategorÃ­as
                CategoryPerformanceSection(
                  categoryPerformance: categoryPerformance,
                  stats: stats,
                  theme: theme,
                  fontConfig: fontConfig,
                  onTap:
                      () =>
                          _showDetailedAnalysis('Rendimiento por CategorÃ­as', {
                            'Total de categorÃ­as':
                                '${stats['categorias'] ?? 0}',
                            'CategorÃ­as con productos':
                                '${categoryPerformance.length}',
                          }),
                  isDesktop: isDesktop,
                  isTablet: isTablet,
                ),
                const SizedBox(height: 24),

                // SECCIÃ“N 5: AnÃ¡lisis de Ventas
                SalesAnalysisSection(
                  salesData: salesData,
                  topProducts: topProducts,
                  stats: stats,
                  theme: theme,
                  fontConfig: fontConfig,
                  onTap:
                      () => _showDetailedAnalysis('AnÃ¡lisis de Ventas', {
                        'DÃ­as con ventas':
                            '${salesData.where((d) => d['ventas'] > 0).length}',
                        'Total de dÃ­as analizados': '${salesData.length}',
                        'Promedio diario':
                            '\$${(stats['totalVentasMes'] ?? 0) / salesData.length}',
                      }),
                  isDesktop: isDesktop,
                ),
                const SizedBox(height: 24),

                // SECCIÃ“N 6: Pedidos Recientes
                RecentOrdersSection(
                  recentOrders: recentOrders,
                  theme: theme,
                  fontConfig: fontConfig,
                  onTap:
                      () => _showDetailedAnalysis('Pedidos Recientes', {
                        'Total de pedidos mostrados': '${recentOrders.length}',
                        'Promedio de pedidos':
                            '\$${recentOrders.isNotEmpty ? recentOrders.map((o) => o['total'] as double).reduce((a, b) => a + b) / recentOrders.length : 0}',
                      }),
                ),
                const SizedBox(height: 24),

                // SECCIÃ“N 7: Acciones RÃ¡pidas
                QuickActionsSection(
                  theme: theme,
                  fontConfig: fontConfig,
                  isDesktop: isDesktop,
                  isTablet: isTablet,
                ),
                const SizedBox(height: 32),

                // KPIs principales
                Wrap(
                  spacing: 24,
                  runSpacing: 24,
                  children: [
                    _buildKpiCard(
                      'Ventas Hoy',
                      ventasHoy.toString(),
                      Icons.shopping_cart,
                      Colors.green,
                    ),
                    _buildKpiCard(
                      'Ingresos Hoy',
                      '\$${ingresosHoy.toStringAsFixed(0)}',
                      Icons.attach_money,
                      Colors.blue,
                    ),
                    _buildKpiCard(
                      'Bajo Stock',
                      productosBajoStock.toString(),
                      Icons.warning,
                      Colors.orange,
                    ),
                    _buildKpiCard(
                      'Clientes Nuevos',
                      clientesNuevos.toString(),
                      Icons.person_add,
                      Colors.purple,
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                // Notificaciones
                Card(
                  color: Colors.grey[900],
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.notifications, color: Colors.purple),
                            SizedBox(width: 8),
                            Text(
                              'Notificaciones',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.purple,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        ...notificaciones.map(
                          (n) => ListTile(
                            leading: const Icon(
                              Icons.info,
                              color: Colors.white54,
                              size: 20,
                            ),
                            title: Text(
                              n,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                // ...puedes agregar aquÃ­ grÃ¡ficos, tendencias, accesos rÃ¡pidos, etc...
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildKpiCard(String title, String value, IconData icon, Color color) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 32),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: const TextStyle(fontSize: 14, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
