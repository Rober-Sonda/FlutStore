import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'dart:math' as math;
import 'dart:async';
import '../../services/auth_service.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

// Widget principal para el carrusel de imágenes de moda
class FashionCarouselBackground extends StatefulWidget {
  @override
  _FashionCarouselBackgroundState createState() =>
      _FashionCarouselBackgroundState();
}

class _FashionCarouselBackgroundState extends State<FashionCarouselBackground>
    with TickerProviderStateMixin {
  late AnimationController _transitionController;
  late AnimationController _overlayController;
  late Timer _carouselTimer;

  int _currentImageIndex = 0;
  final List<String> _fashionImages = [
    'https://images.unsplash.com/photo-1469334031218-e382a71b716b?w=1200&q=80', // Jóvenes amigos riéndose con estilo urbano
    'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?w=1200&q=80', // Chica joven saltando con alegría y estilo
    'https://images.unsplash.com/photo-1516726817505-f5ed825624d8?w=1200&q=80', // Grupo de amigos diversos con personalidad y estilo
    'https://images.unsplash.com/photo-1554080353-a576cf803bda?w=1200&q=80', // Joven con outfit colorido y actitud vibrante
    'https://images.unsplash.com/photo-1490725263030-1f0521cec8ec?w=1200&q=80', // Chica con estilo urbano juvenil y energético
    'https://images.unsplash.com/photo-1515886657613-9f3515b0c78f?w=1200&q=80', // Moda oversize y tendencias
    'https://images.unsplash.com/photo-1524504388940-b1c1722653e1?w=1200&q=80', // Estilo casual chic
    'https://images.unsplash.com/photo-1509631179647-0177331693ae?w=1200&q=80', // Jóvenes con personalidad urbana
    'https://images.unsplash.com/photo-1502823403499-6ccfcf4fb453?w=1200&q=80', // Moda colorida y vibrante
    'https://images.unsplash.com/photo-1500048993953-d23a436266cf?w=1200&q=80', // Estilo deportivo y energético
  ];

  @override
  void initState() {
    super.initState();
    _transitionController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _overlayController = AnimationController(
      duration: const Duration(seconds: 6),
      vsync: this,
    )..repeat();

    _startCarouselTimer();
  }

  void _startCarouselTimer() {
    _carouselTimer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (mounted) {
        _nextImage();
      }
    });
  }

  void _nextImage() {
    _transitionController.forward().then((_) {
      setState(() {
        _currentImageIndex = (_currentImageIndex + 1) % _fashionImages.length;
      });
      _transitionController.reverse();
    });
  }

  @override
  void dispose() {
    _transitionController.dispose();
    _overlayController.dispose();
    _carouselTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Imagen de fondo actual
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(_fashionImages[_currentImageIndex]),
              fit: BoxFit.cover,
              onError: (exception, stackTrace) {
                // Fallback a gradiente si la imagen no carga
                setState(() {});
              },
            ),
          ),
        ),

        // Fallback gradiente elegante si la imagen falla
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                const Color(0xFF0F0F23),
                const Color(0xFF1A1A2E),
                const Color(0xFF16213E),
                const Color(0xFF0F0F23),
              ],
            ),
          ),
        ),

        // Overlay con transición de opacidad animada
        AnimatedBuilder(
          animation: _transitionController,
          builder: (context, child) {
            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(
                      0.4 + (_transitionController.value * 0.2),
                    ),
                    Colors.black.withOpacity(0.1),
                    Colors.black.withOpacity(
                      0.6 + (_transitionController.value * 0.3),
                    ),
                  ],
                ),
              ),
            );
          },
        ),

        // Carrusel de moda parisina con indicadores
        ParisianFashionCarousel(),
      ],
    );
  }
}

class GlamorousParticlesPainter extends CustomPainter {
  final double animationValue;

  GlamorousParticlesPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    // Partículas doradas elegantes
    for (int i = 0; i < 30; i++) {
      final x =
          (size.width * (i / 30)) +
          (40 * math.sin(animationValue * 2 * math.pi + i * 0.2));
      final y =
          (size.height * ((i * 0.618) % 1)) +
          (30 * math.cos(animationValue * math.pi + i * 0.3));

      paint.color =
          Color.lerp(
            const Color(0xFFFFD700).withOpacity(0.3),
            const Color(0xFFFF6B35).withOpacity(0.2),
            math.sin(animationValue * math.pi + i) * 0.5 + 0.5,
          )!;

      final radius = 1.5 + (1.5 * math.sin(animationValue * 4 * math.pi + i));
      canvas.drawCircle(Offset(x, y), radius, paint);
    }

    // Líneas diagonales elegantes
    paint.strokeWidth = 0.8;
    paint.style = PaintingStyle.stroke;

