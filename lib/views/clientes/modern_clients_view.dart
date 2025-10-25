import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../src/app_routes.dart';
import '../../widgets/app_design_system.dart';
import '../../widgets/app_widgets.dart';
import '../../widgets/permission_widget.dart';
import '../../providers/clientes_provider.dart';
import '../../models/cliente.dart';

class ModernClientsView extends ConsumerStatefulWidget {
  const ModernClientsView({super.key});

  @override
  ConsumerState<ModernClientsView> createState() => _ModernClientsViewState();
}

class _ModernClientsViewState extends ConsumerState<ModernClientsView> {
  String _searchQuery = '';
  String _selectedFilter = 'Todos';
  bool _isListView = true;

  final List<String> _filterOptions = [
    'Todos',
    'Activos',
    'VIP',
    'Morosos',
    'Nuevos',
  ];

  @override
  Widget build(BuildContext context) {
    final clientesAsync = ref.watch(clientesProvider);

    return Scaffold(
      backgroundColor: AppDesignSystem.background,
      body: Column(
        children: [
          // Header de la sección
          _buildSectionHeader(),

          // Barra de búsqueda y filtros
          _buildSearchAndFilters(),

          // Contenido principal
          Expanded(
            child: clientesAsync.when(
              data: (clientes) => _buildClientsContent(clientes),
              loading:
                  () =>
                      AppWidgets.loadingState(message: 'Cargando clientes...'),
              error:
                  (error, _) => AppWidgets.errorState(
                    title: 'Error al cargar clientes',
                    message: error.toString(),
                    actionText: 'Reintentar',
                    onActionPressed: () => ref.refresh(clientesProvider),
                  ),
            ),
          ),
        ],
      ),
      floatingActionButton: PermissionWidget(
        resource: 'clientes',
        action: 'crear',
        child: FloatingActionButton.extended(
          onPressed: () => context.push(AppRoutes.clientAdd),
          backgroundColor: AppDesignSystem.primaryBlue,
          foregroundColor: AppDesignSystem.textPrimary,
          icon: const Icon(Icons.person_add),
          label: const Text('Nuevo Cliente'),
        ),
      ),
    );
  }

