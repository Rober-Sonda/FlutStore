import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../models/app_theme.dart';
import '../../../models/custom_theme.dart';
import '../../../services/theme_service.dart';
import '../../../services/auth_service.dart';
import 'theme_card.dart';
import 'create_theme_form.dart';

class ThemeSection extends ConsumerStatefulWidget {
  final AppTheme? selectedTheme;
  final List<CustomTheme> customThemes;
  final Function(AppTheme) onThemeChanged;
  final VoidCallback onSettingsReload;

  const ThemeSection({
    super.key,
    required this.selectedTheme,
    required this.customThemes,
    required this.onThemeChanged,
    required this.onSettingsReload,
  });

  @override
  ConsumerState<ThemeSection> createState() => _ThemeSectionState();
}

class _ThemeSectionState extends ConsumerState<ThemeSection> {
  void _showCreateThemeDialog() {
    final currentTheme = widget.selectedTheme ?? AppTheme.darkTheme;

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(
              'Crear Tema Personalizado',
              style: TextStyle(color: currentTheme.textColor),
            ),
            backgroundColor: currentTheme.surfaceColor,
            content: CreateThemeForm(
              onThemeCreated: (
                String name,
                bool isDark,
                Color primaryColor,
                Color secondaryColor,
                Color accentColor,
                Color backgroundColor,
                Color surfaceColor,
                Color textColor,
                Color textSecondaryColor,
                Color errorColor,
                Color successColor,
                Color warningColor,
                Color infoColor,
              ) async {
                // Crear tema personalizado
                final currentUser = ref.read(currentUserProvider);
                if (currentUser == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Debes estar logueado para crear temas'),
                    ),
                  );
                  return;
                }

                print('🔍 Usuario actual: ${currentUser.username}');
                print('🔍 Nombre del tema: $name');
                print('🔍 Es oscuro: $isDark');

                final themeService = ref.read(themeServiceProvider);
                final customTheme = themeService.createCustomTheme(
                  userId: currentUser.username,
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

                // Guardar tema
                final success = await themeService.saveCustomTheme(customTheme);

                print('🔍 Resultado del guardado: $success');
                if (success) {
                  print('🔍 Tema guardado con ID: ${customTheme.id}');
                }

                if (success) {
                  Navigator.pop(context);
                  widget.onSettingsReload(); // Recargar temas

                  if (mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Tema "$name" creado exitosamente'),
                      ),
                    );
                  }
                } else {
                  if (mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Error al crear el tema')),
                    );
                  }
                }
              },
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Cancelar'),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentTheme = widget.selectedTheme ?? AppTheme.darkTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Sección de Temas
        Row(
          children: [
            Expanded(
              child: Text(
                'Temas',
                style: TextStyle(
                  color: currentTheme.textColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ElevatedButton.icon(
              onPressed: _showCreateThemeDialog,
              icon: const Icon(Icons.add),
              label: const Text('Crear Tema'),
              style: ElevatedButton.styleFrom(
                backgroundColor: currentTheme.accentColor,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),

        // Temas incorporados
        Text(
          'Temas Incorporados',
          style: TextStyle(
            color: currentTheme.textSecondaryColor,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),

        LayoutBuilder(
          builder: (context, constraints) {
            final cardWidth = 280.0;
            final spacing = 16.0;
            final crossAxisCount =
                (constraints.maxWidth / (cardWidth + spacing)).floor();
            final actualCrossAxisCount =
                crossAxisCount > 0 ? crossAxisCount : 1;

            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: actualCrossAxisCount,
                crossAxisSpacing: spacing,
                mainAxisSpacing: spacing,
                childAspectRatio: 1.2,
              ),
              itemCount: AppTheme.availableThemes.length,
              itemBuilder: (context, index) {
                return ThemeCard(
                  theme: AppTheme.availableThemes[index],
                  isSelected:
                      widget.selectedTheme?.name ==
                      AppTheme.availableThemes[index].name,
                  onThemeSelected: widget.onThemeChanged,
                );
              },
            );
          },
        ),

        // Temas personalizados
        if (widget.customThemes.isNotEmpty) ...[
          const SizedBox(height: 24),
          Text(
            'Mis Temas Personalizados',
            style: TextStyle(
              color: currentTheme.textSecondaryColor,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),

          LayoutBuilder(
            builder: (context, constraints) {
              final cardWidth = 280.0;
              final spacing = 16.0;
              final crossAxisCount =
                  (constraints.maxWidth / (cardWidth + spacing)).floor();
              final actualCrossAxisCount =
                  crossAxisCount > 0 ? crossAxisCount : 1;

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: actualCrossAxisCount,
                  crossAxisSpacing: spacing,
                  mainAxisSpacing: spacing,
                  childAspectRatio: 1.2,
                ),
                itemCount: widget.customThemes.length,
                itemBuilder: (context, index) {
                  return ThemeCard(
                    theme: widget.customThemes[index].toAppTheme(),
                    isSelected:
                        widget.selectedTheme?.name ==
                        widget.customThemes[index].name,
                    onThemeSelected: widget.onThemeChanged,
                    isCustom: true,
                  );
                },
              );
            },
          ),
        ],
      ],
    );
  }
}