    for (int i = 0; i < 8; i++) {
      paint.color =
          Color.lerp(
            const Color(0xFF6366F1).withOpacity(0.1),
            const Color(0xFFA855F7).withOpacity(0.05),
            math.sin(animationValue * math.pi + i) * 0.5 + 0.5,
          )!;

      final startX = -200 + (animationValue * 300);
      final startY = (size.height / 8) * i;
      final endX = size.width + 200 + (animationValue * 200);
      final endY = startY + 400;

      canvas.drawLine(Offset(startX, startY), Offset(endX, endY), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

// Carrusel de moda parisina elegante
class ParisianFashionCarousel extends StatefulWidget {
  @override
  _ParisianFashionCarouselState createState() =>
      _ParisianFashionCarouselState();
}

class _ParisianFashionCarouselState extends State<ParisianFashionCarousel>
    with TickerProviderStateMixin {
  late PageController _pageController;
  late AnimationController _fadeController;
  late AnimationController _parallaxController;

  int _currentPage = 0;
  Timer? _autoScrollTimer;

  final List<ParisianFashionItem> _fashionItems = [
    // Imágenes originales que te gustaron
    ParisianFashionItem(
      imageUrl:
          'https://images.unsplash.com/photo-1509631179647-0177331693ae?w=800&q=80',
      title: 'Estilo Juvenil',
      subtitle: 'Energía Urbana',
    ),
    ParisianFashionItem(
      imageUrl:
          'https://images.unsplash.com/photo-1554080353-a576cf803bda?w=800&q=80',
      title: 'Moda Vibrante',
      subtitle: 'Personalidad Única',
    ),
    ParisianFashionItem(
      imageUrl:
          'https://images.unsplash.com/photo-1516726817505-f5ed825624d8?w=800&q=80',
      title: 'Diversidad',
      subtitle: 'Estilos Únicos',
    ),
    ParisianFashionItem(
      imageUrl:
          'https://images.unsplash.com/photo-1469334031218-e382a71b716b?w=800&q=80',
      title: 'Alegría Urbana',
      subtitle: 'Moda Divertida',
    ),
    ParisianFashionItem(
      imageUrl:
          'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?w=800&q=80',
      title: 'Vida y Movimiento',
      subtitle: 'Estilo Dinámico',
    ),
    ParisianFashionItem(
      imageUrl:
          'https://images.unsplash.com/photo-1490725263030-1f0521cec8ec?w=800&q=80',
      title: 'Street Style',
      subtitle: 'Actitud Joven',
    ),

    // Nuevas imágenes de moda juvenil y alegría
    ParisianFashionItem(
      imageUrl:
          'https://images.unsplash.com/photo-1515886657613-9f3515b0c78f?w=800&q=80',
      title: 'Moda Oversize',
      subtitle: 'Tendencia Actual',
    ),
    ParisianFashionItem(
      imageUrl:
          'https://images.unsplash.com/photo-1524504388940-b1c1722653e1?w=800&q=80',
      title: 'Estilo Casual',
      subtitle: 'Comodidad Chic',
    ),
    ParisianFashionItem(
      imageUrl:
          'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=800&q=80',
      title: 'Elegancia Masculina',
      subtitle: 'Sofisticación Joven',
    ),
    ParisianFashionItem(
      imageUrl:
          'https://images.unsplash.com/photo-1581803118522-7b72a50f7e9f?w=800&q=80',
      title: 'Moda Femenina',
      subtitle: 'Estilo Único',
    ),
    ParisianFashionItem(
      imageUrl:
          'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=800&q=80',
      title: 'Look Urbano',
      subtitle: 'Personalidad Auténtica',
    ),
    ParisianFashionItem(
      imageUrl:
          'https://images.unsplash.com/photo-1503104834685-7205e8607eb9?w=800&q=80',
      title: 'Estilo Bohemio',
      subtitle: 'Libertad de Expresión',
    ),
    ParisianFashionItem(
      imageUrl:
          'https://images.unsplash.com/photo-1488426862026-3ee34a7d66df?w=800&q=80',
      title: 'Moda Minimalista',
      subtitle: 'Simplicidad Elegante',
    ),
    ParisianFashionItem(
      imageUrl:
          'https://images.unsplash.com/photo-1445205170230-053b83016050?w=800&q=80',
      title: 'Fashion Forward',
      subtitle: 'Vanguardia Joven',
    ),
    ParisianFashionItem(
      imageUrl:
          'https://images.unsplash.com/photo-1556906781-9a412961c28c?w=800&q=80',
      title: 'Street Wear',
      subtitle: 'Cultura Urbana',
    ),
    ParisianFashionItem(
      imageUrl:
          'https://images.unsplash.com/photo-1487412720507-e7ab37603c6f?w=800&q=80',
      title: 'Elegancia Natural',
      subtitle: 'Belleza Auténtica',
    ),
    ParisianFashionItem(
      imageUrl:
          'https://images.unsplash.com/photo-1564564321837-a57b7070ac4f?w=800&q=80',
      title: 'Casual Chic',
      subtitle: 'Estilo Relajado',
    ),
    ParisianFashionItem(
      imageUrl:
          'https://images.unsplash.com/photo-1502823403499-6ccfcf4fb453?w=800&q=80',
      title: 'Moda Colorida',
      subtitle: 'Expresión Vibrante',
    ),
    ParisianFashionItem(
      imageUrl:
          'https://images.unsplash.com/photo-1500048993953-d23a436266cf?w=800&q=80',
      title: 'Estilo Deportivo',
      subtitle: 'Actitud Activa',
    ),
    ParisianFashionItem(
      imageUrl:
          'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=800&q=80',
      title: 'Moda Masculina',
      subtitle: 'Fuerza y Estilo',
    ),
    ParisianFashionItem(
      imageUrl:
          'https://images.unsplash.com/photo-1496440737103-cd596325d314?w=800&q=80',
      title: 'Tendencia Retro',
      subtitle: 'Vintage Moderno',
    ),
    ParisianFashionItem(
      imageUrl:
          'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?w=800&q=80',
      title: 'Estilo Profesional',
      subtitle: 'Elegancia Contemporánea',
    ),
    ParisianFashionItem(
      imageUrl:
          'https://images.unsplash.com/photo-1531123897727-8f129e1688ce?w=800&q=80',
      title: 'Moda Juvenil',
      subtitle: 'Frescura y Energía',
    ),
    ParisianFashionItem(
      imageUrl:
          'https://images.unsplash.com/photo-1528991435120-e73e05a58897?w=800&q=80',
      title: 'Look Alternativo',
      subtitle: 'Creatividad sin Límites',
    ),
    ParisianFashionItem(
      imageUrl:
          'https://images.unsplash.com/photo-1492562080023-ab3db95bfbce?w=800&q=80',
      title: 'Estilo Sofisticado',
      subtitle: 'Refinamiento Joven',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _parallaxController = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    )..repeat();

    _startAutoScroll();
    _fadeController.forward();
  }

  void _startAutoScroll() {
    _autoScrollTimer = Timer.periodic(const Duration(seconds: 6), (timer) {
      if (_pageController.hasClients) {
        final nextPage = (_currentPage + 1) % _fashionItems.length;
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOutCubic,
        );
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _fadeController.dispose();
    _parallaxController.dispose();
    _autoScrollTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Carrusel de imágenes
        AnimatedBuilder(
          animation: _parallaxController,
          builder: (context, child) {
            return PageView.builder(
              controller: _pageController,
              onPageChanged: (index) => setState(() => _currentPage = index),
              itemCount: _fashionItems.length,
              itemBuilder: (context, index) {
                final item = _fashionItems[index];
                return _buildFashionSlide(item, index);
              },
            );
          },
        ),

        // Indicadores de página estilo parisino
        Positioned(
          bottom: 40,
          left: 0,
          right: 0,
          child: _buildParisianIndicators(),
        ),

        // Efectos decorativos parisinos
        _buildParisianDecorations(),
      ],
    );
  }

  Widget _buildFashionSlide(ParisianFashionItem item, int index) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(item.imageUrl),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.3),
            BlendMode.darken,
          ),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.black.withOpacity(0.1),
              Colors.black.withOpacity(0.4),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildParisianIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(_fashionItems.length, (index) {
        final isActive = index == _currentPage;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: isActive ? 24 : 8,
          height: 8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: isActive ? Colors.white : Colors.white.withOpacity(0.4),
            boxShadow:
                isActive
                    ? [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.4),
                        blurRadius: 8,
                        spreadRadius: 1,
                      ),
                    ]
                    : null,
          ),
        );
      }),
    );
  }

  Widget _buildParisianDecorations() {
    return AnimatedBuilder(
      animation: _parallaxController,
      builder: (context, child) {
        return CustomPaint(
          size: Size.infinite,
          painter: ParisianDecorationPainter(_parallaxController.value),
        );
      },
    );
  }
}

