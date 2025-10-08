import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../widgets/color_picker_widget.dart';
import '../../../services/theme_service.dart';

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
