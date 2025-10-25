import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../models/flujo_caja.dart';
import '../../services/isar_service.dart';
import '../../widgets/permission_widget.dart';
import '../../widgets/fashion_components.dart';
import '../../widgets/app_design_system.dart';
import '../../components/shared/professional_app_bar.dart';
import 'fixed_expenses_view.dart';

class FashionFinanceView extends ConsumerStatefulWidget {
  const FashionFinanceView({super.key});

  @override
  ConsumerState<FashionFinanceView> createState() => _FashionFinanceViewState();
}

class _FashionFinanceViewState extends ConsumerState<FashionFinanceView>
    with TickerProviderStateMixin {
  List<FlujoCaja> _flujos = [];
  bool _isLoading = true;
  String _filtroSeleccionado = 'Todos';
  int _tabIndex = 0;

  late AnimationController _fadeController;
  late AnimationController _slideController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Animaciones
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

    _loadData();

    // Iniciar animaciones
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fadeController.forward();
      _slideController.forward();
    });
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _loadData() async {
    try {
      setState(() => _isLoading = true);

      final isar = await ref.read(isarServiceProvider).db;
      final flujosRaw = await isar.flujoCajas.getAll([0]);
      final flujos = flujosRaw.whereType<FlujoCaja>().toList();

      setState(() {
        _flujos = flujos;
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error al cargar datos: $e'),
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

  List<FlujoCaja> get _flujosFiltrados {
    List<FlujoCaja> filtrados = _flujos;

    // Filtrar por búsqueda
    if (_searchController.text.isNotEmpty) {
      final query = _searchController.text.toLowerCase();
      filtrados =
          filtrados.where((flujo) {
            final descripcion = (flujo.descripcion ?? '').toLowerCase();
            final categoria = flujo.categoria.toLowerCase();
            return descripcion.contains(query) || categoria.contains(query);
          }).toList();
    }

    // Filtrar por tipo
    switch (_filtroSeleccionado) {
      case 'Ingresos':
        return filtrados.where((f) => f.tipo == 'ingreso').toList();
      case 'Egresos':
        return filtrados.where((f) => f.tipo == 'egreso').toList();
      default:
        return filtrados;
    }
  }

  double get _totalIngresos {
    return _flujos
        .where((f) => f.tipo == 'ingreso')
        .fold(0.0, (total, flujo) => total + flujo.monto);
  }

  double get _totalEgresos {
    return _flujos
        .where((f) => f.tipo == 'egreso')
        .fold(0.0, (total, flujo) => total + flujo.monto);
  }

  double get _saldoNeto => _totalIngresos - _totalEgresos;

  @override
  Widget build(BuildContext context) {
    return FashionScaffold(
      backgroundTags: const ['personalidad', 'urbano', 'elegante'],
      overlayOpacity: 0.82,
      showBackgroundRotation: true,
      rotationInterval: const Duration(minutes: 5),
      body: AnimatedBuilder(
        animation: Listenable.merge([_fadeAnimation, _slideAnimation]),
        builder: (context, child) {
          return FadeTransition(
            opacity: _fadeAnimation,
            child: SlideTransition(
              position: _slideAnimation,
              child: DefaultTabController(
                length: 3,
                initialIndex: _tabIndex,
                child: Column(
                  children: [
                    // Header moderno con glassmorphismo
                    ModernCard(
                      margin: const EdgeInsets.all(0),
                      borderRadius: 0,
                      glassMorphism: true,
                      opacity: 0.9,
                      child: Column(
                        children: [
                          ProfessionalAppBar(
                            title: '💰 Finanzas & Control',
                            actions: [
                              FashionButton(
                                text: 'Nuevo Movimiento',
                                icon: Icons.add_rounded,
                                style: FashionButtonStyle.primary,
                                onPressed: () {
                                  if (_tabIndex == 0) {
                                    context.push('/finanzas/add-flujo');
                                  } else if (_tabIndex == 1) {
                                    context.push('/finanzas/add-gasto-fijo');
                                  } else {
                                    context.push('/finanzas/add-caja');
                                  }
                                },
                              ),
                              const SizedBox(width: 16),
                            ],
                          ),
                          // TabBar moderno
                          Container(
                            margin: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color:
                                  AppDesignSystem.isDark
                                      ? AppDesignSystem.darkSecondary
                                          .withOpacity(0.3)
                                      : Colors.white.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: AppDesignSystem.vibrantPink.withOpacity(
                                  0.2,
                                ),
                                width: 1,
                              ),
                            ),
                            child: TabBar(
                              onTap: (i) => setState(() => _tabIndex = i),
                              indicator: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    AppDesignSystem.vibrantPink,
                                    AppDesignSystem.electricBlue,
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              indicatorSize: TabBarIndicatorSize.tab,
                              dividerColor: Colors.transparent,
                              labelColor: Colors.white,
                              unselectedLabelColor:
                                  AppDesignSystem.textSecondary,
                              labelStyle: AppDesignSystem.bodySm().copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                              tabs: const [
                                Tab(
                                  text: 'General',
                                  icon: Icon(Icons.analytics_rounded, size: 20),
                                ),
                                Tab(
                                  text: 'Gastos Fijos',
                                  icon: Icon(
                                    Icons.receipt_long_rounded,
                                    size: 20,
                                  ),
                                ),
                                Tab(
                                  text: 'Flujo de Caja',
                                  icon: Icon(Icons.swap_vert_rounded, size: 20),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Contenido de las pestañas
                    Expanded(
                      child: TabBarView(
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          _buildGeneralTab(),
                          _buildGastosFijosTab(),
                          _buildFlujoCajaTab(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildGeneralTab() {
    return Column(
      children: [
        // Descripción juvenil
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ModernCard(
            glassMorphism: true,
            opacity: 0.9,
            borderColor: AppDesignSystem.success.withOpacity(0.3),
            child: Row(
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
                    Icons.account_balance_wallet_rounded,
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
                        'Resumen Financiero Total',
                        style: AppDesignSystem.bodyMd().copyWith(
                          fontWeight: FontWeight.w700,
                          color: AppDesignSystem.success,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Control total de tu dinero: ingresos, egresos y balance general de todas las áreas del negocio en tiempo real.',
                        style: AppDesignSystem.bodySm().copyWith(
                          color: AppDesignSystem.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        // Panel de estadísticas principal
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ModernCard(
            glassMorphism: true,
            opacity: 0.95,
            borderColor: AppDesignSystem.success.withOpacity(0.3),
            child: Column(
              children: [
                Text(
                  'Dashboard Financiero',
                  style: AppDesignSystem.headingSm().copyWith(
                    color: AppDesignSystem.success,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: _buildStatCard(
                        'Ingresos',
                        _totalIngresos,
                        AppDesignSystem.success,
                        Icons.trending_up_rounded,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildStatCard(
                        'Egresos',
                        _totalEgresos,
                        AppDesignSystem.error,
                        Icons.trending_down_rounded,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors:
                          _saldoNeto >= 0
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
                          _saldoNeto >= 0
                              ? AppDesignSystem.success
                              : AppDesignSystem.error,
                      width: 2,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            _saldoNeto >= 0
                                ? Icons.account_balance_rounded
                                : Icons.warning_rounded,
                            color:
                                _saldoNeto >= 0
                                    ? AppDesignSystem.success
                                    : AppDesignSystem.error,
                            size: 24,
                          ),
                          const SizedBox(width: 12),
                          Text(
                            'Saldo Neto Total:',
                            style: AppDesignSystem.bodyMd().copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '\$${_saldoNeto.toStringAsFixed(2)}',
                        style: AppDesignSystem.headingSm().copyWith(
                          color:
                              _saldoNeto >= 0
                                  ? AppDesignSystem.success
                                  : AppDesignSystem.error,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        // Panel de búsqueda y filtros
        Padding(
          padding: const EdgeInsets.all(16),
          child: ModernCard(
            glassMorphism: true,
            opacity: 0.9,
            borderColor: AppDesignSystem.electricBlue.withOpacity(0.2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.search_rounded,
                      color: AppDesignSystem.electricBlue,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Buscar Movimientos',
                      style: AppDesignSystem.bodyMd().copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppDesignSystem.electricBlue,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                FashionTextField(
                  controller: _searchController,
                  hint: 'Buscar por descripción o categoría...',
                  prefixIcon: Icons.receipt_rounded,
                  suffixIcon: Icons.clear_rounded,
                  onSuffixIconTap: () {
                    _searchController.clear();
                    setState(() {});
                  },
                ),
                const SizedBox(height: 16),
                Text(
                  'Filtros rápidos',
                  style: AppDesignSystem.bodySm().copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppDesignSystem.textSecondary,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    FashionChip(
                      label: 'Todos',
                      isSelected: _filtroSeleccionado == 'Todos',
                      onTap: () => _setFilter('Todos'),
                      icon: Icons.all_inclusive_rounded,
                    ),
                    const SizedBox(width: 8),
                    FashionChip(
                      label: 'Ingresos',
                      isSelected: _filtroSeleccionado == 'Ingresos',
                      onTap: () => _setFilter('Ingresos'),
                      icon: Icons.trending_up_rounded,
                      selectedColor: AppDesignSystem.success,
                    ),
                    const SizedBox(width: 8),
                    FashionChip(
                      label: 'Egresos',
                      isSelected: _filtroSeleccionado == 'Egresos',
                      onTap: () => _setFilter('Egresos'),
                      icon: Icons.trending_down_rounded,
                      selectedColor: AppDesignSystem.error,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        // Lista de movimientos
        Expanded(
          child:
              _isLoading
                  ? const FashionLoader(
                    message: 'Cargando datos financieros...',
                    size: 60,
                  )
                  : _flujosFiltrados.isEmpty
                  ? _buildEmptyState()
                  : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: _flujosFiltrados.length,
                    itemBuilder: (context, index) {
                      final flujo = _flujosFiltrados[index];
                      return TweenAnimationBuilder<double>(
                        duration: Duration(milliseconds: 300 + (index * 100)),
                        tween: Tween(begin: 0.0, end: 1.0),
                        builder: (context, value, child) {
                          return Transform.scale(
                            scale: value,
                            child: Opacity(
                              opacity: value,
                              child: _buildMovimientoCard(flujo),
                            ),
                          );
                        },
                      );
                    },
                  ),
        ),
      ],
    );
  }

  Widget _buildGastosFijosTab() {
    return Column(
      children: [
        // Descripción moderna
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ModernCard(
            glassMorphism: true,
            opacity: 0.9,
            borderColor: AppDesignSystem.warning.withOpacity(0.3),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppDesignSystem.warning,
                        AppDesignSystem.sunsetOrange,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.receipt_long_rounded,
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
                        'Gestión de Gastos Fijos',
                        style: AppDesignSystem.bodyMd().copyWith(
                          fontWeight: FontWeight.w700,
                          color: AppDesignSystem.warning,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Controla alquiler, servicios, sueldos y otros gastos recurrentes. Programa pagos automáticos y mantén el control total.',
                        style: AppDesignSystem.bodySm().copyWith(
                          color: AppDesignSystem.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        // Vista de gastos fijos modernizada
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: ModernCard(
              glassMorphism: true,
              opacity: 0.95,
              padding: const EdgeInsets.all(8),
              child: const FixedExpensesView(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFlujoCajaTab() {
    return Column(
      children: [
        // Descripción moderna
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ModernCard(
            glassMorphism: true,
            opacity: 0.9,
            borderColor: AppDesignSystem.purpleHaze.withOpacity(0.3),
            child: Row(
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
                    Icons.swap_vert_rounded,
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
                        'Control de Flujo de Caja',
                        style: AppDesignSystem.bodyMd().copyWith(
                          fontWeight: FontWeight.w700,
                          color: AppDesignSystem.purpleHaze,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Monitorea el efectivo disponible, registra movimientos diarios y mantiene el historial completo de caja física.',
                        style: AppDesignSystem.bodySm().copyWith(
                          color: AppDesignSystem.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        // Resumen de flujo de caja con estadísticas
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ModernCard(
            glassMorphism: true,
            opacity: 0.95,
            borderColor: AppDesignSystem.purpleHaze.withOpacity(0.3),
            child: Column(
              children: [
                Text(
                  'Resumen de Flujo de Caja',
                  style: AppDesignSystem.headingSm().copyWith(
                    color: AppDesignSystem.purpleHaze,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: _buildStatCard(
                        'Ingresos Caja',
                        _totalIngresos,
                        AppDesignSystem.success,
                        Icons.trending_up_rounded,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildStatCard(
                        'Egresos Caja',
                        _totalEgresos,
                        AppDesignSystem.error,
                        Icons.trending_down_rounded,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppDesignSystem.purpleHaze.withOpacity(0.1),
                        AppDesignSystem.electricBlue.withOpacity(0.1),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: AppDesignSystem.purpleHaze,
                      width: 2,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.account_balance_wallet_rounded,
                            color: AppDesignSystem.purpleHaze,
                            size: 24,
                          ),
                          const SizedBox(width: 12),
                          Text(
                            'Efectivo Disponible:',
                            style: AppDesignSystem.bodyMd().copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '\$${_saldoNeto.toStringAsFixed(2)}',
                        style: AppDesignSystem.headingSm().copyWith(
                          color: AppDesignSystem.purpleHaze,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 16),

        // Lista de movimientos de caja
        Expanded(
          child:
              _isLoading
                  ? const FashionLoader(
                    message: 'Cargando flujo de caja...',
                    size: 60,
                  )
                  : _flujosFiltrados.isEmpty
                  ? _buildEmptyState()
                  : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: _flujosFiltrados.length,
                    itemBuilder: (context, index) {
                      final flujo = _flujosFiltrados[index];
                      return TweenAnimationBuilder<double>(
                        duration: Duration(milliseconds: 300 + (index * 100)),
                        tween: Tween(begin: 0.0, end: 1.0),
                        builder: (context, value, child) {
                          return Transform.scale(
                            scale: value,
                            child: Opacity(
                              opacity: value,
                              child: _buildMovimientoCard(flujo),
                            ),
                          );
                        },
                      );
                    },
                  ),
        ),
      ],
    );
  }

  void _setFilter(String filter) {
    setState(() {
      _filtroSeleccionado = filter;
    });
  }

  Widget _buildStatCard(
    String title,
    double amount,
    Color color,
    IconData icon,
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
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(height: 8),
          Text(
            '\$${amount.toStringAsFixed(2)}',
            style: AppDesignSystem.bodyMd().copyWith(
              color: color,
              fontWeight: FontWeight.w800,
            ),
          ),
          Text(
            title,
            style: AppDesignSystem.bodySm().copyWith(
              color: AppDesignSystem.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppDesignSystem.success.withOpacity(0.1),
                  AppDesignSystem.electricBlue.withOpacity(0.1),
                ],
              ),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Icon(
              Icons.account_balance_wallet_outlined,
              size: 80,
              color: AppDesignSystem.success.withOpacity(0.6),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'No hay movimientos registrados',
            style: AppDesignSystem.headingMd().copyWith(
              color: AppDesignSystem.textPrimary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Comienza a registrar tus movimientos financieros para un mejor control',
            style: AppDesignSystem.bodyMd().copyWith(
              color: AppDesignSystem.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          FashionButton(
            text: 'Nuevo Movimiento',
            icon: Icons.add_rounded,
            onPressed: () => context.push('/finanzas/add-flujo'),
            style: FashionButtonStyle.primary,
          ),
        ],
      ),
    );
  }

  Widget _buildMovimientoCard(FlujoCaja flujo) {
    final isIngreso = flujo.tipo == 'ingreso';
    final statusColor =
        isIngreso ? AppDesignSystem.success : AppDesignSystem.error;
    final statusIcon =
        isIngreso ? Icons.trending_up_rounded : Icons.trending_down_rounded;

    return ModernCard(
      margin: const EdgeInsets.only(bottom: 12),
      glassMorphism: true,
      opacity: 0.95,
      borderColor: statusColor.withOpacity(0.3),
      boxShadow: [
        BoxShadow(
          color: statusColor.withOpacity(0.2),
          blurRadius: 12,
          offset: const Offset(0, 4),
        ),
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header del movimiento
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(statusIcon, color: statusColor, size: 20),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      flujo.descripcion ?? 'Sin descripción',
                      style: AppDesignSystem.bodyMd().copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppDesignSystem.textPrimary,
                      ),
                    ),
                    Text(
                      flujo.categoria,
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
                      statusColor.withOpacity(0.1),
                      statusColor.withOpacity(0.2),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: statusColor.withOpacity(0.3),
                    width: 1,
                  ),
                ),
                child: Text(
                  '\$${flujo.monto.toStringAsFixed(2)}',
                  style: AppDesignSystem.bodyMd().copyWith(
                    fontWeight: FontWeight.w800,
                    color: statusColor,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Información adicional
          Row(
            children: [
              Icon(
                Icons.calendar_today_rounded,
                size: 16,
                color: AppDesignSystem.textSecondary,
              ),
              const SizedBox(width: 6),
              Text(
                '${flujo.fecha.day.toString().padLeft(2, '0')}/${flujo.fecha.month.toString().padLeft(2, '0')}/${flujo.fecha.year}',
                style: AppDesignSystem.bodySm().copyWith(
                  color: AppDesignSystem.textSecondary,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color:
                      isIngreso
                          ? AppDesignSystem.success.withOpacity(0.1)
                          : AppDesignSystem.error.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  isIngreso ? 'INGRESO' : 'EGRESO',
                  style: AppDesignSystem.bodySm().copyWith(
                    color: statusColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 10,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
