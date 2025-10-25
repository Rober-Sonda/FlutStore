import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'dart:async';

/// Sistema global de fondos con jóvenes diversos con estilo urbano
/// Rotación aleatoria y caché optimizado para toda la aplicación
class FashionBackgroundSystem {
  static const List<FashionBackground> _fashionGallery = [
    // 🌍 Diversidad Global - Jóvenes con Estilo Urbano

    // Mujeres Latinas
    FashionBackground(
      url:
          'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?w=1200&q=80',
      description: 'Latina joven saltando con alegría y estilo',
      tags: ['latina', 'alegría', 'urbano', 'energía'],
    ),
    FashionBackground(
      url:
          'https://images.unsplash.com/photo-1554080353-a576cf803bda?w=1200&q=80',
      description: 'Joven latina con outfit colorido y personalidad',
      tags: ['latina', 'colorido', 'personalidad', 'moda'],
    ),
    FashionBackground(
      url:
          'https://images.unsplash.com/photo-1581803118522-7b72a50f7e9f?w=1200&q=80',
      description: 'Mujer latina elegante con estilo único',
      tags: ['latina', 'elegancia', 'único', 'sofisticado'],
    ),

    // Hombres Latinos
    FashionBackground(
      url:
          'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=1200&q=80',
      description: 'Hombre latino con estilo urbano auténtico',
      tags: ['latino', 'urbano', 'auténtico', 'masculino'],
    ),
    FashionBackground(
      url:
          'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=1200&q=80',
      description: 'Joven latino con elegancia masculina',
      tags: ['latino', 'elegancia', 'masculino', 'estilo'],
    ),

    // Mujeres Afroamericanas
    FashionBackground(
      url:
          'https://images.unsplash.com/photo-1531123897727-8f129e1688ce?w=1200&q=80',
      description: 'Mujer afroamericana con estilo juvenil vibrante',
      tags: ['afroamericana', 'juvenil', 'vibrante', 'moda'],
    ),
    FashionBackground(
      url:
          'https://images.unsplash.com/photo-1487412720507-e7ab37603c6f?w=1200&q=80',
      description: 'Joven afroamericana con belleza natural y estilo',
      tags: ['afroamericana', 'natural', 'belleza', 'elegante'],
    ),
    FashionBackground(
      url:
          'https://images.unsplash.com/photo-1524504388940-b1c1722653e1?w=1200&q=80',
      description: 'Mujer afroamericana con estilo casual chic',
      tags: ['afroamericana', 'casual', 'chic', 'relajado'],
    ),

    // Hombres Afroamericanos
    FashionBackground(
      url:
          'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?w=1200&q=80',
      description: 'Hombre afroamericano con estilo profesional',
      tags: ['afroamericano', 'profesional', 'elegante', 'contemporáneo'],
    ),
    FashionBackground(
      url:
          'https://images.unsplash.com/photo-1500048993953-d23a436266cf?w=1200&q=80',
      description: 'Joven afroamericano con estilo deportivo',
      tags: ['afroamericano', 'deportivo', 'activo', 'energético'],
    ),

    // Mujeres Asiáticas
    FashionBackground(
      url:
          'https://images.unsplash.com/photo-1503104834685-7205e8607eb9?w=1200&q=80',
      description: 'Mujer asiática con estilo bohemio moderno',
      tags: ['asiática', 'bohemio', 'moderno', 'libertad'],
    ),
    FashionBackground(
      url:
          'https://images.unsplash.com/photo-1488426862026-3ee34a7d66df?w=1200&q=80',
      description: 'Joven asiática con estilo minimalista elegante',
      tags: ['asiática', 'minimalista', 'elegante', 'simplicidad'],
    ),

    // Mujeres Caucásicas
    FashionBackground(
      url:
          'https://images.unsplash.com/photo-1490725263030-1f0521cec8ec?w=1200&q=80',
      description: 'Mujer caucásica con estilo urbano juvenil',
      tags: ['caucásica', 'urbano', 'juvenil', 'energético'],
    ),
    FashionBackground(
      url:
          'https://images.unsplash.com/photo-1515886657613-9f3515b0c78f?w=1200&q=80',
      description: 'Joven caucásica con moda oversize trendy',
      tags: ['caucásica', 'oversize', 'trendy', 'actual'],
    ),

    // Hombres Caucásicos
    FashionBackground(
      url:
          'https://images.unsplash.com/photo-1564564321837-a57b7070ac4f?w=1200&q=80',
      description: 'Hombre caucásico con estilo casual chic',
      tags: ['caucásico', 'casual', 'chic', 'relajado'],
    ),
    FashionBackground(
      url:
          'https://images.unsplash.com/photo-1496440737103-cd596325d314?w=1200&q=80',
      description: 'Joven caucásico con tendencia retro moderna',
      tags: ['caucásico', 'retro', 'moderno', 'vintage'],
    ),

    // Grupos Diversos
    FashionBackground(
      url:
          'https://images.unsplash.com/photo-1516726817505-f5ed825624d8?w=1200&q=80',
      description: 'Grupo diverso de jóvenes con personalidad única',
      tags: ['grupo', 'diverso', 'personalidad', 'únicos'],
    ),
    FashionBackground(
      url:
          'https://images.unsplash.com/photo-1469334031218-e382a71b716b?w=1200&q=80',
      description: 'Amigos diversos riéndose con estilo urbano',
      tags: ['amigos', 'diverso', 'alegría', 'urbano'],
    ),
    FashionBackground(
      url:
          'https://images.unsplash.com/photo-1509631179647-0177331693ae?w=1200&q=80',
      description: 'Jóvenes diversos con estilo y personalidad',
      tags: ['jóvenes', 'diverso', 'estilo', 'personalidad'],
    ),

    // Estilos Alternativos y Creativos
    FashionBackground(
      url:
          'https://images.unsplash.com/photo-1528991435120-e73e05a58897?w=1200&q=80',
      description: 'Look alternativo con creatividad sin límites',
      tags: ['alternativo', 'creativo', 'límites', 'expresión'],
    ),
    FashionBackground(
      url:
          'https://images.unsplash.com/photo-1502823403499-6ccfcf4fb453?w=1200&q=80',
      description: 'Moda colorida con expresión vibrante',
      tags: ['colorida', 'expresión', 'vibrante', 'alegre'],
    ),

    // Street Fashion Global
    FashionBackground(
      url:
          'https://images.unsplash.com/photo-1445205170230-053b83016050?w=1200&q=80',
      description: 'Street fashion vanguardista y joven',
      tags: ['street', 'vanguardia', 'joven', 'forward'],
    ),
    FashionBackground(
      url:
          'https://images.unsplash.com/photo-1556906781-9a412961c28c?w=1200&q=80',
      description: 'Street wear con cultura urbana auténtica',
      tags: ['streetwear', 'cultura', 'urbana', 'auténtica'],
    ),

    // Tendencias Actuales
    FashionBackground(
      url:
          'https://images.unsplash.com/photo-1492562080023-ab3db95bfbce?w=1200&q=80',
      description: 'Estilo sofisticado con refinamiento joven',
      tags: ['sofisticado', 'refinamiento', 'joven', 'elegante'],
    ),

    // Más Diversidad y Estilos Únicos
    FashionBackground(
      url:
          'https://images.unsplash.com/photo-1441986300917-64674bd600d8?w=1200&q=80',
      description: 'Boutique interior con ambiente juvenil',
      tags: ['boutique', 'interior', 'juvenil', 'ambiente'],
    ),
    FashionBackground(
      url:
          'https://images.unsplash.com/photo-1567401893414-76b7b1e5a7a5?w=1200&q=80',
      description: 'Espacio de moda luxury con personalidad',
      tags: ['luxury', 'moda', 'personalidad', 'espacio'],
    ),

    // Adicionales para mayor variedad
    FashionBackground(
      url:
          'https://images.unsplash.com/photo-1556905055-8f358a7a47b2?w=1200&q=80',
      description: 'Retrato de moda con personalidad única',
      tags: ['retrato', 'moda', 'personalidad', 'única'],
    ),
    FashionBackground(
      url:
          'https://images.unsplash.com/photo-1583394838336-acd977736f90?w=1200&q=80',
      description: 'Estilo urbano con actitud contemporánea',
      tags: ['urbano', 'actitud', 'contemporáneo', 'moderno'],
    ),
    FashionBackground(
      url:
          'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=1200&q=80',
      description: 'Moda juvenil con energía y frescura',
      tags: ['juvenil', 'energía', 'frescura', 'vibrante'],
    ),
    FashionBackground(
      url:
          'https://images.unsplash.com/photo-1521119989659-a83eee488004?w=1200&q=80',
      description: 'Street style con personalidad auténtica',
      tags: ['street', 'personalidad', 'auténtica', 'original'],
    ),
    FashionBackground(
      url:
          'https://images.unsplash.com/photo-1542909168-82c3e7fdca5c?w=1200&q=80',
      description: 'Estilo casual con elegancia natural',
      tags: ['casual', 'elegancia', 'natural', 'relajado'],
    ),
    FashionBackground(
      url:
          'https://images.unsplash.com/photo-1512733596533-7b00ccf8ebaf?w=1200&q=80',
      description: 'Moda urbana con diversidad cultural',
      tags: ['urbana', 'diversidad', 'cultural', 'inclusiva'],
    ),
  ];