  Widget _buildSectionHeader() {
    return AppWidgets.primaryCard(
      margin: const EdgeInsets.all(AppDesignSystem.spaceMd),
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          AppDesignSystem.info.withValues(alpha: 0.1),
          AppDesignSystem.info.withValues(alpha: 0.05),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(AppDesignSystem.spaceMd),
            decoration: BoxDecoration(
              color: AppDesignSystem.info.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(AppDesignSystem.radiusMd),
            ),
            child: Icon(
              Icons.people_rounded,
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
                  'Gestión de Clientes',
                  style: AppDesignSystem.headingLg().copyWith(
                    color: AppDesignSystem.textPrimary,
                  ),
                ),
                const SizedBox(height: AppDesignSystem.spaceXs),
                Text(
                  'Administra tu base de clientes, mantén actualizada su información y mejora la atención personalizada.',
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

  Widget _buildSearchAndFilters() {
    return AppWidgets.primaryCard(
      margin: const EdgeInsets.symmetric(horizontal: AppDesignSystem.spaceMd),
      child: Column(
        children: [
          // Barra de búsqueda
          Row(
            children: [
              Expanded(
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
                      hintText: 'Buscar por nombre, email o teléfono...',
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
              // Toggle de vista
              Container(
                decoration: BoxDecoration(
                  color: AppDesignSystem.surfaceLight.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(AppDesignSystem.radiusMd),
                  border: Border.all(
                    color: AppDesignSystem.textMuted.withValues(alpha: 0.2),
                    width: 1,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildViewToggleButton(
                      icon: Icons.view_list,
                      isSelected: _isListView,
                      onTap: () => setState(() => _isListView = true),
                    ),
                    _buildViewToggleButton(
                      icon: Icons.grid_view,
                      isSelected: !_isListView,
                      onTap: () => setState(() => _isListView = false),
                    ),
                  ],
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
                  _filterOptions.map((filter) {
                    final isSelected = _selectedFilter == filter;
                    return Padding(
                      padding: const EdgeInsets.only(
                        right: AppDesignSystem.spaceSm,
                      ),
                      child: GestureDetector(
                        onTap: () => setState(() => _selectedFilter = filter),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppDesignSystem.spaceMd,
                            vertical: AppDesignSystem.spaceSm,
                          ),
                          decoration: BoxDecoration(
                            color:
                                isSelected
                                    ? AppDesignSystem.primaryBlue
                                    : Colors.transparent,
                            borderRadius: BorderRadius.circular(
                              AppDesignSystem.radiusMd,
                            ),
                            border: Border.all(
                              color:
                                  isSelected
                                      ? AppDesignSystem.primaryBlue
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

  Widget _buildViewToggleButton({
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(AppDesignSystem.spaceSm),
        decoration: BoxDecoration(
          color:
              isSelected
                  ? AppDesignSystem.primaryBlue.withValues(alpha: 0.2)
                  : Colors.transparent,
          borderRadius: BorderRadius.circular(AppDesignSystem.radiusSm),
        ),
        child: Icon(
          icon,
          size: 20,
          color:
              isSelected
                  ? AppDesignSystem.primaryBlue
                  : AppDesignSystem.textMuted,
        ),
      ),
    );
  }

  Widget _buildClientsContent(List<Cliente> clientes) {
    final filteredClientes = _filterClientes(clientes);

    if (filteredClientes.isEmpty) {
      return AppWidgets.emptyState(
        icon: Icons.people_outline,
        title:
            _searchQuery.isNotEmpty || _selectedFilter != 'Todos'
                ? 'No se encontraron clientes'
                : 'No hay clientes registrados',
        message:
            _searchQuery.isNotEmpty || _selectedFilter != 'Todos'
                ? 'Intenta ajustar los filtros o la búsqueda.'
                : 'Comienza agregando tu primer cliente para gestionar mejor tu negocio.',
        actionText: 'Agregar Cliente',
        onActionPressed: () => context.push(AppRoutes.clientAdd),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(AppDesignSystem.spaceMd),
      child:
          _isListView
              ? _buildListView(filteredClientes)
              : _buildGridView(filteredClientes),
    );
  }

  Widget _buildListView(List<Cliente> clientes) {
    return ListView.builder(
      itemCount: clientes.length,
      itemBuilder: (context, index) {
        final cliente = clientes[index];
        return _buildClientCard(cliente, isGrid: false);
      },
    );
  }

  Widget _buildGridView(List<Cliente> clientes) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount:
            MediaQuery.of(context).size.width > 1200
                ? 4
                : MediaQuery.of(context).size.width > 800
                ? 3
                : 2,
        crossAxisSpacing: AppDesignSystem.spaceMd,
        mainAxisSpacing: AppDesignSystem.spaceMd,
        childAspectRatio: MediaQuery.of(context).size.width < 768 ? 0.85 : 1.0,
      ),
      itemCount: clientes.length,
      itemBuilder: (context, index) {
        final cliente = clientes[index];
        return _buildClientCard(cliente, isGrid: true);
      },
    );
  }

  Widget _buildClientCard(Cliente cliente, {required bool isGrid}) {
    return AppWidgets.primaryCard(
      margin: EdgeInsets.only(bottom: isGrid ? 0 : AppDesignSystem.spaceMd),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header del cliente
          Row(
            children: [
              // Avatar
              CircleAvatar(
                radius: isGrid ? 20 : 24,
                backgroundColor: AppDesignSystem.info.withValues(alpha: 0.2),
                child: Text(
                  _getClientInitials(cliente.nombre),
                  style: AppDesignSystem.bodyMd().copyWith(
                    color: AppDesignSystem.info,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(width: AppDesignSystem.spaceMd),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cliente.nombre,
                      style: AppDesignSystem.headingSm().copyWith(
                        color: AppDesignSystem.textPrimary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (cliente.email != null) ...[
                      const SizedBox(height: AppDesignSystem.spaceXs),
                      Text(
                        cliente.email!,
                        style: AppDesignSystem.bodySm().copyWith(
                          color: AppDesignSystem.textSecondary,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ],
                ),
              ),

              // Status
              AppWidgets.statusChip(
                label: _getClientStatus(cliente),
                color: _getClientStatusColor(cliente),
                icon: _getClientStatusIcon(cliente),
              ),
            ],
          ),

          if (!isGrid) ...[
            const SizedBox(height: AppDesignSystem.spaceMd),

            // Información adicional para vista de lista
            Row(
              children: [
                if (cliente.telefono != null) ...[
                  Icon(Icons.phone, size: 16, color: AppDesignSystem.textMuted),
                  const SizedBox(width: AppDesignSystem.spaceXs),
                  Text(
                    cliente.telefono!,
                    style: AppDesignSystem.bodySm().copyWith(
                      color: AppDesignSystem.textSecondary,
                    ),
                  ),
                  const SizedBox(width: AppDesignSystem.spaceLg),
                ],

                Icon(
                  Icons.calendar_today,
                  size: 16,
                  color: AppDesignSystem.textMuted,
                ),
                const SizedBox(width: AppDesignSystem.spaceXs),
                Text(
                  _formatDate(cliente.fechaRegistro),
                  style: AppDesignSystem.bodySm().copyWith(
                    color: AppDesignSystem.textSecondary,
                  ),
                ),
              ],
            ),
          ],

          const SizedBox(height: AppDesignSystem.spaceMd),

          // Acciones
          Row(
            children: [
              Expanded(
                child: AppWidgets.secondaryButton(
                  text: 'Ver Detalles',
                  icon: Icons.visibility,
                  onPressed: () => _viewClientDetails(cliente),
                ),
              ),
              const SizedBox(width: AppDesignSystem.spaceSm),

              PermissionWidget(
                resource: 'clientes',
                action: 'editar',
                child: IconButton(
                  onPressed:
                      () =>
                          context.push('${AppRoutes.clientEdit}/${cliente.id}'),
                  icon: const Icon(Icons.edit),
                  color: AppDesignSystem.primaryBlue,
                  tooltip: 'Editar cliente',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<Cliente> _filterClientes(List<Cliente> clientes) {
    var filtered = clientes;

    // Filtrar por búsqueda
    if (_searchQuery.isNotEmpty) {
      filtered =
          filtered.where((cliente) {
            final query = _searchQuery.toLowerCase();
            return (cliente.nombre.toLowerCase().contains(query)) ||
                (cliente.email?.toLowerCase().contains(query) ?? false) ||
                (cliente.telefono?.contains(query) ?? false);
          }).toList();
    }

    // Filtrar por categoría
    switch (_selectedFilter) {
      case 'Activos':
        // Lógica para clientes activos
        break;
      case 'VIP':
        // Lógica para clientes VIP
        break;
      case 'Morosos':
        // Lógica para clientes morosos
        break;
      case 'Nuevos':
        // Filtrar clientes registrados en los últimos 30 días
        final thirtyDaysAgo = DateTime.now().subtract(const Duration(days: 30));
        filtered =
            filtered.where((cliente) {
              return cliente.fechaRegistro?.isAfter(thirtyDaysAgo) ?? false;
            }).toList();
        break;
    }

    return filtered;
  }

  String _getClientInitials(String name) {
    final parts = name.trim().split(' ');
    if (parts.length >= 2) {
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    }
    return parts[0].isNotEmpty ? parts[0][0].toUpperCase() : 'C';
  }

  String _getClientStatus(Cliente cliente) {
    // Lógica para determinar el estado del cliente
    return 'Activo';
  }

  Color _getClientStatusColor(Cliente cliente) {
    // Lógica para determinar el color del estado
    return AppDesignSystem.success;
  }

  IconData _getClientStatusIcon(Cliente cliente) {
    // Lógica para determinar el ícono del estado
    return Icons.check_circle;
  }

  String _formatDate(DateTime? date) {
    if (date == null) return 'Fecha desconocida';
    final now = DateTime.now();
    final diff = now.difference(date);

    if (diff.inDays == 0) return 'Hoy';
    if (diff.inDays == 1) return 'Ayer';
    if (diff.inDays < 30) return 'Hace ${diff.inDays} días';
    if (diff.inDays < 365) return 'Hace ${(diff.inDays / 30).floor()} meses';
    return 'Hace ${(diff.inDays / 365).floor()} años';
  }

  void _viewClientDetails(Cliente cliente) {
    showDialog(
      context: context,
      builder:
          (context) => Dialog(
            backgroundColor: AppDesignSystem.surface,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppDesignSystem.radiusLg),
            ),
            child: Padding(
              padding: const EdgeInsets.all(AppDesignSystem.spaceLg),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Detalles del Cliente',
                    style: AppDesignSystem.headingMd().copyWith(
                      color: AppDesignSystem.textPrimary,
                    ),
                  ),
                  const SizedBox(height: AppDesignSystem.spaceLg),

                  _buildDetailRow(
                    'Nombre',
                    cliente.nombre.isEmpty ? 'No especificado' : cliente.nombre,
                  ),
                  _buildDetailRow('Email', cliente.email ?? 'No especificado'),
                  _buildDetailRow(
                    'Teléfono',
                    cliente.telefono ?? 'No especificado',
                  ),
                  _buildDetailRow(
                    'Dirección',
                    cliente.direccion ?? 'No especificada',
                  ),
                  _buildDetailRow(
                    'Fecha de Registro',
                    _formatDate(cliente.fechaRegistro),
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
                        text: 'Editar',
                        icon: Icons.edit,
                        onPressed: () {
                          Navigator.of(context).pop();
                          context.push('${AppRoutes.clientEdit}/${cliente.id}');
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
            width: 120,
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