// Clase que representa un elemento de moda parisina
class ParisianFashionItem {
  final String imageUrl;
  final String title;
  final String subtitle;

  ParisianFashionItem({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
  });
}

// Painter que crea decoraciones parisinas elegantes
class ParisianDecorationPainter extends CustomPainter {
  final double animationValue;

  ParisianDecorationPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    // Efectos parisinos sutiles
    _drawParisianElements(canvas, size, paint);
    _drawElegantPatterns(canvas, size, paint);
  }

  void _drawParisianElements(Canvas canvas, Size size, Paint paint) {
    // Partículas doradas flotantes estilo parisino
    for (int i = 0; i < 20; i++) {
      final x =
          (size.width * (i / 20)) +
          (30 * math.sin(animationValue * math.pi + i * 0.3));
      final y =
          (size.height * ((i * 0.618) % 1)) +
          (25 * math.cos(animationValue * math.pi * 0.7 + i * 0.4));

      final alpha =
          (math.sin(animationValue * 2 * math.pi + i) * 0.5 + 0.5) * 0.15;
      paint.color = Colors.white.withOpacity(alpha);

      final radius = 1.0 + (0.5 * math.sin(animationValue * 3 * math.pi + i));
      canvas.drawCircle(Offset(x, y), radius, paint);
    }
  }

  void _drawElegantPatterns(Canvas canvas, Size size, Paint paint) {
    // Líneas elegantes diagonales
    paint.strokeWidth = 0.5;
    paint.style = PaintingStyle.stroke;

    for (int i = 0; i < 6; i++) {
      final alpha =
          (math.sin(animationValue * math.pi + i * 0.5) * 0.5 + 0.5) * 0.08;
      paint.color = Colors.white.withOpacity(alpha * 0.6);

      final startX = -100 + (animationValue * 150);
      final startY = (size.height / 6) * i;
      final endX = size.width + 100 + (animationValue * 100);
      final endY = startY + 300;

      canvas.drawLine(Offset(startX, startY), Offset(endX, endY), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class InteractiveParticlesPainter extends CustomPainter {
  final double animationValue;
  final Offset mousePosition;
  final bool isMouseInside;

  InteractiveParticlesPainter(
    this.animationValue,
    this.mousePosition,
    this.isMouseInside,
  );

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    // Partículas principales con reacción al mouse
    for (int i = 0; i < 40; i++) {
      final baseX =
          (size.width * (i / 40)) +
          (50 * math.sin(animationValue * 2 * math.pi + i * 0.15));
      final baseY =
          (size.height * ((i * 0.618) % 1)) +
          (40 * math.cos(animationValue * math.pi + i * 0.25));

      // Calcular distancia al mouse y efecto de atracción
      double x = baseX;
      double y = baseY;

      if (isMouseInside) {
        final distance = math.sqrt(
          math.pow(baseX - mousePosition.dx, 2) +
              math.pow(baseY - mousePosition.dy, 2),
        );

        // Efecto de atracción magnética
        if (distance < 150) {
          final attractionStrength = (150 - distance) / 150;
          final angle = math.atan2(
            mousePosition.dy - baseY,
            mousePosition.dx - baseX,
          );
          x += math.cos(angle) * attractionStrength * 30;
          y += math.sin(angle) * attractionStrength * 30;
        }
      }

      // Color dinámico basado en posición y mouse
      final distanceToMouse =
          isMouseInside
              ? math.sqrt(
                math.pow(x - mousePosition.dx, 2) +
                    math.pow(y - mousePosition.dy, 2),
              )
              : 200.0;

      final mouseProximity = math.max(0, 1 - (distanceToMouse / 200));

      paint.color =
          Color.lerp(
            Color.lerp(
              const Color(0xFFFFD700).withOpacity(0.4),
              const Color(0xFFFF6B35).withOpacity(0.3),
              math.sin(animationValue * math.pi + i) * 0.5 + 0.5,
            ),
            const Color(0xFFFFFFFF).withOpacity(0.8),
            mouseProximity * 0.6,
          )!;

      // Radio dinámico con efecto de proximidad
      final baseRadius =
          1.8 + (1.2 * math.sin(animationValue * 4 * math.pi + i));
      final radius = baseRadius + (mouseProximity * 2.5);

      canvas.drawCircle(Offset(x, y), radius, paint);

      // Efecto de rastro para partículas cercanas al mouse
      if (mouseProximity > 0.3) {
        paint.color = paint.color.withOpacity(0.3);
        canvas.drawCircle(Offset(x, y), radius * 1.5, paint);
      }
    }

    // Partículas secundarias más pequeñas
    for (int i = 0; i < 60; i++) {
      final x =
          (size.width * math.Random(i).nextDouble()) +
          (20 * math.sin(animationValue * 3 * math.pi + i * 0.1));
      final y =
          (size.height * math.Random(i + 100).nextDouble()) +
          (15 * math.cos(animationValue * 2 * math.pi + i * 0.2));

      final distanceToMouse =
          isMouseInside
              ? math.sqrt(
                math.pow(x - mousePosition.dx, 2) +
                    math.pow(y - mousePosition.dy, 2),
              )
              : 300.0;

      final proximity = math.max(0, 1 - (distanceToMouse / 100));

      paint.color =
          Color.lerp(
            const Color(0xFF6366F1).withOpacity(0.2),
            const Color(0xFFA855F7).withOpacity(0.4),
            proximity.toDouble(),
          )!;

      final radius = 0.5 + (proximity * 1.5);
      canvas.drawCircle(Offset(x, y), radius, paint);
    }

    // Líneas conectoras entre partículas cercanas al mouse
    if (isMouseInside) {
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 0.5;
      paint.color = const Color(0xFF6366F1).withOpacity(0.3);

      // Crear red de conexiones alrededor del mouse
      final connectionRadius = 120.0;
      List<Offset> nearbyPoints = [];

      for (int i = 0; i < 15; i++) {
        final angle = (i * 2 * math.pi / 15) + (animationValue * math.pi);
        final distance = 50 + (70 * math.sin(animationValue * 2 * math.pi + i));
        final x = mousePosition.dx + math.cos(angle) * distance;
        final y = mousePosition.dy + math.sin(angle) * distance;
        nearbyPoints.add(Offset(x, y));
      }

      for (int i = 0; i < nearbyPoints.length; i++) {
        for (int j = i + 1; j < nearbyPoints.length; j++) {
          final distance = math.sqrt(
            math.pow(nearbyPoints[i].dx - nearbyPoints[j].dx, 2) +
                math.pow(nearbyPoints[i].dy - nearbyPoints[j].dy, 2),
          );

          if (distance < connectionRadius) {
            final opacity =
                (connectionRadius - distance) / connectionRadius * 0.4;
            paint.color = Color(0xFF6366F1).withOpacity(opacity);
            canvas.drawLine(nearbyPoints[i], nearbyPoints[j], paint);
          }
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

// Widget de campo de formulario premium con efectos avanzados
class PremiumFormField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final IconData icon;
  final TextInputType keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;

  const PremiumFormField({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    required this.icon,
    required this.keyboardType,
    this.obscureText = false,
    this.validator,
    this.suffixIcon,
  }) : super(key: key);

  @override
  _PremiumFormFieldState createState() => _PremiumFormFieldState();
}

class _PremiumFormFieldState extends State<PremiumFormField>
    with TickerProviderStateMixin {
  late AnimationController _focusController;
  late AnimationController _hoverController;
  late Animation<double> _focusAnimation;
  late Animation<double> _hoverAnimation;
  late Animation<Color?> _borderColorAnimation;
  late Animation<Color?> _glowColorAnimation;

  bool _isFocused = false;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();

    _focusController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _hoverController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _focusAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _focusController, curve: Curves.easeOutCubic),
    );

    _hoverAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _hoverController, curve: Curves.easeInOut),
    );

    _borderColorAnimation = ColorTween(
      begin: Colors.white.withOpacity(0.1),
      end: Colors.white.withOpacity(0.6),
    ).animate(_focusController);

    _glowColorAnimation = ColorTween(
      begin: Colors.transparent,
      end: Colors.white.withOpacity(0.2),
    ).animate(_focusController);
  }

  @override
  void dispose() {
    _focusController.dispose();
    _hoverController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([_focusController, _hoverController]),
      builder: (context, child) {
        return MouseRegion(
          onEnter: (_) => _onHover(true),
          onExit: (_) => _onHover(false),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                // Sombra base
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10 + (_hoverAnimation.value * 5),
                  offset: Offset(0, 4 + (_hoverAnimation.value * 2)),
                ),
                // Sombra de color dinámico
                BoxShadow(
                  color: _glowColorAnimation.value ?? Colors.transparent,
                  blurRadius: 20 + (_focusAnimation.value * 10),
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            child: TextFormField(
              controller: widget.controller,
              keyboardType: widget.keyboardType,
              obscureText: widget.obscureText,
              validator: widget.validator,
              onTap: () => _onFocusChange(true),
              onTapOutside: (_) => _onFocusChange(false),
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.5,
              ),
              decoration: InputDecoration(
                labelText: widget.labelText,
                hintText: widget.hintText,
                labelStyle: TextStyle(
                  color: Color.lerp(
                    Colors.white.withOpacity(0.6),
                    Colors.white.withOpacity(0.9),
                    _focusAnimation.value * 0.8,
                  ),
                  fontSize: 14 + (_focusAnimation.value * 2),
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.5,
                ),
                hintStyle: TextStyle(
                  color: Colors.white.withOpacity(0.4),
                  fontSize: 14,
                ),
                prefixIcon: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOutCubic,
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.lerp(
                          Colors.white.withOpacity(0.2),
                          Colors.white.withOpacity(0.4),
                          _focusAnimation.value,
                        )!,
                        Color.lerp(
                          Colors.white.withOpacity(0.1),
                          Colors.white.withOpacity(0.3),
                          _focusAnimation.value,
                        )!,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow:
                        _focusAnimation.value > 0.3
                            ? [
                              BoxShadow(
                                color: Colors.white.withOpacity(0.3),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ]
                            : [],
                  ),
                  transform:
                      Matrix4.identity()
                        ..scale(1.0 + (_hoverAnimation.value * 0.1)),
                  child: Icon(
                    widget.icon,
                    color: Color.lerp(
                      Colors.white.withOpacity(0.8),
                      Colors.white,
                      _focusAnimation.value,
                    ),
                    size: 18 + (_focusAnimation.value * 2),
                  ),
                ),
                suffixIcon:
                    widget.suffixIcon != null
                        ? Transform.scale(
                          scale: 1.0 + (_hoverAnimation.value * 0.1),
                          child: widget.suffixIcon,
                        )
                        : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color:
                        Color.lerp(
                          Colors.white.withOpacity(0.1),
                          Colors.white.withOpacity(0.3),
                          _hoverAnimation.value,
                        )!,
                    width: 1 + (_hoverAnimation.value * 0.5),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color:
                        _borderColorAnimation.value ??
                        Colors.white.withOpacity(0.6),
                    width: 2 + (_focusAnimation.value * 0.5),
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Colors.redAccent.withOpacity(0.8),
                    width: 2,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    color: Colors.redAccent,
                    width: 2.5,
                  ),
                ),
                filled: true,
                fillColor: Color.lerp(
                  Colors.white.withOpacity(
                    0.12,
                  ), // Más opacidad para mejor legibilidad
                  Colors.white.withOpacity(0.18),
                  _hoverAnimation.value,
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20 + (_focusAnimation.value * 4),
                  vertical: 18 + (_focusAnimation.value * 2),
                ),
                errorStyle: TextStyle(
                  color: Colors.redAccent.withOpacity(0.9),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _onFocusChange(bool focused) {
    setState(() => _isFocused = focused);
    if (focused) {
      _focusController.forward();
    } else {
      _focusController.reverse();
    }
  }

  void _onHover(bool hovered) {
    setState(() => _isHovered = hovered);
    if (hovered) {
      _hoverController.forward();
    } else {
      _hoverController.reverse();
    }
  }
}

// Botón de login premium con efectos avanzados
class PremiumLoginButton extends StatefulWidget {
  final VoidCallback? onPressed;
  final bool isLoading;
  final String text;

  const PremiumLoginButton({
    Key? key,
    required this.onPressed,
    required this.isLoading,
    required this.text,
  }) : super(key: key);

  @override
  _PremiumLoginButtonState createState() => _PremiumLoginButtonState();
}

class _PremiumLoginButtonState extends State<PremiumLoginButton>
    with TickerProviderStateMixin {
  late AnimationController _hoverController;
  late AnimationController _pressController;
  late AnimationController _shimmerController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _elevationAnimation;
  late Animation<Color?> _colorAnimation;

  bool _isHovered = false;

  @override
  void initState() {
    super.initState();

    _hoverController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _pressController = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );

    _shimmerController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat();

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.02).animate(
      CurvedAnimation(parent: _hoverController, curve: Curves.easeInOut),
    );

    _elevationAnimation = Tween<double>(begin: 8.0, end: 16.0).animate(
      CurvedAnimation(parent: _hoverController, curve: Curves.easeInOut),
    );

    _colorAnimation = ColorTween(
      begin: Colors.white.withOpacity(0.9),
      end: Colors.white,
    ).animate(_hoverController);
  }

  @override
  void dispose() {
    _hoverController.dispose();
    _pressController.dispose();
    _shimmerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([
        _hoverController,
        _pressController,
        _shimmerController,
      ]),
      builder: (context, child) {
        return MouseRegion(
          onEnter: (_) => _onHover(true),
          onExit: (_) => _onHover(false),
          child: GestureDetector(
            onTapDown: (_) => _pressController.forward(),
            onTapUp: (_) => _pressController.reverse(),
            onTapCancel: () => _pressController.reverse(),
            child: Transform.scale(
              scale: _scaleAnimation.value - (_pressController.value * 0.02),
              child: Container(
                width: double.infinity,
                height: 56,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      _colorAnimation.value ?? Colors.white.withOpacity(0.9),
                      Color.lerp(
                            Colors.white.withOpacity(0.9),
                            Colors.white,
                            _hoverController.value * 0.4,
                          ) ??
                          Colors.white.withOpacity(0.9),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: _elevationAnimation.value,
                      offset: Offset(0, _elevationAnimation.value * 0.3),
                    ),
                    BoxShadow(
                      color: Colors.white.withOpacity(
                        0.3 * _hoverController.value,
                      ),
                      blurRadius: 20,
                      offset: const Offset(0, 0),
                    ),
                  ],
                  border: Border.all(
                    color:
                        Color.lerp(
                          Colors.transparent,
                          Colors.white.withOpacity(0.4),
                          _hoverController.value,
                        ) ??
                        Colors.transparent,
                    width: 1,
                  ),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: widget.onPressed,
                    borderRadius: BorderRadius.circular(28),
                    splashColor: Colors.black.withOpacity(0.2),
                    highlightColor: Colors.black.withOpacity(0.1),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          // Efecto shimmer
                          if (!widget.isLoading)
                            Positioned.fill(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(28),
                                child: CustomPaint(
                                  painter: ShimmerPainter(
                                    _shimmerController.value,
                                    _hoverController.value,
                                  ),
                                ),
                              ),
                            ),

                          // Contenido del botón
                          widget.isLoading
                              ? SizedBox(
                                width: 24,
                                height: 24,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2.5,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.black,
                                  ),
                                ),
                              )
                              : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.login_rounded,
                                    color: Colors.black,
                                    size: 20,
                                  ),
                                  const SizedBox(width: 12),
                                  Text(
                                    widget.text,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                ],
                              ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _onHover(bool hovered) {
    setState(() => _isHovered = hovered);
    if (hovered) {
      _hoverController.forward();
    } else {
      _hoverController.reverse();
    }
  }
}

// Painter para efecto shimmer en el botón
class ShimmerPainter extends CustomPainter {
  final double animationValue;
  final double hoverValue;

  ShimmerPainter(this.animationValue, this.hoverValue);

  @override
  void paint(Canvas canvas, Size size) {
    if (hoverValue < 0.1) return;

    final paint =
        Paint()
          ..shader = LinearGradient(
            begin: Alignment(-1.0 - (animationValue * 2), 0.0),
            end: Alignment(1.0 - (animationValue * 2), 0.0),
            colors: [
              Colors.transparent,
              Colors.white.withOpacity(0.3 * hoverValue),
              Colors.white.withOpacity(0.5 * hoverValue),
              Colors.white.withOpacity(0.2 * hoverValue),
              Colors.transparent,
            ],
            stops: const [0.0, 0.3, 0.5, 0.7, 1.0],
          ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.width, size.height),
        const Radius.circular(28),
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

// Widget obsoleto - mantenido para compatibilidad
class FashionLoginBackground extends StatefulWidget {
  @override
  _FashionLoginBackgroundState createState() => _FashionLoginBackgroundState();
}

class _FashionLoginBackgroundState extends State<FashionLoginBackground>
    with TickerProviderStateMixin {
  late AnimationController _particleController;
  late AnimationController _colorController;

  @override
  void initState() {
    super.initState();
    _particleController = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    )..repeat();

    _colorController = AnimationController(
      duration: const Duration(seconds: 8),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _particleController.dispose();
    _colorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Gradiente base elegante
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                const Color(0xFF0F0F23),
                const Color(0xFF1A1A2E),
                const Color(0xFF16213E),
                const Color(0xFF0F0F23),
              ],
            ),
          ),
        ),

        // Efectos de partículas de moda
        AnimatedBuilder(
          animation: _particleController,
          builder: (context, child) {
            return CustomPaint(
              size: Size.infinite,
              painter: FashionParticlesPainter(
                _particleController.value,
                _colorController.value,
              ),
            );
          },
        ),

        // Overlay con transparencia
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.3),
                Colors.transparent,
                Colors.black.withOpacity(0.5),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class FashionParticlesPainter extends CustomPainter {
  final double animationValue;
  final double colorValue;

  FashionParticlesPainter(this.animationValue, this.colorValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    // Partículas doradas para elegancia
    for (int i = 0; i < 50; i++) {
      final x =
          (size.width * (i / 50)) +
          (30 * math.sin(animationValue * 2 * math.pi + i * 0.1));
      final y =
          (size.height * ((i * 0.618) % 1)) +
          (20 * math.cos(animationValue * math.pi + i * 0.2));

      paint.color =
          Color.lerp(
            const Color(0xFFFFD700).withOpacity(0.3),
            const Color(0xFFFF6B6B).withOpacity(0.2),
            colorValue,
          )!;

      canvas.drawCircle(
        Offset(x, y),
        1 + (2 * math.sin(animationValue * 3 * math.pi + i)),
        paint,
      );
    }

    // Líneas diagonales estilo moda
    paint.strokeWidth = 1;
    paint.style = PaintingStyle.stroke;
    paint.color = const Color(0xFF6366F1).withOpacity(0.1);

    for (int i = 0; i < 15; i++) {
      final startX = -100 + (animationValue * 200);
      final startY = (size.height / 15) * i;
      final endX = size.width + 100 + (animationValue * 150);
      final endY = startY + 200;

      canvas.drawLine(Offset(startX, startY), Offset(endX, endY), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class _LoginViewState extends ConsumerState<LoginView>
    with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _obscurePassword = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _createDefaultAdmin();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _createDefaultAdmin() async {
    final authService = ref.read(authServiceProvider);
    await authService.createDefaultAdmin();
  }

  Future<void> _login() async {
    // Verifica que el formKey y el estado no sean nulos antes de usar el operador !
    // Esta línea asegura que solo se continúa si el formulario existe y es válido.
    if (_formKey.currentState == null || !_formKey.currentState!.validate())
      return;

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final authService = ref.read(authServiceProvider);
      final success = await authService.login(
        _usernameController.text.trim(),
        _passwordController.text,
      );

      if (success) {
        // Obtener información del usuario
        final usuario = await authService.getCurrentUser(
          _usernameController.text.trim(),
        );

        // Actualizar estado de autenticación
        ref.read(currentUserProvider.notifier).state = usuario;
        ref.read(isAuthenticatedProvider.notifier).state = true;

        // Login exitoso
        if (mounted) {
          context.go('/dashboard');
        }
      } else {
        setState(() {
          _errorMessage = 'Usuario o contraseña incorrectos';
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Error al iniciar sesión: $e';
      });
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _showForgotPasswordDialog() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            title: Row(
              children: [
                Icon(Icons.lock_reset, color: Colors.blue[600]),
                const SizedBox(width: 8),
                const Text('Recuperar Contraseña'),
              ],
            ),
            content: const Text(
              'Para recuperar tu contraseña, contacta al administrador del sistema. '
              'Se requiere verificación de identidad por seguridad.',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Entendido'),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isWideScreen = screenSize.width > 800;
    final screenHeight = screenSize.height;

    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: screenHeight,
        child: isWideScreen ? _buildSplitScreenLayout() : _buildMobileLayout(),
      ),
    );
  }

  // Layout para pantallas anchas (desktop/tablet horizontal)
  Widget _buildSplitScreenLayout() {
    return Stack(
      children: [
        // Fondo completo - Carrusel de imágenes de moda que abarca toda la pantalla
        Positioned.fill(child: FashionCarouselBackground()),

        // Overlay negro con opacidad
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Colors.black.withOpacity(0.3),
                  Colors.black.withOpacity(0.1),
                  Colors.black.withOpacity(0.7),
                ],
              ),
            ),
          ),
        ),

        // Branding overlay en la izquierda
        Positioned(
          bottom: 60,
          left: 40,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'TIENDA NAJAM',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  letterSpacing: 4,
                  shadows: [
                    Shadow(
                      color: Colors.black.withOpacity(0.8),
                      blurRadius: 30,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'MODA • JUVENTUD • PERSONALIDAD',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white.withOpacity(0.9),
                  letterSpacing: 2,
                  shadows: [
                    Shadow(
                      color: Colors.black.withOpacity(0.8),
                      blurRadius: 20,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // Panel derecho - Formulario de login
        Positioned(
          right: 0,
          top: 0,
          bottom: 0,
          width: MediaQuery.of(context).size.width * 0.4,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Colors.black.withOpacity(0.4),
                  Colors.black.withOpacity(0.85),
                  Colors.black.withOpacity(0.95),
                ],
              ),
            ),
            child: _buildLoginForm(),
          ),
        ),
      ],
    );
  }

  // Layout para dispositivos móviles
  Widget _buildMobileLayout() {
    return Container(
      height: double.infinity,
      child: Stack(
        children: [
          // Background de moda
          FashionCarouselBackground(),

          // Contenido principal
          Container(
            width: double.infinity,
            height: double.infinity,
            child: SafeArea(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Container(
                  constraints: BoxConstraints(
                    minHeight:
                        MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.top -
                        MediaQuery.of(context).padding.bottom,
                  ),
                  child: Center(
                    child: Container(
                      margin: const EdgeInsets.all(24),
                      padding: const EdgeInsets.all(32),
                      constraints: const BoxConstraints(maxWidth: 400),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.black.withOpacity(0.85),
                            Colors.black.withOpacity(0.7),
                            Colors.black.withOpacity(0.9),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(32),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.6),
                            blurRadius: 50,
                            spreadRadius: 0,
                            offset: const Offset(0, 20),
                          ),
                          BoxShadow(
                            color: Colors.white.withOpacity(0.1),
                            blurRadius: 80,
                            spreadRadius: -20,
                            offset: const Offset(0, 0),
                          ),
                        ],
                        border: Border.all(
                          color: Colors.white.withOpacity(0.2),
                          width: 1.5,
                        ),
                      ),
                      child: _buildLoginFormContent(),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Formulario elegante para split-screen
  Widget _buildLoginForm() {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 420),
          padding: const EdgeInsets.all(36),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.black.withOpacity(0.6),
                Colors.black.withOpacity(0.4),
                Colors.black.withOpacity(0.7),
              ],
            ),
            borderRadius: BorderRadius.circular(32),
            border: Border.all(
              color: Colors.white.withOpacity(0.2),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 30,
                offset: const Offset(0, 16),
              ),
              BoxShadow(
                color: Colors.white.withOpacity(0.1),
                blurRadius: 60,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [_buildLoginFormContent()],
            ),
          ),
        ),
      ),
    );
  }

  // Contenido del formulario (reutilizable)
  Widget _buildLoginFormContent() {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Logo elegante
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white.withOpacity(0.2),
                  Colors.white.withOpacity(0.1),
                  Colors.white.withOpacity(0.15),
                ],
              ),
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.1),
                  blurRadius: 25,
                  offset: const Offset(0, 12),
                ),
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 15,
                  offset: const Offset(0, 6),
                ),
              ],
              border: Border.all(
                color: Colors.white.withOpacity(0.3),
                width: 2,
              ),
            ),
            child: Icon(
              Icons.storefront_outlined,
              size: 45,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),

          // Título principal elegante
          Text(
            'TIENDA NAJAM',
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.w800,
              color: Colors.white,
              letterSpacing: 3,
              shadows: [
                Shadow(
                  color: Colors.white.withOpacity(0.3),
                  blurRadius: 20,
                  offset: const Offset(0, 4),
                ),
                Shadow(
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
          ),
          const SizedBox(height: 6),

          // Subtítulo elegante
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.white.withOpacity(0.1),
                  Colors.white.withOpacity(0.15),
                  Colors.white.withOpacity(0.1),
                ],
              ),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.white.withOpacity(0.2),
                width: 1,
              ),
            ),
            child: Text(
              'MODA • ESTILO • PERSONALIDAD',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: Colors.white.withOpacity(0.9),
                letterSpacing: 2,
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Texto de acceso elegante
          Column(
            children: [
              Text(
                'Bienvenido',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                width: 60,
                height: 1,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      Colors.white.withOpacity(0.6),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Descubrí tu estilo único',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.white.withOpacity(0.8),
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Decoración elegante
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 1,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        Colors.white.withOpacity(0.4),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Icon(
                  Icons.auto_awesome_outlined,
                  color: Colors.white.withOpacity(0.6),
                  size: 20,
                ),
              ),
              Expanded(
                child: Container(
                  height: 1,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        Colors.white.withOpacity(0.4),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Campo de usuario premium con efectos hover
          PremiumFormField(
            controller: _usernameController,
            labelText: 'Usuario',
            hintText: 'Ingresa tu usuario',
            icon: Icons.person_outline,
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'El usuario es requerido';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),

          // Campo de contraseña premium con efectos hover
          PremiumFormField(
            controller: _passwordController,
            labelText: 'Contraseña',
            hintText: 'Ingresa tu contraseña',
            icon: Icons.lock_outline,
            keyboardType: TextInputType.visiblePassword,
            obscureText: _obscurePassword,
            suffixIcon: IconButton(
              icon: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: Icon(
                  _obscurePassword
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  key: ValueKey(_obscurePassword),
                  color: Colors.white.withOpacity(0.7),
                  size: 20,
                ),
              ),
              onPressed: () {
                setState(() {
                  _obscurePassword = !_obscurePassword;
                });
              },
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'La contraseña es requerida';
              }
              return null;
            },
          ),
          const SizedBox(height: 24),

          // Mensaje de error
          if (_errorMessage != null) ...[
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.red.withOpacity(0.3),
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  Icon(Icons.error_outline, color: Colors.red[300], size: 18),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      _errorMessage!,
                      style: TextStyle(
                        color: Colors.red[100],
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],

          // Botón de login premium con efectos avanzados
          PremiumLoginButton(
            onPressed: _isLoading ? null : _login,
            isLoading: _isLoading,
            text: 'INGRESAR',
          ),
          const SizedBox(height: 20),

          // Información adicional elegante
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.05),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Colors.white.withOpacity(0.1),
                width: 1,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.info_outline,
                  color: Colors.white.withOpacity(0.8),
                  size: 16,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Usuario: admin | Contraseña: admin123',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),

          // Enlace para recuperar contraseña
          GestureDetector(
            onTap: _showForgotPasswordDialog,
            child: Text(
              '¿Olvidaste tu contraseña?',
              style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontSize: 12,
                decoration: TextDecoration.underline,
                decorationColor: Colors.white.withOpacity(0.7),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
