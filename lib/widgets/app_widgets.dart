import 'package:flutter/material.dart';
import 'package:tienda_app/widgets/app_design_system.dart';

/// Componentes UI reutilizables para mantener consistencia visual
class AppWidgets {
  /// 📄 CARD PRINCIPAL - Contenedor base para secciones
  static Widget primaryCard({
    required Widget child,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    Color? backgroundColor,
    List<BoxShadow>? boxShadow,
    double? borderRadius,
    Border? border,
    Gradient? gradient,
  }) {
    return Container(
      margin: margin ?? const EdgeInsets.all(AppDesignSystem.spaceMd),
      decoration: BoxDecoration(
        color: backgroundColor ?? AppDesignSystem.surface,
        gradient: gradient,
        borderRadius: BorderRadius.circular(
          borderRadius ?? AppDesignSystem.radiusLg,
        ),
        boxShadow: boxShadow ?? AppDesignSystem.shadowMd,
        border:
            border ??
            Border.all(
              color: AppDesignSystem.textMuted.withOpacity(0.1),
              width: 1,
            ),
      ),
      child: Padding(
        padding: padding ?? const EdgeInsets.all(AppDesignSystem.spaceLg),
        child: child,
      ),
    );
  }

  /// 📊 METRIC CARD - Para mostrar KPIs y métricas
  static Widget metricCard({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
    String? subtitle,
    String? trend,
    bool? isPositiveTrend,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(AppDesignSystem.spaceLg),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [color.withOpacity(0.1), color.withOpacity(0.05)],
          ),
          borderRadius: BorderRadius.circular(AppDesignSystem.radiusLg),
          border: Border.all(color: color.withOpacity(0.2), width: 1),
          boxShadow: AppDesignSystem.shadowSm,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(AppDesignSystem.spaceSm),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(
                      AppDesignSystem.radiusSm,
                    ),
                  ),
                  child: Icon(
                    icon,
                    color: AppDesignSystem.textPrimary,
                    size: 20,
                  ),
                ),
                const Spacer(),
                if (trend != null) ...[
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppDesignSystem.spaceSm,
                      vertical: AppDesignSystem.spaceXs,
                    ),
                    decoration: BoxDecoration(
                      color:
                          (isPositiveTrend ?? true)
                              ? AppDesignSystem.success.withOpacity(0.2)
                              : AppDesignSystem.error.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(
                        AppDesignSystem.radiusXs,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          (isPositiveTrend ?? true)
                              ? Icons.trending_up
                              : Icons.trending_down,
                          size: 12,
                          color:
                              (isPositiveTrend ?? true)
                                  ? AppDesignSystem.success
                                  : AppDesignSystem.error,
                        ),
                        const SizedBox(width: 2),
                        Text(
                          trend,
                          style: AppDesignSystem.caption().copyWith(
                            color:
                                (isPositiveTrend ?? true)
                                    ? AppDesignSystem.success
                                    : AppDesignSystem.error,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
            const SizedBox(height: AppDesignSystem.spaceMd),
            Text(
              value,
              style: AppDesignSystem.headingLg().copyWith(
                color: AppDesignSystem.textPrimary,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: AppDesignSystem.spaceXs),
            Text(
              title,
              style: AppDesignSystem.bodyMd().copyWith(
                color: AppDesignSystem.textSecondary,
                fontWeight: FontWeight.w500,
              ),
            ),
            if (subtitle != null) ...[
              const SizedBox(height: AppDesignSystem.spaceXs),
              Text(
                subtitle,
                style: AppDesignSystem.bodySm().copyWith(
                  color: AppDesignSystem.textTertiary,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  /// 🏷️ STATUS CHIP - Para mostrar estados y etiquetas
  static Widget statusChip({
    required String label,
    required Color color,
    IconData? icon,
    bool outlined = false,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDesignSystem.spaceSm,
        vertical: AppDesignSystem.spaceXs,
      ),
      decoration: BoxDecoration(
        color: outlined ? Colors.transparent : color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(AppDesignSystem.radiusSm),
        border: Border.all(
          color: color.withOpacity(outlined ? 0.6 : 0.3),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 12, color: color),
            const SizedBox(width: 4),
          ],
          Text(
            label,
            style: AppDesignSystem.caption().copyWith(
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  /// 🔘 BOTÓN PRIMARIO
  static Widget primaryButton({
    required String text,
    required VoidCallback onPressed,
    IconData? icon,
    bool isLoading = false,
    bool expanded = false,
    Color? backgroundColor,
    Color? textColor,
    double? borderRadius,
  }) {
    Widget button = Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: isLoading ? null : onPressed,
        borderRadius: BorderRadius.circular(
          borderRadius ?? AppDesignSystem.radiusMd,
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDesignSystem.spaceLg,
            vertical: AppDesignSystem.spaceMd,
          ),
          decoration: BoxDecoration(
            gradient:
                backgroundColor != null
                    ? null
                    : AppDesignSystem.primaryGradient,
            color: backgroundColor,
            borderRadius: BorderRadius.circular(
              borderRadius ?? AppDesignSystem.radiusMd,
            ),
            boxShadow: AppDesignSystem.shadowSm,
          ),
          child:
              isLoading
                  ? SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        textColor ?? Colors.white,
                      ),
                    ),
                  )
                  : Row(
                    mainAxisSize:
                        expanded ? MainAxisSize.max : MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (icon != null) ...[
                        Icon(
                          icon,
                          color: textColor ?? AppDesignSystem.textPrimary,
                          size: 18,
                        ),
                        const SizedBox(width: AppDesignSystem.spaceSm),
                      ],
                      Text(
                        text,
                        style: AppDesignSystem.bodyMd().copyWith(
                          color: textColor ?? Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
        ),
      ),
    );

    return expanded ? SizedBox(width: double.infinity, child: button) : button;
  }

  /// 🔘 BOTÓN SECUNDARIO
  static Widget secondaryButton({
    required String text,
    required VoidCallback onPressed,
    IconData? icon,
    bool isLoading = false,
    bool expanded = false,
    Color? borderColor,
    Color? textColor,
  }) {
    Widget button = Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: isLoading ? null : onPressed,
        borderRadius: BorderRadius.circular(AppDesignSystem.radiusMd),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDesignSystem.spaceLg,
            vertical: AppDesignSystem.spaceMd,
          ),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(AppDesignSystem.radiusMd),
            border: Border.all(
              color: borderColor ?? AppDesignSystem.goldAccent,
              width: 1.5,
            ),
          ),
          child:
              isLoading
                  ? SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        borderColor ?? AppDesignSystem.goldAccent,
                      ),
                    ),
                  )
                  : Row(
                    mainAxisSize:
                        expanded ? MainAxisSize.max : MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (icon != null) ...[
                        Icon(
                          icon,
                          color: textColor ?? AppDesignSystem.goldAccent,
                          size: 18,
                        ),
                        const SizedBox(width: AppDesignSystem.spaceSm),
                      ],
                      Text(
                        text,
                        style: AppDesignSystem.bodyMd().copyWith(
                          color: textColor ?? AppDesignSystem.goldAccent,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
        ),
      ),
    );

    return expanded ? SizedBox(width: double.infinity, child: button) : button;
  }

  /// 📋 SECCIÓN HEADER - Encabezado de sección con título y acciones
  static Widget sectionHeader({
    required String title,
    String? subtitle,
    List<Widget>? actions,
    EdgeInsetsGeometry? padding,
  }) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(AppDesignSystem.spaceMd),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppDesignSystem.headingLg().copyWith(
                    color: AppDesignSystem.textPrimary,
                  ),
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: AppDesignSystem.spaceXs),
                  Text(
                    subtitle,
                    style: AppDesignSystem.bodyMd().copyWith(
                      color: AppDesignSystem.textSecondary,
                    ),
                  ),
                ],
              ],
            ),
          ),
          if (actions != null) ...actions,
        ],
      ),
    );
  }

  /// 📝 EMPTY STATE - Estado vacío con mensaje y acción
  static Widget emptyState({
    required IconData icon,
    required String title,
    required String message,
    String? actionText,
    VoidCallback? onActionPressed,
  }) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppDesignSystem.space2xl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(AppDesignSystem.spaceLg),
              decoration: BoxDecoration(
                color: AppDesignSystem.textMuted.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 48, color: AppDesignSystem.textMuted),
            ),
            const SizedBox(height: AppDesignSystem.spaceLg),
            Text(
              title,
              style: AppDesignSystem.headingMd().copyWith(
                color: AppDesignSystem.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppDesignSystem.spaceSm),
            Text(
              message,
              style: AppDesignSystem.bodyMd().copyWith(
                color: AppDesignSystem.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
            if (actionText != null && onActionPressed != null) ...[
              const SizedBox(height: AppDesignSystem.spaceLg),
              primaryButton(
                text: actionText,
                onPressed: onActionPressed,
                icon: Icons.add,
              ),
            ],
          ],
        ),
      ),
    );
  }

  /// ⚠️ ERROR STATE - Estado de error con opción de reintentar
  static Widget errorState({
    required String title,
    required String message,
    String? actionText,
    VoidCallback? onActionPressed,
  }) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppDesignSystem.space2xl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(AppDesignSystem.spaceLg),
              decoration: BoxDecoration(
                color: AppDesignSystem.error.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.error_outline,
                size: 48,
                color: AppDesignSystem.error,
              ),
            ),
            const SizedBox(height: AppDesignSystem.spaceLg),
            Text(
              title,
              style: AppDesignSystem.headingMd().copyWith(
                color: AppDesignSystem.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppDesignSystem.spaceSm),
            Text(
              message,
              style: AppDesignSystem.bodyMd().copyWith(
                color: AppDesignSystem.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
            if (actionText != null && onActionPressed != null) ...[
              const SizedBox(height: AppDesignSystem.spaceLg),
              primaryButton(
                text: actionText,
                onPressed: onActionPressed,
                icon: Icons.refresh,
                backgroundColor: AppDesignSystem.error,
              ),
            ],
          ],
        ),
      ),
    );
  }

  /// 🔄 LOADING STATE - Indicador de carga elegante
  static Widget loadingState({String? message}) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppDesignSystem.space2xl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                AppDesignSystem.goldAccent,
              ),
            ),
            if (message != null) ...[
              const SizedBox(height: AppDesignSystem.spaceLg),
              Text(
                message,
                style: AppDesignSystem.bodyMd().copyWith(
                  color: AppDesignSystem.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
