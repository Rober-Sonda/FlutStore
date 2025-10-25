import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:isar/isar.dart';
import '../../models/producto.dart';
import '../../models/categoria.dart';
import '../../models/app_theme.dart';
import '../../models/font_config.dart';
import '../../services/app_config_service.dart';
import '../../services/pedido_compra_service.dart';
import '../../services/isar_service.dart';
import '../../widgets/permission_widget.dart';

class UtilidadReportView extends ConsumerStatefulWidget {
  const UtilidadReportView({super.key});

  @override
  ConsumerState<UtilidadReportView> createState() => _UtilidadReportViewState();
}

class _UtilidadReportViewState extends ConsumerState<UtilidadReportView> {
  List<Producto> _productos = [];
  List<Producto> _productosFiltrados = [];
  double _utilidadPromedio = 0.0;
  List<Producto> _productosBajaUtilidad = [];
  List<Producto> _productosAltaUtilidad = [];
  List<Producto> _productosMediaUtilidad = [];
  AppTheme? _currentTheme;
  FontConfig? _currentFontConfig;
  bool _isLoading = true;

  // Filtros
  String _filtroSeleccionado = 'Todos';
  String _busqueda = '';
  double _utilidadMinima = 0.0;
  double _utilidadMaxima = 100.0;
  String _categoriaSeleccionada = 'Todas';
  List<String> _categorias = ['Todas'];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      setState(() => _isLoading = true);

      final isar = await ref.read(isarServiceProvider).db;
      final productos = await isar.collection<Producto>().where().findAll();

      final pedidoCompraService = PedidoCompraService();

      // Cargar datos de utilidad
      _utilidadPromedio = await pedidoCompraService.obtenerUtilidadPromedio();
      _productosBajaUtilidad =
          await pedidoCompraService.obtenerProductosBajaUtilidad();
      _productosAltaUtilidad =
          await pedidoCompraService.obtenerProductosAltaUtilidad();
      _productosMediaUtilidad =
          await pedidoCompraService.obtenerProductosMediaUtilidad();

      // Cargar categorías
      final categorias = await isar.collection<Categoria>().where().findAll();
      _categorias = ['Todas', ...categorias.map((c) => c.nombre)];

      // Cargar tema
      final configService = ref.read(appConfigServiceProvider);
      final theme = await configService.getSelectedTheme();
      final fontConfig = await configService.getSelectedFontConfig();

      setState(() {
        _productos = productos;
        _productosFiltrados = productos;
        _currentTheme = theme;
        _currentFontConfig = fontConfig;
        _isLoading = false;
      });

