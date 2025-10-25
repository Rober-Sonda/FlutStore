import 'package:flutter/material.dart';
import '../components/shared/professional_navigation_rail.dart';
import '../widgets/modern_title_bar.dart';
import '../widgets/app_design_system.dart';
import '../widgets/theme_switcher.dart';
import '../widgets/fashion_components.dart';

class MainView extends StatefulWidget {
  final Widget child;

  const MainView({super.key, required this.child});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FashionScaffold(
      backgroundTags: const ['urbano', 'personalidad'],
      overlayOpacity: 0.8,
      showBackgroundRotation: true,
      rotationInterval: const Duration(minutes: 3),
      body: AnimatedBuilder(
        animation: _fadeAnimation,
        builder: (context, child) {
          return Opacity(
            opacity: _fadeAnimation.value,
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: Column(
                children: [
                  // Barra de título moderna con glassmorphismo
                  ModernCard(
                    margin: const EdgeInsets.all(0),
                    borderRadius: 0,
                    glassMorphism: true,
                    opacity: 0.92,
                    child: Row(
                      children: [
                        const Expanded(child: ModernTitleBar()),
                        // Selector de tema con estilo juvenil
                        Padding(
                          padding: const EdgeInsets.all(
                            AppDesignSystem.spaceMd,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  AppDesignSystem.vibrantPink.withOpacity(0.1),
                                  AppDesignSystem.electricBlue.withOpacity(0.1),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: AppDesignSystem.vibrantPink.withOpacity(
                                  0.2,
                                ),
                                width: 1,
                              ),
                            ),
                            child: ThemeSwitcher(
                              onThemeChanged: (isDark) {
                                setState(() {
                                  // Rebuild para aplicar el nuevo tema
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Contenido principal con animación
                  Expanded(
                    child: Row(
                      children: [
                        // Navegación lateral profesional mejorada
                        TweenAnimationBuilder<double>(
                          duration: const Duration(milliseconds: 800),
                          tween: Tween(begin: -300.0, end: 0.0),
                          builder: (context, value, child) {
                            return Transform.translate(
                              offset: Offset(value, 0),
                              child: const ProfessionalNavigationRail(),
                            );
                          },
                        ),

                        // Área de contenido con glassmorphismo juvenil
                        Expanded(
                          child: TweenAnimationBuilder<double>(
                            duration: const Duration(milliseconds: 1000),
                            tween: Tween(begin: 300.0, end: 0.0),
                            builder: (context, value, child) {
                              return Transform.translate(
                                offset: Offset(value, 0),
                                child: ModernCard(
                                  margin: const EdgeInsets.all(
                                    AppDesignSystem.spaceMd,
                                  ),
                                  borderRadius: AppDesignSystem.radiusXl,
                                  glassMorphism: true,
                                  opacity: 0.95,
                                  borderColor: AppDesignSystem.vibrantPink
                                      .withOpacity(0.2),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppDesignSystem.vibrantPink
                                          .withOpacity(0.1),
                                      blurRadius: 20,
                                      offset: const Offset(0, 10),
                                      spreadRadius: -2,
                                    ),
                                    BoxShadow(
                                      color: AppDesignSystem.electricBlue
                                          .withOpacity(0.1),
                                      blurRadius: 30,
                                      offset: const Offset(10, 0),
                                      spreadRadius: -5,
                                    ),
                                  ],
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        AppDesignSystem.radiusXl,
                                      ),
                                      gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          Colors.white.withOpacity(0.1),
                                          Colors.white.withOpacity(0.05),
                                        ],
                                      ),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                        AppDesignSystem.radiusXl,
                                      ),
                                      child: widget.child,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
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
}