  static final math.Random _random = math.Random();
  static FashionBackground? _currentBackground;
  static Timer? _rotationTimer;

  /// Obtiene un fondo aleatorio de la galería
  static FashionBackground getRandomBackground() {
    final newBackground =
        _fashionGallery[_random.nextInt(_fashionGallery.length)];
    _currentBackground = newBackground;
    return newBackground;
  }

  /// Obtiene un fondo filtrado por tags
  static FashionBackground getBackgroundByTags(List<String> tags) {
    final filtered =
        _fashionGallery
            .where(
              (bg) => bg.tags.any((tag) => tags.contains(tag.toLowerCase())),
            )
            .toList();

    if (filtered.isEmpty) return getRandomBackground();

    final selected = filtered[_random.nextInt(filtered.length)];
    _currentBackground = selected;
    return selected;
  }

  /// Inicia rotación automática de fondos
  static void startAutoRotation(Duration interval, VoidCallback onChanged) {
    _rotationTimer?.cancel();
    _rotationTimer = Timer.periodic(interval, (_) {
      getRandomBackground();
      onChanged();
    });
  }

  /// Detiene la rotación automática
  static void stopAutoRotation() {
    _rotationTimer?.cancel();
    _rotationTimer = null;
  }

  /// Obtiene el fondo actual
  static FashionBackground? get currentBackground => _currentBackground;

