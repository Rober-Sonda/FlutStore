import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../widgets/fashion_components.dart';
import '../../widgets/app_design_system.dart';
import '../../components/shared/professional_app_bar.dart';

class FashionUserGuideView extends ConsumerStatefulWidget {
  const FashionUserGuideView({super.key});

  @override
  ConsumerState<FashionUserGuideView> createState() =>
      _FashionUserGuideViewState();
}

class _FashionUserGuideViewState extends ConsumerState<FashionUserGuideView>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  String _selectedSection = 'inicio';
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();

    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _fadeController, curve: Curves.easeOut));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fadeController.forward();
    });
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FashionScaffold(
      backgroundTags: const ['personalidad', 'urbano', 'guia'],
      overlayOpacity: 0.88,
      showBackgroundRotation: true,
      rotationInterval: const Duration(minutes: 8),
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: Column(
          children: [
            // Header moderno
            ModernCard(
              margin: const EdgeInsets.all(0),
              borderRadius: 0,
              glassMorphism: true,
              opacity: 0.9,
              child: ProfessionalAppBar(
                title: '📖 Guía de Usuario FlutStore',
                subtitle: 'Todo lo que necesitas saber para usar la aplicación',
              ),
            ),

            // Contenido principal
            Expanded(
              child: Row(
                children: [
                  // Menú lateral
                  Container(
                    width: 280,
                    child: ModernCard(
                      margin: const EdgeInsets.only(
                        left: 16,
                        top: 16,
                        bottom: 16,
                      ),
                      glassMorphism: true,
                      opacity: 0.95,
                      borderColor: AppDesignSystem.vibrantPink.withOpacity(0.3),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        AppDesignSystem.vibrantPink,
                                        AppDesignSystem.electricBlue,
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Icon(
                                    Icons.menu_book_rounded,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Text(
                                  'Índice de Contenidos',
                                  style: AppDesignSystem.headingSm().copyWith(
                                    color: AppDesignSystem.vibrantPink,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Expanded(
                            child: ListView(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                              ),
                              children: [
                                _buildMenuSection(
                                  '🚀 Inicio',
                                  'inicio',
                                  Icons.home_rounded,
                                ),
                                _buildMenuSection(
                                  '🛒 Productos',
                                  'productos',
                                  Icons.inventory_2_rounded,
                                ),
                                _buildMenuSection(
                                  '💰 Ventas',
                                  'ventas',
                                  Icons.point_of_sale_rounded,
                                ),
                                _buildMenuSection(
                                  '📊 Finanzas',
                                  'finanzas',
                                  Icons.account_balance_rounded,
                                ),
                                _buildMenuSection(
                                  '📈 Reportes',
                                  'reportes',
                                  Icons.analytics_rounded,
                                ),
                                _buildMenuSection(
                                  '👥 Usuarios',
                                  'usuarios',
                                  Icons.people_rounded,
                                ),
                                _buildMenuSection(
                                  '⚙️ Configuración',
                                  'configuracion',
                                  Icons.settings_rounded,
                                ),
                                _buildMenuSection(
                                  '🆘 Solución de Problemas',
                                  'problemas',
                                  Icons.help_rounded,
                                ),
                                _buildMenuSection(
                                  '💡 Tips y Trucos',
                                  'tips',
                                  Icons.lightbulb_rounded,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Contenido principal
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(16),
                      child: ModernCard(
                        glassMorphism: true,
                        opacity: 0.95,
                        padding: const EdgeInsets.all(0),
                        child: PageView(
                          controller: _pageController,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            _buildInicioContent(),
                            _buildProductosContent(),
                            _buildVentasContent(),
                            _buildFinanzasContent(),
                            _buildReportesContent(),
                            _buildUsuariosContent(),
                            _buildConfiguracionContent(),
                            _buildProblemasContent(),
                            _buildTipsContent(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuSection(String title, String section, IconData icon) {
    final isSelected = _selectedSection == section;

    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: () => _selectSection(section),
          borderRadius: BorderRadius.circular(12),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color:
                  isSelected
                      ? AppDesignSystem.vibrantPink.withOpacity(0.1)
                      : Colors.transparent,
              borderRadius: BorderRadius.circular(12),
              border:
                  isSelected
                      ? Border.all(
                        color: AppDesignSystem.vibrantPink.withOpacity(0.3),
                      )
                      : null,
            ),
            child: Row(
              children: [
                Icon(
                  icon,
                  color:
                      isSelected
                          ? AppDesignSystem.vibrantPink
                          : AppDesignSystem.textSecondary,
                  size: 20,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: AppDesignSystem.bodyMd().copyWith(
                      color:
                          isSelected
                              ? AppDesignSystem.vibrantPink
                              : AppDesignSystem.textPrimary,
                      fontWeight:
                          isSelected ? FontWeight.w600 : FontWeight.w500,
                    ),
                  ),
                ),
                if (isSelected)
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: AppDesignSystem.vibrantPink,
                    size: 16,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _selectSection(String section) {
    setState(() {
      _selectedSection = section;
    });

    final index = [
      'inicio',
      'productos',
      'ventas',
      'finanzas',
      'reportes',
      'usuarios',
      'configuracion',
      'problemas',
      'tips',
    ].indexOf(section);

    if (index != -1) {
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  Widget _buildSectionContent({
    required String title,
    required IconData icon,
    required Color color,
    required List<Widget> children,
  }) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header de sección
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.only(bottom: 32),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [color.withOpacity(0.1), color.withOpacity(0.05)],
              ),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: color.withOpacity(0.3)),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, color: color, size: 28),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppDesignSystem.headingLg().copyWith(
                        color: color,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      'Guía completa paso a paso',
                      style: AppDesignSystem.bodyMd().copyWith(
                        color: AppDesignSystem.textSecondary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Contenido
          ...children,
        ],
      ),
    );
  }

  Widget _buildStepCard({
    required String step,
    required String title,
    required String description,
    required IconData icon,
    Color? color,
    List<String>? bulletPoints,
  }) {
    final stepColor = color ?? AppDesignSystem.electricBlue;

    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      child: ModernCard(
        glassMorphism: true,
        opacity: 0.9,
        borderColor: stepColor.withOpacity(0.2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: stepColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    step,
                    style: AppDesignSystem.bodyMd().copyWith(
                      color: stepColor,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Icon(icon, color: stepColor, size: 20),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    title,
                    style: AppDesignSystem.bodyLg().copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppDesignSystem.textPrimary,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            Text(
              description,
              style: AppDesignSystem.bodyMd().copyWith(
                color: AppDesignSystem.textSecondary,
                height: 1.6,
              ),
            ),

            if (bulletPoints != null && bulletPoints.isNotEmpty) ...[
              const SizedBox(height: 16),
              ...bulletPoints.map(
                (point) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 6, right: 12),
                        width: 6,
                        height: 6,
                        decoration: BoxDecoration(
                          color: stepColor,
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          point,
                          style: AppDesignSystem.bodyMd().copyWith(
                            color: AppDesignSystem.textPrimary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  // CONTENIDO DE LAS SECCIONES

  Widget _buildInicioContent() {
    return _buildSectionContent(
      title: 'Bienvenido a FlutStore Fashion Edition',
      icon: Icons.home_rounded,
      color: AppDesignSystem.vibrantPink,
      children: [
        _buildStepCard(
          step: '1',
          title: 'Primeros Pasos',
          description:
              'FlutStore es tu sistema completo de gestión comercial con una estética juvenil moderna.',
          icon: Icons.rocket_launch_rounded,
          color: AppDesignSystem.vibrantPink,
          bulletPoints: [
            'Interfaz moderna con jóvenes diversos y estilo urbano',
            'Efectos glassmorphism en todos los componentes',
            'Paleta de colores vibrante y juvenil',
            'Funcionalidad empresarial 100% preservada',
          ],
        ),

        _buildStepCard(
          step: '2',
          title: 'Credenciales de Acceso',
          description:
              'Para comenzar a usar la aplicación, utiliza las siguientes credenciales por defecto:',
          icon: Icons.key_rounded,
          color: AppDesignSystem.success,
          bulletPoints: [
            'Usuario: admin',
            'Contraseña: admin123',
            'Puedes cambiar estas credenciales una vez dentro del sistema',
          ],
        ),

        _buildStepCard(
          step: '3',
          title: 'Navegación Principal',
          description:
              'La aplicación está organizada en módulos principales para facilitar tu trabajo:',
          icon: Icons.explore_rounded,
          color: AppDesignSystem.electricBlue,
          bulletPoints: [
            '🛒 Productos: Gestiona tu inventario y catálogo',
            '💰 Ventas: Registra transacciones y gestiona clientes',
            '📊 Finanzas: Control de flujo de caja y gastos',
            '📈 Reportes: Análisis de ventas y estadísticas',
            '👥 Usuarios: Gestión de roles y permisos',
          ],
        ),

        _buildStepCard(
          step: '4',
          title: 'Características Fashion',
          description: 'Esta nueva versión incluye elementos únicos de diseño:',
          icon: Icons.palette_rounded,
          color: AppDesignSystem.sunsetOrange,
          bulletPoints: [
            'Fondos rotativos con jóvenes diversos cada 5-6 minutos',
            'Componentes con efectos de glassmorphism',
            'Animaciones fluidas en toda la aplicación',
            'Paleta de colores juvenil y vibrante',
            'Representación diversa e inclusiva',
          ],
        ),
      ],
    );
  }

  Widget _buildProductosContent() {
    return _buildSectionContent(
      title: 'Gestión de Productos',
      icon: Icons.inventory_2_rounded,
      color: AppDesignSystem.neonGreen,
      children: [
        _buildStepCard(
          step: '1',
          title: 'Agregar Nuevo Producto',
          description: 'Para añadir productos a tu inventario:',
          icon: Icons.add_box_rounded,
          color: AppDesignSystem.neonGreen,
          bulletPoints: [
            'Haz clic en "Nuevo Producto" en la vista principal',
            'Completa la información básica: nombre, descripción',
            'Establece el precio de venta y costo',
            'Define la cantidad inicial de stock',
            'Asigna una categoría o crea una nueva',
            'Guarda los cambios',
          ],
        ),

        _buildStepCard(
          step: '2',
          title: 'Búsqueda y Filtros',
          description: 'La nueva interfaz fashion incluye búsqueda avanzada:',
          icon: Icons.search_rounded,
          color: AppDesignSystem.electricBlue,
          bulletPoints: [
            'Usa la barra de búsqueda para encontrar productos rápidamente',
            'Filtra por categorías usando los chips modernos',
            'Busca por nombre, código o descripción',
            'Los resultados se actualizan en tiempo real',
          ],
        ),

        _buildStepCard(
          step: '3',
          title: 'Gestión de Categorías',
          description: 'Organiza tus productos eficientemente:',
          icon: Icons.category_rounded,
          color: AppDesignSystem.purpleHaze,
          bulletPoints: [
            'Crea categorías desde la sección de productos',
            'Asigna productos a categorías específicas',
            'Usa subcategorías para mejor organización',
            'Las categorías aparecen como filtros visuales',
          ],
        ),

        _buildStepCard(
          step: '4',
          title: 'Control de Stock',
          description: 'Mantén tu inventario actualizado:',
          icon: Icons.inventory_rounded,
          color: AppDesignSystem.warning,
          bulletPoints: [
            'El stock se actualiza automáticamente con las ventas',
            'Recibe alertas cuando el stock esté bajo',
            'Registra movimientos de entrada y salida',
            'Visualiza el valor total del inventario',
          ],
        ),
      ],
    );
  }

  Widget _buildVentasContent() {
    return _buildSectionContent(
      title: 'Sistema de Ventas',
      icon: Icons.point_of_sale_rounded,
      color: AppDesignSystem.success,
      children: [
        _buildStepCard(
          step: '1',
          title: 'Registrar Nueva Venta',
          description: 'Proceso completo para registrar una transacción:',
          icon: Icons.shopping_cart_rounded,
          color: AppDesignSystem.success,
          bulletPoints: [
            'Ve a la sección "Ventas" desde el menú principal',
            'Haz clic en "Nueva Venta"',
            'Selecciona los productos desde el catálogo',
            'Ajusta cantidades según necesites',
            'Elige el método de pago',
            'Confirma la venta',
          ],
        ),

        _buildStepCard(
          step: '2',
          title: 'Gestión de Clientes',
          description: 'Administra tu base de clientes:',
          icon: Icons.people_rounded,
          color: AppDesignSystem.electricBlue,
          bulletPoints: [
            'Registra nuevos clientes durante la venta',
            'Mantén historial de compras por cliente',
            'Gestiona cuentas corrientes y créditos',
            'Consulta el perfil completo del cliente',
          ],
        ),

        _buildStepCard(
          step: '3',
          title: 'Métodos de Pago',
          description: 'Opciones de pago disponibles:',
          icon: Icons.payment_rounded,
          color: AppDesignSystem.purpleHaze,
          bulletPoints: [
            'Efectivo: Pago inmediato en caja',
            'Tarjeta: Débito o crédito',
            'Transferencia: Pagos bancarios',
            'Cuenta Corriente: Crédito al cliente',
            'Combinado: Múltiples métodos en una venta',
          ],
        ),

        _buildStepCard(
          step: '4',
          title: 'Estadísticas de Ventas',
          description: 'El nuevo diseño incluye KPIs visuales:',
          icon: Icons.analytics_rounded,
          color: AppDesignSystem.vibrantPink,
          bulletPoints: [
            'Total de ventas del día/mes',
            'Número de transacciones',
            'Productos más vendidos',
            'Clientes más frecuentes',
            'Gráficos de tendencias',
          ],
        ),
      ],
    );
  }

  Widget _buildFinanzasContent() {
    return _buildSectionContent(
      title: 'Control Financiero',
      icon: Icons.account_balance_rounded,
      color: AppDesignSystem.warning,
      children: [
        _buildStepCard(
          step: '1',
          title: 'Dashboard Financiero',
          description:
              'El nuevo módulo de finanzas incluye 3 tabs principales:',
          icon: Icons.dashboard_rounded,
          color: AppDesignSystem.warning,
          bulletPoints: [
            'General: Vista completa de ingresos y egresos',
            'Gastos Fijos: Administra gastos recurrentes',
            'Flujo de Caja: Control del efectivo disponible',
            'KPIs visuales con estadísticas en tiempo real',
          ],
        ),

        _buildStepCard(
          step: '2',
          title: 'Registro de Movimientos',
          description: 'Cómo registrar ingresos y gastos:',
          icon: Icons.receipt_rounded,
          color: AppDesignSystem.electricBlue,
          bulletPoints: [
            'Selecciona el tipo: Ingreso o Egreso',
            'Completa descripción y monto',
            'Asigna una categoría (ventas, gastos, etc.)',
            'Establece la fecha del movimiento',
            'Guarda el registro',
          ],
        ),

        _buildStepCard(
          step: '3',
          title: 'Gastos Fijos',
          description: 'Gestiona gastos operativos recurrentes:',
          icon: Icons.repeat_rounded,
          color: AppDesignSystem.purpleHaze,
          bulletPoints: [
            'Alquiler del local comercial',
            'Servicios públicos (luz, agua, gas)',
            'Salarios y sueldos del personal',
            'Seguros y impuestos',
            'Suscripciones y servicios',
          ],
        ),

        _buildStepCard(
          step: '4',
          title: 'Análisis Financiero',
          description: 'Herramientas de análisis incluidas:',
          icon: Icons.trending_up_rounded,
          color: AppDesignSystem.success,
          bulletPoints: [
            'Balance general automático',
            'Flujo de efectivo disponible',
            'Comparación ingresos vs egresos',
            'Gráficos de tendencias mensuales',
            'Alertas de flujo bajo',
          ],
        ),
      ],
    );
  }

  Widget _buildReportesContent() {
    return _buildSectionContent(
      title: 'Reportes y Analytics',
      icon: Icons.analytics_rounded,
      color: AppDesignSystem.electricBlue,
      children: [
        _buildStepCard(
          step: '1',
          title: 'KPIs Principales',
          description:
              'El nuevo sistema de reportes incluye indicadores clave:',
          icon: Icons.speed_rounded,
          color: AppDesignSystem.electricBlue,
          bulletPoints: [
            'Ventas Totales del período seleccionado',
            'Utilidad Bruta y margen de ganancia',
            'Total de Ingresos de todas las fuentes',
            'Egresos y gastos operativos',
            'Balance General del período',
          ],
        ),

        _buildStepCard(
          step: '2',
          title: 'Gráficos Interactivos',
          description: 'Visualización moderna con FL Chart:',
          icon: Icons.bar_chart_rounded,
          color: AppDesignSystem.purpleHaze,
          bulletPoints: [
            'Gráfico de barras: Ingresos vs Egresos',
            'Gráfico de líneas: Tendencia de ventas',
            'Tooltips informativos al pasar el mouse',
            'Colores vibrantes acordes al diseño fashion',
          ],
        ),

        _buildStepCard(
          step: '3',
          title: 'Períodos de Análisis',
          description: 'Analiza diferentes rangos temporales:',
          icon: Icons.date_range_rounded,
          color: AppDesignSystem.neonGreen,
          bulletPoints: [
            'Diario: Análisis del día actual',
            'Semanal: Semana en curso',
            'Mensual: Mes completo',
            'Anual: Todo el año',
            'Personalizado: Rango específico (próximamente)',
          ],
        ),

        _buildStepCard(
          step: '4',
          title: 'Top Productos',
          description: 'Identifica los productos más exitosos:',
          icon: Icons.star_rounded,
          color: AppDesignSystem.sunsetOrange,
          bulletPoints: [
            'Los 5 productos más vendidos',
            'Cantidad total vendida por producto',
            'Ingresos generados por cada producto',
            'Análisis de rotación de inventario',
          ],
        ),
      ],
    );
  }

  Widget _buildUsuariosContent() {
    return _buildSectionContent(
      title: 'Gestión de Usuarios y Roles',
      icon: Icons.people_rounded,
      color: AppDesignSystem.vibrantPink,
      children: [
        _buildStepCard(
          step: '1',
          title: 'Sistema de Roles Moderno',
          description: 'El nuevo sistema incluye gestión visual de permisos:',
          icon: Icons.admin_panel_settings_rounded,
          color: AppDesignSystem.vibrantPink,
          bulletPoints: [
            'Crear roles personalizados',
            'Asignar permisos específicos por módulo',
            'Interfaz con chips visuales para permisos',
            'Estadísticas del sistema de roles',
          ],
        ),

        _buildStepCard(
          step: '2',
          title: 'Crear Nuevo Rol',
          description: 'Pasos para configurar un rol personalizado:',
          icon: Icons.group_add_rounded,
          color: AppDesignSystem.electricBlue,
          bulletPoints: [
            'Ve a "Gestión de Roles"',
            'Haz clic en "Nuevo Rol"',
            'Asigna un nombre descriptivo',
            'Selecciona permisos usando chips visuales',
            'Guarda el rol creado',
          ],
        ),

        _buildStepCard(
          step: '3',
          title: 'Permisos Disponibles',
          description: 'Tipos de permisos que puedes asignar:',
          icon: Icons.security_rounded,
          color: AppDesignSystem.warning,
          bulletPoints: [
            'Admin: Acceso completo al sistema',
            'Ventas: Registrar y consultar ventas',
            'Inventario: Gestionar productos y stock',
            'Finanzas: Acceso a módulo financiero',
            'Reportes: Ver estadísticas y análisis',
            'Usuarios: Gestionar otros usuarios',
            'Configuración: Cambiar configuraciones',
          ],
        ),

        _buildStepCard(
          step: '4',
          title: 'Asignar Usuarios a Roles',
          description: 'Cómo asignar roles a los usuarios:',
          icon: Icons.person_add_rounded,
          color: AppDesignSystem.success,
          bulletPoints: [
            'Crea o edita un usuario',
            'Selecciona el rol apropiado',
            'El usuario heredará todos los permisos del rol',
            'Puedes cambiar roles cuando sea necesario',
          ],
        ),
      ],
    );
  }

  Widget _buildConfiguracionContent() {
    return _buildSectionContent(
      title: 'Configuración del Sistema',
      icon: Icons.settings_rounded,
      color: AppDesignSystem.purpleHaze,
      children: [
        _buildStepCard(
          step: '1',
          title: 'Sistema de Fondos Fashion',
          description: 'Configuración de los fondos dinámicos:',
          icon: Icons.wallpaper_rounded,
          color: AppDesignSystem.purpleHaze,
          bulletPoints: [
            'Los fondos rotan automáticamente cada 5-6 minutos',
            '30+ imágenes de jóvenes diversos precargadas',
            'Sistema de tags para filtrar por contexto',
            'Optimización automática para rendimiento',
          ],
        ),

        _buildStepCard(
          step: '2',
          title: 'Temas y Colores',
          description: 'Personalización de la apariencia:',
          icon: Icons.palette_rounded,
          color: AppDesignSystem.vibrantPink,
          bulletPoints: [
            'Modo claro y oscuro disponibles',
            'Paleta juvenil vibrante predefinida',
            'Efectos glassmorphism configurables',
            'Animaciones fluidas activadas por defecto',
          ],
        ),

        _buildStepCard(
          step: '3',
          title: 'Configuración de Negocio',
          description: 'Personaliza la información de tu tienda:',
          icon: Icons.store_rounded,
          color: AppDesignSystem.electricBlue,
          bulletPoints: [
            'Nombre del negocio',
            'Logo y colores corporativos',
            'Información de contacto',
            'Configuración de impuestos',
            'Métodos de pago aceptados',
          ],
        ),

        _buildStepCard(
          step: '4',
          title: 'Respaldo de Datos',
          description: 'Protege tu información:',
          icon: Icons.backup_rounded,
          color: AppDesignSystem.success,
          bulletPoints: [
            'Crear respaldos manuales',
            'Programar respaldos automáticos',
            'Restaurar datos de respaldos',
            'Exportar datos a archivos',
          ],
        ),
      ],
    );
  }

  Widget _buildProblemasContent() {
    return _buildSectionContent(
      title: 'Solución de Problemas Comunes',
      icon: Icons.help_rounded,
      color: AppDesignSystem.error,
      children: [
        _buildStepCard(
          step: '1',
          title: 'Problemas de Login',
          description: 'Si no puedes acceder al sistema:',
          icon: Icons.login_rounded,
          color: AppDesignSystem.error,
          bulletPoints: [
            'Verifica las credenciales: admin / admin123',
            'Asegúrate de no tener CAPS LOCK activado',
            'Reinicia la aplicación si el problema persiste',
            'Contacta al administrador del sistema',
          ],
        ),

        _buildStepCard(
          step: '2',
          title: 'Rendimiento Lento',
          description: 'Si la aplicación funciona lenta:',
          icon: Icons.speed_rounded,
          color: AppDesignSystem.warning,
          bulletPoints: [
            'Los fondos fashion pueden consumir recursos',
            'Cierra otras aplicaciones pesadas',
            'Verifica que tu dispositivo cumpla los requisitos',
            'Reinicia la aplicación periódicamente',
          ],
        ),

        _buildStepCard(
          step: '3',
          title: 'Errores en Reportes',
          description: 'Si los gráficos no cargan correctamente:',
          icon: Icons.error_rounded,
          color: AppDesignSystem.sunsetOrange,
          bulletPoints: [
            'Verifica que existan datos en el período seleccionado',
            'Cambia el período de análisis',
            'Reinicia la vista de reportes',
            'Revisa la configuración de fecha y hora',
          ],
        ),

        _buildStepCard(
          step: '4',
          title: 'Problemas con Permisos',
          description: 'Si un usuario no puede acceder a una función:',
          icon: Icons.block_rounded,
          color: AppDesignSystem.purpleHaze,
          bulletPoints: [
            'Verifica que el rol tenga los permisos necesarios',
            'Revisa la asignación de rol al usuario',
            'El rol Admin tiene acceso a todo',
            'Contacta al administrador para cambios de permisos',
          ],
        ),
      ],
    );
  }

  Widget _buildTipsContent() {
    return _buildSectionContent(
      title: 'Tips y Trucos para Usar FlutStore',
      icon: Icons.lightbulb_rounded,
      color: AppDesignSystem.neonGreen,
      children: [
        _buildStepCard(
          step: '💡',
          title: 'Aprovecha los Fondos Fashion',
          description: 'Saca el máximo provecho de la nueva estética:',
          icon: Icons.auto_awesome_rounded,
          color: AppDesignSystem.neonGreen,
          bulletPoints: [
            'Los fondos cambian automáticamente para mantener frescura visual',
            'Usa diferentes tags según el contexto de trabajo',
            'La diversidad de imágenes refleja inclusión y modernidad',
            'Los efectos glassmorphism mejoran la experiencia visual',
          ],
        ),

        _buildStepCard(
          step: '⚡',
          title: 'Navegación Rápida',
          description: 'Accesos directos para trabajar más eficientemente:',
          icon: Icons.flash_on_rounded,
          color: AppDesignSystem.electricBlue,
          bulletPoints: [
            'Usa la búsqueda global para encontrar productos rápidamente',
            'Los chips de filtros permiten navegación visual',
            'Las animaciones indican el estado de las operaciones',
            'El dashboard centraliza toda la información importante',
          ],
        ),

        _buildStepCard(
          step: '📊',
          title: 'Mejores Prácticas para Reportes',
          description: 'Cómo obtener insights valiosos:',
          icon: Icons.insights_rounded,
          color: AppDesignSystem.vibrantPink,
          bulletPoints: [
            'Revisa los KPIs diariamente desde el dashboard',
            'Usa diferentes períodos para identificar tendencias',
            'Analiza el top de productos para optimizar inventario',
            'Compara ingresos vs egresos para control financiero',
          ],
        ),

        _buildStepCard(
          step: '🔒',
          title: 'Seguridad y Roles',
          description: 'Mantén tu sistema seguro y organizado:',
          icon: Icons.security_rounded,
          color: AppDesignSystem.warning,
          bulletPoints: [
            'Cambia las credenciales por defecto inmediatamente',
            'Asigna solo los permisos necesarios a cada usuario',
            'Revisa periódicamente los roles y permisos activos',
            'Mantén un rol Admin de respaldo siempre activo',
          ],
        ),

        _buildStepCard(
          step: '🎨',
          title: 'Personalización Visual',
          description: 'Haz que FlutStore refleje tu marca:',
          icon: Icons.brush_rounded,
          color: AppDesignSystem.sunsetOrange,
          bulletPoints: [
            'Los colores juveniles conectan con audiencias jóvenes',
            'La diversidad en los fondos proyecta inclusión',
            'Las animaciones fluidas mejoran la experiencia',
            'El glassmorphism da un toque moderno y profesional',
          ],
        ),
      ],
    );
  }
}
