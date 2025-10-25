import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../models/producto.dart';
import '../../models/registrofinanciero.dart';
import '../../models/venta.dart';
import '../../models/flujo_caja.dart';
import '../../services/isar_service.dart';

import '../../widgets/fashion_components.dart';
import '../../widgets/app_design_system.dart';
import '../../components/shared/professional_app_bar.dart';

class FashionReportsView extends ConsumerStatefulWidget {
  const FashionReportsView({super.key});

  @override
  ConsumerState<FashionReportsView> createState() => _FashionReportsViewState();
}

class _FashionReportsViewState extends ConsumerState<FashionReportsView>
    with TickerProviderStateMixin {
  String _periodoSeleccionado = 'Mensual';
  DateTime? _fechaInicio;
  DateTime? _fechaFin;
  bool _isLoading = true;

  late AnimationController _fadeController;
  late AnimationController _slideController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  // Datos del reporte
  List<Venta> _ventas = [];
  List<RegistroFinanciero> _registros = [];
  List<FlujoCaja> _flujos = [];
  List<Producto> _productos = [];

  @override
  void initState() {
    super.initState();

    // Configurar animaciones
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

    _configurarPeriodo();
    _loadData();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fadeController.forward();
      _slideController.forward();
    });
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  void _configurarPeriodo() {
    final ahora = DateTime.now();
    switch (_periodoSeleccionado) {
      case 'Diario':
        _fechaInicio = DateTime(ahora.year, ahora.month, ahora.day);
        _fechaFin = DateTime(ahora.year, ahora.month, ahora.day, 23, 59, 59);
        break;
      case 'Semanal':
        final inicioSemana = ahora.subtract(Duration(days: ahora.weekday - 1));
        _fechaInicio = DateTime(
          inicioSemana.year,
          inicioSemana.month,
          inicioSemana.day,
        );
        _fechaFin = DateTime(ahora.year, ahora.month, ahora.day, 23, 59, 59);
        break;
      case 'Mensual':
        _fechaInicio = DateTime(ahora.year, ahora.month, 1);
        _fechaFin = DateTime(ahora.year, ahora.month + 1, 0, 23, 59, 59);
        break;
      case 'Anual':
        _fechaInicio = DateTime(ahora.year, 1, 1);
        _fechaFin = DateTime(ahora.year, 12, 31, 23, 59, 59);
        break;
    }
  }

  Future<void> _loadData() async {
    try {
      setState(() => _isLoading = true);

      final isar = await ref.read(isarServiceProvider).db;

      // Cargar datos en paralelo
      final futures = await Future.wait([
        isar.ventas.filter().fechaBetween(_fechaInicio!, _fechaFin!).findAll(),
        isar.registroFinancieros
            .filter()
            .fechaBetween(_fechaInicio!, _fechaFin!)
            .findAll(),
        isar.flujoCajas
            .filter()
            .fechaBetween(_fechaInicio!, _fechaFin!)
            .findAll(),
        Future.value(
          <Producto>[],
        ), // TODO: Fix when Produto collection is available
      ]);

      setState(() {
        _ventas = futures[0] as List<Venta>;
        _registros = futures[1] as List<RegistroFinanciero>;
        _flujos = futures[2] as List<FlujoCaja>;
        _productos = futures[3] as List<Producto>;
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error al cargar reportes: $e'),
            backgroundColor: AppDesignSystem.error,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return FashionScaffold(
      backgroundTags: const ['elegante', 'urbano', 'personalidad'],
      overlayOpacity: 0.85,
      showBackgroundRotation: true,
      rotationInterval: const Duration(minutes: 4),
      body: AnimatedBuilder(
        animation: Listenable.merge([_fadeAnimation, _slideAnimation]),
        builder: (context, child) {
          return FadeTransition(
            opacity: _fadeAnimation,
            child: SlideTransition(
              position: _slideAnimation,
              child: Column(
                children: [
                  // Header moderno
                  ModernCard(
                    margin: const EdgeInsets.all(0),
                    borderRadius: 0,
                    glassMorphism: true,
                    opacity: 0.9,
                    child: Column(
                      children: [
                        ProfessionalAppBar(
                          title: '📊 Reportes & Analytics',
                          actions: [
                            FashionButton(
                              text: 'Personalizar',
                              icon: Icons.tune_rounded,
                              style: FashionButtonStyle.secondary,
                              onPressed: _showCustomPeriodDialog,
                            ),
                            const SizedBox(width: 16),
                          ],
                        ),

                        // Selector de período
                        Container(
                          margin: const EdgeInsets.all(16),
                          child: ModernCard(
                            glassMorphism: true,
                            opacity: 0.95,
                            borderColor: AppDesignSystem.vibrantPink
                                .withOpacity(0.3),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.date_range_rounded,
                                      color: AppDesignSystem.vibrantPink,
                                      size: 20,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      'Período de Análisis',
                                      style: AppDesignSystem.bodyMd().copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: AppDesignSystem.vibrantPink,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                Wrap(
                                  spacing: 8,
                                  runSpacing: 8,
                                  children:
                                      ['Diario', 'Semanal', 'Mensual', 'Anual']
                                          .map(
                                            (periodo) => FashionChip(
                                              label: periodo,
                                              isSelected:
                                                  _periodoSeleccionado ==
                                                  periodo,
                                              onTap:
                                                  () => _changePeriod(periodo),
                                              icon: _getPeriodIcon(periodo),
                                            ),
                                          )
                                          .toList(),
                                ),
                                if (_fechaInicio != null &&
                                    _fechaFin != null) ...[
                                  const SizedBox(height: 12),
                                  Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: AppDesignSystem.vibrantPink
                                          .withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: AppDesignSystem.vibrantPink
                                            .withOpacity(0.3),
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.info_outline_rounded,
                                          color: AppDesignSystem.vibrantPink,
                                          size: 16,
                                        ),
                                        const SizedBox(width: 8),
                                        Expanded(
                                          child: Text(
                                            'Desde ${_formatDate(_fechaInicio!)} hasta ${_formatDate(_fechaFin!)}',
                                            style: AppDesignSystem.bodySm()
                                                .copyWith(
                                                  color:
                                                      AppDesignSystem
                                                          .vibrantPink,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Contenido principal
                  Expanded(
                    child:
                        _isLoading
                            ? const FashionLoader(
                              message: 'Generando reportes...',
                              size: 60,
                            )
                            : SingleChildScrollView(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                children: [
                                  _buildKPISection(),
                                  const SizedBox(height: 24),
                                  _buildChartsSection(),
                                  const SizedBox(height: 24),
                                  _buildTopProductsSection(),
                                  const SizedBox(height: 24),
                                  _buildFinancialSummarySection(),
                                ],
                              ),
                            ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildKPISection() {
    final totalVentas = _ventas.fold<double>(
      0,
      (sum, venta) => sum + venta.total,
    );
    final totalCosto = _ventas.fold<double>(
      0,
      (sum, venta) =>
          sum +
          venta.detalles.fold(
            0.0,
            (subtotal, detalle) =>
                subtotal + (detalle.precioCompra * detalle.cantidad),
          ),
    );
    final utilidadBruta = totalVentas - totalCosto;
    final margenUtilidad =
        totalVentas > 0 ? (utilidadBruta / totalVentas) * 100 : 0.0;

    final totalIngresos = _flujos
        .where((f) => f.tipo == 'ingreso')
        .fold<double>(0, (sum, flujo) => sum + flujo.monto);
    final totalEgresos = _flujos
        .where((f) => f.tipo == 'egreso')
        .fold<double>(0, (sum, flujo) => sum + flujo.monto);

    return ModernCard(
      glassMorphism: true,
      opacity: 0.95,
      borderColor: AppDesignSystem.success.withOpacity(0.3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppDesignSystem.success,
                      AppDesignSystem.neonGreen,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.dashboard_rounded,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'KPIs Principales',
                      style: AppDesignSystem.headingSm().copyWith(
                        color: AppDesignSystem.success,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'Indicadores clave de rendimiento del período',
                      style: AppDesignSystem.bodySm().copyWith(
                        color: AppDesignSystem.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Primera fila de KPIs
          Row(
            children: [
              Expanded(
                child: _buildKPICard(
                  'Ventas Totales',
                  '\$${totalVentas.toStringAsFixed(2)}',
                  Icons.attach_money_rounded,
                  AppDesignSystem.success,
                  '${_ventas.length} transacciones',
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildKPICard(
                  'Utilidad Bruta',
                  '\$${utilidadBruta.toStringAsFixed(2)}',
                  Icons.trending_up_rounded,
                  AppDesignSystem.electricBlue,
                  '${margenUtilidad.toStringAsFixed(1)}% margen',
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Segunda fila de KPIs
          Row(
            children: [
              Expanded(
                child: _buildKPICard(
                  'Ingresos',
                  '\$${totalIngresos.toStringAsFixed(2)}',
                  Icons.input_rounded,
                  AppDesignSystem.neonGreen,
                  'Todas las fuentes',
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildKPICard(
                  'Egresos',
                  '\$${totalEgresos.toStringAsFixed(2)}',
                  Icons.output_rounded,
                  AppDesignSystem.error,
                  'Todos los gastos',
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Resumen final
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppDesignSystem.success.withOpacity(0.1),
                  AppDesignSystem.electricBlue.withOpacity(0.1),
                ],
              ),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppDesignSystem.success.withOpacity(0.3),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.analytics_rounded,
                  color: AppDesignSystem.success,
                  size: 24,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Balance General del Período',
                        style: AppDesignSystem.bodyMd().copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Flujo neto: \$${(totalIngresos - totalEgresos).toStringAsFixed(2)}',
                        style: AppDesignSystem.bodySm().copyWith(
                          color: AppDesignSystem.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color:
                        (totalIngresos - totalEgresos) >= 0
                            ? AppDesignSystem.success.withOpacity(0.2)
                            : AppDesignSystem.error.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    (totalIngresos - totalEgresos) >= 0
                        ? 'POSITIVO'
                        : 'NEGATIVO',
                    style: AppDesignSystem.bodySm().copyWith(
                      color:
                          (totalIngresos - totalEgresos) >= 0
                              ? AppDesignSystem.success
                              : AppDesignSystem.error,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildKPICard(
    String title,
    String value,
    IconData icon,
    Color color,
    String subtitle,
  ) {
    return ModernCard(
      glassMorphism: true,
      opacity: 0.9,
      borderColor: color.withOpacity(0.3),
      boxShadow: [
        BoxShadow(
          color: color.withOpacity(0.2),
          blurRadius: 12,
          offset: const Offset(0, 4),
        ),
      ],
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: AppDesignSystem.bodyLg().copyWith(
              color: color,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: AppDesignSystem.bodySm().copyWith(
              color: AppDesignSystem.textPrimary,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            subtitle,
            style: AppDesignSystem.bodySm().copyWith(
              color: AppDesignSystem.textSecondary,
              fontSize: 11,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildChartsSection() {
    return ModernCard(
      glassMorphism: true,
      opacity: 0.95,
      borderColor: AppDesignSystem.electricBlue.withOpacity(0.3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppDesignSystem.electricBlue,
                      AppDesignSystem.purpleHaze,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.bar_chart_rounded,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Análisis Visual',
                      style: AppDesignSystem.headingSm().copyWith(
                        color: AppDesignSystem.electricBlue,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'Gráficos y tendencias del período seleccionado',
                      style: AppDesignSystem.bodySm().copyWith(
                        color: AppDesignSystem.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Gráfico de barras de ingresos vs egresos
          SizedBox(height: 200, child: _buildIncomeExpenseChart()),

          const SizedBox(height: 24),

          // Gráfico de líneas de ventas diarias
          if (_ventas.isNotEmpty) ...[
            Text(
              'Tendencia de Ventas',
              style: AppDesignSystem.bodyMd().copyWith(
                fontWeight: FontWeight.w600,
                color: AppDesignSystem.electricBlue,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(height: 180, child: _buildSalesLineChart()),
          ],
        ],
      ),
    );
  }

  Widget _buildIncomeExpenseChart() {
    final totalIngresos = _flujos
        .where((f) => f.tipo == 'ingreso')
        .fold<double>(0, (sum, flujo) => sum + flujo.monto);
    final totalEgresos = _flujos
        .where((f) => f.tipo == 'egreso')
        .fold<double>(0, (sum, flujo) => sum + flujo.monto);

    if (totalIngresos == 0 && totalEgresos == 0) {
      return _buildEmptyChart('No hay datos financieros para mostrar');
    }

    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        maxY:
            [totalIngresos, totalEgresos].reduce((a, b) => a > b ? a : b) * 1.2,
        barTouchData: BarTouchData(
          touchTooltipData: BarTouchTooltipData(
            getTooltipColor:
                (BarChartGroupData group) =>
                    AppDesignSystem.isDark
                        ? AppDesignSystem.darkSecondary
                        : Colors.white,
            tooltipRoundedRadius: 8,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              final value = rod.toY.toStringAsFixed(2);
              final label = group.x == 0 ? 'Ingresos' : 'Egresos';
              return BarTooltipItem(
                '$label\n\$$value',
                AppDesignSystem.bodyMd().copyWith(
                  color: AppDesignSystem.textPrimary,
                  fontWeight: FontWeight.w600,
                ),
              );
            },
          ),
        ),
        titlesData: FlTitlesData(
          show: true,
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (double value, TitleMeta meta) {
                final titles = ['Ingresos', 'Egresos'];
                if (value.toInt() >= 0 && value.toInt() < titles.length) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      titles[value.toInt()],
                      style: AppDesignSystem.bodySm().copyWith(
                        color: AppDesignSystem.textSecondary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                }
                return const Text('');
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 60,
              getTitlesWidget: (double value, TitleMeta meta) {
                return Text(
                  '\$${value.toStringAsFixed(0)}',
                  style: AppDesignSystem.bodySm().copyWith(
                    color: AppDesignSystem.textSecondary,
                    fontSize: 10,
                  ),
                );
              },
            ),
          ),
        ),
        borderData: FlBorderData(show: false),
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          horizontalInterval:
              [totalIngresos, totalEgresos].reduce((a, b) => a > b ? a : b) / 4,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: AppDesignSystem.textSecondary.withOpacity(0.2),
              strokeWidth: 1,
            );
          },
        ),
        barGroups: [
          BarChartGroupData(
            x: 0,
            barRods: [
              BarChartRodData(
                toY: totalIngresos,
                gradient: LinearGradient(
                  colors: [AppDesignSystem.success, AppDesignSystem.neonGreen],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
                width: 60,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(8),
                ),
              ),
            ],
          ),
          BarChartGroupData(
            x: 1,
            barRods: [
              BarChartRodData(
                toY: totalEgresos,
                gradient: LinearGradient(
                  colors: [AppDesignSystem.error, AppDesignSystem.warning],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
                width: 60,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(8),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSalesLineChart() {
    if (_ventas.isEmpty) {
      return _buildEmptyChart('No hay ventas registradas');
    }

    // Agrupar ventas por día
    final ventasPorDia = <DateTime, double>{};
    for (final venta in _ventas) {
      final dia = DateTime(
        venta.fecha.year,
        venta.fecha.month,
        venta.fecha.day,
      );
      ventasPorDia[dia] = (ventasPorDia[dia] ?? 0) + venta.total;
    }

    final spots = <FlSpot>[];
    final fechasOrdenadas = ventasPorDia.keys.toList()..sort();

    for (int i = 0; i < fechasOrdenadas.length; i++) {
      final fecha = fechasOrdenadas[i];
      spots.add(FlSpot(i.toDouble(), ventasPorDia[fecha]!));
    }

    return LineChart(
      LineChartData(
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          horizontalInterval:
              spots.isNotEmpty
                  ? spots.map((e) => e.y).reduce((a, b) => a > b ? a : b) / 4
                  : 100,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: AppDesignSystem.textSecondary.withOpacity(0.2),
              strokeWidth: 1,
            );
          },
        ),
        titlesData: FlTitlesData(
          show: true,
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              interval:
                  fechasOrdenadas.length > 7 ? fechasOrdenadas.length / 7 : 1,
              getTitlesWidget: (double value, TitleMeta meta) {
                if (value.toInt() >= 0 &&
                    value.toInt() < fechasOrdenadas.length) {
                  final fecha = fechasOrdenadas[value.toInt()];
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      '${fecha.day}/${fecha.month}',
                      style: AppDesignSystem.bodySm().copyWith(
                        color: AppDesignSystem.textSecondary,
                        fontSize: 10,
                      ),
                    ),
                  );
                }
                return const Text('');
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 50,
              getTitlesWidget: (double value, TitleMeta meta) {
                return Text(
                  '\$${value.toStringAsFixed(0)}',
                  style: AppDesignSystem.bodySm().copyWith(
                    color: AppDesignSystem.textSecondary,
                    fontSize: 10,
                  ),
                );
              },
            ),
          ),
        ),
        borderData: FlBorderData(show: false),
        minX: 0,
        maxX: (fechasOrdenadas.length - 1).toDouble(),
        minY: 0,
        maxY:
            spots.isNotEmpty
                ? spots.map((e) => e.y).reduce((a, b) => a > b ? a : b) * 1.1
                : 100,
        lineBarsData: [
          LineChartBarData(
            spots: spots,
            isCurved: true,
            gradient: LinearGradient(
              colors: [
                AppDesignSystem.electricBlue,
                AppDesignSystem.purpleHaze,
              ],
            ),
            barWidth: 3,
            isStrokeCapRound: true,
            dotData: FlDotData(
              show: true,
              getDotPainter: (spot, percent, barData, index) {
                return FlDotCirclePainter(
                  radius: 4,
                  color: AppDesignSystem.electricBlue,
                  strokeWidth: 2,
                  strokeColor: Colors.white,
                );
              },
            ),
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                colors: [
                  AppDesignSystem.electricBlue.withOpacity(0.3),
                  AppDesignSystem.purpleHaze.withOpacity(0.1),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ],
        lineTouchData: LineTouchData(
          touchTooltipData: LineTouchTooltipData(
            getTooltipColor:
                (touchedSpot) =>
                    AppDesignSystem.isDark
                        ? AppDesignSystem.darkSecondary
                        : Colors.white,
            tooltipRoundedRadius: 8,
            getTooltipItems: (touchedSpots) {
              return touchedSpots.map((spot) {
                final fecha = fechasOrdenadas[spot.x.toInt()];
                return LineTooltipItem(
                  'Ventas\n${fecha.day}/${fecha.month}/${fecha.year}\n\$${spot.y.toStringAsFixed(2)}',
                  AppDesignSystem.bodySm().copyWith(
                    color: AppDesignSystem.textPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                );
              }).toList();
            },
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyChart(String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.bar_chart_rounded,
            size: 48,
            color: AppDesignSystem.textSecondary.withOpacity(0.5),
          ),
          const SizedBox(height: 16),
          Text(
            message,
            style: AppDesignSystem.bodyMd().copyWith(
              color: AppDesignSystem.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildTopProductsSection() {
    // Calcular productos más vendidos
    final productosVendidos = <String, Map<String, dynamic>>{};

    for (final venta in _ventas) {
      for (final item in venta.detalles) {
        final productoId = item.productoId?.toString() ?? 'N/A';
        final cantidad = item.cantidad;
        final precio = item.precioFinal;

        if (productosVendidos.containsKey(productoId)) {
          productosVendidos[productoId]!['cantidad'] += cantidad;
          productosVendidos[productoId]!['ingresos'] += precio * cantidad;
        } else {
          final producto = _productos.firstWhere(
            (p) => p.id.toString() == productoId,
            orElse: () => Producto()..nombre = 'Producto eliminado',
          );
          productosVendidos[productoId] = {
            'producto': producto,
            'cantidad': cantidad,
            'ingresos': precio * cantidad,
          };
        }
      }
    }

    final topProductos =
        productosVendidos.entries.toList()
          ..sort((a, b) => b.value['cantidad'].compareTo(a.value['cantidad']));

    return ModernCard(
      glassMorphism: true,
      opacity: 0.95,
      borderColor: AppDesignSystem.sunsetOrange.withOpacity(0.3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppDesignSystem.sunsetOrange,
                      AppDesignSystem.warning,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.star_rounded,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Top Productos',
                      style: AppDesignSystem.headingSm().copyWith(
                        color: AppDesignSystem.sunsetOrange,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'Los productos más vendidos del período',
                      style: AppDesignSystem.bodySm().copyWith(
                        color: AppDesignSystem.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          if (topProductos.isEmpty)
            Center(
              child: Column(
                children: [
                  Icon(
                    Icons.inventory_2_outlined,
                    size: 48,
                    color: AppDesignSystem.textSecondary.withOpacity(0.5),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No hay ventas de productos registradas',
                    style: AppDesignSystem.bodyMd().copyWith(
                      color: AppDesignSystem.textSecondary,
                    ),
                  ),
                ],
              ),
            )
          else
            ...topProductos.take(5).map((entry) {
              final data = entry.value;
              final producto = data['producto'] as Producto;
              final cantidad = data['cantidad'] as int;
              final ingresos = data['ingresos'] as double;

              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                child: ModernCard(
                  glassMorphism: true,
                  opacity: 0.9,
                  borderColor: AppDesignSystem.sunsetOrange.withOpacity(0.2),
                  child: Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              AppDesignSystem.sunsetOrange.withOpacity(0.2),
                              AppDesignSystem.warning.withOpacity(0.2),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          Icons.inventory_2_rounded,
                          color: AppDesignSystem.sunsetOrange,
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              producto.nombre ?? 'Producto sin nombre',
                              style: AppDesignSystem.bodyMd().copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              '$cantidad unidades vendidas',
                              style: AppDesignSystem.bodySm().copyWith(
                                color: AppDesignSystem.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              AppDesignSystem.success.withOpacity(0.1),
                              AppDesignSystem.neonGreen.withOpacity(0.1),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: AppDesignSystem.success.withOpacity(0.3),
                          ),
                        ),
                        child: Text(
                          '\$${ingresos.toStringAsFixed(2)}',
                          style: AppDesignSystem.bodyMd().copyWith(
                            color: AppDesignSystem.success,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
        ],
      ),
    );
  }

  Widget _buildFinancialSummarySection() {
    final totalVentas = _ventas.fold<double>(
      0,
      (sum, venta) => sum + venta.total,
    );
    final totalCosto = _ventas.fold<double>(
      0,
      (sum, venta) =>
          sum +
          venta.detalles.fold(
            0.0,
            (subtotal, detalle) =>
                subtotal + (detalle.precioCompra * detalle.cantidad),
          ),
    );
    final utilidadBruta = totalVentas - totalCosto;

    final totalIngresos = _flujos
        .where((f) => f.tipo == 'ingreso')
        .fold<double>(0, (sum, flujo) => sum + flujo.monto);
    final totalEgresos = _flujos
        .where((f) => f.tipo == 'egreso')
        .fold<double>(0, (sum, flujo) => sum + flujo.monto);

    final flujoNeto = totalIngresos - totalEgresos;
    final utilidadNeta = utilidadBruta + flujoNeto;

    return ModernCard(
      glassMorphism: true,
      opacity: 0.95,
      borderColor: AppDesignSystem.purpleHaze.withOpacity(0.3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppDesignSystem.purpleHaze,
                      AppDesignSystem.electricBlue,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.account_balance_rounded,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Resumen Financiero Completo',
                      style: AppDesignSystem.headingSm().copyWith(
                        color: AppDesignSystem.purpleHaze,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'Estado de resultados del período analizado',
                      style: AppDesignSystem.bodySm().copyWith(
                        color: AppDesignSystem.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Resumen detallado
          _buildFinancialRow(
            'Ingresos por Ventas',
            totalVentas,
            AppDesignSystem.success,
          ),
          _buildFinancialRow(
            'Costos de Ventas',
            -totalCosto,
            AppDesignSystem.error,
          ),
          const Divider(color: Colors.grey),
          _buildFinancialRow(
            'Utilidad Bruta',
            utilidadBruta,
            AppDesignSystem.electricBlue,
            isSubtotal: true,
          ),

          const SizedBox(height: 12),

          _buildFinancialRow(
            'Otros Ingresos',
            totalIngresos - totalVentas,
            AppDesignSystem.neonGreen,
          ),
          _buildFinancialRow(
            'Otros Gastos',
            -(totalEgresos),
            AppDesignSystem.warning,
          ),
          const Divider(color: Colors.grey),
          _buildFinancialRow(
            'Flujo Neto Operativo',
            flujoNeto,
            AppDesignSystem.purpleHaze,
            isSubtotal: true,
          ),

          const SizedBox(height: 16),

          // Resultado final
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors:
                    utilidadNeta >= 0
                        ? [
                          AppDesignSystem.success.withOpacity(0.1),
                          AppDesignSystem.neonGreen.withOpacity(0.1),
                        ]
                        : [
                          AppDesignSystem.error.withOpacity(0.1),
                          AppDesignSystem.warning.withOpacity(0.1),
                        ],
              ),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color:
                    utilidadNeta >= 0
                        ? AppDesignSystem.success
                        : AppDesignSystem.error,
                width: 2,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'UTILIDAD NETA TOTAL',
                      style: AppDesignSystem.bodyMd().copyWith(
                        fontWeight: FontWeight.w800,
                        color:
                            utilidadNeta >= 0
                                ? AppDesignSystem.success
                                : AppDesignSystem.error,
                      ),
                    ),
                    Text(
                      _periodoSeleccionado,
                      style: AppDesignSystem.bodySm().copyWith(
                        color: AppDesignSystem.textSecondary,
                      ),
                    ),
                  ],
                ),
                Text(
                  '\$${utilidadNeta.toStringAsFixed(2)}',
                  style: AppDesignSystem.headingLg().copyWith(
                    color:
                        utilidadNeta >= 0
                            ? AppDesignSystem.success
                            : AppDesignSystem.error,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFinancialRow(
    String label,
    double amount,
    Color color, {
    bool isSubtotal = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: AppDesignSystem.bodyMd().copyWith(
              fontWeight: isSubtotal ? FontWeight.w700 : FontWeight.w500,
              color: isSubtotal ? color : AppDesignSystem.textPrimary,
            ),
          ),
          Text(
            amount >= 0
                ? '\$${amount.toStringAsFixed(2)}'
                : '(\$${(-amount).toStringAsFixed(2)})',
            style: AppDesignSystem.bodyMd().copyWith(
              fontWeight: isSubtotal ? FontWeight.w700 : FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  void _changePeriod(String periodo) {
    setState(() {
      _periodoSeleccionado = periodo;
    });
    _configurarPeriodo();
    _loadData();
  }

  IconData _getPeriodIcon(String periodo) {
    switch (periodo) {
      case 'Diario':
        return Icons.today_rounded;
      case 'Semanal':
        return Icons.date_range_rounded;
      case 'Mensual':
        return Icons.calendar_month_rounded;
      case 'Anual':
        return Icons.calendar_today_rounded;
      default:
        return Icons.date_range_rounded;
    }
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }

  void _showCustomPeriodDialog() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            backgroundColor:
                AppDesignSystem.isDark
                    ? AppDesignSystem.darkSecondary
                    : Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            title: Text(
              'Período Personalizado',
              style: AppDesignSystem.headingSm().copyWith(
                color: AppDesignSystem.vibrantPink,
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Próximamente podrás seleccionar fechas personalizadas para el análisis.',
                  style: AppDesignSystem.bodyMd().copyWith(
                    color: AppDesignSystem.textSecondary,
                  ),
                ),
                const SizedBox(height: 16),
                Icon(
                  Icons.construction_rounded,
                  size: 48,
                  color: AppDesignSystem.vibrantPink.withOpacity(0.6),
                ),
              ],
            ),
            actions: [
              FashionButton(
                text: 'Entendido',
                onPressed: () => Navigator.of(context).pop(),
                style: FashionButtonStyle.secondary,
              ),
            ],
          ),
    );
  }
}
