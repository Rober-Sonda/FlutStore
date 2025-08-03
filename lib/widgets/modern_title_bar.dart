import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:tienda_app/widgets/top_bar_actions.dart';
import 'package:tienda_app/services/theme_service.dart';
import 'package:tienda_app/models/app_theme.dart';

class ModernTitleBar extends ConsumerStatefulWidget {
  const ModernTitleBar({super.key});

  @override
  ConsumerState<ModernTitleBar> createState() => _ModernTitleBarState();
}

class _ModernTitleBarState extends ConsumerState<ModernTitleBar>
    with TickerProviderStateMixin {
  late AnimationController _logoAnimationController;
  late AnimationController _pulseAnimationController;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _logoAnimationController = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    );
    _pulseAnimationController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
    _logoAnimationController.repeat();
    _pulseAnimationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _logoAnimationController.dispose();
    _pulseAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentTheme = ref.watch(currentThemeProvider);

    return Container(
      height: 50,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            currentTheme.surfaceColor,
            currentTheme.surfaceColor.withOpacity(0.95),
            currentTheme.surfaceColor,
          ],
        ),
        border: Border(
          bottom: BorderSide(
            color: currentTheme.textSecondaryColor.withOpacity(0.1),
            width: 1,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color:
                currentTheme.isDark
                    ? Colors.black.withOpacity(0.3)
                    : Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Modern Logo and Title Section
          Expanded(
            child: MoveWindow(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    // Animated Modern Logo
                    MouseRegion(
                      onEnter: (_) => setState(() => _isHovered = true),
                      onExit: (_) => setState(() => _isHovered = false),
                      child: AnimatedBuilder(
                        animation: Listenable.merge([
                          _logoAnimationController,
                          _pulseAnimationController,
                        ]),
                        builder: (context, child) {
                          return Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  currentTheme.primaryColor,
                                  currentTheme.primaryColor.withOpacity(0.8),
                                  currentTheme.primaryColor,
                                ],
                              ),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: currentTheme.primaryColor.withOpacity(
                                    0.4,
                                  ),
                                  blurRadius:
                                      6 + (_logoAnimationController.value * 3),
                                  offset: Offset(
                                    0,
                                    2 + (_logoAnimationController.value * 1),
                                  ),
                                  spreadRadius: 1,
                                ),
                              ],
                            ),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                // Animated background pattern
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: RadialGradient(
                                      center: Alignment.topLeft,
                                      radius: 1.5,
                                      colors: [
                                        Colors.white.withOpacity(0.3),
                                        Colors.transparent,
                                      ],
                                    ),
                                  ),
                                ),
                                // Main icon with pulse effect
                                Transform.scale(
                                  scale:
                                      _isHovered
                                          ? 1.1 +
                                              (_pulseAnimationController.value *
                                                  0.1)
                                          : 1.0,
                                  child: Icon(
                                    Icons.storefront_rounded,
                                    size: 18,
                                    color: Colors.white,
                                  ),
                                ),
                                // Shine effect
                                Positioned(
                                  top: 2,
                                  left: 2,
                                  child: Container(
                                    width: 5,
                                    height: 5,
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.8),
                                      borderRadius: BorderRadius.circular(2.5),
                                    ),
                                  ),
                                ),
                                // Animated border glow
                                if (_isHovered)
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: Colors.white.withOpacity(0.6),
                                        width: 1.5,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 12),

                    // Modern Typography Section - Ajustado para evitar overflow
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Main brand name with gradient
                          ShaderMask(
                            shaderCallback:
                                (bounds) => LinearGradient(
                                  colors: [
                                    currentTheme.primaryColor,
                                    currentTheme.primaryColor.withOpacity(0.8),
                                    currentTheme.primaryColor,
                                  ],
                                ).createShader(bounds),
                            child: Text(
                              'NAJAM',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 2.0,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          const SizedBox(height: 1),
                          // Subtitle with modern styling
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 1,
                            ),
                            decoration: BoxDecoration(
                              color: currentTheme.primaryColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                color: currentTheme.primaryColor.withOpacity(
                                  0.3,
                                ),
                                width: 1,
                              ),
                            ),
                            child: Text(
                              'TIENDA OFICIAL',
                              style: TextStyle(
                                color: currentTheme.primaryColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 8,
                                letterSpacing: 1.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 16),

                    // Modern separator
                    Container(
                      width: 1,
                      height: 25,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            currentTheme.textSecondaryColor.withOpacity(0.3),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(width: 16),

                    // Version or status indicator
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: currentTheme.successColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: currentTheme.successColor.withOpacity(0.3),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 5,
                            height: 5,
                            decoration: BoxDecoration(
                              color: currentTheme.successColor,
                              borderRadius: BorderRadius.circular(2.5),
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'v2.0.1',
                            style: TextStyle(
                              color: currentTheme.successColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Modern Top Bar Actions
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: const TopBarActions(),
          ),

          // Modern separator
          Container(
            width: 1,
            height: 25,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  currentTheme.textSecondaryColor.withOpacity(0.3),
                  Colors.transparent,
                ],
              ),
            ),
          ),

          // Modern Window Control Buttons
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ModernWindowButtons(currentTheme: currentTheme),
          ),
        ],
      ),
    );
  }
}

