import 'package:flutter/material.dart';
import '../components/shared/professional_navigation_rail.dart';
import '../widgets/modern_title_bar.dart';
import '../widgets/app_design_system.dart';
import '../widgets/theme_switcher.dart';

class MainView extends StatefulWidget {
  final Widget child;

  const MainView({super.key, required this.child});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppDesignSystem.background,
      body: Container(
        decoration: AppDesignSystem.getFashionBackgroundDecoration(),
        child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: Column(
            children: [
              // Barra de título moderna con selector de tema
              Container(
                decoration: BoxDecoration(
                  color: AppDesignSystem.surface.withOpacity(0.95),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    const Expanded(child: ModernTitleBar()),
                    // Selector de tema elegante
                    Padding(
                      padding: const EdgeInsets.all(AppDesignSystem.spaceMd),
                      child: ThemeSwitcher(
                        onThemeChanged: (isDark) {
                          setState(() {
                            // Rebuild para aplicar el nuevo tema
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),

              // Contenido principal
              Expanded(
                child: Row(
                  children: [
                    // Navegación lateral profesional
                    const ProfessionalNavigationRail(),

                    // Área de contenido con diseño mejorado
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(AppDesignSystem.spaceMd),
                        decoration: BoxDecoration(
                          color: AppDesignSystem.surface.withOpacity(0.95),
                          borderRadius: BorderRadius.circular(
                            AppDesignSystem.radiusLg,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 16,
                              offset: const Offset(0, 8),
                            ),
                          ],
                          border: Border.all(
                            color: AppDesignSystem.goldAccent.withOpacity(0.2),
                            width: 1,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                            AppDesignSystem.radiusLg,
                          ),
                          child: widget.child,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
