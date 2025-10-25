import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../src/app_routes.dart';
import '../../widgets/app_design_system.dart';
import '../../widgets/app_widgets.dart';
import '../../widgets/permission_widget.dart';
import '../../providers/ventas_provider.dart';
import '../../providers/compras_provider.dart';
import '../../models/venta.dart';
import '../../models/compra.dart';

class ModernSalesView extends ConsumerStatefulWidget {
  const ModernSalesView({super.key});

  @override
  ConsumerState<ModernSalesView> createState() => _ModernSalesViewState();
}

class _ModernSalesViewState extends ConsumerState<ModernSalesView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _searchQuery = '';
  String _selectedSalesFilter = 'Todas';
  String _selectedPurchasesFilter = 'Todas';
  DateTimeRange? _selectedDateRange;

  final List<String> _salesFilterOptions = [
    'Todas',
    'Completadas',
    'Pendientes',
    'Canceladas',
    'Hoy',
    'Esta Semana',
    'Este Mes',
  ];

  final List<String> _purchasesFilterOptions = [
    'Todas',
    'Recibidas',
    'Pendientes',
    'Canceladas',
    'Hoy',
    'Esta Semana',
    'Este Mes',
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppDesignSystem.background,
      body: Column(
        children: [
          // Header de la sección
          _buildSectionHeader(),

          // Métricas principales
          _buildMetricsSection(),

          // Barra de navegación por pestañas
          _buildTabBar(),

          // Contenido de las pestañas
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [_buildSalesTab(), _buildPurchasesTab()],
            ),
          ),
        ],
      ),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  Widget _buildSectionHeader() {
    return AppWidgets.primaryCard(
      margin: const EdgeInsets.all(AppDesignSystem.spaceMd),
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          AppDesignSystem.success.withValues(alpha: 0.15),
          AppDesignSystem.success.withValues(alpha: 0.05),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(AppDesignSystem.spaceMd),
            decoration: BoxDecoration(
              color: AppDesignSystem.success.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(AppDesignSystem.radiusMd),
            ),
            child: Icon(
              Icons.monetization_on_rounded,
              size: 32,
              color: AppDesignSystem.textPrimary,
            ),
          ),
          const SizedBox(width: AppDesignSystem.spaceLg),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ventas y Compras',
                  style: AppDesignSystem.headingLg().copyWith(
                    color: AppDesignSystem.textPrimary,
                  ),
                ),
                const SizedBox(height: AppDesignSystem.spaceXs),
                Text(
                  'Gestiona transacciones comerciales, controla inventario y mantén registro detallado de operaciones.',
                  style: AppDesignSystem.bodyMd().copyWith(
                    color: AppDesignSystem.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMetricsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDesignSystem.spaceMd),
      child: Row(
        children: [
          Expanded(
            child: AppWidgets.metricCard(
              title: 'Ventas del Día',
              value: '\$12,450',
              subtitle: '+15% vs ayer',
              icon: Icons.trending_up,
              color: AppDesignSystem.success,
              isPositiveTrend: true,
            ),
          ),
          const SizedBox(width: AppDesignSystem.spaceMd),

          Expanded(
            child: AppWidgets.metricCard(
              title: 'Compras del Mes',
              value: '\$8,320',
              subtitle: '-5% vs mes anterior',
              icon: Icons.shopping_cart,
              color: AppDesignSystem.warning,
              isPositiveTrend: false,
            ),
          ),
          const SizedBox(width: AppDesignSystem.spaceMd),

          Expanded(
            child: AppWidgets.metricCard(
              title: 'Margen de Ganancia',
              value: '38.5%',
              subtitle: '+2.1% este mes',
              icon: Icons.account_balance_wallet,
              color: AppDesignSystem.accentGreen,
              isPositiveTrend: true,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return AppWidgets.primaryCard(
      margin: const EdgeInsets.all(AppDesignSystem.spaceMd),
      child: TabBar(
        controller: _tabController,
        dividerColor: Colors.transparent,
        indicatorColor: AppDesignSystem.success,
        indicatorWeight: 3,
        labelColor: AppDesignSystem.success,
        unselectedLabelColor: AppDesignSystem.textSecondary,
        labelStyle: AppDesignSystem.bodyMd().copyWith(
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: AppDesignSystem.bodyMd().copyWith(
          fontWeight: FontWeight.w400,
        ),
        tabs: const [
          Tab(icon: Icon(Icons.point_of_sale), text: 'Ventas'),
          Tab(icon: Icon(Icons.shopping_bag), text: 'Compras'),
        ],
      ),
    );
  }

  Widget _buildSalesTab() {
    final ventasAsync = ref.watch(ventasProvider);

    return Column(
      children: [
        // Controles de búsqueda y filtros para ventas
        _buildSalesSearchAndFilters(),

        // Lista de ventas
        Expanded(
          child: ventasAsync.when(
            data: (ventas) => _buildSalesContent(ventas),
            loading:
                () => AppWidgets.loadingState(message: 'Cargando ventas...'),
            error:
                (error, _) => AppWidgets.errorState(
                  title: 'Error al cargar ventas',
                  message: error.toString(),
                  actionText: 'Reintentar',
                  onActionPressed: () => ref.refresh(ventasProvider),
                ),
          ),
        ),
      ],
    );
  }

  Widget _buildPurchasesTab() {
    final comprasAsync = ref.watch(comprasProvider);

    return Column(
      children: [
        // Controles de búsqueda y filtros para compras
        _buildPurchasesSearchAndFilters(),

        // Lista de compras
        Expanded(
          child: comprasAsync.when(
            data: (compras) => _buildPurchasesContent(compras),
            loading:
                () => AppWidgets.loadingState(message: 'Cargando compras...'),
            error:
                (error, _) => AppWidgets.errorState(
                  title: 'Error al cargar compras',
                  message: error.toString(),
                  actionText: 'Reintentar',
                  onActionPressed: () => ref.refresh(comprasProvider),
                ),
          ),
        ),
      ],
    );
  }

  Widget _buildSalesSearchAndFilters() {
    return AppWidgets.primaryCard(
      margin: const EdgeInsets.symmetric(horizontal: AppDesignSystem.spaceMd),
      child: Column(
        children: [
          Row(
            children: [
              // Barra de búsqueda
              Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppDesignSystem.surfaceLight.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(
                      AppDesignSystem.radiusMd,
                    ),
                    border: Border.all(
                      color: AppDesignSystem.textMuted.withValues(alpha: 0.2),
                      width: 1,
                    ),
                  ),
                  child: TextField(
                    onChanged: (value) => setState(() => _searchQuery = value),
                    style: AppDesignSystem.bodyMd().copyWith(
                      color: AppDesignSystem.textPrimary,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Buscar por cliente, número de venta...',
                      hintStyle: AppDesignSystem.bodyMd().copyWith(
                        color: AppDesignSystem.textMuted,
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: AppDesignSystem.textMuted,
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.all(
                        AppDesignSystem.spaceMd,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(width: AppDesignSystem.spaceMd),

              // Selector de rango de fechas
              Expanded(
                flex: 2,
                child: AppWidgets.secondaryButton(
                  text:
                      _selectedDateRange != null
                          ? '${_selectedDateRange!.start.day}/${_selectedDateRange!.start.month} - ${_selectedDateRange!.end.day}/${_selectedDateRange!.end.month}'
                          : 'Seleccionar fechas',
                  icon: Icons.date_range,
                  onPressed: _selectDateRange,
                ),
              ),
            ],
          ),

          const SizedBox(height: AppDesignSystem.spaceMd),

          // Filtros
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children:
                  _salesFilterOptions.map((filter) {
                    final isSelected = _selectedSalesFilter == filter;
                    return Padding(
                      padding: const EdgeInsets.only(
                        right: AppDesignSystem.spaceSm,
                      ),
                      child: GestureDetector(
                        onTap:
                            () => setState(() => _selectedSalesFilter = filter),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppDesignSystem.spaceMd,
                            vertical: AppDesignSystem.spaceSm,
                          ),
                          decoration: BoxDecoration(
                            color:
                                isSelected
                                    ? AppDesignSystem.success
                                    : Colors.transparent,
                            borderRadius: BorderRadius.circular(
                              AppDesignSystem.radiusMd,
                            ),
                            border: Border.all(
                              color:
                                  isSelected
                                      ? AppDesignSystem.success
                                      : AppDesignSystem.textMuted.withValues(
                                        alpha: 0.3,
                                      ),
                              width: 1,
                            ),
                          ),
                          child: Text(
                            filter,
                            style: AppDesignSystem.bodyMd().copyWith(
                              color:
                                  isSelected
                                      ? AppDesignSystem.textPrimary
                                      : AppDesignSystem.textSecondary,
                              fontWeight:
                                  isSelected
                                      ? FontWeight.w600
                                      : FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPurchasesSearchAndFilters() {
    return AppWidgets.primaryCard(
      margin: const EdgeInsets.symmetric(horizontal: AppDesignSystem.spaceMd),
      child: Column(
        children: [
          Row(
            children: [
              // Barra de búsqueda
              Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppDesignSystem.surfaceLight.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(
                      AppDesignSystem.radiusMd,
                    ),
                    border: Border.all(
                      color: AppDesignSystem.textMuted.withValues(alpha: 0.2),
                      width: 1,
                    ),
                  ),
                  child: TextField(
                    onChanged: (value) => setState(() => _searchQuery = value),
                    style: AppDesignSystem.bodyMd().copyWith(
                      color: AppDesignSystem.textPrimary,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Buscar por proveedor, número de compra...',
                      hintStyle: AppDesignSystem.bodyMd().copyWith(
                        color: AppDesignSystem.textMuted,
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: AppDesignSystem.textMuted,
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.all(
                        AppDesignSystem.spaceMd,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(width: AppDesignSystem.spaceMd),

              // Selector de rango de fechas
              Expanded(
                flex: 2,
                child: AppWidgets.secondaryButton(
                  text:
                      _selectedDateRange != null
                          ? '${_selectedDateRange!.start.day}/${_selectedDateRange!.start.month} - ${_selectedDateRange!.end.day}/${_selectedDateRange!.end.month}'
                          : 'Seleccionar fechas',
                  icon: Icons.date_range,
                  onPressed: _selectDateRange,
                ),
              ),
            ],
          ),

          const SizedBox(height: AppDesignSystem.spaceMd),

          // Filtros
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children:
                  _purchasesFilterOptions.map((filter) {
                    final isSelected = _selectedPurchasesFilter == filter;
                    return Padding(
                      padding: const EdgeInsets.only(
                        right: AppDesignSystem.spaceSm,
                      ),
                      child: GestureDetector(
                        onTap:
                            () => setState(
                              () => _selectedPurchasesFilter = filter,
                            ),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppDesignSystem.spaceMd,
                            vertical: AppDesignSystem.spaceSm,
                          ),
                          decoration: BoxDecoration(
                            color:
                                isSelected
                                    ? AppDesignSystem.warning
                                    : Colors.transparent,
                            borderRadius: BorderRadius.circular(
                              AppDesignSystem.radiusMd,
                            ),
                            border: Border.all(
                              color:
                                  isSelected
                                      ? AppDesignSystem.warning
                                      : AppDesignSystem.textMuted.withValues(
                                        alpha: 0.3,
                                      ),
                              width: 1,
                            ),
                          ),
                          child: Text(
                            filter,
                            style: AppDesignSystem.bodyMd().copyWith(
                              color:
                                  isSelected
                                      ? AppDesignSystem.textPrimary
                                      : AppDesignSystem.textSecondary,
                              fontWeight:
                                  isSelected
                                      ? FontWeight.w600
                                      : FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSalesContent(List<Venta> ventas) {
    final filteredSales = _filterSales(ventas);

    if (filteredSales.isEmpty) {
      return AppWidgets.emptyState(
        icon: Icons.point_of_sale_outlined,
        title:
            _searchQuery.isNotEmpty || _selectedSalesFilter != 'Todas'
                ? 'No se encontraron ventas'
                : 'No hay ventas registradas',
        message:
            _searchQuery.isNotEmpty || _selectedSalesFilter != 'Todas'
                ? 'Intenta ajustar los filtros o la búsqueda.'
                : 'Comienza registrando ventas para controlar tus ingresos.',
        actionText: 'Nueva Venta',
        onActionPressed: () => context.push(AppRoutes.saleAdd),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(AppDesignSystem.spaceMd),
      itemCount: filteredSales.length,
      itemBuilder: (context, index) {
        final venta = filteredSales[index];
        return _buildSaleCard(venta);
      },
    );
  }

  Widget _buildPurchasesContent(List<Compra> compras) {
    final filteredPurchases = _filterPurchases(compras);

    if (filteredPurchases.isEmpty) {
      return AppWidgets.emptyState(
        icon: Icons.shopping_bag_outlined,
        title:
            _searchQuery.isNotEmpty || _selectedPurchasesFilter != 'Todas'
                ? 'No se encontraron compras'
                : 'No hay compras registradas',
        message:
            _searchQuery.isNotEmpty || _selectedPurchasesFilter != 'Todas'
                ? 'Intenta ajustar los filtros o la búsqueda.'
                : 'Comienza registrando compras para controlar tu inventario.',
        actionText: 'Nueva Compra',
        onActionPressed: () => context.push(AppRoutes.purchaseAdd),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(AppDesignSystem.spaceMd),
      itemCount: filteredPurchases.length,
      itemBuilder: (context, index) {
        final compra = filteredPurchases[index];
        return _buildPurchaseCard(compra);
      },
    );
  }

  Widget _buildSaleCard(Venta venta) {
    final statusInfo = _getSaleStatusInfo(venta.estado);

    return AppWidgets.primaryCard(
      margin: const EdgeInsets.only(bottom: AppDesignSystem.spaceMd),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header de la venta
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(AppDesignSystem.spaceSm),
                decoration: BoxDecoration(
                  color: AppDesignSystem.success.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(AppDesignSystem.radiusSm),
                ),
                child: const Icon(
                  Icons.receipt,
                  color: AppDesignSystem.success,
                  size: 20,
                ),
              ),
              const SizedBox(width: AppDesignSystem.spaceMd),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Venta #${venta.numeroFactura ?? 'N/A'}',
                      style: AppDesignSystem.headingSm().copyWith(
                        color: AppDesignSystem.textPrimary,
                      ),
                    ),
                    Text(
                      venta.clienteNombre.isNotEmpty
                          ? venta.clienteNombre
                          : 'Cliente no especificado',
                      style: AppDesignSystem.bodySm().copyWith(
                        color: AppDesignSystem.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),

              AppWidgets.statusChip(
                label: statusInfo['label'],
                color: statusInfo['color'],
                icon: statusInfo['icon'],
              ),
            ],
          ),

          const SizedBox(height: AppDesignSystem.spaceMd),

          // Información de la venta
          Row(
            children: [
              Expanded(
                child: _buildInfoItem(
                  'Total',
                  '\$${venta.total.toStringAsFixed(2)}',
                  Icons.monetization_on,
                  AppDesignSystem.success,
                ),
              ),
              Expanded(
                child: _buildInfoItem(
                  'Fecha',
                  venta.fecha.toString().split(' ')[0],
                  Icons.calendar_today,
                  AppDesignSystem.textMuted,
                ),
              ),
              Expanded(
                child: _buildInfoItem(
                  'Items',
                  '${venta.detalles.length}',
                  Icons.shopping_cart,
                  AppDesignSystem.textMuted,
                ),
              ),
            ],
          ),

          const SizedBox(height: AppDesignSystem.spaceMd),

          // Acciones
          Row(
            children: [
              Expanded(
                child: AppWidgets.secondaryButton(
                  text: 'Ver Detalles',
                  icon: Icons.visibility,
                  onPressed: () => _viewSaleDetails(venta),
                ),
              ),
              const SizedBox(width: AppDesignSystem.spaceSm),

              PermissionWidget(
                resource: 'ventas',
                action: 'editar',
                child: Expanded(
                  child: AppWidgets.primaryButton(
                    text: 'Editar',
                    icon: Icons.edit,
                    backgroundColor: AppDesignSystem.success,
                    onPressed:
                        () => context.push('${AppRoutes.saleEdit}/${venta.id}'),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPurchaseCard(Compra compra) {
    final statusInfo = _getPurchaseStatusInfo(compra.estado);

    return AppWidgets.primaryCard(
      margin: const EdgeInsets.only(bottom: AppDesignSystem.spaceMd),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header de la compra
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(AppDesignSystem.spaceSm),
                decoration: BoxDecoration(
                  color: AppDesignSystem.warning.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(AppDesignSystem.radiusSm),
                ),
                child: const Icon(
                  Icons.shopping_bag,
                  color: AppDesignSystem.warning,
                  size: 20,
                ),
              ),
              const SizedBox(width: AppDesignSystem.spaceMd),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Compra #${compra.numeroFactura}',
                      style: AppDesignSystem.headingSm().copyWith(
                        color: AppDesignSystem.textPrimary,
                      ),
                    ),
                    Text(
                      compra.proveedorNombre.isNotEmpty
                          ? compra.proveedorNombre
                          : 'Proveedor no especificado',
                      style: AppDesignSystem.bodySm().copyWith(
                        color: AppDesignSystem.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),

              AppWidgets.statusChip(
                label: statusInfo['label'],
                color: statusInfo['color'],
                icon: statusInfo['icon'],
              ),
            ],
          ),

          const SizedBox(height: AppDesignSystem.spaceMd),

          // Información de la compra
          Row(
            children: [
              Expanded(
                child: _buildInfoItem(
                  'Total',
                  '\$${compra.total.toStringAsFixed(2)}',
                  Icons.monetization_on,
                  AppDesignSystem.warning,
                ),
              ),
              Expanded(
                child: _buildInfoItem(
                  'Fecha',
                  compra.fecha.toString().split(' ')[0],
                  Icons.calendar_today,
                  AppDesignSystem.textMuted,
                ),
              ),
              Expanded(
                child: _buildInfoItem(
                  'Items',
                  '${compra.productos.length}',
                  Icons.inventory_2,
                  AppDesignSystem.textMuted,
                ),
              ),
            ],
          ),

          const SizedBox(height: AppDesignSystem.spaceMd),

          // Acciones
          Row(
            children: [
              Expanded(
                child: AppWidgets.secondaryButton(
                  text: 'Ver Detalles',
                  icon: Icons.visibility,
                  onPressed: () => _viewPurchaseDetails(compra),
                ),
              ),
              const SizedBox(width: AppDesignSystem.spaceSm),

              PermissionWidget(
                resource: 'compras',
                action: 'editar',
                child: Expanded(
                  child: AppWidgets.primaryButton(
                    text: 'Editar',
                    icon: Icons.edit,
                    backgroundColor: AppDesignSystem.warning,
                    onPressed:
                        () => context.push(
                          '${AppRoutes.purchaseEdit}/${compra.id}',
                        ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem(
    String label,
    String value,
    IconData icon,
    Color color,
  ) {
    return Row(
      children: [
        Icon(icon, size: 16, color: color),
        const SizedBox(width: AppDesignSystem.spaceXs),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: AppDesignSystem.bodySm().copyWith(
                  color: AppDesignSystem.textMuted,
                ),
              ),
              Text(
                value,
                style: AppDesignSystem.bodyMd().copyWith(
                  color: AppDesignSystem.textPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFloatingActionButton() {
    return _tabController.index == 0
        ? PermissionWidget(
          resource: 'ventas',
          action: 'crear',
          child: FloatingActionButton.extended(
            onPressed: () => context.push(AppRoutes.saleAdd),
            backgroundColor: AppDesignSystem.success,
            foregroundColor: AppDesignSystem.textPrimary,
            icon: const Icon(Icons.add_shopping_cart),
            label: const Text('Nueva Venta'),
          ),
        )
        : PermissionWidget(
          resource: 'compras',
          action: 'crear',
          child: FloatingActionButton.extended(
            onPressed: () => context.push(AppRoutes.purchaseAdd),
            backgroundColor: AppDesignSystem.warning,
            foregroundColor: AppDesignSystem.textPrimary,
            icon: const Icon(Icons.add_business),
            label: const Text('Nueva Compra'),
          ),
        );
  }

  // Funciones auxiliares
  List<Venta> _filterSales(List<Venta> ventas) {
    var filtered = ventas;

    // Filtrar por búsqueda
    if (_searchQuery.isNotEmpty) {
      filtered =
          filtered.where((venta) {
            final query = _searchQuery.toLowerCase();
            return (venta.numeroFactura?.toLowerCase().contains(query) ??
                    false) ||
                venta.clienteNombre.toLowerCase().contains(query);
          }).toList();
    }

    // Filtrar por estado y fechas
    switch (_selectedSalesFilter) {
      case 'Completadas':
        filtered = filtered.where((v) => v.estado == 'completada').toList();
        break;
      case 'Pendientes':
        filtered = filtered.where((v) => v.estado == 'pendiente').toList();
        break;
      case 'Canceladas':
        filtered = filtered.where((v) => v.estado == 'cancelada').toList();
        break;
      case 'Hoy':
        final today = DateTime.now();
        filtered = filtered.where((v) => v.fecha.day == today.day).toList();
        break;
      // Agregar más filtros según necesidades
    }

    return filtered;
  }

  List<Compra> _filterPurchases(List<Compra> compras) {
    var filtered = compras;

    // Filtrar por búsqueda
    if (_searchQuery.isNotEmpty) {
      filtered =
          filtered.where((compra) {
            final query = _searchQuery.toLowerCase();
            return compra.numeroFactura.toLowerCase().contains(query) ||
                compra.proveedorNombre.toLowerCase().contains(query);
          }).toList();
    }

    // Filtrar por estado y fechas
    switch (_selectedPurchasesFilter) {
      case 'Recibidas':
        filtered = filtered.where((c) => c.estado == 'recibida').toList();
        break;
      case 'Pendientes':
        filtered = filtered.where((c) => c.estado == 'pendiente').toList();
        break;
      case 'Canceladas':
        filtered = filtered.where((c) => c.estado == 'cancelada').toList();
        break;
      case 'Hoy':
        final today = DateTime.now();
        filtered = filtered.where((c) => c.fecha.day == today.day).toList();
        break;
      // Agregar más filtros según necesidades
    }

    return filtered;
  }

  Map<String, dynamic> _getSaleStatusInfo(String? estado) {
    switch (estado) {
      case 'completada':
        return {
          'label': 'Completada',
          'color': AppDesignSystem.success,
          'icon': Icons.check_circle,
        };
      case 'pendiente':
        return {
          'label': 'Pendiente',
          'color': AppDesignSystem.warning,
          'icon': Icons.pending,
        };
      case 'cancelada':
        return {
          'label': 'Cancelada',
          'color': AppDesignSystem.error,
          'icon': Icons.cancel,
        };
      default:
        return {
          'label': 'Desconocido',
          'color': AppDesignSystem.textMuted,
          'icon': Icons.help,
        };
    }
  }

  Map<String, dynamic> _getPurchaseStatusInfo(String? estado) {
    switch (estado) {
      case 'recibida':
        return {
          'label': 'Recibida',
          'color': AppDesignSystem.success,
          'icon': Icons.check_circle,
        };
      case 'pendiente':
        return {
          'label': 'Pendiente',
          'color': AppDesignSystem.warning,
          'icon': Icons.pending,
        };
      case 'cancelada':
        return {
          'label': 'Cancelada',
          'color': AppDesignSystem.error,
          'icon': Icons.cancel,
        };
      default:
        return {
          'label': 'Desconocido',
          'color': AppDesignSystem.textMuted,
          'icon': Icons.help,
        };
    }
  }

  Future<void> _selectDateRange() async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      initialDateRange: _selectedDateRange,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: Theme.of(
              context,
            ).colorScheme.copyWith(primary: AppDesignSystem.success),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        _selectedDateRange = picked;
      });
    }
  }

  void _viewSaleDetails(Venta venta) {
    showDialog(
      context: context,
      builder:
          (context) => Dialog(
            backgroundColor: AppDesignSystem.surface,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppDesignSystem.radiusLg),
            ),
            child: Container(
              constraints: const BoxConstraints(maxWidth: 600, maxHeight: 700),
              padding: const EdgeInsets.all(AppDesignSystem.spaceLg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Detalles de Venta #${venta.numeroFactura ?? 'N/A'}',
                    style: AppDesignSystem.headingMd().copyWith(
                      color: AppDesignSystem.textPrimary,
                    ),
                  ),
                  const SizedBox(height: AppDesignSystem.spaceLg),

                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildDetailRow(
                            'Cliente',
                            venta.clienteNombre.isNotEmpty
                                ? venta.clienteNombre
                                : 'No especificado',
                          ),
                          _buildDetailRow(
                            'Fecha',
                            venta.fecha.toString().split(' ')[0],
                          ),
                          _buildDetailRow('Estado', venta.estado),
                          _buildDetailRow(
                            'Total',
                            '\$${venta.total.toStringAsFixed(2)}',
                          ),

                          const SizedBox(height: AppDesignSystem.spaceLg),

                          Text(
                            'Productos:',
                            style: AppDesignSystem.headingSm().copyWith(
                              color: AppDesignSystem.textPrimary,
                            ),
                          ),

                          const SizedBox(height: AppDesignSystem.spaceMd),

                          if (venta.detalles.isNotEmpty) ...[
                            ...venta.detalles.map(
                              (detalle) => Container(
                                margin: const EdgeInsets.only(
                                  bottom: AppDesignSystem.spaceSm,
                                ),
                                padding: const EdgeInsets.all(
                                  AppDesignSystem.spaceMd,
                                ),
                                decoration: BoxDecoration(
                                  color: AppDesignSystem.surfaceLight
                                      .withValues(alpha: 0.3),
                                  borderRadius: BorderRadius.circular(
                                    AppDesignSystem.radiusSm,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        ((detalle as dynamic)
                                                .producto
                                                ?.nombre ??
                                            (detalle as dynamic).nombre ??
                                            'Producto sin nombre'),
                                        style: AppDesignSystem.bodyMd()
                                            .copyWith(
                                              color:
                                                  AppDesignSystem.textPrimary,
                                            ),
                                      ),
                                    ),
                                    Text(
                                      'Cant: ${(detalle as dynamic).cantidad ?? 0}',
                                      style: AppDesignSystem.bodySm().copyWith(
                                        color: AppDesignSystem.textSecondary,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: AppDesignSystem.spaceMd,
                                    ),
                                    Text(
                                      '\$${(detalle as dynamic).precio?.toStringAsFixed(2) ?? '0.00'}',
                                      style: AppDesignSystem.bodyMd().copyWith(
                                        color: AppDesignSystem.success,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ] else ...[
                            AppWidgets.emptyState(
                              icon: Icons.shopping_cart_outlined,
                              title: 'Sin productos',
                              message:
                                  'Esta venta no tiene productos registrados.',
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: AppDesignSystem.spaceLg),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AppWidgets.secondaryButton(
                        text: 'Cerrar',
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      const SizedBox(width: AppDesignSystem.spaceMd),
                      AppWidgets.primaryButton(
                        text: 'Editar Venta',
                        icon: Icons.edit,
                        backgroundColor: AppDesignSystem.success,
                        onPressed: () {
                          Navigator.of(context).pop();
                          context.push('${AppRoutes.saleEdit}/${venta.id}');
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
    );
  }

  void _viewPurchaseDetails(Compra compra) {
    showDialog(
      context: context,
      builder:
          (context) => Dialog(
            backgroundColor: AppDesignSystem.surface,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppDesignSystem.radiusLg),
            ),
            child: Container(
              constraints: const BoxConstraints(maxWidth: 600, maxHeight: 700),
              padding: const EdgeInsets.all(AppDesignSystem.spaceLg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Detalles de Compra #${compra.numeroFactura}",
                    style: AppDesignSystem.headingMd().copyWith(
                      color: AppDesignSystem.textPrimary,
                    ),
                  ),
                  const SizedBox(height: AppDesignSystem.spaceLg),

                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildDetailRow(
                            'Proveedor',
                            compra.proveedorNombre.isNotEmpty
                                ? compra.proveedorNombre
                                : 'No especificado',
                          ),
                          _buildDetailRow(
                            'Fecha',
                            compra.fecha.toString().split(' ')[0],
                          ),
                          _buildDetailRow('Estado', compra.estado),
                          _buildDetailRow(
                            'Total',
                            '\$${compra.total.toStringAsFixed(2)}',
                          ),

                          const SizedBox(height: AppDesignSystem.spaceLg),

                          Text(
                            'Productos:',
                            style: AppDesignSystem.headingSm().copyWith(
                              color: AppDesignSystem.textPrimary,
                            ),
                          ),

                          const SizedBox(height: AppDesignSystem.spaceMd),

                          if (compra.productos.isNotEmpty) ...[
                            ...compra.productos.map(
                              (detalle) => Container(
                                margin: const EdgeInsets.only(
                                  bottom: AppDesignSystem.spaceSm,
                                ),
                                padding: const EdgeInsets.all(
                                  AppDesignSystem.spaceMd,
                                ),
                                decoration: BoxDecoration(
                                  color: AppDesignSystem.surfaceLight
                                      .withValues(alpha: 0.3),
                                  borderRadius: BorderRadius.circular(
                                    AppDesignSystem.radiusSm,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        ((detalle as dynamic)
                                                .producto
                                                ?.nombre ??
                                            (detalle as dynamic).nombre ??
                                            'Producto sin nombre'),
                                        style: AppDesignSystem.bodyMd()
                                            .copyWith(
                                              color:
                                                  AppDesignSystem.textPrimary,
                                            ),
                                      ),
                                    ),
                                    Text(
                                      'Cant: ${(detalle as dynamic).cantidad ?? 0}',
                                      style: AppDesignSystem.bodySm().copyWith(
                                        color: AppDesignSystem.textSecondary,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: AppDesignSystem.spaceMd,
                                    ),
                                    Text(
                                      '\$${(detalle as dynamic).precio?.toStringAsFixed(2) ?? '0.00'}',
                                      style: AppDesignSystem.bodyMd().copyWith(
                                        color: AppDesignSystem.warning,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ] else ...[
                            AppWidgets.emptyState(
                              icon: Icons.inventory_2_outlined,
                              title: 'Sin productos',
                              message:
                                  'Esta compra no tiene productos registrados.',
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: AppDesignSystem.spaceLg),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AppWidgets.secondaryButton(
                        text: 'Cerrar',
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      const SizedBox(width: AppDesignSystem.spaceMd),
                      AppWidgets.primaryButton(
                        text: 'Editar Compra',
                        icon: Icons.edit,
                        backgroundColor: AppDesignSystem.warning,
                        onPressed: () {
                          Navigator.of(context).pop();
                          context.push(
                            '${AppRoutes.purchaseEdit}/${compra.id}',
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppDesignSystem.spaceMd),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              '$label:',
              style: AppDesignSystem.bodyMd().copyWith(
                color: AppDesignSystem.textMuted,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: AppDesignSystem.bodyMd().copyWith(
                color: AppDesignSystem.textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
