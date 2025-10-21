import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:tienda_app/main.dart';
import 'package:tienda_app/providers/producto_provider.dart';
import 'package:tienda_app/providers/venta_provider.dart';

void main() {
  group('App Widget Tests', () {
    testWidgets('App should start and show navigation', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => ProductoProvider()),
            ChangeNotifierProvider(create: (_) => VentaProvider()),
          ],
          child: const MyApp(),
        ),
      );

      expect(find.byType(BottomNavigationBar), findsOneWidget);
      expect(find.text('Productos'), findsWidgets);
    });

    testWidgets('Navigation should work correctly', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => ProductoProvider()),
            ChangeNotifierProvider(create: (_) => VentaProvider()),
          ],
          child: const MyApp(),
        ),
      );

      // Tap on Ventas tab
      await tester.tap(find.text('Ventas'));
      await tester.pumpAndSettle();

      expect(find.text('Ventas'), findsWidgets);
    });
  });
}
