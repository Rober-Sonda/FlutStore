import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/app_theme.dart';
import '../models/font_config.dart';

final appConfigServiceProvider = Provider<AppConfigService>((ref) => AppConfigService());

class AppConfigService {
  static const String _themeKey = 'selected_theme';
  static const String _fontConfigKey = 'selected_font_config';
  static const String _customThemeKey = 'custom_theme';
  static const String _customFontConfigKey = 'custom_font_config';

  Future<AppTheme> getSelectedTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final themeName = prefs.getString(_themeKey) ?? 'Tema Oscuro';
    
    // Buscar el tema por nombre
    final theme = AppTheme.availableThemes.firstWhere(
      (t) => t.name == themeName,
      orElse: () => AppTheme.darkTheme,
    );
    
    return theme;
  }

  Future<void> setSelectedTheme(AppTheme theme) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_themeKey, theme.name);
  }

  Future<FontConfig> getSelectedFontConfig() async {
    final prefs = await SharedPreferences.getInstance();
    final configName = prefs.getString(_fontConfigKey) ?? 'default';
    
    // Buscar la configuración por nombre
    switch (configName) {
      case 'modern':
        return FontConfig.modernConfig;
      case 'elegant':
        return FontConfig.elegantConfig;
      case 'tech':
        return FontConfig.techConfig;
      default:
        return FontConfig.defaultConfig;
    }
  }

  Future<void> setSelectedFontConfig(FontConfig config) async {
    final prefs = await SharedPreferences.getInstance();
    String configName = 'default';
    
    if (config == FontConfig.modernConfig) {
      configName = 'modern';
    } else if (config == FontConfig.elegantConfig) configName = 'elegant';
    else if (config == FontConfig.techConfig) configName = 'tech';
    
    await prefs.setString(_fontConfigKey, configName);
  }

  Future<AppTheme?> getCustomTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final customThemeJson = prefs.getString(_customThemeKey);
    
    if (customThemeJson != null) {
      try {
        final Map<String, dynamic> themeData = json.decode(customThemeJson);
        return AppTheme(
          name: themeData['name'] ?? 'Tema Personalizado',
          isDark: themeData['isDark'] ?? true,
          primaryColor: Color(themeData['primaryColor'] ?? 0xFF6B46C1),
          secondaryColor: Color(themeData['secondaryColor'] ?? 0xFF805AD5),
          accentColor: Color(themeData['accentColor'] ?? 0xFF9F7AEA),
          backgroundColor: Color(themeData['backgroundColor'] ?? 0xFF1A202C),
          surfaceColor: Color(themeData['surfaceColor'] ?? 0xFF2D3748),
          textColor: Color(themeData['textColor'] ?? 0xFFFFFFFF),
          textSecondaryColor: Color(themeData['textSecondaryColor'] ?? 0xFFA0AEC0),
          errorColor: Color(themeData['errorColor'] ?? 0xFFE53E3E),
          successColor: Color(themeData['successColor'] ?? 0xFF38A169),
          warningColor: Color(themeData['warningColor'] ?? 0xFFD69E2E),
          infoColor: Color(themeData['infoColor'] ?? 0xFF3182CE),
        );
      } catch (e) {
        print('Error al cargar tema personalizado: $e');
        return null;
      }
    }
    return null;
  }

  Future<void> saveCustomTheme(AppTheme theme) async {
    final prefs = await SharedPreferences.getInstance();
    final themeData = {
      'name': theme.name,
      'isDark': theme.isDark,
      'primaryColor': theme.primaryColor.value,
      'secondaryColor': theme.secondaryColor.value,
      'accentColor': theme.accentColor.value,
      'backgroundColor': theme.backgroundColor.value,
      'surfaceColor': theme.surfaceColor.value,
      'textColor': theme.textColor.value,
      'textSecondaryColor': theme.textSecondaryColor.value,
      'errorColor': theme.errorColor.value,
      'successColor': theme.successColor.value,
      'warningColor': theme.warningColor.value,
      'infoColor': theme.infoColor.value,
    };
    
    await prefs.setString(_customThemeKey, json.encode(themeData));
  }

  Future<FontConfig?> getCustomFontConfig() async {
    final prefs = await SharedPreferences.getInstance();
    final customFontJson = prefs.getString(_customFontConfigKey);
    
    if (customFontJson != null) {
      try {
        final Map<String, dynamic> fontData = json.decode(customFontJson);
        return FontConfig(
          titleFont: fontData['titleFont'] ?? 'Roboto',
          subtitleFont: fontData['subtitleFont'] ?? 'Roboto',
          bodyFont: fontData['bodyFont'] ?? 'Roboto',
          captionFont: fontData['captionFont'] ?? 'Roboto',
          titleSize: fontData['titleSize']?.toDouble() ?? 24.0,
          subtitleSize: fontData['subtitleSize']?.toDouble() ?? 18.0,
          bodySize: fontData['bodySize']?.toDouble() ?? 16.0,
          captionSize: fontData['captionSize']?.toDouble() ?? 12.0,
          titleWeight: FontWeight.values[fontData['titleWeight'] ?? FontWeight.bold.index],
          subtitleWeight: FontWeight.values[fontData['subtitleWeight'] ?? FontWeight.w600.index],
          bodyWeight: FontWeight.values[fontData['bodyWeight'] ?? FontWeight.normal.index],
          captionWeight: FontWeight.values[fontData['captionWeight'] ?? FontWeight.normal.index],
        );
      } catch (e) {
        print('Error al cargar configuración de fuentes personalizada: $e');
        return null;
      }
    }
    return null;
  }

  Future<void> saveCustomFontConfig(FontConfig config) async {
    final prefs = await SharedPreferences.getInstance();
    final fontData = {
      'titleFont': config.titleFont,
      'subtitleFont': config.subtitleFont,
      'bodyFont': config.bodyFont,
      'captionFont': config.captionFont,
      'titleSize': config.titleSize,
      'subtitleSize': config.subtitleSize,
      'bodySize': config.bodySize,
      'captionSize': config.captionSize,
      'titleWeight': config.titleWeight.index,
      'subtitleWeight': config.subtitleWeight.index,
      'bodyWeight': config.bodyWeight.index,
      'captionWeight': config.captionWeight.index,
    };
    
    await prefs.setString(_customFontConfigKey, json.encode(fontData));
  }

  Future<ThemeData> getCurrentThemeData() async {
    final theme = await getSelectedTheme();
    final fontConfig = await getSelectedFontConfig();
    
    final baseTheme = theme.toThemeData();
    final textTheme = fontConfig.toTextTheme(theme.textColor, theme.textSecondaryColor);
    
    return baseTheme.copyWith(textTheme: textTheme);
  }

  Future<void> resetToDefaults() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_themeKey);
    await prefs.remove(_fontConfigKey);
    await prefs.remove(_customThemeKey);
    await prefs.remove(_customFontConfigKey);
  }
} 