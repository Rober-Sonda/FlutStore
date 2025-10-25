import 'package:flutter/material.dart';
import '../widgets/app_design_system.dart';

/// Widget elegante para cambiar entre tema claro y oscuro
class ThemeSwitcher extends StatefulWidget {
  final Function(bool)? onThemeChanged;

  const ThemeSwitcher({super.key, this.onThemeChanged});

  @override
  State<ThemeSwitcher> createState() => _ThemeSwitcherState();
}

class _ThemeSwitcherState extends State<ThemeSwitcher>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.elasticOut),
    );

    _rotationAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleTheme() {
    final newTheme = !AppDesignSystem.isDark;
    AppDesignSystem.setTheme(newTheme);

    _animationController.forward().then((_) {
      _animationController.reverse();
    });

    widget.onThemeChanged?.call(newTheme);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: GestureDetector(
            onTap: _toggleTheme,
            child: Container(
              width: 120,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppDesignSystem.radiusLg),
                gradient: LinearGradient(
                  colors: [
                    AppDesignSystem.isDark
                        ? AppDesignSystem.darkSecondary
                        : AppDesignSystem.lightSecondary,
                    AppDesignSystem.isDark
                        ? AppDesignSystem.darkTertiary
                        : AppDesignSystem.lightTertiary,
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: (AppDesignSystem.isDark ? Colors.black : Colors.grey)
                        .withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
                border: Border.all(
                  color: AppDesignSystem.goldAccent.withOpacity(0.3),
                  width: 1,
                ),
              ),
              child: Stack(
                children: [
                  // Fondo animado
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        AppDesignSystem.radiusLg,
                      ),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors:
                                AppDesignSystem.isDark
                                    ? [
                                      AppDesignSystem.darkBackground,
                                      AppDesignSystem.darkSecondary,
                                    ]
                                    : [
                                      AppDesignSystem.lightBackground,
                                      AppDesignSystem.lightSecondary,
                                    ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Indicador deslizante
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    left: AppDesignSystem.isDark ? 4 : 66,
                    top: 4,
                    child: Transform.rotate(
                      angle: _rotationAnimation.value * 6.28,
                      child: Container(
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [
                              AppDesignSystem.goldAccent,
                              AppDesignSystem.electricBlue,
                            ],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: AppDesignSystem.goldAccent.withOpacity(
                                0.5,
                              ),
                              blurRadius: 12,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Icon(
                          AppDesignSystem.isDark
                              ? Icons.nightlight_round
                              : Icons.wb_sunny_rounded,
                          color: Colors.black,
                          size: 24,
                        ),
                      ),
                    ),
                  ),

                  // Etiquetas
                  Positioned(
                    left: AppDesignSystem.isDark ? 70 : 8,
                    top: 0,
                    bottom: 0,
                    child: Center(
                      child: Text(
                        AppDesignSystem.isDark ? 'Claro' : 'Oscuro',
                        style: TextStyle(
                          color: AppDesignSystem.textSecondary,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
