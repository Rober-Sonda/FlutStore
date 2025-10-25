import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import 'package:tienda_app/services/isar_service.dart';
import 'package:tienda_app/models/pedido.dart';
import 'package:tienda_app/models/compra.dart';
import 'package:tienda_app/models/producto.dart';
import 'package:tienda_app/models/cliente.dart';
import 'package:tienda_app/models/categoria.dart';

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
    DateTime start;
    DateTime end;

    switch (selectedPeriod) {
      case 'Diario':
        start = DateTime(now.year, now.month, now.day);
        end = DateTime(now.year, now.month, now.day, 23, 59, 59);
        break;
      case 'Semanal':
        final weekStart = now.subtract(Duration(days: now.weekday - 1));
        start = DateTime(weekStart.year, weekStart.month, weekStart.day);
        end = start.add(const Duration(days: 6));
        break;
      case 'Mensual':
        start = DateTime(now.year, now.month, 1);
        end = DateTime(now.year, now.month + 1, 0);
        break;
      case 'Anual':
        start = DateTime(now.year, 1, 1);
        end = DateTime(now.year, 12, 31);
        break;
      case 'Personalizado':
        if (startDate != null && endDate != null) {
          start = startDate!;
          end = endDate!;
        } else {
          start = DateTime(now.year, now.month, 1);
          end = DateTime(now.year, now.month + 1, 0);
        }
        break;
      default:
        start = DateTime(now.year, now.month, 1);
        end = DateTime(now.year, now.month + 1, 0);
    }

    final pedidos =
        await isar
            .collection<Pedido>()
            .where()
            .filter()
            .fechaBetween(start, end)
            .findAll();
    final compras =
        await isar
            .collection<Compra>()
            .where()
            .filter()
            .fechaBetween(start, end)
            .findAll();
    final productos = await isar.collection<Producto>().where().findAll();
    final clientes = await isar.collection<Cliente>().where().findAll();

    double totalVentas = pedidos.fold(0, (sum, p) => sum + (p.total ?? 0));
    double totalCompras = compras.fold(0, (sum, c) => sum + (c.total ?? 0));
    double ganancia = totalVentas - totalCompras;

    setState(() {
      stats = {
        'totalVentas': totalVentas,
        'totalCompras': totalCompras,
        'ganancia': ganancia,
        'numPedidos': pedidos.length,
        'numCompras': compras.length,
        'numProductos': productos.length,
        'numClientes': clientes.length,
        'promedioVenta': pedidos.isNotEmpty ? totalVentas / pedidos.length : 0,
        'tasaConversion':
            clientes.isNotEmpty ? (pedidos.length / clientes.length) * 100 : 0,
      };
    });
  }

  Future<void> _generateChartData(Isar isar) async {
    final now = DateTime.now();
    DateTime start;
    DateTime end;

    switch (selectedPeriod) {
      case 'Diario':
        start = DateTime(now.year, now.month, now.day);
        end = DateTime(now.year, now.month, now.day, 23, 59, 59);
        break;
      case 'Semanal':
        final weekStart = now.subtract(Duration(days: now.weekday - 1));
        start = DateTime(weekStart.year, weekStart.month, weekStart.day);
        end = start.add(const Duration(days: 6));
        break;
      case 'Mensual':
        start = DateTime(now.year, now.month, 1);
        end = DateTime(now.year, now.month + 1, 0);
        break;
      case 'Anual':
        start = DateTime(now.year, 1, 1);
        end = DateTime(now.year, 12, 31);
        break;
      case 'Personalizado':
        if (startDate != null && endDate != null) {
          start = startDate!;
          end = endDate!;
        } else {
          start = DateTime(now.year, now.month, 1);
          end = DateTime(now.year, now.month + 1, 0);
        }
        break;
      default:
        start = DateTime(now.year, now.month, 1);
        end = DateTime(now.year, now.month + 1, 0);
    }

    final pedidos =
        await isar
            .collection<Pedido>()
            .where()
            .filter()
            .fechaBetween(start, end)
            .findAll();
    final productos = await isar.collection<Producto>().where().findAll();
    final categorias = await isar.collection<Categoria>().where().findAll();

    // Ventas por dÃ­a
    Map<int, double> ventasPorDia = {};
    for (int i = 1; i <= end.day; i++) {
      ventasPorDia[i] = 0;
    }
    for (final pedido in pedidos) {
      if (pedido.fecha != null) {
        final dia = pedido.fecha!.day;
        ventasPorDia[dia] = (ventasPorDia[dia] ?? 0) + (pedido.total ?? 0);
      }
    }

    // Productos mÃ¡s vendidos
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

    // CategorÃ­as mÃ¡s populares
    Map<String, int> ventasPorCategoria = {};
    for (final pedido in pedidos) {
      for (final productoId in pedido.productos) {
        final producto = productos.firstWhere(
          (p) => p.id == productoId,
          orElse: () => Producto(),
        );
        if (producto.categoriaId != null) {
          final categoria = categorias.firstWhere(
            (c) => c.id == producto.categoriaId,
            orElse: () => Categoria()..nombre = 'Sin categorÃ­a',
          );
          ventasPorCategoria[categoria.nombre] =
              (ventasPorCategoria[categoria.nombre] ?? 0) + 1;
        }
      }
    }

    setState(() {
      salesData =
          ventasPorDia.entries
              .map((e) => {'dia': e.key, 'ventas': e.value})
              .toList();

      topProductsData =
          sortedProducts.take(5).map((entry) {
            final producto = productos.firstWhere(
              (p) => p.id == entry.key,
              orElse: () => Producto()..nombre = 'Producto no encontrado',
            );
            return {
              'nombre': producto.nombre,
              'ventas': entry.value,
              'color': Colors.primaries[entry.key % Colors.primaries.length],
            };
          }).toList();

      categoriesData =
          ventasPorCategoria.entries.map((e) {
            return {
              'categoria': e.key,
              'ventas': e.value,
              'color':
                  Colors.primaries[e.key.hashCode % Colors.primaries.length],
            };
          }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final accentColor = theme.colorScheme.secondary;
    final backgroundColor = theme.scaffoldBackgroundColor;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text('Reportes'),
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // DescripciÃ³n de la secciÃ³n de reportes
              Card(
                color: Colors.blueGrey[900],
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    'Consulta y analiza los reportes de tu negocio. AquÃ­ puedes ver el resumen de ventas, compras, utilidad, inventario y otros indicadores clave. Usa los filtros y exporta los datos para tomar mejores decisiones.',
                    style: const TextStyle(color: Colors.white70, fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Filtros
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'PerÃ­odo de AnÃ¡lisis',
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
                                labelText: 'PerÃ­odo',
                                border: OutlineInputBorder(),
                              ),
                              items:
                                  periods.map((period) {
                                    return DropdownMenuItem(
                                      value: period,
                                      child: Text(period),
                                    );
                                  }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  selectedPeriod = value!;
                                });
                                _loadData();
                              },
                            ),
                          ),
                          const SizedBox(width: 16),
                          if (selectedPeriod == 'Personalizado') ...[
                            Expanded(
                              child: TextButton.icon(
                                onPressed: () async {
                                  final date = await showDatePicker(
                                    context: context,
                                    initialDate: startDate ?? DateTime.now(),
                                    firstDate: DateTime(2020),
                                    lastDate: DateTime.now(),
                                  );
                                  if (date != null) {
                                    setState(() {
                                      startDate = date;
                                    });
                                    _loadData();
                                  }
                                },
                                icon: const Icon(Icons.calendar_today),
                                label: Text(
                                  startDate != null
                                      ? DateFormat(
                                        'dd/MM/yyyy',
                                      ).format(startDate!)
                                      : 'Fecha inicio',
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: TextButton.icon(
                                onPressed: () async {
                                  final date = await showDatePicker(
                                    context: context,
                                    initialDate: endDate ?? DateTime.now(),
                                    firstDate: DateTime(2020),
                                    lastDate: DateTime.now(),
                                  );
                                  if (date != null) {
                                    setState(() {
                                      endDate = date;
                                    });
                                    _loadData();
                                  }
                                },
                                icon: const Icon(Icons.calendar_today),
                                label: Text(
                                  endDate != null
                                      ? DateFormat(
                                        'dd/MM/yyyy',
                                      ).format(endDate!)
                                      : 'Fecha fin',
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // EstadÃ­sticas principales
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.5,
                children: [
                  _buildStatCard(
                    'Total Ventas',
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
                    '${stats['numPedidos'] ?? 0}',
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
              const SizedBox(height: 16),
              // GrÃ¡ficos
              _buildSalesChart(),
              const SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: _buildTopProductsChart()),
                  const SizedBox(width: 16),
                  Expanded(child: _buildCategoriesChart()),
                ],
              ),
            ],
          ),
        ),
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
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(icon, color: color, size: 32),
            const SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
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

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Ventas por DÃ­a',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY:
                      salesData
                          .map((d) => d['ventas'] as double)
                          .fold<double>(0, (a, b) => a > b ? a : b) *
                      1.2,
                  barTouchData: BarTouchData(enabled: false),
                  titlesData: FlTitlesData(
                    show: true,
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          return Text(
                            '${value.toInt()}',
                            style: const TextStyle(fontSize: 10),
                          );
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                        getTitlesWidget: (value, meta) {
                          return Text(
                            '\$${value.toInt()}',
                            style: const TextStyle(fontSize: 10),
                          );
                        },
                      ),
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  barGroups:
                      salesData.map((data) {
                        return BarChartGroupData(
                          x: data['dia'],
                          barRods: [
                            BarChartRodData(
                              toY: data['ventas'],
                              color: Colors.blue,
                              width: 20,
                            ),
                          ],
                        );
                      }).toList(),
                ),
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

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Productos MÃ¡s Vendidos',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ...topProductsData.asMap().entries.map((entry) {
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
                        color: product['color'],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          '${index + 1}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        product['nombre'],
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: product['color'].withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        '${product['ventas']} ventas',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: product['color'],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
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
          child: Center(child: Text('No hay datos de categorÃ­as disponibles')),
        ),
      );
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Ventas por CategorÃ­a',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: PieChart(
                PieChartData(
                  sections:
                      categoriesData.map((data) {
                        final total = categoriesData.fold(
                          0,
                          (sum, d) => sum + (d['ventas'] as int),
                        );
                        final percentage = (data['ventas'] as int) / total;
                        return PieChartSectionData(
                          color: data['color'],
                          value: data['ventas'].toDouble(),
                          title: '${(percentage * 100).toStringAsFixed(1)}%',
                          radius: 60,
                          titleStyle: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        );
                      }).toList(),
                  centerSpaceRadius: 40,
                  sectionsSpace: 2,
                ),
              ),
            ),
            const SizedBox(height: 16),
            ...categoriesData.map((data) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Row(
                  children: [
                    Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: data['color'],
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        data['categoria'],
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                    Text(
                      '${data['ventas']} ventas',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
