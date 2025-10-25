import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:math' as math;
import '../services/theme_service.dart';

class TransparentScaffold extends ConsumerWidget {
  final Widget? body;
  final PreferredSizeWidget? appBar;
  final Widget? drawer;
  final Widget? endDrawer;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Widget? bottomNavigationBar;
  final Widget? bottomSheet;
  final bool resizeToAvoidBottomInset;
  final Color? backgroundColor;
  final bool extendBody;
  final bool extendBodyBehindAppBar;
  final double transparency;

  const TransparentScaffold({
    super.key,
    this.body,
    this.appBar,
    this.drawer,
    this.endDrawer,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.resizeToAvoidBottomInset = true,
    this.backgroundColor,
    this.extendBody = false,
    this.extendBodyBehindAppBar = false,
    this.transparency = 0.95, // 5% de transparencia por defecto
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(currentThemeProvider);

    return Scaffold(
      appBar: appBar,
      drawer: drawer,
      endDrawer: endDrawer,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      bottomNavigationBar: bottomNavigationBar,
      bottomSheet: bottomSheet,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      extendBody: extendBody,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      backgroundColor:
          backgroundColor ??
          (currentTheme.isDark
              ? Colors.black.withOpacity(transparency)
              : Colors.white.withOpacity(transparency)),
      body:
          body != null
              ? Container(
                decoration: BoxDecoration(
                  color:
                      currentTheme.isDark
                          ? const Color(0xFF0F172A).withOpacity(transparency)
                          : const Color(0xFFF8FAFC).withOpacity(transparency),
                ),
                child: body,
              )
              : null,
    );
  }
}

class TransparentContainer extends ConsumerWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? width;
  final double? height;
  final BoxDecoration? decoration;
  final double transparency;
  final bool useGlassEffect;

  const TransparentContainer({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.decoration,
    this.transparency = 0.92, // 8% de transparencia por defecto
    this.useGlassEffect = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(currentThemeProvider);

    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration:
          decoration ??
          BoxDecoration(
            color:
                useGlassEffect
                    ? currentTheme.isDark
                        ? Colors.white.withOpacity(0.05)
                        : Colors.white.withOpacity(0.15)
                    : currentTheme.isDark
                    ? const Color(0xFF1E293B).withOpacity(transparency)
                    : const Color(0xFFFFFFFF).withOpacity(transparency),
            borderRadius: BorderRadius.circular(12),
            border:
                useGlassEffect
                    ? Border.all(
                      color:
                          currentTheme.isDark
                              ? Colors.white.withOpacity(0.1)
                              : Colors.white.withOpacity(0.3),
                      width: 1,
                    )
                    : null,
            boxShadow:
                useGlassEffect
                    ? [
                      BoxShadow(
                        color:
                            currentTheme.isDark
                                ? Colors.black.withOpacity(0.3)
                                : Colors.grey.withOpacity(0.2),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                      ),
                    ]
                    : [
                      BoxShadow(
                        color:
                            currentTheme.isDark
                                ? Colors.black.withOpacity(0.2)
                                : Colors.grey.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
          ),
      child: child,
    );
  }
}

class FashionBackground extends StatefulWidget {
  final Widget child;

  const FashionBackground({super.key, required this.child});

  @override
  State<FashionBackground> createState() => _FashionBackgroundState();
}

class _FashionBackgroundState extends State<FashionBackground>
    with TickerProviderStateMixin {
  late AnimationController _backgroundController;
  int _currentImageIndex = 0;

  final List<String> _fashionImages = [
    'assets/images/backgrounds/fashion1.jpg',
    'assets/images/backgrounds/fashion2.jpg',
    'assets/images/backgrounds/fashion3.jpg',
    'assets/images/backgrounds/fashion4.jpg',
    'assets/images/backgrounds/fashion5.jpg',
  ];

  @override
  void initState() {
    super.initState();
    _backgroundController = AnimationController(
      duration: const Duration(seconds: 8),
      vsync: this,
    );

    _backgroundController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _currentImageIndex = (_currentImageIndex + 1) % _fashionImages.length;
        });
        _backgroundController.reset();
        _backgroundController.forward();
      }
    });

    _backgroundController.forward();
  }

  @override
  void dispose() {
    _backgroundController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background con gradiente y patrones de moda
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                const Color(0xFF1E293B),
                const Color(0xFF334155),
                const Color(0xFF475569),
                const Color(0xFF1E293B),
              ],
              stops: const [0.0, 0.3, 0.7, 1.0],
            ),
          ),
        ),

        // Patrón de moda animado
        AnimatedBuilder(
          animation: _backgroundController,
          builder: (context, child) {
            return Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment.topRight,
                  radius: 1.5 + (_backgroundController.value * 0.5),
                  colors: [
                    const Color(0xFF6366F1).withOpacity(0.1),
                    const Color(0xFF8B5CF6).withOpacity(0.05),
                    Colors.transparent,
                  ],
                ),
              ),
            );
          },
        ),

        // Efectos de partículas de moda
        Positioned.fill(
          child: CustomPaint(
            painter: FashionParticlesPainter(_backgroundController.value),
          ),
        ),

        // Contenido principal
        widget.child,
      ],
    );
  }
}

class FashionParticlesPainter extends CustomPainter {
  final double animationValue;

  FashionParticlesPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = const Color(0xFF6366F1).withOpacity(0.1)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1;

    // Dibujar patrones geométricos inspirados en moda
    for (int i = 0; i < 20; i++) {
      final x = (size.width / 20) * i;
      final y =
          size.height * 0.3 +
          (50 * math.sin((animationValue * 2 * math.pi) + (i * 0.3)));

      canvas.drawCircle(
        Offset(x, y),
        3 + (2 * math.sin(animationValue * 2 * math.pi + i)),
        paint,
      );
    }

    // Líneas diagonales estilo moda
    paint.color = const Color(0xFF8B5CF6).withOpacity(0.05);
    for (int i = 0; i < 10; i++) {
      final startX = (size.width / 10) * i;
      final startY = size.height * 0.1;
      final endX = startX + (100 * math.cos(animationValue * math.pi + i));
      final endY = size.height * 0.9;

      canvas.drawLine(Offset(startX, startY), Offset(endX, endY), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
