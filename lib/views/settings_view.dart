import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../models/app_theme.dart';
import '../models/font_config.dart';
import '../models/custom_theme.dart';
import '../services/app_config_service.dart';
import '../services/theme_service.dart';
import '../services/auth_service.dart';
import '../widgets/color_picker_widget.dart';

class SettingsView extends ConsumerStatefulWidget {
  const SettingsView({super.key});

  @override
  ConsumerState<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends ConsumerState<SettingsView> {
  AppTheme? _selectedTheme;
  FontConfig? _selectedFontConfig;
  bool _isLoading = true;
  List<CustomTheme> _customThemes = [];

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final configService = ref.read(appConfigServiceProvider);
    final themeService = ref.read(themeServiceProvider);
    final currentUser = ref.read(currentUserProvider);

    final theme = await configService.getSelectedTheme();
    final fontConfig = await configService.getSelectedFontConfig();

    List<CustomTheme> customThemes = [];
    if (currentUser != null) {
      customThemes = await themeService.getCustomThemes(currentUser.username);
    }

    setState(() {
      _selectedTheme = theme;
      _selectedFontConfig = fontConfig;
      _customThemes = customThemes;
      _isLoading = false;
    });
  }

  Future<void> _changeTheme(AppTheme theme) async {
    final configService = ref.read(appConfigServiceProvider);
    await configService.setSelectedTheme(theme);

    // Actualizar el tema actual en el provider
    ref.read(currentThemeProvider.notifier).state = theme;

    setState(() {
      _selectedTheme = theme;
    });

    if (mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Tema cambiado a: ${theme.name}')));
    }
  }

  Future<void> _changeFontConfig(FontConfig config) async {
    final configService = ref.read(appConfigServiceProvider);
    await configService.setSelectedFontConfig(config);

    setState(() {
      _selectedFontConfig = config;
    });

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Configuración de fuentes actualizada')),
      );
    }
  }

  Widget _buildThemeCard(AppTheme theme, {bool isCustom = false}) {
    final isSelected = _selectedTheme?.name == theme.name;
    final currentTheme = _selectedTheme ?? AppTheme.darkTheme;

    return Card(
      color: currentTheme.surfaceColor,
      elevation: isSelected ? 4 : 2,
      child: InkWell(
        onTap: () => _changeTheme(theme),
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(
              color: isSelected ? currentTheme.accentColor : Colors.transparent,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      theme.name,
                      style: TextStyle(
                        color: currentTheme.textColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  if (isSelected)
                    Icon(
                      Icons.check_circle,
                      color: currentTheme.accentColor,
                      size: 24,
                    ),
                  if (isCustom)
                    Icon(
                      Icons.person,
                      color: currentTheme.textSecondaryColor,
                      size: 16,
                    ),
                ],
              ),
              const SizedBox(height: 12),

              // Muestra de colores
              Row(
                children: [
                  _buildColorPreview(theme.primaryColor, 'Primario'),
                  const SizedBox(width: 8),
                  _buildColorPreview(theme.secondaryColor, 'Secundario'),
                  const SizedBox(width: 8),
                  _buildColorPreview(theme.accentColor, 'Acento'),
                ],
              ),

              const SizedBox(height: 8),
              Text(
                theme.isDark ? 'Tema Oscuro' : 'Tema Claro',
                style: TextStyle(
                  color: currentTheme.textSecondaryColor,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildColorPreview(Color color, String label) {
    final currentTheme = _selectedTheme ?? AppTheme.darkTheme;

    return Column(
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: currentTheme.textSecondaryColor.withOpacity(0.3),
            ),
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 10,
            color: currentTheme.textSecondaryColor,
          ),
        ),
      ],
    );
  }

  Widget _buildFontConfigCard(FontConfig config) {
    final isSelected = _selectedFontConfig == config;
    final theme = _selectedTheme ?? AppTheme.darkTheme;

    return Card(
      color: theme.surfaceColor,
      elevation: isSelected ? 4 : 2,
      child: InkWell(
        onTap: () => _changeFontConfig(config),
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(
              color: isSelected ? theme.accentColor : Colors.transparent,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      _getFontConfigName(config),
                      style: TextStyle(
                        color: theme.textColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  if (isSelected)
                    Icon(
                      Icons.check_circle,
                      color: theme.accentColor,
                      size: 24,
                    ),
                ],
              ),
              const SizedBox(height: 12),

              // Muestra de fuentes
              Text(
                'Título',
                style: TextStyle(
                  fontFamily: config.titleFont,
                  fontSize: config.titleSize,
                  fontWeight: config.titleWeight,
                  color: theme.textColor,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Subtítulo',
                style: TextStyle(
                  fontFamily: config.subtitleFont,
                  fontSize: config.subtitleSize,
                  fontWeight: config.subtitleWeight,
                  color: theme.textColor,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Texto del cuerpo',
                style: TextStyle(
                  fontFamily: config.bodyFont,
                  fontSize: config.bodySize,
                  fontWeight: config.bodyWeight,
                  color: theme.textSecondaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getFontConfigName(FontConfig config) {
    if (config == FontConfig.modernConfig) return 'Moderno';
    if (config == FontConfig.elegantConfig) return 'Elegante';
    if (config == FontConfig.techConfig) return 'Tecnológico';
    return 'Predeterminado';
  }

  void _showCreateThemeDialog() {
    final currentTheme = _selectedTheme ?? AppTheme.darkTheme;

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
                  await _loadSettings(); // Recargar temas

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
    if (_isLoading) {
      return const Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: CircularProgressIndicator(color: Colors.deepPurpleAccent),
        ),
      );
    }

    final currentTheme = _selectedTheme ?? AppTheme.darkTheme;

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
                    return _buildThemeCard(AppTheme.availableThemes[index]);
                  },
                );
              },
            ),

            // Temas personalizados
            if (_customThemes.isNotEmpty) ...[
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
                    itemCount: _customThemes.length,
                    itemBuilder: (context, index) {
                      return _buildThemeCard(
                        _customThemes[index].toAppTheme(),
                        isCustom: true,
                      );
                    },
                  );
                },
              ),
            ],

            const SizedBox(height: 32),

            // Sección de Fuentes
            Text(
              'Configuración de Fuentes',
              style: TextStyle(
                color: currentTheme.textColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            LayoutBuilder(
              builder: (context, constraints) {
                final cardWidth = 320.0;
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
                    childAspectRatio: 1.5,
                  ),
                  itemCount: FontConfig.availableConfigs.length,
                  itemBuilder: (context, index) {
                    return _buildFontConfigCard(
                      FontConfig.availableConfigs[index],
                    );
                  },
                );
              },
            ),

            const SizedBox(height: 32),

            // Botón para restablecer configuración
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () async {
                  final configService = ref.read(appConfigServiceProvider);
                  await configService.resetToDefaults();
                  await _loadSettings();

                  if (mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Configuración restablecida'),
                      ),
                    );
                  }
                },
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

