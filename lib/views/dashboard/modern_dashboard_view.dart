import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../widgets/app_design_system.dart';
import '../../widgets/app_widgets.dart';
import '../../services/isar_service.dart';
import '../../services/dashboard_data_service.dart';

class ModernDashboardView extends ConsumerStatefulWidget {
  const ModernDashboardView({super.key});

  @override
  ConsumerState<ModernDashboardView> createState() =>
      _ModernDashboardViewState();
}

class _ModernDashboardViewState extends ConsumerState<ModernDashboardView> {
  bool _isLoading = true;
  String? _error;

  // Datos del dashboard
  Map<String, dynamic> _stats = {};
  List<Map<String, dynamic>> _stockAlerts = [];
  List<Map<String, dynamic>> _recentOrders = [];

  @override
  void initState() {
    super.initState();
    _loadThemeAndData();
  }

  Future<void> _loadThemeAndData() async {
    try {
      setState(() => _isLoading = true);
      await _loadDashboardData();
    } catch (e) {
      setState(() {
        _error = 'Error al cargar el dashboard: $e';
        _isLoading = false;
      });
    }
  }

  Future<void> _loadDashboardData() async {
    try {
      final isarService = ref.read(isarServiceProvider);
      final isar = await isarService.db;

      final stats = await DashboardDataService.calculateStats(isar);
      final stockAlerts = await DashboardDataService.loadStockAlerts(isar);
      final recentOrders = await DashboardDataService.loadRecentOrders(isar);

      setState(() {
        _stats = stats;
        _stockAlerts = stockAlerts;
        _recentOrders = recentOrders;
        _isLoading = false;
        _error = null;
      });
    } catch (e) {
      setState(() {
        _error = 'Error al cargar los datos: $e';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        backgroundColor: AppDesignSystem.background,
        body: AppWidgets.loadingState(message: 'Cargando dashboard...'),
      );
    }

    if (_error != null) {
      return Scaffold(
        backgroundColor: AppDesignSystem.background,
        body: AppWidgets.errorState(
          title: 'Error en el Dashboard',
          message: _error!,
          actionText: 'Reintentar',
          onActionPressed: _loadThemeAndData,
        ),
      );
    }

    return Scaffold(
      backgroundColor: AppDesignSystem.background,
      body: RefreshIndicator(
        onRefresh: _loadDashboardData,
        backgroundColor: AppDesignSystem.surface,
        color: AppDesignSystem.primaryBlue,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(
              MediaQuery.of(context).size.width < 768
                  ? AppDesignSystem.spaceMd
                  : AppDesignSystem.spaceLg,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header del Dashboard
                _buildDashboardHeader(),

                const SizedBox(height: AppDesignSystem.spaceLg),

                // KPIs Principales
                _buildKpiSection(),

                const SizedBox(height: AppDesignSystem.spaceLg),

                // Sección de Alertas y Acciones Rápidas
                if (MediaQuery.of(context).size.width > 1024) ...[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(flex: 2, child: _buildAlertsSection()),
                      const SizedBox(width: AppDesignSystem.spaceLg),
                      Expanded(flex: 1, child: _buildQuickActions()),
                    ],
                  ),
                ] else ...[
                  _buildAlertsSection(),
                  const SizedBox(height: AppDesignSystem.spaceLg),
                  _buildQuickActions(),
                ],

                const SizedBox(height: AppDesignSystem.spaceLg),

                // Sección de Actividad Reciente
                _buildRecentActivitySection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDashboardHeader() {
    final now = DateTime.now();
    final greeting = _getGreeting(now.hour);

    return AppWidgets.primaryCard(
      gradient: AppDesignSystem.primaryGradient,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  greeting,
                  style: AppDesignSystem.headingLg().copyWith(
                    color: AppDesignSystem.textPrimary,
                  ),
                ),
                const SizedBox(height: AppDesignSystem.spaceXs),
                Text(
                  'Resumen de tu negocio hoy',
                  style: AppDesignSystem.bodyMd().copyWith(
                    color: AppDesignSystem.textSecondary,
                  ),
                ),
                const SizedBox(height: AppDesignSystem.spaceSm),
                AppWidgets.statusChip(
                  label: 'En línea • ${_formatDate(now)}',
                  color: AppDesignSystem.success,
                  icon: Icons.circle,
                ),
              ],
            ),
          ),
          if (MediaQuery.of(context).size.width >= 768) ...[
            Container(
              padding: const EdgeInsets.all(AppDesignSystem.spaceLg),
              decoration: BoxDecoration(
                color: AppDesignSystem.textPrimary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(AppDesignSystem.radiusLg),
              ),
              child: Icon(
                Icons.dashboard_rounded,
                size: 48,
                color: AppDesignSystem.textPrimary,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildKpiSection() {
    final kpis = [
      {
        'title': 'Ventas Hoy',
        'value': '\$${_stats['totalVentas']?.toStringAsFixed(0) ?? '0'}',
        'icon': Icons.trending_up,
        'color': AppDesignSystem.success,
        'trend': '+12.5%',
        'isPositive': true,
      },
      {
        'title': 'Productos',
        'value': '${_stats['totalProductos'] ?? 0}',
        'icon': Icons.inventory_2,
        'color': AppDesignSystem.primaryBlue,
        'trend': '+3',
        'isPositive': true,
      },
      {
        'title': 'Clientes',
        'value': '${_stats['totalClientes'] ?? 0}',
        'icon': Icons.people,
        'color': AppDesignSystem.info,
        'trend': '+8',
        'isPositive': true,
      },
      {
        'title': 'Bajo Stock',
        'value': '${_stats['productosBajoStock'] ?? 0}',
        'icon': Icons.warning,
        'color': AppDesignSystem.warning,
        'trend': '-2',
        'isPositive': true,
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppWidgets.sectionHeader(
          title: 'Métricas Principales',
          subtitle: 'Indicadores clave de tu negocio',
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:
                MediaQuery.of(context).size.width < 768
                    ? 1
                    : MediaQuery.of(context).size.width < 1024
                    ? 2
                    : 4,
            crossAxisSpacing: AppDesignSystem.spaceMd,
            mainAxisSpacing: AppDesignSystem.spaceMd,
            childAspectRatio:
                MediaQuery.of(context).size.width < 768 ? 1.2 : 1.4,
          ),
          itemCount: kpis.length,
          itemBuilder: (context, index) {
            final kpi = kpis[index];
            return AppWidgets.metricCard(
              title: kpi['title'] as String,
              value: kpi['value'] as String,
              icon: kpi['icon'] as IconData,
              color: kpi['color'] as Color,
              trend: kpi['trend'] as String?,
              isPositiveTrend: kpi['isPositive'] as bool?,
              onTap: () => _navigateToSection(kpi['title'] as String),
            );
          },
        ),
      ],
    );
  }

  Widget _buildAlertsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppWidgets.sectionHeader(
          title: 'Alertas y Notificaciones',
          subtitle: 'Requieren tu atención',
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_outlined),
              color: AppDesignSystem.textSecondary,
            ),
          ],
        ),
        AppWidgets.primaryCard(
          child: Column(
            children: [
              if (_stockAlerts.isEmpty) ...[
                AppWidgets.emptyState(
                  icon: Icons.check_circle,
                  title: 'Todo está bien',
                  message: 'No hay alertas pendientes en este momento.',
                ),
              ] else ...[
                ..._stockAlerts.take(5).map((alert) => _buildAlertItem(alert)),
              ],
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAlertItem(Map<String, dynamic> alert) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppDesignSystem.spaceMd),
      padding: const EdgeInsets.all(AppDesignSystem.spaceMd),
      decoration: BoxDecoration(
        color: AppDesignSystem.warning.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(AppDesignSystem.radiusMd),
        border: Border.all(
          color: AppDesignSystem.warning.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(AppDesignSystem.spaceSm),
            decoration: BoxDecoration(
              color: AppDesignSystem.warning.withValues(alpha: 0.2),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.warning,
              size: 16,
              color: AppDesignSystem.warning,
            ),
          ),
          const SizedBox(width: AppDesignSystem.spaceMd),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  alert['titulo'] ?? 'Alerta',
                  style: AppDesignSystem.bodyMd().copyWith(
                    color: AppDesignSystem.textPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: AppDesignSystem.spaceXs),
                Text(
                  alert['descripcion'] ?? 'Sin descripción',
                  style: AppDesignSystem.bodySm().copyWith(
                    color: AppDesignSystem.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_forward_ios),
            iconSize: 16,
            color: AppDesignSystem.textMuted,
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActions() {
    final actions = [
      {
        'title': 'Nueva Venta',
        'icon': Icons.point_of_sale,
        'color': AppDesignSystem.success,
        'route': '/sales/add',
      },
      {
        'title': 'Agregar Producto',
        'icon': Icons.add_box,
        'color': AppDesignSystem.primaryBlue,
        'route': '/products/add',
      },
      {
        'title': 'Nuevo Cliente',
        'icon': Icons.person_add,
        'color': AppDesignSystem.info,
        'route': '/clients/add',
      },
      {
        'title': 'Crear Oferta',
        'icon': Icons.local_offer,
        'color': AppDesignSystem.warning,
        'route': '/offers/add',
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppWidgets.sectionHeader(
          title: 'Acciones Rápidas',
          subtitle: 'Operaciones frecuentes',
        ),
        AppWidgets.primaryCard(
          child: Column(
            children:
                actions.map((action) {
                  return Container(
                    margin: const EdgeInsets.only(
                      bottom: AppDesignSystem.spaceSm,
                    ),
                    child: AppWidgets.secondaryButton(
                      text: action['title'] as String,
                      icon: action['icon'] as IconData,
                      expanded: true,
                      borderColor: action['color'] as Color,
                      textColor: action['color'] as Color,
                      onPressed:
                          () => _navigateToRoute(action['route'] as String),
                    ),
                  );
                }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildRecentActivitySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppWidgets.sectionHeader(
          title: 'Actividad Reciente',
          subtitle: 'Últimos movimientos',
          actions: [
            TextButton(
              onPressed: () {},
              child: Text(
                'Ver todo',
                style: AppDesignSystem.bodyMd().copyWith(
                  color: AppDesignSystem.primaryBlue,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        AppWidgets.primaryCard(
          child: Column(
            children: [
              if (_recentOrders.isEmpty) ...[
                AppWidgets.emptyState(
                  icon: Icons.receipt_long,
                  title: 'No hay actividad reciente',
                  message:
                      'Los movimientos aparecerán aquí cuando se realicen operaciones.',
                ),
              ] else ...[
                ..._recentOrders
                    .take(5)
                    .map((order) => _buildActivityItem(order)),
              ],
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActivityItem(Map<String, dynamic> activity) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppDesignSystem.spaceMd),
      padding: const EdgeInsets.all(AppDesignSystem.spaceMd),
      decoration: BoxDecoration(
        color: AppDesignSystem.surfaceLight.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(AppDesignSystem.radiusMd),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(AppDesignSystem.spaceSm),
            decoration: BoxDecoration(
              color: AppDesignSystem.primaryBlue.withValues(alpha: 0.2),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.receipt,
              size: 16,
              color: AppDesignSystem.primaryBlue,
            ),
          ),
          const SizedBox(width: AppDesignSystem.spaceMd),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  activity['descripcion'] ?? 'Actividad',
                  style: AppDesignSystem.bodyMd().copyWith(
                    color: AppDesignSystem.textPrimary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: AppDesignSystem.spaceXs),
                Text(
                  _formatTime(activity['fecha']),
                  style: AppDesignSystem.bodySm().copyWith(
                    color: AppDesignSystem.textTertiary,
                  ),
                ),
              ],
            ),
          ),
          Text(
            '\$${activity['monto']?.toStringAsFixed(2) ?? '0.00'}',
            style: AppDesignSystem.bodyMd().copyWith(
              color: AppDesignSystem.success,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  String _getGreeting(int hour) {
    if (hour < 12) return '¡Buenos días!';
    if (hour < 18) return '¡Buenas tardes!';
    return '¡Buenas noches!';
  }

  String _formatDate(DateTime date) {
    final months = [
      'Enero',
      'Febrero',
      'Marzo',
      'Abril',
      'Mayo',
      'Junio',
      'Julio',
      'Agosto',
      'Septiembre',
      'Octubre',
      'Noviembre',
      'Diciembre',
    ];
    return '${date.day} de ${months[date.month - 1]} de ${date.year}';
  }

  String _formatTime(DateTime? date) {
    if (date == null) return 'Fecha desconocida';
    final now = DateTime.now();
    final diff = now.difference(date);

    if (diff.inDays > 0)
      return 'Hace ${diff.inDays} día${diff.inDays > 1 ? 's' : ''}';
    if (diff.inHours > 0)
      return 'Hace ${diff.inHours} hora${diff.inHours > 1 ? 's' : ''}';
    if (diff.inMinutes > 0)
      return 'Hace ${diff.inMinutes} minuto${diff.inMinutes > 1 ? 's' : ''}';
    return 'Hace un momento';
  }

  void _navigateToSection(String section) {
    // Implementar navegación basada en la sección
    switch (section) {
      case 'Ventas Hoy':
        // Navigator.of(context).pushNamed('/sales');
        break;
      case 'Productos':
        // Navigator.of(context).pushNamed('/products');
        break;
      case 'Clientes':
        // Navigator.of(context).pushNamed('/clients');
        break;
      case 'Bajo Stock':
        // Navigator.of(context).pushNamed('/stock-alerts');
        break;
    }
  }

  void _navigateToRoute(String route) {
    // Implementar navegación a rutas específicas
    // Navigator.of(context).pushNamed(route);
  }
}
