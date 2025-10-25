import 'package:flutter/material.dart';
import 'app_design_system.dart';
import 'fashion_background_system.dart';

/// Scaffold moderno con fondo de moda juvenil aleatorio
class FashionScaffold extends StatefulWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? floatingActionButton;
  final Widget? drawer;
  final Widget? endDrawer;
  final List<String>? backgroundTags;
  final Color? overlayColor;
  final double overlayOpacity;
  final bool showBackgroundRotation;
  final Duration? rotationInterval;

  const FashionScaffold({
    super.key,
    required this.body,
    this.appBar,
    this.floatingActionButton,
    this.drawer,
    this.endDrawer,
    this.backgroundTags,
    this.overlayColor,
    this.overlayOpacity = 0.7,
    this.showBackgroundRotation = true,
    this.rotationInterval = const Duration(minutes: 2),
  });

  @override
  State<FashionScaffold> createState() => _FashionScaffoldState();
}

class _FashionScaffoldState extends State<FashionScaffold> {
  FashionBackground? _currentBackground;

  @override
  void initState() {
    super.initState();
    _updateBackground();

    if (widget.showBackgroundRotation && widget.rotationInterval != null) {
      FashionBackgroundSystem.startAutoRotation(
        widget.rotationInterval!,
        _updateBackground,
      );
    }
  }

  @override
  void dispose() {
    if (widget.showBackgroundRotation) {
      FashionBackgroundSystem.stopAutoRotation();
    }
    super.dispose();
  }

  void _updateBackground() {
    setState(() {
      _currentBackground =
          widget.backgroundTags != null
              ? FashionBackgroundSystem.getBackgroundByTags(
                widget.backgroundTags!,
              )
              : FashionBackgroundSystem.getRandomBackground();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.appBar,
      drawer: widget.drawer,
      endDrawer: widget.endDrawer,
      floatingActionButton: widget.floatingActionButton,
      body: FashionBackgroundWidget(
        background: _currentBackground,
        overlayColor: widget.overlayColor ?? Colors.black,
        overlayOpacity: widget.overlayOpacity,
        child: widget.body,
      ),
    );
  }
}

/// Card moderna con efectos glassmorphismo y estética juvenil
class ModernCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Color? borderColor;
  final double borderRadius;
  final List<BoxShadow>? boxShadow;
  final VoidCallback? onTap;
  final bool glassMorphism;
  final double opacity;

  const ModernCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.backgroundColor,
    this.borderColor,
    this.borderRadius = 16.0,
    this.boxShadow,
    this.onTap,
    this.glassMorphism = true,
    this.opacity = 0.95,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = AppDesignSystem.isDark;

    Widget cardContent = Container(
      width: width,
      height: height,
      margin: margin ?? const EdgeInsets.all(8),
      padding: padding ?? const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color:
            glassMorphism
                ? (backgroundColor ??
                    (isDark
                        ? AppDesignSystem.darkSurface.withOpacity(opacity)
                        : Colors.white.withOpacity(opacity)))
                : (backgroundColor ??
                    (isDark ? AppDesignSystem.darkSurface : Colors.white)),
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color:
              borderColor ??
              (isDark
                  ? Colors.white.withOpacity(0.1)
                  : Colors.black.withOpacity(0.1)),
          width: 1,
        ),
        boxShadow:
            boxShadow ??
            (glassMorphism
                ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(isDark ? 0.3 : 0.1),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                    spreadRadius: -4,
                  ),
                  BoxShadow(
                    color: Colors.white.withOpacity(isDark ? 0.05 : 0.8),
                    blurRadius: 1,
                    offset: const Offset(0, 1),
                    spreadRadius: 0,
                  ),
                ]
                : AppDesignSystem.shadowMd),
      ),
      child: child,
    );

    if (onTap != null) {
      return Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(borderRadius),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(borderRadius),
          child: cardContent,
        ),
      );
    }

    return cardContent;
  }
}

/// Botón moderno con estética juvenil y efectos hover
class FashionButton extends StatefulWidget {
  final String text;
  final IconData? icon;
  final VoidCallback? onPressed;
  final bool isLoading;
  final FashionButtonStyle style;
  final Size? size;
  final EdgeInsetsGeometry? padding;

  const FashionButton({
    super.key,
    required this.text,
    this.icon,
    this.onPressed,
    this.isLoading = false,
    this.style = FashionButtonStyle.primary,
    this.size,
    this.padding,
  });

  @override
  State<FashionButton> createState() => _FashionButtonState();
}