class CreateThemeForm extends ConsumerStatefulWidget {
  final Function(
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
  )
  onThemeCreated;

  const CreateThemeForm({super.key, required this.onThemeCreated});

  @override
  ConsumerState<CreateThemeForm> createState() => _CreateThemeFormState();
}

class _CreateThemeFormState extends ConsumerState<CreateThemeForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  bool _isDark = true;
  Color _primaryColor = Colors.blue;
  Color _secondaryColor = Colors.blueAccent;
  Color _accentColor = Colors.blue.shade300;
  Color _backgroundColor = Colors.grey[900]!;
  Color _surfaceColor = Colors.grey[800]!;
  Color _textColor = Colors.white;
  Color _textSecondaryColor = Colors.grey[400]!;
  Color _errorColor = Colors.red;
  Color _successColor = Colors.green;
  Color _warningColor = Colors.orange;
  Color _infoColor = Colors.blue;

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _updateColorsFromPrimary(Color primaryColor) {
    final hsl = HSLColor.fromColor(primaryColor);

    setState(() {
      _primaryColor = primaryColor;

      // Generar colores armonizados automáticamente
      if (_isDark) {
        _backgroundColor = hsl.withLightness(0.1).toColor();
        _surfaceColor = hsl.withLightness(0.15).toColor();
        _textColor = Colors.white;
        _textSecondaryColor = Colors.grey[400]!;
      } else {
        _backgroundColor = hsl.withLightness(0.95).toColor();
        _surfaceColor = Colors.white;
        _textColor = Colors.black;
        _textSecondaryColor = Colors.grey[600]!;
      }

      // Colores secundarios armonizados
      _secondaryColor = hsl.withHue((hsl.hue + 30) % 360).toColor();
      _accentColor =
          hsl.withLightness((hsl.lightness * 1.3).clamp(0.0, 1.0)).toColor();

      // Colores semánticos
      _errorColor = Colors.red;
      _successColor = Colors.green;
      _warningColor = Colors.orange;
      _infoColor = primaryColor;
    });
  }

  void _createTheme() {
    if (_formKey.currentState!.validate()) {
      widget.onThemeCreated(
        _nameController.text.trim(),
        _isDark,
        _primaryColor,
        _secondaryColor,
        _accentColor,
        _backgroundColor,
        _surfaceColor,
        _textColor,
        _textSecondaryColor,
        _errorColor,
        _successColor,
        _warningColor,
        _infoColor,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentTheme = ref.watch(currentThemeProvider);

    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Información de ayuda
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: currentTheme.accentColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: currentTheme.accentColor.withOpacity(0.3),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.palette,
                    color: currentTheme.accentColor,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Consejo: Selecciona un color primario y los demás se ajustarán automáticamente para crear una paleta armonizada.',
                      style: TextStyle(
                        color: currentTheme.textColor,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Nombre del tema
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Nombre del Tema *',
                border: OutlineInputBorder(),
                helperText: 'Elige un nombre descriptivo para tu tema',
                suffixIcon: Icon(Icons.star, color: Colors.red, size: 16),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'El nombre del tema es requerido';
                }
                return null;
              },
            ),

            const SizedBox(height: 16),

            // Selector de modo oscuro/claro
            Row(
              children: [
                Text('Modo: ', style: TextStyle(color: currentTheme.textColor)),
                Switch(
                  value: _isDark,
                  onChanged: (value) {
                    setState(() {
                      _isDark = value;
                      _updateColorsFromPrimary(_primaryColor);
                    });
                  },
                ),
                Text(
                  _isDark ? 'Oscuro' : 'Claro',
                  style: TextStyle(color: currentTheme.textColor),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Colores principales
            Text(
              'Colores del Tema',
              style: TextStyle(
                color: currentTheme.textColor,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 16),

            // Color primario (el más importante)
            ColorPickerWidget(
              initialColor: _primaryColor,
              label: 'Color Primario *',
              onColorChanged: _updateColorsFromPrimary,
              helpText:
                  'Este es el color principal de tu tema. Los demás colores se ajustarán automáticamente.',
            ),

            const SizedBox(height: 16),

            // Vista previa del tema
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: _backgroundColor,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: currentTheme.textSecondaryColor.withOpacity(0.3),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Vista Previa del Tema',
                    style: TextStyle(
                      color: _textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Muestra de elementos
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _primaryColor,
                            foregroundColor: Colors.white,
                          ),
                          child: Text('Botón Primario'),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _secondaryColor,
                            foregroundColor: Colors.white,
                          ),
                          child: Text('Botón Secundario'),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  Text(
                    'Texto principal del tema',
                    style: TextStyle(color: _textColor, fontSize: 14),
                  ),
                  Text(
                    'Texto secundario del tema',
                    style: TextStyle(color: _textSecondaryColor, fontSize: 12),
                  ),

                  const SizedBox(height: 12),

                  // Colores semánticos
                  Row(
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          color: _successColor,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          color: _warningColor,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          color: _errorColor,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          color: _infoColor,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Información adicional
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: currentTheme.backgroundColor,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: currentTheme.textSecondaryColor.withOpacity(0.2),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tipos de Paletas:',
                    style: TextStyle(
                      color: currentTheme.textColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '• Monocromática: Variaciones del mismo color\n'
                    '• Análoga: Colores adyacentes en el círculo cromático\n'
                    '• Complementaria: Colores opuestos\n'
                    '• Triádica: Tres colores equidistantes',
                    style: TextStyle(
                      color: currentTheme.textSecondaryColor,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Botón de crear tema
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _createTheme,
                icon: const Icon(Icons.add),
                label: const Text('Crear Tema'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: currentTheme.accentColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ),

            const SizedBox(height: 8),

            // Botón de prueba temporal
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () async {
                  final themeService = ref.read(themeServiceProvider);
                  final result = await themeService.testCreateTheme();
                  if (mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          result ? 'Prueba exitosa' : 'Prueba fallida',
                        ),
                        backgroundColor: result ? Colors.green : Colors.red,
                      ),
                    );
                  }
                },
                icon: const Icon(Icons.bug_report),
                label: const Text('Probar Creación'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
