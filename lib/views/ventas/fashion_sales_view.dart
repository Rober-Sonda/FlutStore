import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:isar/isar.dart';
import '../../src/app_routes.dart';
import '../../models/venta.dart';
import '../../models/cliente.dart';
import '../../services/isar_service.dart';
import '../../widgets/permission_widget.dart';
import '../../widgets/fashion_components.dart';
import '../../widgets/app_design_system.dart';
import '../../components/shared/professional_app_bar.dart';
import 'dialogs/return_sale_dialog.dart';

class FashionSalesView extends ConsumerStatefulWidget {
  const FashionSalesView({super.key});

  @override
  ConsumerState<FashionSalesView> createState() => _FashionSalesViewState();
}

class _FashionSalesViewState extends ConsumerState<FashionSalesView>
    with TickerProviderStateMixin {
  bool _isLoading = false;
  String _filtroSeleccionado = 'Todas';
  List<Venta> _ventas = [];
  List<Cliente> _clientes = [];

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
      duration: const Duration(milliseconds: 1000),
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
      _ventas = await isar.ventas.where().sortByFecha().findAll();
      _clientes = await isar.clientes.where().findAll();

      setState(() => _isLoading = false);
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

  List<Venta> get _ventasFiltradas {
    List<Venta> filtradas = _ventas;

    // Filtrar por búsqueda
    if (_searchController.text.isNotEmpty) {
      final query = _searchController.text.toLowerCase();
      filtradas =
          filtradas.where((venta) {
            final numeroFactura = (venta.numeroFactura ?? '').toLowerCase();
            final cliente =
                _obtenerNombreCliente(venta.clienteId ?? 0).toLowerCase();
            return numeroFactura.contains(query) || cliente.contains(query);
          }).toList();
    }

    // Filtrar por estado
    switch (_filtroSeleccionado) {
      case 'Pendientes':
        return filtradas.where((v) => v.estado == 'pendiente').toList();
      case 'Completadas':
        return filtradas.where((v) => v.estado == 'completada').toList();
      case 'Canceladas':
        return filtradas.where((v) => v.estado == 'cancelada').toList();
      case 'Devoluciones':
        return filtradas.where((v) => v.esDevolucion).toList();
      default:
        return filtradas;
    }
  }

  double get _totalVentas => _ventas.fold(0.0, (sum, v) => sum + v.total);

  String _obtenerNombreCliente(int clienteId) {
    final cliente = _clientes.firstWhere(
      (c) => c.id == clienteId,
      orElse: () => Cliente(id: 0, nombre: 'Cliente no encontrado'),
    );
    return cliente.nombre;
  }

  @override
  Widget build(BuildContext context) {
    return FashionScaffold(
      backgroundTags: const ['urbano', 'personalidad', 'casual'],
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
                  // Header moderno con glassmorphismo
                  ModernCard(
                    margin: const EdgeInsets.all(0),
                    borderRadius: 0,
                    glassMorphism: true,
                    opacity: 0.9,
                    child: ProfessionalAppBar(
                      title: '💰 Ventas & Transacciones',
                      actions: [
                        PermissionWidget(
                          resource: 'ventas',
                          action: 'create',
                          child: FashionButton(
                            text: 'Nueva Venta',
                            icon: Icons.add_shopping_cart_rounded,
                            style: FashionButtonStyle.primary,
                            onPressed: () => context.push(AppRoutes.saleAdd),
                          ),
                        ),
                        const SizedBox(width: 16),
                      ],
                    ),
                  ),

                  // Descripción moderna con estética juvenil
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ModernCard(
                      glassMorphism: true,
                      opacity: 0.9,
                      borderColor: AppDesignSystem.vibrantPink.withOpacity(0.3),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  AppDesignSystem.vibrantPink,
                                  AppDesignSystem.electricBlue,
                                ],
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.analytics_rounded,
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
                                  'Control Total de Ventas',
                                  style: AppDesignSystem.bodyMd().copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: AppDesignSystem.vibrantPink,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Gestiona todas las transacciones de tu negocio con estilo. Analiza rendimiento, controla inventario y maximiza ganancias.',
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

                  // Panel de búsqueda y filtros modernos
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ModernCard(
                      glassMorphism: true,
                      opacity: 0.92,
                      borderColor: AppDesignSystem.electricBlue.withOpacity(
                        0.2,
                      ),
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
                                'Buscar y Filtrar Ventas',
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
                            hint: 'Buscar por cliente, número de venta...',
                            prefixIcon: Icons.receipt_long_rounded,
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
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                FashionChip(
                                  label: 'Todas',
                                  isSelected: _filtroSeleccionado == 'Todas',
                                  onTap: () => _setFilter('Todas'),
                                  icon: Icons.all_inclusive_rounded,
                                ),
                                const SizedBox(width: 8),
                                FashionChip(
                                  label: 'Completadas',
                                  isSelected:
                                      _filtroSeleccionado == 'Completadas',
                                  onTap: () => _setFilter('Completadas'),
                                  icon: Icons.check_circle_rounded,
                                  selectedColor: AppDesignSystem.success,
                                ),
                                const SizedBox(width: 8),
                                FashionChip(
                                  label: 'Pendientes',
                                  isSelected:
                                      _filtroSeleccionado == 'Pendientes',
                                  onTap: () => _setFilter('Pendientes'),
                                  icon: Icons.schedule_rounded,
                                  selectedColor: AppDesignSystem.warning,
                                ),
                                const SizedBox(width: 8),
                                FashionChip(
                                  label: 'Canceladas',
                                  isSelected:
                                      _filtroSeleccionado == 'Canceladas',
                                  onTap: () => _setFilter('Canceladas'),
                                  icon: Icons.cancel_rounded,
                                  selectedColor: AppDesignSystem.error,
                                ),
                                const SizedBox(width: 8),
                                FashionChip(
                                  label: 'Devoluciones',
                                  isSelected:
                                      _filtroSeleccionado == 'Devoluciones',
                                  onTap: () => _setFilter('Devoluciones'),
                                  icon: Icons.undo_rounded,
                                  selectedColor: AppDesignSystem.purpleHaze,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Estadísticas juveniles
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Expanded(
                          child: _buildStatCard(
                            'Total Ventas',
                            _ventas.length.toString(),
                            Icons.point_of_sale_rounded,
                            AppDesignSystem.vibrantPink,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildStatCard(
                            'Ventas Hoy',
                            _ventas
                                .where(
                                  (v) => v.fecha.isAfter(
                                    DateTime.now().subtract(
                                      const Duration(days: 1),
                                    ),
                                  ),
                                )
                                .length
                                .toString(),
                            Icons.today_rounded,
                            AppDesignSystem.electricBlue,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildStatCard(
                            'Ingresos',
                            '\$${_totalVentas.toStringAsFixed(2)}',
                            Icons.monetization_on_rounded,
                            AppDesignSystem.success,
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
                              message: 'Cargando ventas con estilo...',
                              size: 60,
                            )
                            : _ventasFiltradas.isEmpty
                            ? _buildEmptyState()
                            : ListView.builder(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              itemCount: _ventasFiltradas.length,
                              itemBuilder: (context, index) {
                                final venta = _ventasFiltradas[index];
                                return TweenAnimationBuilder<double>(
                                  duration: Duration(
                                    milliseconds: 300 + (index * 100),
                                  ),
                                  tween: Tween(begin: 0.0, end: 1.0),
                                  builder: (context, value, child) {
                                    return Transform.scale(
                                      scale: value,
                                      child: Opacity(
                                        opacity: value,
                                        child: _buildVentaCard(venta),
                                      ),
                                    );
                                  },
                                );
                              },
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

  void _setFilter(String filter) {
    setState(() {
      _filtroSeleccionado = filter;
    });
  }

  Widget _buildStatCard(
    String title,
    String value,
    IconData icon,
    Color color,
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
            value,
            style: AppDesignSystem.headingSm().copyWith(
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
                  AppDesignSystem.vibrantPink.withOpacity(0.1),
                  AppDesignSystem.electricBlue.withOpacity(0.1),
                ],
              ),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Icon(
              Icons.point_of_sale_outlined,
              size: 80,
              color: AppDesignSystem.vibrantPink.withOpacity(0.6),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'No hay ventas registradas',
            style: AppDesignSystem.headingMd().copyWith(
              color: AppDesignSystem.textPrimary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Comienza a registrar ventas para hacer crecer tu negocio',
            style: AppDesignSystem.bodyMd().copyWith(
              color: AppDesignSystem.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          FashionButton(
            text: 'Nueva Venta',
            icon: Icons.add_shopping_cart_rounded,
            onPressed: () => context.push(AppRoutes.saleAdd),
            style: FashionButtonStyle.primary,
          ),
        ],
      ),
    );
  }

  Widget _buildVentaCard(Venta venta) {
    final statusColor = _getColorEstado(venta.estado);
    final statusIcon = _getIconEstado(venta.estado);

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
          // Header de la venta
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
                      'Venta #${venta.numeroFactura ?? venta.id.toString()}',
                      style: AppDesignSystem.bodyMd().copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppDesignSystem.textPrimary,
                      ),
                    ),
                    Text(
                      'Cliente: ${_obtenerNombreCliente(venta.clienteId ?? 0)}',
                      style: AppDesignSystem.bodySm().copyWith(
                        color: AppDesignSystem.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              if (venta.esDevolucion)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppDesignSystem.error.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppDesignSystem.error),
                  ),
                  child: Text(
                    'DEVOLUCIÓN',
                    style: AppDesignSystem.bodySm().copyWith(
                      color: AppDesignSystem.error,
                      fontWeight: FontWeight.w600,
                      fontSize: 10,
                    ),
                  ),
                ),
            ],
          ),

          const SizedBox(height: 12),

          // Información de la venta
          Row(
            children: [
              Expanded(
                child: _buildInfoItem(
                  'Total',
                  '\$${venta.total.toStringAsFixed(2)}',
                  Icons.monetization_on_rounded,
                  AppDesignSystem.success,
                ),
              ),
              Expanded(
                child: _buildInfoItem(
                  'Fecha',
                  _formatearFecha(venta.fecha),
                  Icons.calendar_today_rounded,
                  AppDesignSystem.textSecondary,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Acciones
          Row(
            children: [
              Expanded(
                child: FashionButton(
                  text: 'Ver Detalles',
                  icon: Icons.visibility_rounded,
                  style: FashionButtonStyle.ghost,
                  onPressed:
                      () => context.push('${AppRoutes.saleEdit}/${venta.id}'),
                ),
              ),
              const SizedBox(width: 8),
              if (!venta.esDevolucion)
                Expanded(
                  child: FashionButton(
                    text: 'Devolución',
                    icon: Icons.undo_rounded,
                    style: FashionButtonStyle.outlined,
                    onPressed: () => _mostrarDialogoDevolucion(venta),
                  ),
                ),
              if (!venta.esDevolucion) const SizedBox(width: 8),
              FashionButton(
                text: '',
                icon: Icons.delete_rounded,
                style: FashionButtonStyle.error,
                onPressed: () => _confirmarEliminarVenta(venta),
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
        const SizedBox(width: 6),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: AppDesignSystem.bodySm().copyWith(
                  color: AppDesignSystem.textSecondary,
                ),
              ),
              Text(
                value,
                style: AppDesignSystem.bodyMd().copyWith(
                  color: color,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Color _getColorEstado(String estado) {
    switch (estado) {
      case 'completada':
        return AppDesignSystem.success;
      case 'pendiente':
        return AppDesignSystem.warning;
      case 'cancelada':
        return AppDesignSystem.error;
      default:
        return AppDesignSystem.textSecondary;
    }
  }

  IconData _getIconEstado(String estado) {
    switch (estado) {
      case 'completada':
        return Icons.check_circle_rounded;
      case 'pendiente':
        return Icons.schedule_rounded;
      case 'cancelada':
        return Icons.cancel_rounded;
      default:
        return Icons.help_rounded;
    }
  }

  String _formatearFecha(DateTime fecha) {
    return '${fecha.day.toString().padLeft(2, '0')}/${fecha.month.toString().padLeft(2, '0')}/${fecha.year}';
  }

  void _mostrarDialogoDevolucion(Venta venta) {
    showDialog(
      context: context,
      builder: (context) => ReturnSaleDialog(venta: venta),
    ).then((_) => _loadData());
  }

  void _confirmarEliminarVenta(Venta venta) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            backgroundColor:
                AppDesignSystem.isDark
                    ? AppDesignSystem.darkSurface
                    : Colors.white,
            title: Text(
              'Confirmar eliminación',
              style: AppDesignSystem.headingSm().copyWith(
                color: AppDesignSystem.error,
              ),
            ),
            content: Text(
              '¿Está seguro de eliminar la venta #${venta.numeroFactura ?? venta.id}?',
              style: AppDesignSystem.bodyMd(),
            ),
            actions: [
              FashionButton(
                text: 'Cancelar',
                style: FashionButtonStyle.ghost,
                onPressed: () => Navigator.of(context).pop(),
              ),
              FashionButton(
                text: 'Eliminar',
                style: FashionButtonStyle.error,
                onPressed: () async {
                  try {
                    final isar = await ref.read(isarServiceProvider).db;
                    await isar.writeTxn(() async {
                      await isar.ventas.delete(venta.id);
                    });
                    Navigator.of(context).pop();
                    _loadData();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('Venta eliminada exitosamente'),
                        backgroundColor: AppDesignSystem.success,
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    );
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Error al eliminar venta: $e'),
                        backgroundColor: AppDesignSystem.error,
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
    );
  }
}
