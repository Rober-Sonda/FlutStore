import 'package:flutter/material.dart';

class AppDesignSystem {
  // TEMA OSCURO - Paleta negra elegante
  static const Color darkPrimary = Color(0xFF000000);
  static const Color darkSecondary = Color(0xFF1A1A1A);
  static const Color darkTertiary = Color(0xFF2D2D2D);
  static const Color darkSurface = Color(0xFF121212);
  static const Color darkBackground = Color(0xFF0A0A0A);

  // TEMA CLARO - Paleta limpia
  static const Color lightPrimary = Color(0xFFFFFFFF);
  static const Color lightSecondary = Color(0xFFF5F5F5);
  static const Color lightTertiary = Color(0xFFE0E0E0);
  static const Color lightSurface = Color(0xFFFAFAFA);
  static const Color lightBackground = Color(0xFFFFFFFF);

  // COLORES DE ACENTO MODERNOS - Estética Juvenil
  static const Color vibrantPink = Color(0xFFFF6B9D);
  static const Color electricBlue = Color(0xFF00D9FF);
  static const Color neonGreen = Color(0xFF39FF14);
  static const Color sunsetOrange = Color(0xFFFF7B54);
  static const Color purpleHaze = Color(0xFF9F7AEA);
  static const Color goldAccent = Color(0xFFFFD700);
  static const Color silverAccent = Color(0xFFC0C0C0);

  // Estados de la aplicación
  static const Color success = Color(0xFF22C55E);
  static const Color warning = Color(0xFFEAB308);
  static const Color error = Color(0xFFEF4444);
  static const Color info = Color(0xFF06B6D4);

  // COLORES PROFESIONALES PARA NAVEGACIÓN
  static const Color navPrimary = Color(0xFF1E293B); // Slate-800
  static const Color navSecondary = Color(0xFF334155); // Slate-700
  static const Color navAccent = Color(0xFF3B82F6); // Blue-500
  static const Color navHover = Color(0xFF475569); // Slate-600
  static const Color navActive = Color(0xFF1D4ED8); // Blue-700
  static const Color navText = Color(0xFFE2E8F0); // Slate-200
  static const Color navTextSecondary = Color(0xFF94A3B8); // Slate-400

  // CONTROL DE TEMA
  static bool _isDark = true;
  static bool get isDark => _isDark;
  static void setTheme(bool dark) => _isDark = dark;

  // COLORES DINÁMICOS
  static Color get primary => _isDark ? darkPrimary : lightPrimary;
  static Color get secondary => _isDark ? darkSecondary : lightSecondary;
  static Color get surface => _isDark ? darkSurface : lightSurface;
  static Color get background => _isDark ? darkBackground : lightBackground;
  static Color get textPrimary => _isDark ? Colors.white : Colors.black;
  static Color get textSecondary => _isDark ? Colors.white70 : Colors.black87;

  // RETROCOMPATIBILIDAD
  static const primaryBlue = Color(0xFF2196F3);
  static const primaryViolet = Color(0xFF9C27B0);
  static const accentGreen = Color(0xFF4CAF50);
  static const primaryIndigo = Color(0xFF3F51B5);
  static const accentEmerald = Color(0xFF009688);
  static const surfaceDark = Color(0xFF121212);
  static const surfaceLight = Color(0xFFF5F5F5);

  // ESPACIADO
  static const double spaceSm = 8.0;
  static const double spaceMd = 16.0;
  static const double spaceLg = 24.0;
  static const double spaceXl = 32.0;
  static const double spaceXs = 4.0;
  static const double space2xl = 48.0;

  // RADIOS
  static const double radiusSm = 8.0;
  static const double radiusMd = 16.0;
  static const double radiusLg = 24.0;
  static const double radiusXl = 32.0;
  static const double radiusXs = 4.0;

  // SOMBRAS
  static const List<BoxShadow> shadowSm = [
    BoxShadow(color: Color(0x1A000000), blurRadius: 3, offset: Offset(0, 1)),
  ];