      _aplicarFiltros();
    } catch (e) {
      setState(() => _isLoading = false);
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error al cargar datos: $e')));
      }
    }
  }

  void _aplicarFiltros() {
    List<Producto> productosFiltrados = _productos;

    // Filtro por bÃºsqueda
    if (_busqueda.isNotEmpty) {
      productosFiltrados =
          productosFiltrados.where((producto) {
            return producto.nombre?.toLowerCase().contains(
                  _busqueda.toLowerCase(),
                ) ??
                false;
          }).toList();
    }

    // Filtro por categorÃ­a
    if (_categoriaSeleccionada != 'Todas') {
      productosFiltrados =
          productosFiltrados.where((producto) {
            return producto.categoriaId != null;
          }).toList();
    }

    // Filtro por rango de utilidad
    productosFiltrados =
        productosFiltrados.where((producto) {
          final utilidad = producto.utilidad ?? 0.0;
          return utilidad >= _utilidadMinima && utilidad <= _utilidadMaxima;
        }).toList();

    // Filtro por tipo de utilidad
    switch (_filtroSeleccionado) {
      case 'Baja Utilidad':
        productosFiltrados =
            productosFiltrados.where((p) => (p.utilidad ?? 0.0) < 20).toList();
        break;
      case 'Media Utilidad':
        productosFiltrados =
            productosFiltrados.where((p) {
              final utilidad = p.utilidad ?? 0.0;
              return utilidad >= 20 && utilidad <= 50;
            }).toList();
        break;
      case 'Alta Utilidad':
        productosFiltrados =
            productosFiltrados.where((p) => (p.utilidad ?? 0.0) > 50).toList();
        break;
      case 'Sin Utilidad':
        productosFiltrados =
            productosFiltrados
                .where((p) => p.utilidad == null || p.utilidad == 0)
                .toList();
        break;
    }

    setState(() {
      _productosFiltrados = productosFiltrados;
    });
  }

  Future<void> _exportarReporte() async {
    try {
      // TODO: Implementar exportaciÃ³n a PDF/Excel
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Funcionalidad de exportaciÃ³n en desarrollo'),
          backgroundColor: Colors.orange,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error al exportar: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Widget _buildUtilidadCard({
    required String title,
    required double value,
    required Color color,
    required IconData icon,
    String? subtitle,
  }) {
    final theme = _currentTheme ?? AppTheme.darkTheme;
    final fontConfig = _currentFontConfig ?? FontConfig.defaultConfig;

    return Card(
      color: theme.surfaceColor,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(icon, size: 32, color: color),
            const SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                color: theme.textSecondaryColor,
                fontSize: 14,
                fontFamily: fontConfig.bodyFont,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              title.contains('Utilidad')
                  ? '${value.toStringAsFixed(1)}%'
                  : value.toInt().toString(),
              style: TextStyle(
                color: theme.textColor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: fontConfig.titleFont,
              ),
            ),
            if (subtitle != null) ...[
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: TextStyle(
                  color: theme.textSecondaryColor,
                  fontSize: 12,
                  fontFamily: fontConfig.bodyFont,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildProductoCard(Producto producto) {
    final theme = _currentTheme ?? AppTheme.darkTheme;
    final fontConfig = _currentFontConfig ?? FontConfig.defaultConfig;
    final utilidad = producto.utilidad ?? 0.0;
    final color =
        utilidad < 20
            ? Colors.red
            : utilidad > 50
            ? Colors.green
            : Colors.orange;

    return Card(
      color: theme.surfaceColor,
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withValues(alpha: 0.2),
          child: Icon(Icons.inventory, color: color),
        ),
        title: Text(
          producto.nombre ?? 'Producto sin nombre',
          style: TextStyle(
            color: theme.textColor,
            fontFamily: fontConfig.bodyFont,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Precio: \$${producto.precio?.toStringAsFixed(2) ?? 'N/A'}',
              style: TextStyle(
                color: theme.textSecondaryColor,
                fontFamily: fontConfig.bodyFont,
              ),
            ),
            Text(
              'Costo: \$${producto.precioCosto?.toStringAsFixed(2) ?? 'N/A'}',
              style: TextStyle(
                color: theme.textSecondaryColor,
                fontFamily: fontConfig.bodyFont,
              ),
            ),
            if (producto.categoriaId != null)
              Text(
                'CategorÃ­a ID: ${producto.categoriaId}',
                style: TextStyle(
                  color: theme.textSecondaryColor,
                  fontFamily: fontConfig.bodyFont,
                  fontSize: 12,
                ),
              ),
          ],
        ),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: color),
          ),
          child: Text(
            '${utilidad.toStringAsFixed(1)}%',
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontFamily: fontConfig.bodyFont,
            ),
          ),
        ),
        onTap: () {
          context.push('/products/edit/${producto.id}');
        },
      ),
    );
  }

  Widget _buildFiltros() {
    final theme = _currentTheme ?? AppTheme.darkTheme;
    final fontConfig = _currentFontConfig ?? FontConfig.defaultConfig;

    return Card(
      color: theme.surfaceColor,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Filtros',
              style: TextStyle(
                color: theme.textColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: fontConfig.titleFont,
              ),
            ),
            const SizedBox(height: 16),

            // BÃºsqueda
            TextField(
              decoration: InputDecoration(
                labelText: 'Buscar productos',
                prefixIcon: const Icon(Icons.search),
                border: const OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() => _busqueda = value);
                _aplicarFiltros();
              },
            ),
            const SizedBox(height: 16),

            // Filtros en fila
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: _filtroSeleccionado,
                    decoration: const InputDecoration(
                      labelText: 'Tipo de Utilidad',
                      border: OutlineInputBorder(),
                    ),
                    items:
                        [
                          'Todos',
                          'Baja Utilidad',
                          'Media Utilidad',
                          'Alta Utilidad',
                          'Sin Utilidad',
                        ].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                    onChanged: (String? newValue) {
                      setState(() => _filtroSeleccionado = newValue!);
                      _aplicarFiltros();
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: _categoriaSeleccionada,
                    decoration: const InputDecoration(
                      labelText: 'CategorÃ­a',
                      border: OutlineInputBorder(),
                    ),
                    items:
                        _categorias.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                    onChanged: (String? newValue) {
                      setState(() => _categoriaSeleccionada = newValue!);
                      _aplicarFiltros();
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Rango de utilidad
            Text(
              'Rango de Utilidad: ${_utilidadMinima.toInt()}% - ${_utilidadMaxima.toInt()}%',
              style: TextStyle(
                color: theme.textColor,
                fontFamily: fontConfig.bodyFont,
              ),
            ),
            RangeSlider(
              values: RangeValues(_utilidadMinima, _utilidadMaxima),
              min: 0,
              max: 100,
              divisions: 20,
              labels: RangeLabels(
                '${_utilidadMinima.toInt()}%',
                '${_utilidadMaxima.toInt()}%',
              ),
              onChanged: (RangeValues values) {
                setState(() {
                  _utilidadMinima = values.start;
                  _utilidadMaxima = values.end;
                });
                _aplicarFiltros();
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      final theme = _currentTheme ?? AppTheme.darkTheme;
      return Scaffold(
        backgroundColor: theme.backgroundColor,
        body: Center(
          child: CircularProgressIndicator(color: theme.primaryColor),
        ),
      );
    }

    final theme = _currentTheme ?? AppTheme.darkTheme;
    final fontConfig = _currentFontConfig ?? FontConfig.defaultConfig;

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: theme.backgroundColor,
        title: Text(
          'Reporte de Utilidad',
          style: TextStyle(color: theme.textColor),
        ),
        actions: [
          PermissionWidget(
            action: 'read',
            resource: 'reportes',
            child: IconButton(
              icon: Icon(Icons.refresh, color: theme.textColor),
              onPressed: _loadData,
              tooltip: 'Actualizar',
            ),
          ),
          PermissionWidget(
            action: 'export',
            resource: 'reportes',
            child: IconButton(
              icon: Icon(Icons.download, color: theme.textColor),
              onPressed: _exportarReporte,
              tooltip: 'Exportar',
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Filtros
            _buildFiltros(),
            const SizedBox(height: 24),

            // Resumen de utilidad
            Text(
              'Resumen de Utilidad',
              style: TextStyle(
                color: theme.textColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: fontConfig.titleFont,
              ),
            ),
            const SizedBox(height: 16),

            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: [
                _buildUtilidadCard(
                  title: 'Utilidad Promedio',
                  value: _utilidadPromedio,
                  color: Colors.blue,
                  icon: Icons.trending_up,
                  subtitle: 'Promedio general',
                ),
                _buildUtilidadCard(
                  title: 'Productos Analizados',
                  value: _productosFiltrados.length.toDouble(),
                  color: Colors.grey,
                  icon: Icons.inventory,
                  subtitle: 'Con datos de utilidad',
                ),
                _buildUtilidadCard(
                  title: 'Baja Utilidad',
                  value: _productosBajaUtilidad.length.toDouble(),
                  color: Colors.red,
                  icon: Icons.warning,
                  subtitle: '< 20%',
                ),
                _buildUtilidadCard(
                  title: 'Alta Utilidad',
                  value: _productosAltaUtilidad.length.toDouble(),
                  color: Colors.green,
                  icon: Icons.star,
                  subtitle: '> 50%',
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Lista de productos filtrados
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Productos (${_productosFiltrados.length})',
                  style: TextStyle(
                    color: theme.textColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: fontConfig.titleFont,
                  ),
                ),
                Text(
                  'Promedio: ${_productosFiltrados.isNotEmpty ? (_productosFiltrados.map((p) => p.utilidad ?? 0.0).reduce((a, b) => a + b) / _productosFiltrados.length).toStringAsFixed(1) : '0.0'}%',
                  style: TextStyle(
                    color: theme.textSecondaryColor,
                    fontSize: 14,
                    fontFamily: fontConfig.bodyFont,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Lista de productos
            if (_productosFiltrados.isNotEmpty)
              ..._productosFiltrados.map(
                (producto) => _buildProductoCard(producto),
              )
            else
              Center(
                child: Column(
                  children: [
                    Icon(
                      Icons.filter_list,
                      size: 64,
                      color: theme.textSecondaryColor,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'No hay productos que coincidan con los filtros',
                      style: TextStyle(
                        color: theme.textSecondaryColor,
                        fontSize: 16,
                        fontFamily: fontConfig.bodyFont,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Ajusta los filtros para ver mÃ¡s resultados',
                      style: TextStyle(
                        color: theme.textSecondaryColor,
                        fontSize: 14,
                        fontFamily: fontConfig.bodyFont,
                      ),
                      textAlign: TextAlign.center,
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
