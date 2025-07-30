import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';

// Botones de ventana personalizados
class WindowButtons extends StatelessWidget {
  const WindowButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _WindowButton(onPressed: appWindow.minimize, icon: Icons.remove),
        _WindowButton(
          onPressed: appWindow.maximizeOrRestore,
          icon: Icons.crop_square,
        ),
        _WindowButton(onPressed: appWindow.close, icon: Icons.close),
      ],
    );
  }
}

class _WindowButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;

  const _WindowButton({required this.onPressed, required this.icon});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          Future.microtask(() => onPressed());
        },
        child: Container(
          width: 46,
          height: 50,
          color: Colors.black,
          child: Icon(icon, color: Colors.grey.shade400),
        ),
      ),
    );
  }
}