  static const List<BoxShadow> shadowMd = [
    BoxShadow(color: Color(0x1F000000), blurRadius: 6, offset: Offset(0, 2)),
    BoxShadow(color: Color(0x14000000), blurRadius: 3, offset: Offset(0, 1)),
  ];

  static const List<BoxShadow> shadowLg = [
    BoxShadow(color: Color(0x29000000), blurRadius: 15, offset: Offset(0, 4)),
    BoxShadow(color: Color(0x14000000), blurRadius: 6, offset: Offset(0, 2)),
  ];

  // GRADIENTES
  static LinearGradient get primaryGradient => LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [goldAccent, electricBlue],
  );

  static LinearGradient get secondaryGradient => LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primary.withOpacity(0.8), secondary.withOpacity(0.6)],
  );

  // TYPOGRAPHY - Funciones para usar colores dinámicos
  static TextStyle headingLg({Color? color}) => TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    color: color ?? textPrimary,
    letterSpacing: -0.25,
  );

  static TextStyle headingSm({Color? color}) => TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: color ?? textPrimary,
    letterSpacing: -0.1,
  );

  static TextStyle headingMd({Color? color}) => TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: color ?? textPrimary,
    letterSpacing: -0.15,
  );

  static TextStyle bodyLg({Color? color}) => TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: color ?? textPrimary,
    height: 1.6,
  );

  static TextStyle bodyMd({Color? color}) => TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: color ?? textPrimary,
    height: 1.5,
  );

  static TextStyle bodySm({Color? color}) => TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: color ?? textSecondary,
    height: 1.4,
  );

  static TextStyle caption({Color? color}) => TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: color ?? textSecondary,
    height: 1.3,
  );

  // COLORES DE TEXTO ADICIONALES
  static Color get textTertiary => _isDark ? Colors.white54 : Colors.black54;
  static Color get textMuted => _isDark ? Colors.white38 : Colors.black38;

  // INTEGRACIÓN CON FASHION BACKGROUND SYSTEM
  static BoxDecoration getFashionBackgroundDecoration({List<String>? tags}) {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          (_isDark ? darkBackground : lightBackground),
          (_isDark ? darkSecondary : lightSecondary).withOpacity(0.8),
        ],
      ),
    );
  }

  // GRADIENTES JUVENILES ACTUALIZADOS
  static LinearGradient get youthGradient => LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [vibrantPink.withOpacity(0.3), electricBlue.withOpacity(0.3)],
  );

  static LinearGradient get energyGradient => LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [sunsetOrange.withOpacity(0.2), purpleHaze.withOpacity(0.2)],
  );

  // APPBAR PROFESIONAL
  static AppBar buildProfessionalAppBar({
    required String title,
    List<Widget>? actions,
    bool centerTitle = true,
    PreferredSizeWidget? bottom,
  }) {
    return AppBar(
      title: Text(
        title,
        style: headingMd(
          color: _isDark ? Colors.white : navPrimary,
        ).copyWith(fontWeight: FontWeight.w700, letterSpacing: 0.5),
      ),
      centerTitle: centerTitle,
      elevation: 0,
      scrolledUnderElevation: 8,
      backgroundColor: _isDark ? navPrimary : Colors.white,
      foregroundColor: _isDark ? Colors.white : navPrimary,
      surfaceTintColor: _isDark ? navAccent : navAccent.withOpacity(0.1),
      shadowColor: _isDark ? Colors.black26 : navPrimary.withOpacity(0.1),
      actions: actions,
      bottom: bottom,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors:
                _isDark
                    ? [navPrimary, navSecondary]
                    : [Colors.white, Colors.grey.shade50],
          ),
          boxShadow: [
            BoxShadow(
              color: _isDark ? Colors.black38 : navPrimary.withOpacity(0.08),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
      ),
    );
  }

  // FORMULARIOS CON OPACIDAD
  static Widget buildGlassContainer({
    required Widget child,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    double opacity = 0.95,
    double blur = 10.0,
  }) {
    return Container(
      margin: margin ?? const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: (_isDark ? darkSurface : Colors.white).withOpacity(opacity),
        borderRadius: BorderRadius.circular(radiusLg),
        border: Border.all(
          color: (_isDark ? Colors.white24 : Colors.black12),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: _isDark ? Colors.black54 : Colors.black12,
            blurRadius: blur,
            offset: const Offset(0, 4),
            spreadRadius: 2,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radiusLg),
        child: Container(
          padding: padding ?? const EdgeInsets.all(24),
          child: child,
        ),
      ),
    );
  }

  // NAVEGACIÓN PROFESIONAL
  static BoxDecoration getNavigationDecoration() {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors:
            _isDark
                ? [
                  const Color(0xFF0F172A), // Slate-900
                  const Color(0xFF1E293B), // Slate-800
                  const Color(0xFF334155), // Slate-700
                ]
                : [
                  Colors.white,
                  const Color(0xFFF8FAFC), // Slate-50
                  const Color(0xFFF1F5F9), // Slate-100
                ],
      ),
      border: Border(
        right: BorderSide(
          color: _isDark ? navSecondary : const Color(0xFFE2E8F0),
          width: 1,
        ),
      ),
      boxShadow: [
        BoxShadow(
          color: _isDark ? Colors.black38 : const Color(0x1A000000),
          blurRadius: 20,
          offset: const Offset(4, 0),
          spreadRadius: 0,
        ),
      ],
    );
  }

  // ELEMENTOS DE NAVEGACIÓN
  static Widget buildNavItem({
    required IconData icon,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
    String? description,
    Color? customColor,
  }) {
    final color = customColor ?? navAccent;
    final bool isCollapsed = description == null;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(radiusSm),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(radiusSm),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: EdgeInsets.all(isCollapsed ? 8 : 12),
            constraints: const BoxConstraints(minHeight: 40),
            decoration: BoxDecoration(
              color:
                  isSelected
                      ? color.withOpacity(_isDark ? 0.15 : 0.1)
                      : Colors.transparent,
              borderRadius: BorderRadius.circular(radiusSm),
              border:
                  isSelected
                      ? Border.all(color: color.withOpacity(0.3), width: 1)
                      : null,
            ),
            child:
                isCollapsed
                    ? // Modo colapsado - solo ícono centrado
                    Center(
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color:
                              isSelected
                                  ? color.withOpacity(0.2)
                                  : (_isDark
                                      ? Colors.white.withOpacity(0.1)
                                      : Colors.black.withOpacity(0.05)),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Icon(
                          icon,
                          size: 16,
                          color:
                              isSelected
                                  ? color
                                  : (_isDark ? navText : navPrimary),
                        ),
                      ),
                    )
                    : // Modo expandido - layout completo
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color:
                                isSelected
                                    ? color.withOpacity(0.2)
                                    : (_isDark
                                        ? Colors.white.withOpacity(0.1)
                                        : Colors.black.withOpacity(0.05)),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Icon(
                            icon,
                            size: 16,
                            color:
                                isSelected
                                    ? color
                                    : (_isDark ? navText : navPrimary),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                label,
                                style: bodyMd(
                                  color:
                                      isSelected
                                          ? (_isDark
                                              ? Colors.white
                                              : navPrimary)
                                          : (_isDark ? navText : navPrimary),
                                ).copyWith(
                                  fontWeight:
                                      isSelected
                                          ? FontWeight.w600
                                          : FontWeight.w500,
                                  fontSize: 13,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              if (description.isNotEmpty) ...[
                                const SizedBox(height: 2),
                                Text(
                                  description,
                                  style: caption(
                                    color:
                                        _isDark
                                            ? navTextSecondary
                                            : navPrimary.withOpacity(0.6),
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ],
                          ),
                        ),
                        if (isSelected) ...[
                          const SizedBox(width: 8),
                          Container(
                            width: 3,
                            height: 16,
                            decoration: BoxDecoration(
                              color: color,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ],
                      ],
                    ),
          ),
        ),
      ),
    );
  }
}