class ModernWindowButtons extends StatelessWidget {
  final AppTheme currentTheme;

  const ModernWindowButtons({super.key, required this.currentTheme});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ModernWindowButton(
          icon: Icons.remove,
          color: Colors.orange,
          onPressed: appWindow.minimize,
          tooltip: 'Minimizar',
          currentTheme: currentTheme,
        ),
        const SizedBox(width: 6),
        ModernWindowButton(
          icon: Icons.crop_square,
          color: Colors.green,
          onPressed: appWindow.maximizeOrRestore,
          tooltip: 'Maximizar/Restaurar',
          currentTheme: currentTheme,
        ),
        const SizedBox(width: 6),
        ModernWindowButton(
          icon: Icons.close,
          color: Colors.red,
          onPressed: appWindow.close,
          tooltip: 'Cerrar',
          currentTheme: currentTheme,
        ),
      ],
    );
  }
}

class ModernWindowButton extends StatefulWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;
  final String tooltip;
  final AppTheme currentTheme;

  const ModernWindowButton({
    super.key,
    required this.icon,
    required this.color,
    required this.onPressed,
    required this.tooltip,
    required this.currentTheme,
  });

  @override
  State<ModernWindowButton> createState() => _ModernWindowButtonState();
}

class _ModernWindowButtonState extends State<ModernWindowButton>
    with TickerProviderStateMixin {
  bool _hovering = false;
  late AnimationController _hoverAnimationController;
  late AnimationController _pulseAnimationController;

  @override
  void initState() {
    super.initState();
    _hoverAnimationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _pulseAnimationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _hoverAnimationController.dispose();
    _pulseAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() => _hovering = true);
        _hoverAnimationController.forward();
        _pulseAnimationController.repeat();
      },
      onExit: (_) {
        setState(() => _hovering = false);
        _hoverAnimationController.reverse();
        _pulseAnimationController.stop();
      },
      cursor: SystemMouseCursors.click,
      child: Tooltip(
        message: widget.tooltip,
        child: GestureDetector(
          onTap: widget.onPressed,
          child: AnimatedBuilder(
            animation: Listenable.merge([
              _hoverAnimationController,
              _pulseAnimationController,
            ]),
            builder: (context, child) {
              return Container(
                width: 26,
                height: 26,
                decoration: BoxDecoration(
                  gradient:
                      _hovering
                          ? LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              widget.color.withOpacity(0.2),
                              widget.color.withOpacity(0.1),
                            ],
                          )
                          : null,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color:
                        _hovering
                            ? widget.color.withOpacity(0.5)
                            : Colors.transparent,
                    width: 1,
                  ),
                  boxShadow:
                      _hovering
                          ? [
                            BoxShadow(
                              color: widget.color.withOpacity(0.3),
                              blurRadius: 4,
                              offset: const Offset(0, 1),
                            ),
                          ]
                          : null,
                ),
                child: Icon(
                  widget.icon,
                  size: 13,
                  color:
                      _hovering
                          ? widget.color
                          : widget.currentTheme.textSecondaryColor,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
