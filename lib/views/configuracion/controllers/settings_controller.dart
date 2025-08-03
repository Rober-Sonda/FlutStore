import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../models/app_theme.dart';
import '../../../models/font_config.dart';
import '../../../models/custom_theme.dart';
import '../../../services/app_config_service.dart';
import '../../../services/theme_service.dart';
import '../../../services/auth_service.dart';

class SettingsController extends ChangeNotifier {
  AppTheme? _selectedTheme;
  FontConfig? _selectedFontConfig;
  bool _isLoading = true;
  List<CustomTheme> _customThemes = [];

  AppTheme? get selectedTheme => _selectedTheme;
  FontConfig? get selectedFontConfig => _selectedFontConfig;
  bool get isLoading => _isLoading;
  List<CustomTheme> get customThemes => _customThemes;

  Future<void> loadSettings(WidgetRef ref) async {
    final configService = ref.read(appConfigServiceProvider);
    final themeService = ref.read(themeServiceProvider);
    final currentUser = ref.read(currentUserProvider);

    final theme = await configService.getSelectedTheme();
    final fontConfig = await configService.getSelectedFontConfig();

    List<CustomTheme> customThemes = [];
    if (currentUser != null) {
      customThemes = await themeService.getCustomThemes(currentUser.username);
    }

    _selectedTheme = theme;
    _selectedFontConfig = fontConfig;
    _customThemes = customThemes;
    _isLoading = false;
    notifyListeners();
  }

  Future<void> changeTheme(AppTheme theme, WidgetRef ref) async {
    final configService = ref.read(appConfigServiceProvider);
    await configService.setSelectedTheme(theme);

    // Actualizar el tema actual en el provider
    ref.read(currentThemeProvider.notifier).state = theme;

    _selectedTheme = theme;
    notifyListeners();
  }

  Future<void> changeFontConfig(FontConfig config, WidgetRef ref) async {
    final configService = ref.read(appConfigServiceProvider);
    await configService.setSelectedFontConfig(config);

    _selectedFontConfig = config;
    notifyListeners();
  }

  Future<void> resetToDefaults(WidgetRef ref) async {
    final configService = ref.read(appConfigServiceProvider);
    await configService.resetToDefaults();
    await loadSettings(ref);
  }
}
