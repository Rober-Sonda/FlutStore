import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/app_theme.dart';
import '../services/theme_service.dart';

class ColorPickerWidget extends ConsumerStatefulWidget {
  final Color initialColor;
  final String label;
  final ValueChanged<Color> onColorChanged;
  final String? helpText;

  const ColorPickerWidget({
    super.key,
    required this.initialColor,
    required this.label,
    required this.onColorChanged,
    this.helpText,
  });

  @override
  ConsumerState<ColorPickerWidget> createState() => _ColorPickerWidgetState();
}

class _ColorPickerWidgetState extends ConsumerState<ColorPickerWidget> {
  late Color _selectedColor;
  bool _showPalette = false;

  @override
  void initState() {
    super.initState();
    _selectedColor = widget.initialColor;
  }

  @override
  Widget build(BuildContext context) {
    final currentTheme = ref.watch(currentThemeProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(
            color: currentTheme.textColor,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),

        // Color actual
        GestureDetector(
          onTap: () => _showColorPicker(context),
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: _selectedColor,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: currentTheme.textSecondaryColor.withOpacity(0.3),
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: _selectedColor.withOpacity(0.3),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: const Icon(Icons.colorize, color: Colors.white, size: 20),
          ),
        ),

        const SizedBox(height: 8),

        // Paletas predefinidas
        if (_showPalette) ...[
          Text(
            'Paletas Sugeridas',
            style: TextStyle(
              color: currentTheme.textSecondaryColor,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),

          // Paletas armonizadas
          _buildHarmonyPalettes(),

          const SizedBox(height: 12),

          // BotÃ³n para cerrar paleta
          TextButton(
            onPressed: () => setState(() => _showPalette = false),
            child: Text(
              'Ocultar Paletas',
              style: TextStyle(color: currentTheme.accentColor),
            ),
          ),
        ] else ...[
          // BotÃ³n para mostrar paleta
          TextButton(
            onPressed: () => setState(() => _showPalette = true),
            child: Text(
              'Ver Paletas Sugeridas',
              style: TextStyle(color: currentTheme.accentColor),
            ),
          ),
        ],

        // Texto de ayuda
        if (widget.helpText != null) ...[
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: currentTheme.backgroundColor,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: currentTheme.textSecondaryColor.withOpacity(0.2),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.lightbulb_outline,
                  color: currentTheme.accentColor,
                  size: 16,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    widget.helpText!,
                    style: TextStyle(
                      color: currentTheme.textSecondaryColor,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildHarmonyPalettes() {
    final currentTheme = ref.watch(currentThemeProvider);

    return Column(
      children: [
        // Paleta monocromÃ¡tica
        _buildPaletteSection(
          'MonocromÃ¡tica',
          'Variaciones del mismo color',
          _generateMonochromaticPalette(_selectedColor),
          currentTheme,
        ),

        const SizedBox(height: 12),

        // Paleta anÃ¡loga
        _buildPaletteSection(
          'AnÃ¡loga',
          'Colores adyacentes en el cÃ­rculo cromÃ¡tico',
          _generateAnalogousPalette(_selectedColor),
          currentTheme,
        ),

        const SizedBox(height: 12),

        // Paleta complementaria
        _buildPaletteSection(
          'Complementaria',
          'Colores opuestos en el cÃ­rculo cromÃ¡tico',
          _generateComplementaryPalette(_selectedColor),
          currentTheme,
        ),

        const SizedBox(height: 12),

        // Paleta triÃ¡dica
        _buildPaletteSection(
          'TriÃ¡dica',
          'Tres colores equidistantes',
          _generateTriadicPalette(_selectedColor),
          currentTheme,
        ),
      ],
    );
  }

  Widget _buildPaletteSection(
    String title,
    String description,
    List<Color> colors,
    AppTheme currentTheme,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: currentTheme.textColor,
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
        ),
        Text(
          description,
          style: TextStyle(
            color: currentTheme.textSecondaryColor,
            fontSize: 10,
          ),
        ),
        const SizedBox(height: 6),

        Row(
          children:
              colors.map((color) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedColor = color;
                    });
                    widget.onColorChanged(color);
                  },
                  child: Container(
                    width: 30,
                    height: 30,
                    margin: const EdgeInsets.only(right: 6),
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: currentTheme.textSecondaryColor.withOpacity(0.3),
                      ),
                    ),
                  ),
                );
              }).toList(),
        ),
      ],
    );
  }

  // Generar paleta monocromÃ¡tica
  List<Color> _generateMonochromaticPalette(Color baseColor) {
    final hsl = HSLColor.fromColor(baseColor);
    return [
      hsl.withLightness((hsl.lightness * 0.3).clamp(0.0, 1.0)).toColor(),
      hsl.withLightness((hsl.lightness * 0.6).clamp(0.0, 1.0)).toColor(),
      baseColor,
      hsl.withLightness((hsl.lightness * 1.4).clamp(0.0, 1.0)).toColor(),
      hsl.withLightness((hsl.lightness * 1.7).clamp(0.0, 1.0)).toColor(),
    ];
  }

  // Generar paleta anÃ¡loga
  List<Color> _generateAnalogousPalette(Color baseColor) {
    final hsl = HSLColor.fromColor(baseColor);
    return [
      hsl.withHue((hsl.hue - 30) % 360).toColor(),
      hsl.withHue((hsl.hue - 15) % 360).toColor(),
      baseColor,
      hsl.withHue((hsl.hue + 15) % 360).toColor(),
      hsl.withHue((hsl.hue + 30) % 360).toColor(),
    ];
  }

  // Generar paleta complementaria
  List<Color> _generateComplementaryPalette(Color baseColor) {
    final hsl = HSLColor.fromColor(baseColor);
    final complementary = hsl.withHue((hsl.hue + 180) % 360).toColor();
    return [
      baseColor,
      hsl.withLightness((hsl.lightness * 0.7).clamp(0.0, 1.0)).toColor(),
      complementary,
      HSLColor.fromColor(complementary)
          .withLightness(
            (HSLColor.fromColor(complementary).lightness * 0.7).clamp(0.0, 1.0),
          )
          .toColor(),
    ];
  }

  // Generar paleta triÃ¡dica
  List<Color> _generateTriadicPalette(Color baseColor) {
    final hsl = HSLColor.fromColor(baseColor);
    return [
      baseColor,
      hsl.withHue((hsl.hue + 120) % 360).toColor(),
      hsl.withHue((hsl.hue + 240) % 360).toColor(),
    ];
  }

  void _showColorPicker(BuildContext context) {
    final currentTheme = ref.watch(currentThemeProvider);

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(
              'Seleccionar Color',
              style: TextStyle(color: currentTheme.textColor),
            ),
            backgroundColor: currentTheme.surfaceColor,
            content: SizedBox(
              width: 300,
              height: 400,
              child: Column(
                children: [
                  // Color picker bÃ¡sico
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          // Colores predefinidos populares
                          _buildPredefinedColors(currentTheme),

                          const SizedBox(height: 16),

                          // InformaciÃ³n del color
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: currentTheme.backgroundColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  'Color Seleccionado',
                                  style: TextStyle(
                                    color: currentTheme.textColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: _selectedColor,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: currentTheme.textSecondaryColor
                                          .withOpacity(0.3),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'RGB: ${(_selectedColor.r * 255.0).round() & 0xff}, ${(_selectedColor.g * 255.0).round() & 0xff}, ${(_selectedColor.b * 255.0).round() & 0xff}',
                                  style: TextStyle(
                                    color: currentTheme.textSecondaryColor,
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  'Hex: #${_selectedColor.toARGB32().toRadixString(16).substring(2).toUpperCase()}',
                                  style: TextStyle(
                                    color: currentTheme.textSecondaryColor,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Cancelar'),
              ),
              ElevatedButton(
                onPressed: () {
                  widget.onColorChanged(_selectedColor);
                  Navigator.pop(context);
                },
                child: Text('Seleccionar'),
              ),
            ],
          ),
    );
  }

  Widget _buildPredefinedColors(AppTheme currentTheme) {
    final colors = [
      // Azules
      Colors.blue[900]!,
      Colors.blue[700]!,
      Colors.blue[500]!,
      Colors.blue[300]!,
      Colors.blue[100]!,
      // Verdes
      Colors.green[900]!,
      Colors.green[700]!,
      Colors.green[500]!,
      Colors.green[300]!,
      Colors.green[100]!,
      // PÃºrpuras
      Colors.purple[900]!,
      Colors.purple[700]!,
      Colors.purple[500]!,
      Colors.purple[300]!,
      Colors.purple[100]!,
      // Rojos
      Colors.red[900]!,
      Colors.red[700]!,
      Colors.red[500]!,
      Colors.red[300]!,
      Colors.red[100]!,
      // Naranjas
      Colors.orange[900]!,
      Colors.orange[700]!,
      Colors.orange[500]!,
      Colors.orange[300]!,
      Colors.orange[100]!,
      // Grises
      Colors.grey[900]!,
      Colors.grey[700]!,
      Colors.grey[500]!,
      Colors.grey[300]!,
      Colors.grey[100]!,
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Colores Predefinidos',
          style: TextStyle(
            color: currentTheme.textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children:
              colors.map((color) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedColor = color;
                    });
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        color:
                            _selectedColor == color
                                ? currentTheme.accentColor
                                : currentTheme.textSecondaryColor.withOpacity(
                                  0.3,
                                ),
                        width: _selectedColor == color ? 2 : 1,
                      ),
                    ),
                  ),
                );
              }).toList(),
        ),
      ],
    );
  }
}

