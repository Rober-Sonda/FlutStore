﻿import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tienda_app/components/shared/app_navigation_rail.dart';
import '../widgets/modern_title_bar.dart';

class MainView extends StatelessWidget {
  final Widget child;

  const MainView({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true, // ðŸ”¥ Esto fuerza a ignorar padding de sistema
        child: Column(
          children: [
            // Modern Title Bar
            const ModernTitleBar(),
            Expanded(
              child: Row(
                children: [
                  // Usa el AppNavigationRail que ahora muestra el punto rojo
                  const AppNavigationRail(),
                  Expanded(child: child),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

