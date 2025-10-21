import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../services/app_config_service.dart';
import '../../services/isar_service.dart';
import '../../models/app_theme.dart';
import '../../models/font_config.dart';
import '../../services/dashboard_data_service.dart';
import 'sections/financial_metrics_section.dart';
import 'sections/operations_section.dart';
import 'sections/inventory_alerts_section.dart';
import 'sections/category_performance_section.dart';
import 'sections/sales_analysis_section.dart';
import 'sections/recent_orders_section.dart';
import 'sections/quick_actions_section.dart';

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
  List<Map<String, dynamic>> categoryPerformance = [];
  List<Map<String, dynamic>> stockAlerts = [];
  List<Map<String, dynamic>> customerInsights = [];
  List<Map<String, dynamic>> supplierData = [];
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
              ],
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
                    'Pedidos de la semana': '${stats['pedidosSemana'] ?? 0}',
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
                  () => _showDetailedAnalysis('Alertas de Inventario', {
                    'Productos crÃ­ticos': '${stats['productosCriticos'] ?? 0}',
                    'Productos con stock bajo':
                        '${stats['productosBajoStock'] ?? 0}',
                    'Productos sin stock': '${stats['productosSinStock'] ?? 0}',
                    'Total de productos': '${stats['productos'] ?? 0}',
                  }),
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
                  () => _showDetailedAnalysis('Rendimiento por CategorÃ­as', {
                    'Total de categorÃ­as': '${stats['categorias'] ?? 0}',
                    'CategorÃ­as con productos': '${categoryPerformance.length}',
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
          ],
        ),
      ),
    );
  }
}

