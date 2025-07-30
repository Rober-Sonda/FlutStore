import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:tienda_app/models/app_theme.dart';

part 'custom_theme.g.dart';

@collection
class CustomTheme {
  Id id = Isar.autoIncrement;

  @Index()
  late String userId;

  late String name;
  late bool isDark;
  late int primaryColorValue;
  late int secondaryColorValue;
  late int accentColorValue;
  late int backgroundColorValue;
  late int surfaceColorValue;
  late int textColorValue;
  late int textSecondaryColorValue;
  late int errorColorValue;
  late int successColorValue;
  late int warningColorValue;
  late int infoColorValue;
  late DateTime createdAt;
  late DateTime updatedAt;

  // Getters para convertir valores int a Color
  @ignore
  Color get primaryColor => Color(primaryColorValue);
  @ignore
  Color get secondaryColor => Color(secondaryColorValue);
  @ignore
  Color get accentColor => Color(accentColorValue);
  @ignore
  Color get backgroundColor => Color(backgroundColorValue);
  @ignore
  Color get surfaceColor => Color(surfaceColorValue);
  @ignore
  Color get textColor => Color(textColorValue);
  @ignore
  Color get textSecondaryColor => Color(textSecondaryColorValue);
  @ignore
  Color get errorColor => Color(errorColorValue);
  @ignore
  Color get successColor => Color(successColorValue);
  @ignore
  Color get warningColor => Color(warningColorValue);
  @ignore
  Color get infoColor => Color(infoColorValue);

  // Setters para convertir Color a valores int
  @ignore
  set primaryColor(Color color) => primaryColorValue = color.value;
  @ignore
  set secondaryColor(Color color) => secondaryColorValue = color.value;
  @ignore
  set accentColor(Color color) => accentColorValue = color.value;
  @ignore
  set backgroundColor(Color color) => backgroundColorValue = color.value;
  @ignore
  set surfaceColor(Color color) => surfaceColorValue = color.value;
  @ignore
  set textColor(Color color) => textColorValue = color.value;
  @ignore
  set textSecondaryColor(Color color) => textSecondaryColorValue = color.value;
  @ignore
  set errorColor(Color color) => errorColorValue = color.value;
  @ignore
  set successColor(Color color) => successColorValue = color.value;
  @ignore
  set warningColor(Color color) => warningColorValue = color.value;
  @ignore
  set infoColor(Color color) => infoColorValue = color.value;

  // Método para crear un tema desde colores
  static CustomTheme fromColors({
    required String userId,
    required String name,
    required bool isDark,
    required Color primaryColor,
    required Color secondaryColor,
    required Color accentColor,
    required Color backgroundColor,
    required Color surfaceColor,
    required Color textColor,
    required Color textSecondaryColor,
    required Color errorColor,
    required Color successColor,
    required Color warningColor,
    required Color infoColor,
  }) {
    final theme =
        CustomTheme()
          ..userId = userId
          ..name = name
          ..isDark = isDark
          ..primaryColor = primaryColor
          ..secondaryColor = secondaryColor
          ..accentColor = accentColor
          ..backgroundColor = backgroundColor
          ..surfaceColor = surfaceColor
          ..textColor = textColor
          ..textSecondaryColor = textSecondaryColor
          ..errorColor = errorColor
          ..successColor = successColor
          ..warningColor = warningColor
          ..infoColor = infoColor
          ..createdAt = DateTime.now()
          ..updatedAt = DateTime.now();

    return theme;
  }

  // Método para convertir a AppTheme
  @ignore
  AppTheme toAppTheme() {
    return AppTheme(
      name: name,
      isDark: isDark,
      primaryColor: primaryColor,
      secondaryColor: secondaryColor,
      accentColor: accentColor,
      backgroundColor: backgroundColor,
      surfaceColor: surfaceColor,
      textColor: textColor,
      textSecondaryColor: textSecondaryColor,
      errorColor: errorColor,
      successColor: successColor,
      warningColor: warningColor,
      infoColor: infoColor,
    );
  }

  // Método para actualizar el tema
  @ignore
  void updateTheme({
    String? name,
    bool? isDark,
    Color? primaryColor,
    Color? secondaryColor,
    Color? accentColor,
    Color? backgroundColor,
    Color? surfaceColor,
    Color? textColor,
    Color? textSecondaryColor,
    Color? errorColor,
    Color? successColor,
    Color? warningColor,
    Color? infoColor,
  }) {
    if (name != null) this.name = name;
    if (isDark != null) this.isDark = isDark;
    if (primaryColor != null) this.primaryColor = primaryColor;
    if (secondaryColor != null) this.secondaryColor = secondaryColor;
    if (accentColor != null) this.accentColor = accentColor;
    if (backgroundColor != null) this.backgroundColor = backgroundColor;
    if (surfaceColor != null) this.surfaceColor = surfaceColor;
    if (textColor != null) this.textColor = textColor;
    if (textSecondaryColor != null)
      this.textSecondaryColor = textSecondaryColor;
    if (errorColor != null) this.errorColor = errorColor;
    if (successColor != null) this.successColor = successColor;
    if (warningColor != null) this.warningColor = warningColor;
    if (infoColor != null) this.infoColor = infoColor;

    updatedAt = DateTime.now();
  }
}

// Extensión de AppTheme para incluir temas personalizados
extension AppThemeExtension on AppTheme {
  static AppTheme fromCustomTheme(CustomTheme customTheme) {
    return AppTheme(
      name: customTheme.name,
      isDark: customTheme.isDark,
      primaryColor: customTheme.primaryColor,
      secondaryColor: customTheme.secondaryColor,
      accentColor: customTheme.accentColor,
      backgroundColor: customTheme.backgroundColor,
      surfaceColor: customTheme.surfaceColor,
      textColor: customTheme.textColor,
      textSecondaryColor: customTheme.textSecondaryColor,
      errorColor: customTheme.errorColor,
      successColor: customTheme.successColor,
      warningColor: customTheme.warningColor,
      infoColor: customTheme.infoColor,
    );
  }
}
