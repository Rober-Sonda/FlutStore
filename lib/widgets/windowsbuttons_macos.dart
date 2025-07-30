import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';

class WindowButtons extends StatelessWidget {
  const WindowButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min, // que el row no tome todo el espacio
      children: [
        MacWindowButton(
          color: Color(0xFFFF605C), // rojo
          hoverColor: Color(0xFFFF4842),
          onPressed: appWindow.close,
        ),
        SizedBox(width: 8),
        MacWindowButton(
          color: Color(0xFFFFBD44), // amarillo
          hoverColor: Color(0xFFFFD64C),
          onPressed: appWindow.minimize,
        ),
        SizedBox(width: 8),
        MacWindowButton(
          color: Color(0xFF00CA56), // verde
          hoverColor: Color(0xFF00E56B),
          onPressed: appWindow.maximizeOrRestore,
        ),
      ],
    );
  }
}

class MacWindowButton extends StatefulWidget {
  final Color color;
  final Color hoverColor;
  final VoidCallback onPressed;

  const MacWindowButton({
    super.key,
    required this.color,
    required this.hoverColor,
    required this.onPressed,
  });

  @override
  State<MacWindowButton> createState() => _MacWindowButtonState();
}

class _MacWindowButtonState extends State<MacWindowButton> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final currentColor = _hovering ? widget.hoverColor : widget.color;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onPressed,
        child: Container(
          width: 14,
          height: 14,
          decoration: BoxDecoration(
            color: currentColor,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: currentColor.withOpacity(0.6),
                blurRadius: 4,
                spreadRadius: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