  /// Total de imágenes en la galería
  static int get totalImages => _fashionGallery.length;
}

/// Modelo para representar un fondo de moda
class FashionBackground {
  final String url;
  final String description;
  final List<String> tags;

  const FashionBackground({
    required this.url,
    required this.description,
    required this.tags,
  });
}

/// Widget que muestra un fondo de moda con overlay personalizable
class FashionBackgroundWidget extends StatefulWidget {
  final FashionBackground? background;
  final Widget child;
  final Color overlayColor;
  final double overlayOpacity;
  final BlendMode blendMode;
  final bool animated;
  final Duration animationDuration;

  const FashionBackgroundWidget({
    super.key,
    this.background,
    required this.child,
    this.overlayColor = Colors.black,
    this.overlayOpacity = 0.6,
    this.blendMode = BlendMode.darken,
    this.animated = true,
    this.animationDuration = const Duration(milliseconds: 800),
  });

  @override
  State<FashionBackgroundWidget> createState() =>
      _FashionBackgroundWidgetState();
}

class _FashionBackgroundWidgetState extends State<FashionBackgroundWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  FashionBackground? _currentBackground;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _updateBackground();
  }

  @override
  void didUpdateWidget(FashionBackgroundWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.background != oldWidget.background) {
      _updateBackground();
    }
  }

  void _updateBackground() {
    final newBackground =
        widget.background ?? FashionBackgroundSystem.getRandomBackground();

    if (widget.animated && _currentBackground != null) {
      _animationController.reverse().then((_) {
        setState(() {
          _currentBackground = newBackground;
        });
        _animationController.forward();
      });
    } else {
      setState(() {
        _currentBackground = newBackground;
      });
      if (widget.animated) {
        _animationController.forward();
      }
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_currentBackground == null) {
      return widget.child;
    }

    Widget backgroundImage = Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(_currentBackground!.url),
          fit: BoxFit.cover,
          onError: (exception, stackTrace) {
            // Fallback a gradiente si la imagen falla
          },
        ),
      ),
    );

    if (widget.animated) {
      backgroundImage = FadeTransition(
        opacity: _fadeAnimation,
        child: backgroundImage,
      );
    }

    return Stack(
      children: [
        // Fondo de imagen
        Positioned.fill(child: backgroundImage),

        // Overlay con color personalizable
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              color: widget.overlayColor.withOpacity(widget.overlayOpacity),
            ),
          ),
        ),

        // Gradiente adicional para mejor legibilidad
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.2),
                  Colors.transparent,
                  Colors.black.withOpacity(0.4),
                ],
              ),
            ),
          ),
        ),

        // Contenido principal
        widget.child,
      ],
    );
  }
}
