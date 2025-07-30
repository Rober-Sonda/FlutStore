import 'package:flutter/material.dart';

class FontConfig {
  final String titleFont;
  final String subtitleFont;
  final String bodyFont;
  final String captionFont;
  final double titleSize;
  final double subtitleSize;
  final double bodySize;
  final double captionSize;
  final FontWeight titleWeight;
  final FontWeight subtitleWeight;
  final FontWeight bodyWeight;
  final FontWeight captionWeight;

  const FontConfig({
    required this.titleFont,
    required this.subtitleFont,
    required this.bodyFont,
    required this.captionFont,
    required this.titleSize,
    required this.subtitleSize,
    required this.bodySize,
    required this.captionSize,
    required this.titleWeight,
    required this.subtitleWeight,
    required this.bodyWeight,
    required this.captionWeight,
  });

  TextTheme toTextTheme(Color textColor, Color textSecondaryColor) {
    return TextTheme(
      displayLarge: TextStyle(
        fontFamily: titleFont,
        fontSize: titleSize * 1.5,
        fontWeight: titleWeight,
        color: textColor,
      ),
      displayMedium: TextStyle(
        fontFamily: titleFont,
        fontSize: titleSize * 1.25,
        fontWeight: titleWeight,
        color: textColor,
      ),
      displaySmall: TextStyle(
        fontFamily: titleFont,
        fontSize: titleSize,
        fontWeight: titleWeight,
        color: textColor,
      ),
      headlineLarge: TextStyle(
        fontFamily: titleFont,
        fontSize: titleSize * 0.9,
        fontWeight: titleWeight,
        color: textColor,
      ),
      headlineMedium: TextStyle(
        fontFamily: titleFont,
        fontSize: titleSize * 0.8,
        fontWeight: titleWeight,
        color: textColor,
      ),
      headlineSmall: TextStyle(
        fontFamily: titleFont,
        fontSize: titleSize * 0.7,
        fontWeight: titleWeight,
        color: textColor,
      ),
      titleLarge: TextStyle(
        fontFamily: subtitleFont,
        fontSize: subtitleSize * 1.2,
        fontWeight: subtitleWeight,
        color: textColor,
      ),
      titleMedium: TextStyle(
        fontFamily: subtitleFont,
        fontSize: subtitleSize,
        fontWeight: subtitleWeight,
        color: textColor,
      ),
      titleSmall: TextStyle(
        fontFamily: subtitleFont,
        fontSize: subtitleSize * 0.8,
        fontWeight: subtitleWeight,
        color: textColor,
      ),
      bodyLarge: TextStyle(
        fontFamily: bodyFont,
        fontSize: bodySize * 1.1,
        fontWeight: bodyWeight,
        color: textColor,
      ),
      bodyMedium: TextStyle(
        fontFamily: bodyFont,
        fontSize: bodySize,
        fontWeight: bodyWeight,
        color: textColor,
      ),
      bodySmall: TextStyle(
        fontFamily: bodyFont,
        fontSize: bodySize * 0.9,
        fontWeight: bodyWeight,
        color: textSecondaryColor,
      ),
      labelLarge: TextStyle(
        fontFamily: captionFont,
        fontSize: captionSize * 1.2,
        fontWeight: captionWeight,
        color: textColor,
      ),
      labelMedium: TextStyle(
        fontFamily: captionFont,
        fontSize: captionSize,
        fontWeight: captionWeight,
        color: textColor,
      ),
      labelSmall: TextStyle(
        fontFamily: captionFont,
        fontSize: captionSize * 0.8,
        fontWeight: captionWeight,
        color: textSecondaryColor,
      ),
    );
  }

  static const FontConfig defaultConfig = FontConfig(
    titleFont: 'Roboto',
    subtitleFont: 'Roboto',
    bodyFont: 'Roboto',
    captionFont: 'Roboto',
    titleSize: 24.0,
    subtitleSize: 18.0,
    bodySize: 16.0,
    captionSize: 12.0,
    titleWeight: FontWeight.bold,
    subtitleWeight: FontWeight.w600,
    bodyWeight: FontWeight.normal,
    captionWeight: FontWeight.normal,
  );

  static const FontConfig modernConfig = FontConfig(
    titleFont: 'Poppins',
    subtitleFont: 'Poppins',
    bodyFont: 'Inter',
    captionFont: 'Inter',
    titleSize: 28.0,
    subtitleSize: 20.0,
    bodySize: 16.0,
    captionSize: 14.0,
    titleWeight: FontWeight.w700,
    subtitleWeight: FontWeight.w600,
    bodyWeight: FontWeight.w400,
    captionWeight: FontWeight.w400,
  );

  static const FontConfig elegantConfig = FontConfig(
    titleFont: 'Playfair Display',
    subtitleFont: 'Playfair Display',
    bodyFont: 'Lato',
    captionFont: 'Lato',
    titleSize: 32.0,
    subtitleSize: 22.0,
    bodySize: 16.0,
    captionSize: 12.0,
    titleWeight: FontWeight.w700,
    subtitleWeight: FontWeight.w600,
    bodyWeight: FontWeight.w400,
    captionWeight: FontWeight.w300,
  );

  static const FontConfig techConfig = FontConfig(
    titleFont: 'JetBrains Mono',
    subtitleFont: 'JetBrains Mono',
    bodyFont: 'Fira Code',
    captionFont: 'Fira Code',
    titleSize: 20.0,
    subtitleSize: 16.0,
    bodySize: 14.0,
    captionSize: 12.0,
    titleWeight: FontWeight.w600,
    subtitleWeight: FontWeight.w500,
    bodyWeight: FontWeight.w400,
    captionWeight: FontWeight.w400,
  );

  static List<FontConfig> get availableConfigs => [
    defaultConfig,
    modernConfig,
    elegantConfig,
    techConfig,
  ];

  static List<String> get availableFonts => [
    'Roboto',
    'Poppins',
    'Inter',
    'Playfair Display',
    'Lato',
    'JetBrains Mono',
    'Fira Code',
    'Open Sans',
    'Montserrat',
    'Source Sans Pro',
  ];
} 