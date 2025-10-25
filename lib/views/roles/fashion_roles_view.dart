import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/rol.dart';
import '../../services/isar_service.dart';
import '../../widgets/permission_widget.dart';
import '../../widgets/fashion_components.dart';
import '../../widgets/app_design_system.dart';
import '../../components/shared/professional_app_bar.dart';

class FashionRolesView extends ConsumerStatefulWidget {
  const FashionRolesView({super.key});

  @override
  ConsumerState<FashionRolesView> createState() => _FashionRolesViewState();
}

class _FashionRolesViewState extends ConsumerState<FashionRolesView>
    with TickerProviderStateMixin {
  List<Rol> _roles = [];
  bool _isLoading = true;

  late AnimationController _fadeController;
  late AnimationController _slideController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  final TextEditingController _searchController = TextEditingController();

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

    _loadRoles();

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

  Future<void> _loadRoles() async {
    try {
      setState(() => _isLoading = true);

      // TODO: Fix Isar query - temporary workaround
      final roles = <Rol>[];

      setState(() {
        _roles = roles;
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error al cargar roles: $e'),
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

  List<Rol> get _rolesFiltrados {
    if (_searchController.text.isEmpty) return _roles;

    final query = _searchController.text.toLowerCase();
    return _roles.where((role) {
      return role.nombre.toLowerCase().contains(query) ||
          (role.descripcion?.toLowerCase().contains(query) ?? false);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return PermissionWidget(
      action: 'view',
      resource: 'roles',
      child: FashionScaffold(
        backgroundTags: const ['personalidad', 'elegante', 'urbano'],
        overlayOpacity: 0.83,
        showBackgroundRotation: true,
        rotationInterval: const Duration(minutes: 6),
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
                            title: '👥 Gestión de Roles',
                            actions: [
                              FashionButton(
                                text: 'Nuevo Rol',
                                icon: Icons.add_rounded,
                                style: FashionButtonStyle.primary,
                                onPressed: () => _showCreateRoleDialog(),
                              ),
                              const SizedBox(width: 16),
                            ],
                          ),

                          // Descripción moderna
                          Container(
                            margin: const EdgeInsets.all(16),
                            child: ModernCard(
                              glassMorphism: true,
                              opacity: 0.95,
                              borderColor: AppDesignSystem.vibrantPink
                                  .withOpacity(0.3),
                              child: Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          AppDesignSystem.vibrantPink,
                                          AppDesignSystem.purpleHaze,
                                        ],
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: const Icon(
                                      Icons.admin_panel_settings_rounded,
                                      color: Colors.white,
                                      size: 24,
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Sistema de Roles y Permisos',
                                          style: AppDesignSystem.bodyMd()
                                              .copyWith(
                                                fontWeight: FontWeight.w700,
                                                color:
                                                    AppDesignSystem.vibrantPink,
                                              ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          'Define roles personalizados con permisos específicos para controlar el acceso a las funcionalidades del sistema.',
                                          style: AppDesignSystem.bodySm()
                                              .copyWith(
                                                color:
                                                    AppDesignSystem
                                                        .textSecondary,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Panel de estadísticas
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: ModernCard(
                        glassMorphism: true,
                        opacity: 0.95,
                        borderColor: AppDesignSystem.electricBlue.withOpacity(
                          0.3,
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Estadísticas de Roles',
                              style: AppDesignSystem.headingSm().copyWith(
                                color: AppDesignSystem.electricBlue,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                Expanded(
                                  child: _buildStatCard(
                                    'Total Roles',
                                    _roles.length.toString(),
                                    Icons.group_rounded,
                                    AppDesignSystem.electricBlue,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: _buildStatCard(
                                    'Roles Activos',
                                    _roles
                                        .where((r) => r.activo)
                                        .length
                                        .toString(),
                                    Icons.check_circle_rounded,
                                    AppDesignSystem.success,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: _buildStatCard(
                                    'Roles Admin',
                                    _roles
                                        .where(
                                          (r) =>
                                              r.permisos?.contains('admin') ??
                                              false,
                                        )
                                        .length
                                        .toString(),
                                    Icons.security_rounded,
                                    AppDesignSystem.warning,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Búsqueda
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: ModernCard(
                        glassMorphism: true,
                        opacity: 0.9,
                        borderColor: AppDesignSystem.neonGreen.withOpacity(0.2),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.search_rounded,
                                  color: AppDesignSystem.neonGreen,
                                  size: 20,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  'Buscar Roles',
                                  style: AppDesignSystem.bodyMd().copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: AppDesignSystem.neonGreen,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            FashionTextField(
                              controller: _searchController,
                              hint: 'Buscar por nombre o descripción...',
                              prefixIcon: Icons.badge_rounded,
                              suffixIcon: Icons.clear_rounded,
                              onSuffixIconTap: () {
                                _searchController.clear();
                                setState(() {});
                              },
                              onTap: () => setState(() {}),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Lista de roles
                    Expanded(
                      child:
                          _isLoading
                              ? const FashionLoader(
                                message: 'Cargando roles del sistema...',
                                size: 60,
                              )
                              : _rolesFiltrados.isEmpty
                              ? _buildEmptyState()
                              : ListView.builder(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                ),
                                itemCount: _rolesFiltrados.length,
                                itemBuilder: (context, index) {
                                  final role = _rolesFiltrados[index];
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
                                          child: _buildRoleCard(role),
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
      ),
    );
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
                  AppDesignSystem.purpleHaze.withOpacity(0.1),
                ],
              ),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Icon(
              Icons.group_outlined,
              size: 80,
              color: AppDesignSystem.vibrantPink.withOpacity(0.6),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'No hay roles definidos',
            style: AppDesignSystem.headingMd().copyWith(
              color: AppDesignSystem.textPrimary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Crea roles personalizados para gestionar permisos de usuarios',
            style: AppDesignSystem.bodyMd().copyWith(
              color: AppDesignSystem.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          FashionButton(
            text: 'Crear Primer Rol',
            icon: Icons.add_rounded,
            onPressed: () => _showCreateRoleDialog(),
            style: FashionButtonStyle.primary,
          ),
        ],
      ),
    );
  }

  Widget _buildRoleCard(Rol role) {
    final isAdmin = role.permisos?.contains('admin') ?? false;
    final statusColor =
        role.activo ? AppDesignSystem.success : AppDesignSystem.error;
    final roleColor =
        isAdmin ? AppDesignSystem.warning : AppDesignSystem.electricBlue;

    return ModernCard(
      margin: const EdgeInsets.only(bottom: 12),
      glassMorphism: true,
      opacity: 0.95,
      borderColor: roleColor.withOpacity(0.3),
      boxShadow: [
        BoxShadow(
          color: roleColor.withOpacity(0.2),
          blurRadius: 12,
          offset: const Offset(0, 4),
        ),
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header del rol
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      roleColor.withOpacity(0.2),
                      roleColor.withOpacity(0.1),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  isAdmin
                      ? Icons.admin_panel_settings_rounded
                      : Icons.badge_rounded,
                  color: roleColor,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            role.nombre,
                            style: AppDesignSystem.bodyLg().copyWith(
                              fontWeight: FontWeight.w700,
                              color: AppDesignSystem.textPrimary,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: statusColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: statusColor.withOpacity(0.3),
                            ),
                          ),
                          child: Text(
                            role.activo ? 'ACTIVO' : 'INACTIVO',
                            style: AppDesignSystem.bodySm().copyWith(
                              color: statusColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                    if (role.descripcion != null &&
                        role.descripcion!.isNotEmpty) ...[
                      const SizedBox(height: 4),
                      Text(
                        role.descripcion!,
                        style: AppDesignSystem.bodySm().copyWith(
                          color: AppDesignSystem.textSecondary,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Permisos
          if (role.permisos?.isNotEmpty ?? false) ...[
            Text(
              'Permisos:',
              style: AppDesignSystem.bodySm().copyWith(
                fontWeight: FontWeight.w600,
                color: AppDesignSystem.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children:
                  (role.permisos ?? []).map((permiso) {
                    final isAdminPermission = permiso == 'admin';
                    final permissionColor =
                        isAdminPermission
                            ? AppDesignSystem.warning
                            : AppDesignSystem.electricBlue;

                    return FashionChip(
                      label: _getPermissionLabel(permiso),
                      isSelected: true,
                      selectedColor: permissionColor,
                      icon: _getPermissionIcon(permiso),
                      onTap: null, // No clickeable en vista
                    );
                  }).toList(),
            ),
            const SizedBox(height: 16),
          ],

          // Acciones
          Row(
            children: [
              Icon(
                Icons.access_time_rounded,
                size: 16,
                color: AppDesignSystem.textSecondary,
              ),
              const SizedBox(width: 6),
              Text(
                'Creado: ${_formatDate(role.fechaCreacion ?? DateTime.now())}',
                style: AppDesignSystem.bodySm().copyWith(
                  color: AppDesignSystem.textSecondary,
                ),
              ),
              const Spacer(),
              FashionButton(
                text: 'Editar',
                icon: Icons.edit_rounded,
                style: FashionButtonStyle.secondary,
                onPressed: () => _showEditRoleDialog(role),
              ),
              const SizedBox(width: 8),
              FashionButton(
                text: 'Eliminar',
                icon: Icons.delete_rounded,
                style: FashionButtonStyle.error,
                onPressed: () => _showDeleteConfirmation(role),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _getPermissionLabel(String permission) {
    switch (permission) {
      case 'admin':
        return 'Administrador';
      case 'ventas':
        return 'Ventas';
      case 'inventario':
        return 'Inventario';
      case 'finanzas':
        return 'Finanzas';
      case 'reportes':
        return 'Reportes';
      case 'usuarios':
        return 'Usuarios';
      case 'configuracion':
        return 'Configuración';
      default:
        return permission.toUpperCase();
    }
  }

  IconData _getPermissionIcon(String permission) {
    switch (permission) {
      case 'admin':
        return Icons.admin_panel_settings_rounded;
      case 'ventas':
        return Icons.point_of_sale_rounded;
      case 'inventario':
        return Icons.inventory_rounded;
      case 'finanzas':
        return Icons.account_balance_rounded;
      case 'reportes':
        return Icons.analytics_rounded;
      case 'usuarios':
        return Icons.people_rounded;
      case 'configuracion':
        return Icons.settings_rounded;
      default:
        return Icons.security_rounded;
    }
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }

  void _showCreateRoleDialog() {
    final nombreController = TextEditingController();
    final descripcionController = TextEditingController();
    final permisos = <String>{};

    showDialog(
      context: context,
      builder:
          (context) => StatefulBuilder(
            builder:
                (context, setDialogState) => AlertDialog(
                  backgroundColor:
                      AppDesignSystem.isDark
                          ? AppDesignSystem.darkSecondary
                          : Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  title: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              AppDesignSystem.vibrantPink,
                              AppDesignSystem.purpleHaze,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.group_add_rounded,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'Crear Nuevo Rol',
                        style: AppDesignSystem.headingSm().copyWith(
                          color: AppDesignSystem.vibrantPink,
                        ),
                      ),
                    ],
                  ),
                  content: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FashionTextField(
                          controller: nombreController,
                          hint: 'Nombre del rol',
                          prefixIcon: Icons.badge_rounded,
                        ),
                        const SizedBox(height: 16),
                        FashionTextField(
                          controller: descripcionController,
                          hint: 'Descripción (opcional)',
                          prefixIcon: Icons.description_rounded,
                          maxLines: 3,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Permisos:',
                          style: AppDesignSystem.bodyMd().copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children:
                              [
                                    'admin',
                                    'ventas',
                                    'inventario',
                                    'finanzas',
                                    'reportes',
                                    'usuarios',
                                    'configuracion',
                                  ]
                                  .map(
                                    (permiso) => FashionChip(
                                      label: _getPermissionLabel(permiso),
                                      isSelected: permisos.contains(permiso),
                                      icon: _getPermissionIcon(permiso),
                                      selectedColor:
                                          permiso == 'admin'
                                              ? AppDesignSystem.warning
                                              : AppDesignSystem.electricBlue,
                                      onTap: () {
                                        setDialogState(() {
                                          if (permisos.contains(permiso)) {
                                            permisos.remove(permiso);
                                          } else {
                                            permisos.add(permiso);
                                          }
                                        });
                                      },
                                    ),
                                  )
                                  .toList(),
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    FashionButton(
                      text: 'Cancelar',
                      onPressed: () => Navigator.of(context).pop(),
                      style: FashionButtonStyle.secondary,
                    ),
                    FashionButton(
                      text: 'Crear Rol',
                      onPressed:
                          () => _createRole(
                            nombreController.text,
                            descripcionController.text,
                            permisos.toList(),
                          ),
                      style: FashionButtonStyle.primary,
                    ),
                  ],
                ),
          ),
    );
  }

  void _showEditRoleDialog(Rol role) {
    final nombreController = TextEditingController(text: role.nombre);
    final descripcionController = TextEditingController(
      text: role.descripcion ?? '',
    );
    final permisos = Set<String>.from(role.permisos ?? []);
    bool activo = role.activo;

    showDialog(
      context: context,
      builder:
          (context) => StatefulBuilder(
            builder:
                (context, setDialogState) => AlertDialog(
                  backgroundColor:
                      AppDesignSystem.isDark
                          ? AppDesignSystem.darkSecondary
                          : Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  title: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              AppDesignSystem.electricBlue,
                              AppDesignSystem.purpleHaze,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.edit_rounded,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'Editar Rol',
                        style: AppDesignSystem.headingSm().copyWith(
                          color: AppDesignSystem.electricBlue,
                        ),
                      ),
                    ],
                  ),
                  content: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FashionTextField(
                          controller: nombreController,
                          hint: 'Nombre del rol',
                          prefixIcon: Icons.badge_rounded,
                        ),
                        const SizedBox(height: 16),
                        FashionTextField(
                          controller: descripcionController,
                          hint: 'Descripción (opcional)',
                          prefixIcon: Icons.description_rounded,
                          maxLines: 3,
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Switch.adaptive(
                              value: activo,
                              onChanged: (value) {
                                setDialogState(() {
                                  activo = value;
                                });
                              },
                              activeColor: AppDesignSystem.success,
                            ),
                            const SizedBox(width: 12),
                            Text(
                              'Rol activo',
                              style: AppDesignSystem.bodyMd().copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Permisos:',
                          style: AppDesignSystem.bodyMd().copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children:
                              [
                                    'admin',
                                    'ventas',
                                    'inventario',
                                    'finanzas',
                                    'reportes',
                                    'usuarios',
                                    'configuracion',
                                  ]
                                  .map(
                                    (permiso) => FashionChip(
                                      label: _getPermissionLabel(permiso),
                                      isSelected: permisos.contains(permiso),
                                      icon: _getPermissionIcon(permiso),
                                      selectedColor:
                                          permiso == 'admin'
                                              ? AppDesignSystem.warning
                                              : AppDesignSystem.electricBlue,
                                      onTap: () {
                                        setDialogState(() {
                                          if (permisos.contains(permiso)) {
                                            permisos.remove(permiso);
                                          } else {
                                            permisos.add(permiso);
                                          }
                                        });
                                      },
                                    ),
                                  )
                                  .toList(),
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    FashionButton(
                      text: 'Cancelar',
                      onPressed: () => Navigator.of(context).pop(),
                      style: FashionButtonStyle.secondary,
                    ),
                    FashionButton(
                      text: 'Guardar Cambios',
                      onPressed:
                          () => _updateRole(
                            role,
                            nombreController.text,
                            descripcionController.text,
                            permisos.toList(),
                            activo,
                          ),
                      style: FashionButtonStyle.primary,
                    ),
                  ],
                ),
          ),
    );
  }

  void _showDeleteConfirmation(Rol role) {
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
            title: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppDesignSystem.error.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.warning_rounded,
                    color: AppDesignSystem.error,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  'Confirmar Eliminación',
                  style: AppDesignSystem.headingSm().copyWith(
                    color: AppDesignSystem.error,
                  ),
                ),
              ],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '¿Estás seguro de que deseas eliminar el rol "${role.nombre}"?',
                  style: AppDesignSystem.bodyMd(),
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppDesignSystem.error.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: AppDesignSystem.error.withOpacity(0.3),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.info_outline_rounded,
                        color: AppDesignSystem.error,
                        size: 16,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Esta acción no se puede deshacer.',
                          style: AppDesignSystem.bodySm().copyWith(
                            color: AppDesignSystem.error,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            actions: [
              FashionButton(
                text: 'Cancelar',
                onPressed: () => Navigator.of(context).pop(),
                style: FashionButtonStyle.secondary,
              ),
              FashionButton(
                text: 'Eliminar',
                onPressed: () => _deleteRole(role),
                style: FashionButtonStyle.error,
              ),
            ],
          ),
    );
  }

  Future<void> _createRole(
    String nombre,
    String descripcion,
    List<String> permisos,
  ) async {
    if (nombre.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('El nombre del rol es obligatorio'),
          backgroundColor: AppDesignSystem.error,
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    try {
      final isar = await ref.read(isarServiceProvider).db;

      final newRole =
          Rol()
            ..nombre = nombre.trim()
            ..descripcion =
                descripcion.trim().isEmpty ? null : descripcion.trim()
            ..permisos = permisos
            ..activo = true
            ..fechaCreacion = DateTime.now();

      await isar.writeTxn(() async {
        await isar.rols.put(newRole);
      });

      if (mounted) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Rol "$nombre" creado exitosamente'),
            backgroundColor: AppDesignSystem.success,
            behavior: SnackBarBehavior.floating,
          ),
        );
        _loadRoles();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error al crear rol: $e'),
            backgroundColor: AppDesignSystem.error,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }

  Future<void> _updateRole(
    Rol role,
    String nombre,
    String descripcion,
    List<String> permisos,
    bool activo,
  ) async {
    if (nombre.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('El nombre del rol es obligatorio'),
          backgroundColor: AppDesignSystem.error,
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    try {
      final isar = await ref.read(isarServiceProvider).db;

      role.nombre = nombre.trim();
      role.descripcion = descripcion.trim().isEmpty ? null : descripcion.trim();
      role.permisos = permisos;
      role.activo = activo;

      await isar.writeTxn(() async {
        await isar.rols.put(role);
      });

      if (mounted) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Rol "$nombre" actualizado exitosamente'),
            backgroundColor: AppDesignSystem.success,
            behavior: SnackBarBehavior.floating,
          ),
        );
        _loadRoles();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error al actualizar rol: $e'),
            backgroundColor: AppDesignSystem.error,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }

  Future<void> _deleteRole(Rol role) async {
    try {
      final isar = await ref.read(isarServiceProvider).db;

      await isar.writeTxn(() async {
        await isar.rols.delete(role.id);
      });

      if (mounted) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Rol "${role.nombre}" eliminado exitosamente'),
            backgroundColor: AppDesignSystem.success,
            behavior: SnackBarBehavior.floating,
          ),
        );
        _loadRoles();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error al eliminar rol: $e'),
            backgroundColor: AppDesignSystem.error,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }
}
