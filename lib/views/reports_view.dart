import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:tienda_app/models/pedido.dart';
import 'package:tienda_app/models/compra.dart';
import 'package:tienda_app/models/producto.dart';
import 'package:tienda_app/models/cliente.dart';
import 'package:tienda_app/models/categoria.dart';
import 'package:tienda_app/services/isar_service.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'dart:math';

class ReportsView extends ConsumerStatefulWidget {
  const ReportsView({super.key});

  @override
  ConsumerState<ReportsView> createState() => _ReportsViewState();
}

class _ReportsViewState extends ConsumerState<ReportsView> {
  String selectedPeriod = 'Mensual';
  DateTime? startDate;
  DateTime? endDate;
  Map<String, dynamic> stats = {};
  List<Map<String, dynamic>> salesData = [];
  List<Map<String, dynamic>> topProductsData = [];
  List<Map<String, dynamic>> categoriesData = [];

  final List<String> periods = [
    'Diario',
    'Semanal',
    'Mensual',
    'Anual',
    'Personalizado',
  ];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final isarService = ref.read(isarServiceProvider);
    final isar = await isarService.db;

    await _calculateStats(isar);
    await _generateChartData(isar);
  }

  Future<void> _calculateStats(Isar isar) async {
    final now = DateTime.now();
    DateTime startDate;
    DateTime endDate;

    switch (selectedPeriod) {
      case 'Diario':
        startDate = DateTime(now.year, now.month, now.day);
        endDate = DateTime(now.year, now.month, now.day, 23, 59, 59);
        break;
      case 'Semanal':
        final weekStart = now.subtract(Duration(days: now.weekday - 1));
        startDate = DateTime(weekStart.year, weekStart.month, weekStart.day);
        endDate = startDate.add(const Duration(days: 6));
        break;
      case 'Mensual':
        startDate = DateTime(now.year, now.month, 1);
        endDate = DateTime(now.year, now.month + 1, 0);
        break;
      case 'Anual':
        startDate = DateTime(now.year, 1, 1);
        endDate = DateTime(now.year, 12, 31);
        break;
      case 'Personalizado':
        if (this.startDate != null && this.endDate != null) {
          startDate = this.startDate!;
          endDate = this.endDate!;
        } else {
          startDate = DateTime(now.year, now.month, 1);
          endDate = DateTime(now.year, now.month + 1, 0);
        }
        break;
      default:
        startDate = DateTime(now.year, now.month, 1);
        endDate = DateTime(now.year, now.month + 1, 0);
    }

    final pedidos =
        await isar.pedidos.filter().fechaBetween(startDate, endDate).findAll();

    final compras =
        await isar.compras.filter().fechaBetween(startDate, endDate).findAll();

    final productos = await isar.productos.where().findAll();
    final clientes = await isar.clientes.where().findAll();

    double totalVentas = pedidos.fold(0, (sum, p) => sum + (p.total ?? 0));
    double totalCompras = compras.fold(0, (sum, c) => sum + (c.total ?? 0));
    int totalPedidos = pedidos.length;
    int totalComprasCount = compras.length;
    int productosActivos = productos.where((p) => (p.stock ?? 0) > 0).length;
    int clientesActivos = clientes.length;

    setState(() {
      stats = {
        'totalVentas': totalVentas,
        'totalCompras': totalCompras,
        'ganancia': totalVentas - totalCompras,
        'totalPedidos': totalPedidos,
        'totalComprasCount': totalComprasCount,
        'productosActivos': productosActivos,
        'clientesActivos': clientesActivos,
        'promedioVenta': totalPedidos > 0 ? totalVentas / totalPedidos : 0,
      };
    });
  }

  Future<void> _generateChartData(Isar isar) async {
    final now = DateTime.now();
    DateTime startDate;
    DateTime endDate;

    switch (selectedPeriod) {
      case 'Diario':
        startDate = DateTime(now.year, now.month, now.day);
        endDate = DateTime(now.year, now.month, now.day, 23, 59, 59);
        break;
      case 'Semanal':
        final weekStart = now.subtract(Duration(days: now.weekday - 1));
        startDate = DateTime(weekStart.year, weekStart.month, weekStart.day);
        endDate = startDate.add(const Duration(days: 6));
        break;
      case 'Mensual':
        startDate = DateTime(now.year, now.month, 1);
        endDate = DateTime(now.year, now.month + 1, 0);
        break;
      case 'Anual':
        startDate = DateTime(now.year, 1, 1);
        endDate = DateTime(now.year, 12, 31);
        break;
      case 'Personalizado':
        if (this.startDate != null && this.endDate != null) {
          startDate = this.startDate!;
          endDate = this.endDate!;
        } else {
          startDate = DateTime(now.year, now.month, 1);
          endDate = DateTime(now.year, now.month + 1, 0);
        }
        break;
      default:
        startDate = DateTime(now.year, now.month, 1);
        endDate = DateTime(now.year, now.month + 1, 0);
    }

    final pedidos =
        await isar.pedidos.filter().fechaBetween(startDate, endDate).findAll();

    final productos = await isar.productos.where().findAll();
    final categorias = await isar.categorias.where().findAll();

    // Datos de ventas por período
    Map<String, double> ventasPorPeriodo = {};
    for (final pedido in pedidos) {
      if (pedido.fecha != null) {
        String periodo;
        switch (selectedPeriod) {
          case 'Diario':
            periodo = DateFormat('HH:mm').format(pedido.fecha!);
            break;
          case 'Semanal':
            periodo = DateFormat('E', 'es').format(pedido.fecha!);
            break;
          case 'Mensual':
            periodo = '${pedido.fecha!.day}';
            break;
          case 'Anual':
            periodo = DateFormat('MMM', 'es').format(pedido.fecha!);
            break;
          default:
            periodo = DateFormat('dd/MM').format(pedido.fecha!);
        }
        ventasPorPeriodo[periodo] =
            (ventasPorPeriodo[periodo] ?? 0) + (pedido.total ?? 0);
      }
    }

    // Productos más vendidos (simulado)
    final productosMasVendidos =
        productos
            .take(5)
            .map(
              (p) => {
                'nombre': p.nombre,
                'ventas': (p.stock ?? 0) * Random().nextDouble() * 10,
              },
            )
            .toList();

    // Ventas por categoría
    Map<String, double> ventasPorCategoria = {};
    for (final categoria in categorias) {
      ventasPorCategoria[categoria.nombre] = Random().nextDouble() * 1000;
    }

    setState(() {
      salesData =
          ventasPorPeriodo.entries
              .map((e) => {'periodo': e.key, 'ventas': e.value})
              .toList();

      topProductsData = productosMasVendidos;

      categoriesData =
          ventasPorCategoria.entries
              .map((e) => {'categoria': e.key, 'ventas': e.value})
              .toList();
    });
  }

  void _onPeriodChanged(String? newPeriod) {
    if (newPeriod != null) {
      setState(() {
        selectedPeriod = newPeriod;
      });
      _loadData();
    }
  }

  Future<void> _showDateRangePicker() async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
      initialDateRange:
          startDate != null && endDate != null
              ? DateTimeRange(start: startDate!, end: endDate!)
              : null,
    );

    if (picked != null) {
      setState(() {
        startDate = picked.start;
        endDate = picked.end;
        selectedPeriod = 'Personalizado';
      });
      _loadData();
    }
  }

  Future<void> _exportToPDF() async {
    // TODO: Implementar exportación a PDF
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Función de exportación a PDF en desarrollo'),
      ),
    );
  }

  Widget _buildStatCard(
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(icon, size: 32, color: color),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: color,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSalesChart() {
    if (salesData.isEmpty) {
      return const Card(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Center(child: Text('No hay datos de ventas disponibles')),
        ),
      );
    }

    final maxVentas = salesData
        .map((d) => d['ventas'] as double)
        .reduce((a, b) => a > b ? a : b);
    final maxHeight = 150.0;

    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Ventas por Período',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                ElevatedButton.icon(
                  onPressed: _exportToPDF,
                  icon: const Icon(Icons.picture_as_pdf),
                  label: const Text('Exportar'),
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
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                height: height,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '${data['periodo']}',
                              style: const TextStyle(fontSize: 10),
                              textAlign: TextAlign.center,
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

  Widget _buildTopProductsChart() {
    if (topProductsData.isEmpty) {
      return const Card(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Center(child: Text('No hay datos de productos disponibles')),
        ),
      );
    }

    final maxVentas = topProductsData
        .map((d) => d['ventas'] as double)
        .reduce((a, b) => a > b ? a : b);
    final maxWidth = 200.0;

    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Productos Más Vendidos',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ...topProductsData.map((data) {
              final width =
                  maxVentas > 0
                      ? (data['ventas'] as double) / maxVentas * maxWidth
                      : 0.0;

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${data['nombre']}',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Container(
                          height: 20,
                          width: width,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '\$${(data['ventas'] as double).toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
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

  Widget _buildCategoriesChart() {
    if (categoriesData.isEmpty) {
      return const Card(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Center(child: Text('No hay datos de categorías disponibles')),
        ),
      );
    }

    final totalVentas = categoriesData.fold<double>(
      0,
      (sum, data) => sum + (data['ventas'] as double),
    );
    final colors = [
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.teal,
    ];

    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Ventas por Categoría',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ...categoriesData.asMap().entries.map((entry) {
              final index = entry.key;
              final data = entry.value;
              final porcentaje =
                  totalVentas > 0
                      ? (data['ventas'] as double) / totalVentas * 100
                      : 0.0;

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  children: [
                    Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        color: colors[index % colors.length],
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        '${data['categoria']}',
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                    Text(
                      '\$${(data['ventas'] as double).toStringAsFixed(2)} (${porcentaje.toStringAsFixed(1)}%)',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
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

  Color _getRandomColor() {
    final colors = [
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.teal,
    ];
    return colors[Random().nextInt(colors.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reportes'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Filtros
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Filtros',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            value: selectedPeriod,
                            decoration: const InputDecoration(
                              labelText: 'Período',
                              border: OutlineInputBorder(),
                            ),
                            items:
                                periods.map((period) {
                                  return DropdownMenuItem(
                                    value: period,
                                    child: Text(period),
                                  );
                                }).toList(),
                            onChanged: _onPeriodChanged,
                          ),
                        ),
                        const SizedBox(width: 16),
                        if (selectedPeriod == 'Personalizado')
                          ElevatedButton(
                            onPressed: _showDateRangePicker,
                            child: const Text('Seleccionar Fechas'),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Estadísticas
            const Text(
              'Estadísticas',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1.2,
              children: [
                _buildStatCard(
                  'Ventas Totales',
                  '\$${stats['totalVentas']?.toStringAsFixed(2) ?? '0.00'}',
                  Icons.attach_money,
                  Colors.green,
                ),
                _buildStatCard(
                  'Ganancia',
                  '\$${stats['ganancia']?.toStringAsFixed(2) ?? '0.00'}',
                  Icons.trending_up,
                  Colors.blue,
                ),
                _buildStatCard(
                  'Pedidos',
                  '${stats['totalPedidos'] ?? 0}',
                  Icons.shopping_bag,
                  Colors.orange,
                ),
                _buildStatCard(
                  'Promedio Venta',
                  '\$${stats['promedioVenta']?.toStringAsFixed(2) ?? '0.00'}',
                  Icons.analytics,
                  Colors.purple,
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Gráficos
            const Text(
              'Gráficos',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSalesChart(),
            const SizedBox(height: 16),
            _buildTopProductsChart(),
            const SizedBox(height: 16),
            _buildCategoriesChart(),
          ],
        ),
      ),
    );
  }
}