class _FashionButtonState extends State<FashionButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Color _getBackgroundColor() {
    switch (widget.style) {
      case FashionButtonStyle.primary:
        return AppDesignSystem.vibrantPink;
      case FashionButtonStyle.secondary:
        return AppDesignSystem.electricBlue;
      case FashionButtonStyle.success:
        return AppDesignSystem.success;
      case FashionButtonStyle.warning:
        return AppDesignSystem.warning;
      case FashionButtonStyle.error:
        return AppDesignSystem.error;
      case FashionButtonStyle.outlined:
        return Colors.transparent;
      case FashionButtonStyle.ghost:
        return Colors.transparent;
    }
  }

  Color _getTextColor() {
    switch (widget.style) {
      case FashionButtonStyle.outlined:
      case FashionButtonStyle.ghost:
        return AppDesignSystem.textPrimary;
      default:
        return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = _getBackgroundColor();
    final textColor = _getTextColor();
    final isOutlined = widget.style == FashionButtonStyle.outlined;
    final isGhost = widget.style == FashionButtonStyle.ghost;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTapDown: (_) => _animationController.forward(),
        onTapUp: (_) => _animationController.reverse(),
        onTapCancel: () => _animationController.reverse(),
        child: AnimatedBuilder(
          animation: _scaleAnimation,
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleAnimation.value,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding:
                    widget.padding ??
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                decoration: BoxDecoration(
                  color:
                      isGhost
                          ? (_isHovered
                              ? backgroundColor.withOpacity(0.1)
                              : Colors.transparent)
                          : (_isHovered
                              ? backgroundColor.withOpacity(0.9)
                              : backgroundColor),
                  borderRadius: BorderRadius.circular(AppDesignSystem.radiusMd),
                  border:
                      isOutlined || isGhost
                          ? Border.all(
                            color:
                                _isHovered
                                    ? backgroundColor
                                    : backgroundColor.withOpacity(0.5),
                            width: 2,
                          )
                          : null,
                  boxShadow:
                      !isOutlined && !isGhost
                          ? [
                            BoxShadow(
                              color: backgroundColor.withOpacity(0.3),
                              blurRadius: _isHovered ? 20 : 10,
                              offset: const Offset(0, 8),
                            ),
                          ]
                          : null,
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: widget.isLoading ? null : widget.onPressed,
                    borderRadius: BorderRadius.circular(
                      AppDesignSystem.radiusMd,
                    ),
                    child: Container(
                      width: widget.size?.width,
                      height: widget.size?.height,
                      alignment: Alignment.center,
                      child:
                          widget.isLoading
                              ? SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    textColor,
                                  ),
                                ),
                              )
                              : Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  if (widget.icon != null) ...[
                                    Icon(
                                      widget.icon,
                                      color: textColor,
                                      size: 18,
                                    ),
                                    const SizedBox(width: 8),
                                  ],
                                  Text(
                                    widget.text,
                                    style: AppDesignSystem.bodyMd(
                                      color: textColor,
                                    ).copyWith(fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

enum FashionButtonStyle {
  primary,
  secondary,
  success,
  warning,
  error,
  outlined,
  ghost,
}

/// Input field moderno con estética juvenil
class FashionTextField extends StatefulWidget {
  final String? label;
  final String? hint;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixIconTap;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final bool obscureText;
  final int? maxLines;
  final bool enabled;
  final VoidCallback? onTap;

  const FashionTextField({
    super.key,
    this.label,
    this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixIconTap,
    this.controller,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.maxLines = 1,
    this.enabled = true,
    this.onTap,
  });

  @override
  State<FashionTextField> createState() => _FashionTextFieldState();
}

class _FashionTextFieldState extends State<FashionTextField>
    with SingleTickerProviderStateMixin {
  late AnimationController _focusController;
  late Animation<double> _focusAnimation;
  late Animation<Color?> _borderColorAnimation;

  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _focusAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _focusController, curve: Curves.easeOut));
    _borderColorAnimation = ColorTween(
      begin:
          AppDesignSystem.isDark
              ? Colors.white.withOpacity(0.2)
              : Colors.black.withOpacity(0.2),
      end: AppDesignSystem.vibrantPink,
    ).animate(_focusController);
  }

  @override
  void dispose() {
    _focusController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = AppDesignSystem.isDark;

    return AnimatedBuilder(
      animation: _focusController,
      builder: (context, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.label != null) ...[
              Text(
                widget.label!,
                style: AppDesignSystem.bodyMd().copyWith(
                  fontWeight: FontWeight.w500,
                  color:
                      _isFocused
                          ? AppDesignSystem.vibrantPink
                          : AppDesignSystem.textSecondary,
                ),
              ),
              const SizedBox(height: 8),
            ],
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppDesignSystem.radiusMd),
                boxShadow:
                    _isFocused
                        ? [
                          BoxShadow(
                            color: AppDesignSystem.vibrantPink.withOpacity(0.2),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ]
                        : null,
              ),
              child: TextFormField(
                controller: widget.controller,
                validator: widget.validator,
                keyboardType: widget.keyboardType,
                obscureText: widget.obscureText,
                maxLines: widget.maxLines,
                enabled: widget.enabled,
                onTap: widget.onTap,
                onTapOutside: (_) {
                  FocusScope.of(context).unfocus();
                },
                onChanged: (_) => setState(() {}),
                decoration: InputDecoration(
                  hintText: widget.hint,
                  prefixIcon:
                      widget.prefixIcon != null
                          ? Icon(
                            widget.prefixIcon,
                            color:
                                _isFocused
                                    ? AppDesignSystem.vibrantPink
                                    : AppDesignSystem.textSecondary,
                          )
                          : null,
                  suffixIcon:
                      widget.suffixIcon != null
                          ? IconButton(
                            icon: Icon(
                              widget.suffixIcon,
                              color:
                                  _isFocused
                                      ? AppDesignSystem.vibrantPink
                                      : AppDesignSystem.textSecondary,
                            ),
                            onPressed: widget.onSuffixIconTap,
                          )
                          : null,
                  filled: true,
                  fillColor:
                      isDark
                          ? AppDesignSystem.darkSurface.withOpacity(0.8)
                          : Colors.white.withOpacity(0.9),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      AppDesignSystem.radiusMd,
                    ),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      AppDesignSystem.radiusMd,
                    ),
                    borderSide: BorderSide(
                      color:
                          isDark
                              ? Colors.white.withOpacity(0.1)
                              : Colors.black.withOpacity(0.1),
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      AppDesignSystem.radiusMd,
                    ),
                    borderSide: BorderSide(
                      color:
                          _borderColorAnimation.value ??
                          AppDesignSystem.vibrantPink,
                      width: 2,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      AppDesignSystem.radiusMd,
                    ),
                    borderSide: BorderSide(
                      color: AppDesignSystem.error,
                      width: 2,
                    ),
                  ),
                  contentPadding: const EdgeInsets.all(16),
                ),
                style: AppDesignSystem.bodyMd(),
                focusNode:
                    FocusNode()..addListener(() {
                      setState(() => _isFocused = FocusNode().hasFocus);
                      if (FocusNode().hasFocus) {
                        _focusController.forward();
                      } else {
                        _focusController.reverse();
                      }
                    }),
              ),
            ),
          ],
        );
      },
    );
  }
}

