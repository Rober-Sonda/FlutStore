import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:tienda_app/widgets/top_bar_actions.dart';
import 'package:tienda_app/services/theme_service.dart';
import 'package:tienda_app/models/app_theme.dart';

class ModernTitleBar extends ConsumerWidget {
  const ModernTitleBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(currentThemeProvider);

    return Container(
      height: 40,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            currentTheme.backgroundColor,
            currentTheme.surfaceColor,
            currentTheme.backgroundColor,
          ],
        ),
        // border: Border(
        //   bottom: BorderSide(
        //     color: currentTheme.primaryColor.withOpacity(0.3),
        //     width: 1,
        //   ),
        // ),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black.withOpacity(0.2),
        //     blurRadius: 4,
        //     offset: const Offset(0, 2),
        //   ),
        // ],
      ),
      child: Row(
        children: [
          // Logo y título
          Expanded(
            child: MoveWindow(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    // Logo
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: currentTheme.primaryColor,
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          BoxShadow(
                            color: currentTheme.primaryColor.withOpacity(0.3),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Icon(Icons.store, color: Colors.white, size: 16),
                    ),
                    const SizedBox(width: 12),
                    // Título
                    Text(
                      'NAJAM',
                      style: TextStyle(
                        color: currentTheme.textColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      width: 1,
                      height: 20,
                      color: currentTheme.textSecondaryColor.withOpacity(0.3),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'TIENDA OFICIAL',
                      style: TextStyle(
                        color: currentTheme.textSecondaryColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Acciones de la barra superior (carrito y perfil)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: const TopBarActions(),
          ),

          // Separador
          Container(
            width: 1,
            height: 20,
            color: currentTheme.textSecondaryColor.withOpacity(0.3),
          ),

          // Botones de ventana modernos
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ModernWindowButtons(currentTheme: currentTheme),
          ),
        ],
      ),
    );
  }
}

class ModernWindowButtons extends StatelessWidget {
  final AppTheme currentTheme;

  const ModernWindowButtons({super.key, required this.currentTheme});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ModernWindowButton(
          icon: Icons.remove,
          color: Colors.orange,
          onPressed: appWindow.minimize,
          tooltip: 'Minimizar',
          currentTheme: currentTheme,
        ),
        const SizedBox(width: 8),
        ModernWindowButton(
          icon: Icons.crop_square,
          color: Colors.green,
          onPressed: appWindow.maximizeOrRestore,
          tooltip: 'Maximizar/Restaurar',
          currentTheme: currentTheme,
        ),
        const SizedBox(width: 8),
        ModernWindowButton(
          icon: Icons.close,
          color: Colors.red,
          onPressed: appWindow.close,
          tooltip: 'Cerrar',
          currentTheme: currentTheme,
        ),
      ],
    );
  }
}

class ModernWindowButton extends StatefulWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;
  final String tooltip;
  final AppTheme currentTheme;

  const ModernWindowButton({
    super.key,
    required this.icon,
    required this.color,
    required this.onPressed,
    required this.tooltip,
    required this.currentTheme,
  });

  @override
  State<ModernWindowButton> createState() => _ModernWindowButtonState();
}

class _ModernWindowButtonState extends State<ModernWindowButton> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      cursor: SystemMouseCursors.click,
      child: Tooltip(
        message: widget.tooltip,
        child: GestureDetector(
          onTap: widget.onPressed,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color:
                  _hovering
                      ? widget.color.withOpacity(0.2)
                      : Colors.transparent,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color:
                    _hovering
                        ? widget.color.withOpacity(0.5)
                        : Colors.transparent,
                width: 1,
              ),
            ),
            child: Icon(
              widget.icon,
              size: 14,
              color:
                  _hovering
                      ? widget.color
                      : widget.currentTheme.textSecondaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
