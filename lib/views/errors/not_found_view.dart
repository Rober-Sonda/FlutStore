import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../widgets/app_design_system.dart';
import '../../src/app_routes.dart';

class NotFoundView extends StatefulWidget {
  final String path;

  const NotFoundView({super.key, required this.path});

  @override
  State<NotFoundView> createState() => _NotFoundViewState();
}

class _NotFoundViewState extends State<NotFoundView>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _slideController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _slideController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeOutQuart),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _slideController, curve: Curves.easeOutQuart),
    );

    _startAnimations();
  }

  void _startAnimations() async {
    await Future.delayed(const Duration(milliseconds: 200));
    _fadeController.forward();
    await Future.delayed(const Duration(milliseconds: 300));
    _slideController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.width < 768;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: AppDesignSystem.getFashionBackgroundDecoration(),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppDesignSystem.background.withOpacity(0.8),
                AppDesignSystem.surface.withOpacity(0.9),
              ],
            ),
          ),
          child: Stack(
            children: [
              // Decorative elements
              _buildDecorativeElements(),

              // Main content
              Center(
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: SlideTransition(
                    position: _slideAnimation,
                    child: Container(
                      constraints: BoxConstraints(
                        maxWidth: isSmallScreen ? size.width * 0.9 : 600,
                      ),
                      padding: EdgeInsets.all(isSmallScreen ? 24 : 48),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // 404 Icon with modern design
                          _build404Icon(isSmallScreen),

                          SizedBox(height: isSmallScreen ? 32 : 48),

                          // Title
                          ShaderMask(
                            shaderCallback:
                                (bounds) => const LinearGradient(
                                  colors: [Colors.white, Color(0xFFE2E8F0)],
                                ).createShader(bounds),
                            child: Text(
                              'Página no encontrada',
                              style: TextStyle(
                                fontSize: isSmallScreen ? 28 : 36,
                                fontWeight: FontWeight.w900,
                                color: Colors.white,
                                letterSpacing: -0.5,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),

                          SizedBox(height: isSmallScreen ? 16 : 24),

                          // Subtitle
                          Text(
                            'La ruta "${widget.path}" no existe en nuestro sistema.',
                            style: TextStyle(
                              fontSize: isSmallScreen ? 14 : 16,
                              color: const Color(0xFF94A3B8), // Slate-400
                              height: 1.6,
                            ),
                            textAlign: TextAlign.center,
                          ),

                          SizedBox(height: isSmallScreen ? 32 : 48),

                          // Actions
                          _buildActionButtons(context, isSmallScreen),

                          SizedBox(height: isSmallScreen ? 24 : 32),

                          // Quick navigation
                          _buildQuickNavigation(context, isSmallScreen),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              // Back button
              Positioned(top: 24, left: 24, child: _buildBackButton(context)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDecorativeElements() {
    return Stack(
      children: [
        // Gradient orbs con colores modernos
        Positioned(
          top: -100,
          right: -100,
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  AppDesignSystem.goldAccent.withOpacity(0.2),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: -150,
          left: -150,
          child: Container(
            width: 400,
            height: 400,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  AppDesignSystem.electricBlue.withOpacity(0.15),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _build404Icon(bool isSmallScreen) {
    return Container(
      width: isSmallScreen ? 120 : 160,
      height: isSmallScreen ? 120 : 160,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppDesignSystem.goldAccent, AppDesignSystem.electricBlue],
        ),
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: AppDesignSystem.goldAccent.withOpacity(0.4),
            blurRadius: 24,
            offset: const Offset(0, 12),
            spreadRadius: -4,
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Icon(
            Icons.error_outline_rounded,
            size: isSmallScreen ? 48 : 64,
            color: Colors.white,
          ),
          Positioned(
            top: 16,
            right: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppDesignSystem.electricBlue,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: AppDesignSystem.electricBlue.withOpacity(0.4),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Text(
                '404',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isSmallScreen ? 12 : 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context, bool isSmallScreen) {
    return Column(
      children: [
        // Primary action - Go to Dashboard
        Container(
          width: double.infinity,
          height: 56,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppDesignSystem.goldAccent,
                AppDesignSystem.electricBlue,
              ],
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: ElevatedButton(
            onPressed: () => context.go(AppRoutes.dashboard),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.black,
              elevation: 0,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.home_rounded, size: 20),
                const SizedBox(width: 12),
                Text(
                  'Ir al Dashboard',
                  style: TextStyle(
                    fontSize: isSmallScreen ? 14 : 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 16),

        // Secondary action - Go back
        SizedBox(
          width: double.infinity,
          height: 56,
          child: OutlinedButton(
            onPressed: () {
              if (context.canPop()) {
                context.pop();
              } else {
                context.go(AppRoutes.dashboard);
              }
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: AppDesignSystem.textPrimary,
              side: BorderSide(color: AppDesignSystem.goldAccent, width: 2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ).copyWith(
              foregroundColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.hovered)) {
                  return AppDesignSystem.goldAccent;
                }
                return AppDesignSystem.textPrimary;
              }),
              side: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.hovered)) {
                  return BorderSide(
                    color: AppDesignSystem.goldAccent,
                    width: 2,
                  );
                }
                return BorderSide(color: AppDesignSystem.goldAccent, width: 2);
              }),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.arrow_back_rounded, size: 20),
                const SizedBox(width: 12),
                Text(
                  'Volver atrás',
                  style: TextStyle(
                    fontSize: isSmallScreen ? 14 : 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildQuickNavigation(BuildContext context, bool isSmallScreen) {
    final quickLinks = [
      {
        'icon': Icons.inventory_2_outlined,
        'label': 'Productos',
        'route': AppRoutes.products,
      },
      {
        'icon': Icons.people_outline,
        'label': 'Clientes',
        'route': AppRoutes.clients,
      },
      {
        'icon': Icons.point_of_sale_outlined,
        'label': 'Ventas',
        'route': AppRoutes.sales,
      },
      {
        'icon': Icons.assessment_outlined,
        'label': 'Reportes',
        'route': AppRoutes.reports,
      },
    ];

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppDesignSystem.surface.withOpacity(0.7),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppDesignSystem.goldAccent.withOpacity(0.3),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: AppDesignSystem.goldAccent.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            'Accesos rápidos',
            style: TextStyle(
              fontSize: isSmallScreen ? 14 : 16,
              fontWeight: FontWeight.w600,
              color: AppDesignSystem.textPrimary,
            ),
          ),

          const SizedBox(height: 16),

          Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children:
                quickLinks.map((link) {
                  return InkWell(
                    onTap: () => context.go(link['route'] as String),
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: AppDesignSystem.surface.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: AppDesignSystem.goldAccent.withOpacity(0.3),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            link['icon'] as IconData,
                            size: 16,
                            color: AppDesignSystem.textSecondary,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            link['label'] as String,
                            style: TextStyle(
                              fontSize: isSmallScreen ? 12 : 13,
                              color: AppDesignSystem.textSecondary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppDesignSystem.surface.withOpacity(0.8),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppDesignSystem.goldAccent.withOpacity(0.3),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: AppDesignSystem.goldAccent.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: IconButton(
        onPressed: () {
          if (context.canPop()) {
            context.pop();
          } else {
            context.go(AppRoutes.dashboard);
          }
        },
        icon: Icon(
          Icons.arrow_back_rounded,
          color: AppDesignSystem.textPrimary,
          size: 20,
        ),
        tooltip: 'Volver',
      ),
    );
  }
}