/// Chip moderno con estética juvenil para filtros
class FashionChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Color? selectedColor;
  final IconData? icon;

  const FashionChip({
    super.key,
    required this.label,
    this.isSelected = false,
    this.onTap,
    this.backgroundColor,
    this.selectedColor,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = AppDesignSystem.isDark;
    final baseColor = selectedColor ?? AppDesignSystem.vibrantPink;

    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color:
                isSelected
                    ? baseColor.withOpacity(0.2)
                    : (backgroundColor ??
                        (isDark
                            ? AppDesignSystem.darkSecondary.withOpacity(0.6)
                            : Colors.white.withOpacity(0.8))),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isSelected ? baseColor : Colors.transparent,
              width: 2,
            ),
            boxShadow:
                isSelected
                    ? [
                      BoxShadow(
                        color: baseColor.withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ]
                    : null,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) ...[
                Icon(
                  icon,
                  size: 16,
                  color: isSelected ? baseColor : AppDesignSystem.textSecondary,
                ),
                const SizedBox(width: 4),
              ],
              Text(
                label,
                style: AppDesignSystem.bodySm().copyWith(
                  color: isSelected ? baseColor : AppDesignSystem.textPrimary,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Loader moderno con estética juvenil
class FashionLoader extends StatefulWidget {
  final double size;
  final Color? color;
  final String? message;

  const FashionLoader({super.key, this.size = 50, this.color, this.message});

  @override
  State<FashionLoader> createState() => _FashionLoaderState();
}

class _FashionLoaderState extends State<FashionLoader>
    with TickerProviderStateMixin {
  late AnimationController _rotationController;
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _rotationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();

    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: true);

    _pulseAnimation = Tween<double>(begin: 0.8, end: 1.2).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _rotationController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = widget.color ?? AppDesignSystem.vibrantPink;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedBuilder(
            animation: Listenable.merge([
              _rotationController,
              _pulseController,
            ]),
            builder: (context, child) {
              return Transform.scale(
                scale: _pulseAnimation.value,
                child: Transform.rotate(
                  angle: _rotationController.value * 2 * 3.14159,
                  child: Container(
                    width: widget.size,
                    height: widget.size,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          color,
                          color.withOpacity(0.3),
                          AppDesignSystem.electricBlue,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(widget.size / 2),
                    ),
                    child: const Icon(Icons.star, color: Colors.white),
                  ),
                ),
              );
            },
          ),
          if (widget.message != null) ...[
            const SizedBox(height: 16),
            Text(
              widget.message!,
              style: AppDesignSystem.bodyMd().copyWith(
                color: AppDesignSystem.textSecondary,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
