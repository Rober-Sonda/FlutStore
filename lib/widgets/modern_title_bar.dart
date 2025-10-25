import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import '../widgets/top_bar_actions.dart';
import '../services/theme_service.dart';
import '../models/app_theme.dart';
import '../providers/carrito_provider.dart';
import 'package:go_router/go_router.dart';

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
    final carrito = ref.watch(carritoProvider);

    return Container(
      height: 56, // Altura aumentada para mejor presencia
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors:
              currentTheme.isDark
                  ? [
                    const Color(0xFF0F172A),
                    const Color(0xFF1E293B),
                    const Color(0xFF334155),
                  ]
                  : [
                    Colors.white,
                    const Color(0xFFF8FAFC),
                    const Color(0xFFE2E8F0),
                  ],
        ),
        border: Border(
          bottom: BorderSide(
            color:
                currentTheme.isDark
                    ? Colors.white.withOpacity(0.08)
                    : Colors.black.withOpacity(0.06),
            width: 1,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color:
                currentTheme.isDark
                    ? Colors.black.withOpacity(0.4)
                    : Colors.grey.withOpacity(0.15),
            blurRadius: 12,
            offset: const Offset(0, 4),
            spreadRadius: 1,
          ),
          BoxShadow(
            color:
                currentTheme.isDark
                    ? const Color(0xFF6366F1).withOpacity(0.1)
                    : const Color(0xFF6366F1).withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 8),
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
                    // Animated Modern Logo Premium
                    MouseRegion(
                      onEnter: (_) => setState(() => _isHovered = true),
                      onExit: (_) => setState(() => _isHovered = false),
                      child: AnimatedBuilder(
                        animation: Listenable.merge([
                          _logoAnimationController,
                          _pulseAnimationController,
                        ]),
                        builder: (context, child) {
                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            width: _isHovered ? 38 : 34,
                            height: _isHovered ? 38 : 34,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  const Color(0xFF6366F1),
                                  const Color(0xFF8B5CF6),
                                  const Color(0xFFA855F7),
                                  const Color(0xFF6366F1),
                                ],
                                stops: const [0.0, 0.3, 0.7, 1.0],
                              ),
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xFF6366F1).withOpacity(
                                    0.4 +
                                        (_pulseAnimationController.value * 0.2),
                                  ),
                                  blurRadius:
                                      8 + (_logoAnimationController.value * 4),
                                  offset: Offset(
                                    0,
                                    3 + (_logoAnimationController.value * 2),
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
                          // Main brand name with modern gradient
                          ShaderMask(
                            shaderCallback:
                                (bounds) => LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    const Color(0xFF6366F1),
                                    const Color(0xFF8B5CF6),
                                    const Color(0xFFA855F7),
                                    const Color(0xFF6366F1),
                                  ],
                                  stops: const [0.0, 0.3, 0.7, 1.0],
                                ).createShader(bounds),
                            child: AnimatedDefaultTextStyle(
                              duration: const Duration(milliseconds: 300),
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                letterSpacing: _isHovered ? 2.5 : 2.0,
                                fontSize: _isHovered ? 19 : 18,
                                fontFamily: 'Roboto',
                                shadows: [
                                  Shadow(
                                    color: const Color(
                                      0xFF6366F1,
                                    ).withOpacity(0.3),
                                    blurRadius: 4,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: const Text('FASHION CENTER'),
                            ),
                          ),
                          const SizedBox(height: 2),
                          // Subtitle with premium badge design
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            padding: EdgeInsets.symmetric(
                              horizontal: _isHovered ? 8 : 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors:
                                    currentTheme.isDark
                                        ? [
                                          const Color(
                                            0xFF6366F1,
                                          ).withOpacity(0.15),
                                          const Color(
                                            0xFF8B5CF6,
                                          ).withOpacity(0.15),
                                        ]
                                        : [
                                          const Color(
                                            0xFF6366F1,
                                          ).withOpacity(0.08),
                                          const Color(
                                            0xFF8B5CF6,
                                          ).withOpacity(0.08),
                                        ],
                              ),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: const Color(0xFF6366F1).withOpacity(0.3),
                                width: 1,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(
                                    0xFF6366F1,
                                  ).withOpacity(0.1),
                                  blurRadius: 4,
                                  offset: const Offset(0, 1),
                                ),
                              ],
                            ),
                            child: Text(
                              'GESTIÓN COMERCIAL',
                              style: TextStyle(
                                color: const Color(0xFF6366F1),
                                fontWeight: FontWeight.w700,
                                fontSize: 9,
                                letterSpacing: 1.2,
                                fontFamily: 'Roboto',
                                shadows: [
                                  Shadow(
                                    color: const Color(
                                      0xFF6366F1,
                                    ).withOpacity(0.2),
                                    blurRadius: 2,
                                    offset: const Offset(0, 1),
                                  ),
                                ],
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
            child: Row(
              children: [
                // Icono de carrito con punto rojo si hay productos
                Stack(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.shopping_cart),
                      tooltip: 'Carrito de compras',
                      onPressed: () {
                        GoRouter.of(context).go('/carrito-compra');
                      },
                    ),
                    if (carrito.isNotEmpty)
                      Positioned(
                        right: 6,
                        top: 6,
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 1.5),
                          ),
                        ),
                      ),
                  ],
                ),
                // ...otros posibles botones de TopBarActions...
                // Elimina cualquier otro IconButton de carrito aquÃ­.
                const TopBarActions(),
              ],
            ),
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
