import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../models/app_theme.dart';
import '../../models/font_config.dart';
import '../../models/custom_theme.dart';
import '../../services/app_config_service.dart';
import '../../services/theme_service.dart';
import '../../services/auth_service.dart';
import 'widgets/theme_section.dart';
import 'widgets/font_config_section.dart';
import 'controllers/settings_controller.dart';

class SettingsView extends ConsumerStatefulWidget {
  const SettingsView({super.key});

  @override
  ConsumerState<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends ConsumerState<SettingsView> {
  late SettingsController _controller;

  @override
  void initState() {
    super.initState();
    _controller = SettingsController();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    await _controller.loadSettings(ref);
  }

  Future<void> _changeTheme(AppTheme theme) async {
    await _controller.changeTheme(theme, ref);

    if (mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Tema cambiado a: ${theme.name}')));
    }
  }

  Future<void> _changeFontConfig(FontConfig config) async {
    await _controller.changeFontConfig(config, ref);

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Configuración de fuentes actualizada')),
      );
    }
  }

  Future<void> _resetToDefaults() async {
    await _controller.resetToDefaults(ref);

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Configuración restablecida')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_controller.isLoading) {
      return const Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: CircularProgressIndicator(color: Colors.deepPurpleAccent),
        ),
      );
    }

    final currentTheme = _controller.selectedTheme ?? AppTheme.darkTheme;

    return Scaffold(
      backgroundColor: currentTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: currentTheme.backgroundColor,
        title: Text(
          'Configuración',
          style: TextStyle(color: currentTheme.textColor),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: currentTheme.textColor),
          onPressed: () => context.pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Sección de Temas
            ThemeSection(
              selectedTheme: _controller.selectedTheme,
              customThemes: _controller.customThemes,
              onThemeChanged: _changeTheme,
              onSettingsReload: _loadSettings,
            ),

            const SizedBox(height: 32),

            // Sección de Fuentes
            FontConfigSection(
              selectedFontConfig: _controller.selectedFontConfig,
              onFontConfigChanged: _changeFontConfig,
            ),

            const SizedBox(height: 32),

            // Sección de Configuración del Negocio
            Card(
              color: currentTheme.surfaceColor,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Configuración del Negocio',
                      style: TextStyle(
                        color: currentTheme.textColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Configura los datos de tu negocio para usar en pedidos y reportes',
                      style: TextStyle(
                        color: currentTheme.textSecondaryColor,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          context.push('/business-config');
                        },
                        icon: const Icon(Icons.business),
                        label: const Text('Configurar Datos del Negocio'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: currentTheme.primaryColor,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 32),

            // Botón para restablecer configuración
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _resetToDefaults,
                icon: const Icon(Icons.restore),
                label: const Text('Restablecer Configuración'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: currentTheme.errorColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
