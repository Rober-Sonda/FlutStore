import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../src/app_routes.dart';
import '../../widgets/app_design_system.dart';
import '../../widgets/app_widgets.dart';
import '../../widgets/permission_widget.dart';
import '../../components/shared/professional_app_bar.dart';
import '../../components/shared/glass_containers.dart';
import '../../providers/usuarios_provider.dart';
import '../../providers/roles_provider.dart';
import '../../models/usuario.dart';
import '../../models/rol.dart';

class ModernUsersRolesView extends ConsumerStatefulWidget {
  const ModernUsersRolesView({super.key});

  @override
  ConsumerState<ModernUsersRolesView> createState() =>
      _ModernUsersRolesViewState();
}

class _ModernUsersRolesViewState extends ConsumerState<ModernUsersRolesView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _searchQuery = '';
  String _selectedUserFilter = 'Todos';
  String _selectedRoleFilter = 'Todos';

  final List<String> _userFilterOptions = [
    'Todos',
    'Activos',
    'Inactivos',
    'Administradores',
    'Operadores',
  ];

  final List<String> _roleFilterOptions = ['Todos', 'Activos', 'Inactivos'];

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
      appBar: const ProfessionalAppBar(
        title: 'Usuarios y Roles',
        centerTitle: false,
      ),
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: AppDesignSystem.getFashionBackgroundDecoration(),
        child: SafeArea(
          child: Column(
            children: [
              // Barra de navegación por pestañas
              _buildTabBar(),

              // Contenido de las pestañas
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [_buildUsersTab(), _buildRolesTab()],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  Widget _buildTabBar() {
    return GlassFormContainer(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(8),
      opacity: 0.9,
      child: TabBar(
        controller: _tabController,
        dividerColor: Colors.transparent,
        indicatorColor: AppDesignSystem.navAccent,
        indicatorWeight: 3,
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
          color: AppDesignSystem.navAccent.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppDesignSystem.navAccent.withOpacity(0.3),
            width: 1,
          ),
        ),
        labelColor: AppDesignSystem.navAccent,
        unselectedLabelColor: AppDesignSystem.textSecondary,
        labelStyle: AppDesignSystem.bodyMd().copyWith(
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: AppDesignSystem.bodyMd().copyWith(
          fontWeight: FontWeight.w400,
        ),
        tabs: [
          Tab(icon: Icon(Icons.person_rounded, size: 20), text: 'Usuarios'),
          Tab(
            icon: Icon(Icons.admin_panel_settings_rounded, size: 20),
            text: 'Roles y Permisos',
          ),
        ],
      ),
    );
  }

  Widget _buildUsersTab() {
    final usuariosAsync = ref.watch(usuariosProvider);

    return Column(
      children: [
        // Controles de búsqueda y filtros para usuarios
        _buildUserSearchAndFilters(),

        // Lista de usuarios
        Expanded(
          child: usuariosAsync.when(
            data: (usuarios) => _buildUsersContent(usuarios),
            loading:
                () => AppWidgets.loadingState(message: 'Cargando usuarios...'),
            error:
                (error, _) => AppWidgets.errorState(
                  title: 'Error al cargar usuarios',
                  message: error.toString(),
                  actionText: 'Reintentar',
                  onActionPressed: () => ref.refresh(usuariosProvider),
                ),
          ),
        ),
      ],
    );
  }

  Widget _buildRolesTab() {
    final rolesAsync = ref.watch(rolesProvider);

    return Column(
      children: [
        // Controles de búsqueda y filtros para roles
        _buildRoleSearchAndFilters(),

        // Lista de roles
        Expanded(
          child: rolesAsync.when(
            data: (roles) => _buildRolesContent(roles),
            loading:
                () => AppWidgets.loadingState(message: 'Cargando roles...'),
            error:
                (error, _) => AppWidgets.errorState(
                  title: 'Error al cargar roles',
                  message: error.toString(),
                  actionText: 'Reintentar',
                  onActionPressed: () => ref.refresh(rolesProvider),
                ),
          ),
        ),
      ],
    );
  }

  Widget _buildUserSearchAndFilters() {
    return GlassFormContainer(
      margin: const EdgeInsets.all(16),
      opacity: 0.92,
      title: 'Búsqueda y Filtros',
      child: Column(
        children: [
          // Barra de búsqueda
          Container(
            decoration: BoxDecoration(
              color:
                  (AppDesignSystem.isDark
                      ? Colors.white.withOpacity(0.1)
                      : Colors.black.withOpacity(0.05)),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppDesignSystem.navAccent.withOpacity(0.2),
                width: 1,
              ),
            ),
            child: TextField(
              onChanged: (value) => setState(() => _searchQuery = value),
              style: AppDesignSystem.bodyMd().copyWith(
                color: AppDesignSystem.textPrimary,
              ),
              decoration: InputDecoration(
                hintText: 'Buscar usuarios por nombre, email...',
                hintStyle: AppDesignSystem.bodyMd().copyWith(
                  color: AppDesignSystem.textMuted,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: AppDesignSystem.textMuted,
                ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.all(AppDesignSystem.spaceMd),
              ),
            ),
          ),

          const SizedBox(height: AppDesignSystem.spaceMd),

          // Filtros
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children:
                  _userFilterOptions.map((filter) {
                    final isSelected = _selectedUserFilter == filter;
                    return Padding(
                      padding: const EdgeInsets.only(
                        right: AppDesignSystem.spaceSm,
                      ),
                      child: GestureDetector(
                        onTap:
                            () => setState(() => _selectedUserFilter = filter),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color:
                                isSelected
                                    ? AppDesignSystem.navAccent
                                    : (AppDesignSystem.isDark
                                        ? Colors.white.withOpacity(0.05)
                                        : Colors.black.withOpacity(0.03)),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color:
                                  isSelected
                                      ? AppDesignSystem.navAccent
                                      : AppDesignSystem.navAccent.withOpacity(
                                        0.2,
                                      ),
                              width: 1,
                            ),
                            boxShadow:
                                isSelected
                                    ? [
                                      BoxShadow(
                                        color: AppDesignSystem.navAccent
                                            .withOpacity(0.2),
                                        blurRadius: 8,
                                        offset: const Offset(0, 2),
                                      ),
                                    ]
                                    : null,
                          ),
                          child: Text(
                            filter,
                            style: AppDesignSystem.bodyMd().copyWith(
                              color:
                                  isSelected
                                      ? Colors.white
                                      : AppDesignSystem.textSecondary,
                              fontWeight:
                                  isSelected
                                      ? FontWeight.w600
                                      : FontWeight.w500,
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

  Widget _buildRoleSearchAndFilters() {
    return AppWidgets.primaryCard(
      margin: const EdgeInsets.all(AppDesignSystem.spaceMd),
      child: Column(
        children: [
          // Barra de búsqueda
          Container(
            decoration: BoxDecoration(
              color: AppDesignSystem.surfaceLight.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(AppDesignSystem.radiusMd),
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
                hintText: 'Buscar roles por nombre...',
                hintStyle: AppDesignSystem.bodyMd().copyWith(
                  color: AppDesignSystem.textMuted,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: AppDesignSystem.textMuted,
                ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.all(AppDesignSystem.spaceMd),
              ),
            ),
          ),

          const SizedBox(height: AppDesignSystem.spaceMd),

          // Filtros
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children:
                  _roleFilterOptions.map((filter) {
                    final isSelected = _selectedRoleFilter == filter;
                    return Padding(
                      padding: const EdgeInsets.only(
                        right: AppDesignSystem.spaceSm,
                      ),
                      child: GestureDetector(
                        onTap:
                            () => setState(() => _selectedRoleFilter = filter),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color:
                                isSelected
                                    ? AppDesignSystem.navAccent
                                    : (AppDesignSystem.isDark
                                        ? Colors.white.withOpacity(0.05)
                                        : Colors.black.withOpacity(0.03)),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color:
                                  isSelected
                                      ? AppDesignSystem.navAccent
                                      : AppDesignSystem.navAccent.withOpacity(
                                        0.2,
                                      ),
                              width: 1,
                            ),
                            boxShadow:
                                isSelected
                                    ? [
                                      BoxShadow(
                                        color: AppDesignSystem.navAccent
                                            .withOpacity(0.2),
                                        blurRadius: 8,
                                        offset: const Offset(0, 2),
                                      ),
                                    ]
                                    : null,
                          ),
                          child: Text(
                            filter,
                            style: AppDesignSystem.bodyMd().copyWith(
                              color:
                                  isSelected
                                      ? Colors.white
                                      : AppDesignSystem.textSecondary,
                              fontWeight:
                                  isSelected
                                      ? FontWeight.w600
                                      : FontWeight.w500,
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

  Widget _buildUsersContent(List<Usuario> usuarios) {
    final filteredUsers = _filterUsers(usuarios);

    if (filteredUsers.isEmpty) {
      return AppWidgets.emptyState(
        icon: Icons.person_off_outlined,
        title:
            _searchQuery.isNotEmpty || _selectedUserFilter != 'Todos'
                ? 'No se encontraron usuarios'
                : 'No hay usuarios registrados',
        message:
            _searchQuery.isNotEmpty || _selectedUserFilter != 'Todos'
                ? 'Intenta ajustar los filtros o la búsqueda.'
                : 'Comienza agregando usuarios al sistema.',
        actionText: 'Agregar Usuario',
        onActionPressed: () => context.push(AppRoutes.userAdd),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(AppDesignSystem.spaceMd),
      itemCount: filteredUsers.length,
      itemBuilder: (context, index) {
        final usuario = filteredUsers[index];
        return _buildUserCard(usuario, index);
      },
    );
  }

  Widget _buildRolesContent(List<Rol> roles) {
    final filteredRoles = _filterRoles(roles);

    if (filteredRoles.isEmpty) {
      return AppWidgets.emptyState(
        icon: Icons.admin_panel_settings_outlined,
        title:
            _searchQuery.isNotEmpty || _selectedRoleFilter != 'Todos'
                ? 'No se encontraron roles'
                : 'No hay roles registrados',
        message:
            _searchQuery.isNotEmpty || _selectedRoleFilter != 'Todos'
                ? 'Intenta ajustar los filtros o la búsqueda.'
                : 'Comienza creando roles para organizar permisos.',
        actionText: 'Crear Rol',
        onActionPressed: () => context.push(AppRoutes.roleAdd),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(AppDesignSystem.spaceMd),
      itemCount: filteredRoles.length,
      itemBuilder: (context, index) {
        final rol = filteredRoles[index];
        return _buildRoleCard(rol, index);
      },
    );
  }

  Widget _buildUserCard(Usuario usuario, int index) {
    final isActive = usuario.activo;
    final avatarColors = [
      AppDesignSystem.primaryBlue,
      AppDesignSystem.success,
      AppDesignSystem.warning,
      AppDesignSystem.error,
      AppDesignSystem.info,
    ];
    final avatarColor = avatarColors[index % avatarColors.length];

    return AppWidgets.primaryCard(
      margin: const EdgeInsets.only(bottom: AppDesignSystem.spaceMd),
      child: Row(
        children: [
          // Avatar
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: avatarColor.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(AppDesignSystem.radiusMd),
            ),
            child: Center(
              child: Text(
                usuario.nombre.isNotEmpty
                    ? usuario.nombre[0].toUpperCase()
                    : 'U',
                style: AppDesignSystem.headingMd().copyWith(
                  color: avatarColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          const SizedBox(width: AppDesignSystem.spaceMd),

          // Información del usuario
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        usuario.nombre.isNotEmpty
                            ? usuario.nombre
                            : 'Sin nombre',
                        style: AppDesignSystem.headingSm().copyWith(
                          color: AppDesignSystem.textPrimary,
                        ),
                      ),
                    ),
                    AppWidgets.statusChip(
                      label: isActive ? 'Activo' : 'Inactivo',
                      color:
                          isActive
                              ? AppDesignSystem.success
                              : AppDesignSystem.error,
                      icon: isActive ? Icons.check_circle : Icons.cancel,
                    ),
                  ],
                ),
                const SizedBox(height: AppDesignSystem.spaceXs),

                Text(
                  usuario.email ?? 'Sin email',
                  style: AppDesignSystem.bodyMd().copyWith(
                    color: AppDesignSystem.textSecondary,
                  ),
                ),

                const SizedBox(height: AppDesignSystem.spaceXs),

                Row(
                  children: [
                    Icon(
                      Icons.admin_panel_settings,
                      size: 16,
                      color: AppDesignSystem.textMuted,
                    ),
                    const SizedBox(width: AppDesignSystem.spaceXs),
                    Text(
                      usuario.rolNombre ?? 'Sin rol asignado',
                      style: AppDesignSystem.bodySm().copyWith(
                        color: AppDesignSystem.textMuted,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Acciones
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              PermissionWidget(
                resource: 'usuarios',
                action: 'editar',
                child: IconButton(
                  onPressed:
                      () => context.push('${AppRoutes.userEdit}/${usuario.id}'),
                  icon: const Icon(Icons.edit),
                  color: AppDesignSystem.primaryBlue,
                  tooltip: 'Editar usuario',
                ),
              ),

              IconButton(
                onPressed: () => _viewUserDetails(usuario),
                icon: const Icon(Icons.visibility),
                color: AppDesignSystem.textMuted,
                tooltip: 'Ver detalles',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRoleCard(Rol rol, int index) {
    final isActive = rol.activo;
    final avatarColors = [
      AppDesignSystem.primaryBlue,
      AppDesignSystem.success,
      AppDesignSystem.warning,
      AppDesignSystem.error,
      AppDesignSystem.info,
    ];
    final cardColor = avatarColors[index % avatarColors.length];
    final permissionsCount = rol.permisos?.length ?? 0;

    return AppWidgets.primaryCard(
      margin: const EdgeInsets.only(bottom: AppDesignSystem.spaceMd),
      child: Row(
        children: [
          // Icono del rol
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: cardColor.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(AppDesignSystem.radiusMd),
            ),
            child: Icon(Icons.admin_panel_settings, color: cardColor, size: 28),
          ),

          const SizedBox(width: AppDesignSystem.spaceMd),

          // Información del rol
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        rol.nombre.isNotEmpty ? rol.nombre : 'Sin nombre',
                        style: AppDesignSystem.headingSm().copyWith(
                          color: AppDesignSystem.textPrimary,
                        ),
                      ),
                    ),
                    AppWidgets.statusChip(
                      label: isActive ? 'Activo' : 'Inactivo',
                      color:
                          isActive
                              ? AppDesignSystem.success
                              : AppDesignSystem.error,
                      icon: isActive ? Icons.check_circle : Icons.cancel,
                    ),
                  ],
                ),

                const SizedBox(height: AppDesignSystem.spaceXs),

                if (rol.descripcion != null) ...[
                  Text(
                    rol.descripcion!,
                    style: AppDesignSystem.bodyMd().copyWith(
                      color: AppDesignSystem.textSecondary,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: AppDesignSystem.spaceXs),
                ],

                Row(
                  children: [
                    Icon(
                      Icons.security,
                      size: 16,
                      color: AppDesignSystem.textMuted,
                    ),
                    const SizedBox(width: AppDesignSystem.spaceXs),
                    Text(
                      '$permissionsCount permisos asignados',
                      style: AppDesignSystem.bodySm().copyWith(
                        color: AppDesignSystem.textMuted,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Acciones
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              PermissionWidget(
                resource: 'roles',
                action: 'editar',
                child: IconButton(
                  onPressed:
                      () => context.push('${AppRoutes.roleEdit}/${rol.id}'),
                  icon: const Icon(Icons.edit),
                  color: AppDesignSystem.primaryBlue,
                  tooltip: 'Editar rol',
                ),
              ),

              IconButton(
                onPressed: () => _viewRoleDetails(rol),
                icon: const Icon(Icons.visibility),
                color: AppDesignSystem.textMuted,
                tooltip: 'Ver permisos',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFloatingActionButton() {
    return _tabController.index == 0
        ? PermissionWidget(
          resource: 'usuarios',
          action: 'crear',
          child: FloatingActionButton.extended(
            onPressed: () => context.push(AppRoutes.userAdd),
            backgroundColor: AppDesignSystem.primaryBlue,
            foregroundColor: AppDesignSystem.textPrimary,
            icon: const Icon(Icons.person_add),
            label: const Text('Nuevo Usuario'),
          ),
        )
        : PermissionWidget(
          resource: 'roles',
          action: 'crear',
          child: FloatingActionButton.extended(
            onPressed: () => context.push(AppRoutes.roleAdd),
            backgroundColor: AppDesignSystem.primaryBlue,
            foregroundColor: AppDesignSystem.textPrimary,
            icon: const Icon(Icons.add),
            label: const Text('Nuevo Rol'),
          ),
        );
  }

  List<Usuario> _filterUsers(List<Usuario> usuarios) {
    var filtered = usuarios;

    // Filtrar por búsqueda
    if (_searchQuery.isNotEmpty) {
      filtered =
          filtered.where((usuario) {
            final query = _searchQuery.toLowerCase();
            return usuario.nombre.toLowerCase().contains(query) ||
                (usuario.email?.toLowerCase().contains(query) ?? false);
          }).toList();
    }

    // Filtrar por estado
    switch (_selectedUserFilter) {
      case 'Activos':
        filtered = filtered.where((u) => u.activo == true).toList();
        break;
      case 'Inactivos':
        filtered = filtered.where((u) => u.activo == false).toList();
        break;
      case 'Administradores':
        filtered =
            filtered
                .where(
                  (u) =>
                      (u.rolNombre?.toLowerCase().contains('admin') ?? false),
                )
                .toList();
        break;
      case 'Operadores':
        filtered =
            filtered
                .where(
                  (u) =>
                      u.rolNombre?.toLowerCase().contains('operador') ?? false,
                )
                .toList();
        break;
    }

    return filtered;
  }

  List<Rol> _filterRoles(List<Rol> roles) {
    var filtered = roles;

    // Filtrar por búsqueda
    if (_searchQuery.isNotEmpty) {
      filtered =
          filtered.where((rol) {
            final query = _searchQuery.toLowerCase();
            return rol.nombre.toLowerCase().contains(query) ||
                (rol.descripcion?.toLowerCase().contains(query) ?? false);
          }).toList();
    }

    // Filtrar por estado
    switch (_selectedRoleFilter) {
      case 'Activos':
        filtered = filtered.where((r) => r.activo == true).toList();
        break;
      case 'Inactivos':
        filtered = filtered.where((r) => r.activo == false).toList();
        break;
    }

    return filtered;
  }

  void _viewUserDetails(Usuario usuario) {
    showDialog(
      context: context,
      builder:
          (context) => Dialog(
            backgroundColor: AppDesignSystem.surface,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppDesignSystem.radiusLg),
            ),
            child: Container(
              constraints: const BoxConstraints(maxWidth: 500, maxHeight: 600),
              padding: const EdgeInsets.all(AppDesignSystem.spaceLg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Detalles del Usuario',
                    style: AppDesignSystem.headingMd().copyWith(
                      color: AppDesignSystem.textPrimary,
                    ),
                  ),
                  const SizedBox(height: AppDesignSystem.spaceLg),

                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          _buildDetailRow(
                            'Nombre',
                            usuario.nombre.isNotEmpty
                                ? usuario.nombre
                                : 'No especificado',
                          ),
                          _buildDetailRow(
                            'Email',
                            usuario.email ?? 'No especificado',
                          ),
                          _buildDetailRow(
                            'Rol',
                            usuario.rolNombre ?? 'Sin rol',
                          ),
                          _buildDetailRow(
                            'Estado',
                            usuario.activo ? 'Activo' : 'Inactivo',
                          ),
                          if (usuario.fechaCreacion != null)
                            _buildDetailRow(
                              'Fecha de Creación',
                              usuario.fechaCreacion!.toString().split(' ')[0],
                            ),
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
                        text: 'Editar',
                        icon: Icons.edit,
                        backgroundColor: AppDesignSystem.primaryBlue,
                        onPressed: () {
                          Navigator.of(context).pop();
                          context.push('${AppRoutes.userEdit}/${usuario.id}');
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

  void _viewRoleDetails(Rol rol) {
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
                    'Permisos del Rol: ${rol.nombre}',
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
                          if (rol.descripcion != null) ...[
                            _buildDetailRow('Descripción', rol.descripcion!),
                            const SizedBox(height: AppDesignSystem.spaceMd),
                          ],

                          Text(
                            'Permisos Asignados:',
                            style: AppDesignSystem.headingSm().copyWith(
                              color: AppDesignSystem.textPrimary,
                            ),
                          ),
                          const SizedBox(height: AppDesignSystem.spaceMd),

                          if (rol.permisos?.isNotEmpty ?? false) ...[
                            ...rol.permisos!.map(
                              (permiso) => Padding(
                                padding: const EdgeInsets.only(
                                  bottom: AppDesignSystem.spaceSm,
                                ),
                                child: Container(
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
                                      Icon(
                                        Icons.check_circle,
                                        color: AppDesignSystem.success,
                                        size: 20,
                                      ),
                                      const SizedBox(
                                        width: AppDesignSystem.spaceSm,
                                      ),
                                      Expanded(
                                        child: Text(
                                          permiso,
                                          style: AppDesignSystem.bodyMd()
                                              .copyWith(
                                                color:
                                                    AppDesignSystem.textPrimary,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ] else ...[
                            AppWidgets.emptyState(
                              icon: Icons.security,
                              title: 'Sin permisos asignados',
                              message:
                                  'Este rol no tiene permisos configurados.',
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
                        text: 'Editar Rol',
                        icon: Icons.edit,
                        backgroundColor: AppDesignSystem.primaryBlue,
                        onPressed: () {
                          Navigator.of(context).pop();
                          context.push('${AppRoutes.roleEdit}/${rol.id}');
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
