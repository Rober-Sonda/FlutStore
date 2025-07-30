import 'package:flutter/material.dart';

class AppTheme {
  final String name;
  final bool isDark;
  final Color primaryColor;
  final Color secondaryColor;
  final Color accentColor;
  final Color backgroundColor;
  final Color surfaceColor;
  final Color textColor;
  final Color textSecondaryColor;
  final Color errorColor;
  final Color successColor;
  final Color warningColor;
  final Color infoColor;

  const AppTheme({
    required this.name,
    required this.isDark,
    required this.primaryColor,
    required this.secondaryColor,
    required this.accentColor,
    required this.backgroundColor,
    required this.surfaceColor,
    required this.textColor,
    required this.textSecondaryColor,
    required this.errorColor,
    required this.successColor,
    required this.warningColor,
    required this.infoColor,
  });

  ThemeData toThemeData() {
    return ThemeData(
      brightness: isDark ? Brightness.dark : Brightness.light,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: backgroundColor,
      cardColor: surfaceColor,
      colorScheme: ColorScheme(
        brightness: isDark ? Brightness.dark : Brightness.light,
        primary: primaryColor,
        secondary: secondaryColor,
        surface: surfaceColor,
        error: errorColor,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: textColor,
        onError: Colors.white,
      ),
      textTheme: TextTheme(
        displayLarge: TextStyle(color: textColor),
        displayMedium: TextStyle(color: textColor),
        displaySmall: TextStyle(color: textColor),
        headlineLarge: TextStyle(color: textColor),
        headlineMedium: TextStyle(color: textColor),
        headlineSmall: TextStyle(color: textColor),
        titleLarge: TextStyle(color: textColor),
        titleMedium: TextStyle(color: textColor),
        titleSmall: TextStyle(color: textColor),
        bodyLarge: TextStyle(color: textColor),
        bodyMedium: TextStyle(color: textColor),
        bodySmall: TextStyle(color: textSecondaryColor),
        labelLarge: TextStyle(color: textColor),
        labelMedium: TextStyle(color: textColor),
        labelSmall: TextStyle(color: textSecondaryColor),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: accentColor,
          foregroundColor: Colors.white,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        filled: true,
        fillColor: surfaceColor,
        labelStyle: TextStyle(color: textSecondaryColor),
        hintStyle: TextStyle(color: textSecondaryColor),
      ),
    );
  }

  static const AppTheme darkTheme = AppTheme(
    name: 'Tema Oscuro',
    isDark: true,
    primaryColor: Color(0xFF6B46C1),
    secondaryColor: Color(0xFF805AD5),
    accentColor: Color(0xFF9F7AEA),
    backgroundColor: Color(0xFF1A202C),
    surfaceColor: Color(0xFF2D3748),
    textColor: Color(0xFFFFFFFF),
    textSecondaryColor: Color(0xFFA0AEC0),
    errorColor: Color(0xFFE53E3E),
    successColor: Color(0xFF38A169),
    warningColor: Color(0xFFD69E2E),
    infoColor: Color(0xFF3182CE),
  );

  static const AppTheme lightTheme = AppTheme(
    name: 'Tema Claro',
    isDark: false,
    primaryColor: Color(0xFF6B46C1),
    secondaryColor: Color(0xFF805AD5),
    accentColor: Color(0xFF9F7AEA),
    backgroundColor: Color(0xFFF7FAFC),
    surfaceColor: Color(0xFFFFFFFF),
    textColor: Color(0xFF2D3748),
    textSecondaryColor: Color(0xFF718096),
    errorColor: Color(0xFFE53E3E),
    successColor: Color(0xFF38A169),
    warningColor: Color(0xFFD69E2E),
    infoColor: Color(0xFF3182CE),
  );

  static const AppTheme customPurple = AppTheme(
    name: 'Púrpura Personalizado',
    isDark: true,
    primaryColor: Color(0xFF8B5CF6),
    secondaryColor: Color(0xFFA78BFA),
    accentColor: Color(0xFFC084FC),
    backgroundColor: Color(0xFF0F0F23),
    surfaceColor: Color(0xFF1E1B4B),
    textColor: Color(0xFFFFFFFF),
    textSecondaryColor: Color(0xFFC7D2FE),
    errorColor: Color(0xFFEF4444),
    successColor: Color(0xFF10B981),
    warningColor: Color(0xFFF59E0B),
    infoColor: Color(0xFF3B82F6),
  );

  static const AppTheme customBlue = AppTheme(
    name: 'Azul Personalizado',
    isDark: true,
    primaryColor: Color(0xFF3B82F6),
    secondaryColor: Color(0xFF60A5FA),
    accentColor: Color(0xFF93C5FD),
    backgroundColor: Color(0xFF0F172A),
    surfaceColor: Color(0xFF1E293B),
    textColor: Color(0xFFFFFFFF),
    textSecondaryColor: Color(0xFFCBD5E1),
    errorColor: Color(0xFFEF4444),
    successColor: Color(0xFF10B981),
    warningColor: Color(0xFFF59E0B),
    infoColor: Color(0xFF8B5CF6),
  );

  static const AppTheme customGreen = AppTheme(
    name: 'Verde Personalizado',
    isDark: true,
    primaryColor: Color(0xFF10B981),
    secondaryColor: Color(0xFF34D399),
    accentColor: Color(0xFF6EE7B7),
    backgroundColor: Color(0xFF064E3B),
    surfaceColor: Color(0xFF065F46),
    textColor: Color(0xFFFFFFFF),
    textSecondaryColor: Color(0xFFD1FAE5),
    errorColor: Color(0xFFEF4444),
    successColor: Color(0xFF059669),
    warningColor: Color(0xFFF59E0B),
    infoColor: Color(0xFF3B82F6),
  );

  static List<AppTheme> get availableThemes => [
    darkTheme,
    lightTheme,
    customPurple,
    customBlue,
    customGreen,
  ];
} 