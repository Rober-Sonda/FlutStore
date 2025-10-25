import 'package:flutter/material.dart';
import 'dart:ui';
import '../../widgets/app_design_system.dart';

class GlassFormContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double opacity;
  final double blur;
  final String? title;
  final Widget? titleWidget;
  final List<Widget>? actions;

  const GlassFormContainer({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.opacity = 0.95,
    this.blur = 10.0,
    this.title,
    this.titleWidget,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: (AppDesignSystem.isDark
                ? AppDesignSystem.darkSurface
                : Colors.white)
            .withOpacity(opacity),
        borderRadius: BorderRadius.circular(AppDesignSystem.radiusLg),
        border: Border.all(
          color:
              AppDesignSystem.isDark
                  ? Colors.white.withOpacity(0.1)
                  : Colors.black.withOpacity(0.08),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color:
                AppDesignSystem.isDark
                    ? Colors.black.withOpacity(0.3)
                    : Colors.black.withOpacity(0.08),
            blurRadius: blur,
            offset: const Offset(0, 8),
            spreadRadius: 2,
          ),
          BoxShadow(
            color:
                AppDesignSystem.isDark
                    ? Colors.white.withOpacity(0.05)
                    : Colors.white.withOpacity(0.8),
            blurRadius: blur / 2,
            offset: const Offset(0, -2),
            spreadRadius: 1,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppDesignSystem.radiusLg),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors:
                  AppDesignSystem.isDark
                      ? [
                        Colors.white.withOpacity(0.1),
                        Colors.white.withOpacity(0.05),
                      ]
                      : [
                        Colors.white.withOpacity(0.9),
                        Colors.white.withOpacity(0.7),
                      ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (title != null || titleWidget != null || actions != null)
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color:
                            AppDesignSystem.isDark
                                ? Colors.white.withOpacity(0.1)
                                : Colors.black.withOpacity(0.05),
                        width: 1,
                      ),
                    ),
                    gradient: LinearGradient(
                      colors:
                          AppDesignSystem.isDark
                              ? [
                                Colors.white.withOpacity(0.05),
                                Colors.transparent,
                              ]
                              : [
                                Colors.white.withOpacity(0.8),
                                Colors.white.withOpacity(0.4),
                              ],
                    ),
                  ),
                  child: Row(
                    children: [
                      if (titleWidget != null)
                        titleWidget!
                      else if (title != null)
                        Expanded(
                          child: Text(
                            title!,
                            style: AppDesignSystem.headingMd(
                              color:
                                  AppDesignSystem.isDark
                                      ? Colors.white
                                      : AppDesignSystem.navPrimary,
                            ).copyWith(fontWeight: FontWeight.w700),
                          ),
                        ),
                      if (actions != null) ...actions!,
                    ],
                  ),
                ),
              Container(
                padding: padding ?? const EdgeInsets.all(24),
                child: child,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GlassCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double opacity;
  final VoidCallback? onTap;
  final bool isSelected;

  const GlassCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.opacity = 0.9,
    this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.all(8),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(AppDesignSystem.radiusMd),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppDesignSystem.radiusMd),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: padding ?? const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: (AppDesignSystem.isDark
                      ? AppDesignSystem.darkSurface
                      : Colors.white)
                  .withOpacity(opacity),
              borderRadius: BorderRadius.circular(AppDesignSystem.radiusMd),
              border: Border.all(
                color:
                    isSelected
                        ? AppDesignSystem.navAccent.withOpacity(0.5)
                        : (AppDesignSystem.isDark
                            ? Colors.white.withOpacity(0.1)
                            : Colors.black.withOpacity(0.08)),
                width: isSelected ? 2 : 1,
              ),
              boxShadow: [
                BoxShadow(
                  color:
                      AppDesignSystem.isDark
                          ? Colors.black.withOpacity(0.2)
                          : Colors.black.withOpacity(0.05),
                  blurRadius: isSelected ? 12 : 6,
                  offset: const Offset(0, 4),
                  spreadRadius: isSelected ? 2 : 1,
                ),
                if (isSelected)
                  BoxShadow(
                    color: AppDesignSystem.navAccent.withOpacity(0.2),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                    spreadRadius: 4,
                  ),
              ],
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
