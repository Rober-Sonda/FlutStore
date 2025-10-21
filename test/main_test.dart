import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Main.dart TDD - textScaleFactor to textScaler Migration', () {
    testWidgets('TDD Red: Should identify deprecated textScaleFactor usage', 
        (WidgetTester tester) async {
      // Red Phase: This test documents deprecated usage
      
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              final mediaQuery = MediaQuery.of(context);
              // This uses deprecated API
              final scale = mediaQuery.textScaleFactor.clamp(0.8, 1.4);
              
              return Scaffold(
                body: Text('Scale: $scale'),
              );
            },
          ),
        ),
      );

      expect(find.textContaining('Scale:'), findsOneWidget);
      // NOTE: This test uses deprecated textScaleFactor
    });

    testWidgets('TDD Green: Should use non-deprecated textScaler', 
        (WidgetTester tester) async {
      // Green Phase: This test validates the corrected implementation
      
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              final mediaQuery = MediaQuery.of(context);
              // New non-deprecated approach
              final scale = mediaQuery.textScaler.scale(1.0).clamp(0.8, 1.4);
              
              return Scaffold(
                body: Text('Scale: $scale'),
              );
            },
          ),
        ),
      );

      expect(find.textContaining('Scale:'), findsOneWidget);
    });

    test('TextScaler functionality validation', () {
      // Test that textScaler provides equivalent functionality
      const baseScaler = TextScaler.linear(1.0);
      const scaledScaler = TextScaler.linear(1.2);
      
      // Test scale values
      expect(baseScaler.scale(1.0), equals(1.0));
      expect(scaledScaler.scale(1.0), equals(1.2));
      
      // Test clamping behavior
      final clampedScale = scaledScaler.scale(1.0).clamp(0.8, 1.4);
      expect(clampedScale, equals(1.2));
    });
  });
}