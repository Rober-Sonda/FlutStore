import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/app_theme.dart';
import '../../models/font_config.dart';
import '../../services/app_config_service.dart';
import '../../services/optimization_service.dart';
import '../../widgets/permission_widget.dart';

class OptimizationView extends ConsumerStatefulWidget {
  const OptimizationView({super.key});

  @override
  ConsumerState<OptimizationView> createState() => _OptimizationViewState();
}

class _OptimizationViewState extends ConsumerState<OptimizationView> {
  final OptimizationService _optimizationService = OptimizationService();
  Map<String, dynamic> _stats = {};
  bool _isLoading = false;
  bool _autoOptimizationEnabled = false;
  AppTheme? _currentTheme;
  FontConfig? _currentFontConfig;

  @override
  void initState() {
    super.initState();
    _loadData();
    _checkAutoOptimizationStatus();
  }

  Future<void> _loadData() async {
    try {
      setState(() => _isLoading = true);

      // Cargar estadísticas
      _stats = await _optimizationService.getPerformanceStats();

      // Cargar tema
      final configService = ref.read(appConfigServiceProvider);
      final theme = await configService.getSelectedTheme();
      final fontConfig = await configService.getSelectedFontConfig();

      setState(() {
        _currentTheme = theme;
        _currentFontConfig = fontConfig;
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error al cargar datos: $e')));
      }
    }
  }

  void _checkAutoOptimizationStatus() {
    // Verificar si las optimizaciones automáticas están activas
    // Por ahora, asumimos que están inactivas por defecto
    setState(() {
      _autoOptimizationEnabled = false;
    });
  }

  Future<void> _runOptimization() async {
    try {
      setState(() => _isLoading = true);

      await _optimizationService.optimizeAppPerformance();
      await _loadData(); // Recargar estadísticas

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Optimización completada exitosamente'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error durante la optimización: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _toggleAutoOptimization(bool enabled) {
    if (enabled) {
      OptimizationService.startAutoOptimization();
    } else {
      OptimizationService.stopAutoOptimization();
    }
    setState(() => _autoOptimizationEnabled = enabled);
  }

  void _clearCache() {
    OptimizationService.clearCache();
    _loadData(); // Recargar estadísticas
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Cache limpiado exitosamente'),
        backgroundColor: Colors.blue,
      ),
    );
  }

  Widget _buildStatCard({
    required String title,
    required dynamic value,
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
              value.toString(),
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

  Widget _buildActionCard({
    required String title,
    required String description,
    required VoidCallback onPressed,
    required IconData icon,
    Color? color,
  }) {
    final theme = _currentTheme ?? AppTheme.darkTheme;
    final fontConfig = _currentFontConfig ?? FontConfig.defaultConfig;

    return Card(
      color: theme.surfaceColor,
      child: ListTile(
        leading: Icon(icon, color: color ?? theme.primaryColor),
        title: Text(
          title,
          style: TextStyle(
            color: theme.textColor,
            fontFamily: fontConfig.bodyFont,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          description,
          style: TextStyle(
            color: theme.textSecondaryColor,
            fontFamily: fontConfig.bodyFont,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: theme.textSecondaryColor,
          size: 16,
        ),
        onTap: onPressed,
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
          'Optimización del Sistema',
          style: TextStyle(color: theme.textColor),
        ),
        actions: [
          PermissionWidget(
            action: 'read',
            resource: 'configuracion',
            child: IconButton(
              icon: Icon(Icons.refresh, color: theme.textColor),
              onPressed: _loadData,
              tooltip: 'Actualizar',
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Estadísticas de rendimiento
            Text(
              'Estadísticas de Rendimiento',
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
                _buildStatCard(
                  title: 'Entradas en Cache',
                  value: _stats['cache_entries'] ?? 0,
                  color: Colors.blue,
                  icon: Icons.storage,
                  subtitle: 'Datos en memoria',
                ),
                _buildStatCard(
                  title: 'Tamaño del Cache',
                  value:
                      '${(_stats['cache_size_mb'] ?? 0.0).toStringAsFixed(2)} MB',
                  color: Colors.green,
                  icon: Icons.memory,
                  subtitle: 'Uso de memoria',
                ),
                _buildStatCard(
                  title: 'Optimización',
                  value:
                      _stats['optimization_enabled'] == true
                          ? 'Activa'
                          : 'Inactiva',
                  color: Colors.orange,
                  icon: Icons.speed,
                  subtitle: 'Estado del sistema',
                ),
                _buildStatCard(
                  title: 'Auto-Optimización',
                  value: _autoOptimizationEnabled ? 'Activa' : 'Inactiva',
                  color: _autoOptimizationEnabled ? Colors.green : Colors.red,
                  icon: Icons.auto_fix_high,
                  subtitle: 'Optimización automática',
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Acciones de optimización
            Text(
              'Acciones de Optimización',
              style: TextStyle(
                color: theme.textColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: fontConfig.titleFont,
              ),
            ),
            const SizedBox(height: 16),

            _buildActionCard(
              title: 'Ejecutar Optimización Completa',
              description: 'Optimiza base de datos, memoria y cache',
              icon: Icons.rocket_launch,
              color: Colors.green,
              onPressed: _runOptimization,
            ),

            const SizedBox(height: 12),

            _buildActionCard(
              title: 'Limpiar Cache',
              description: 'Elimina todos los datos en cache',
              icon: Icons.cleaning_services,
              color: Colors.orange,
              onPressed: _clearCache,
            ),

            const SizedBox(height: 12),

            // Switch para optimización automática
            Card(
              color: theme.surfaceColor,
              child: SwitchListTile(
                title: Text(
                  'Optimización Automática',
                  style: TextStyle(
                    color: theme.textColor,
                    fontFamily: fontConfig.bodyFont,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  'Ejecutar optimizaciones cada 30 minutos',
                  style: TextStyle(
                    color: theme.textSecondaryColor,
                    fontFamily: fontConfig.bodyFont,
                  ),
                ),
                value: _autoOptimizationEnabled,
                onChanged: _toggleAutoOptimization,
                activeColor: theme.primaryColor,
              ),
            ),

            const SizedBox(height: 24),

            // Información adicional
            Card(
              color: theme.surfaceColor,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Información del Sistema',
                      style: TextStyle(
                        color: theme.textColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: fontConfig.titleFont,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      '• El sistema de optimización mejora el rendimiento de la aplicación\n'
                      '• El cache almacena datos frecuentemente accedidos\n'
                      '• La optimización automática se ejecuta cada 30 minutos\n'
                      '• Los datos antiguos se limpian automáticamente',
                      style: TextStyle(
                        color: theme.textSecondaryColor,
                        fontFamily: fontConfig.bodyFont,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
