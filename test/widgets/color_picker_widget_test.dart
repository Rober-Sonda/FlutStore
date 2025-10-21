import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ColorPicker TDD - Color Components Migration', () {
    test('TDD Red: Should identify deprecated color component usage', () {
      // Red Phase: This test documents deprecated usage
      final testColor = const Color(0xFF2196F3); // Blue
      
      // These use deprecated API (will trigger warnings)
      final redValue = testColor.red; // Deprecated
      final greenValue = testColor.green; // Deprecated
      final blueValue = testColor.blue; // Deprecated
      final alphaValue = testColor.alpha; // Deprecated
      
      // Verify functionality works despite deprecated API
      expect(redValue, isA<int>());
      expect(greenValue, isA<int>());
      expect(blueValue, isA<int>());
      expect(alphaValue, isA<int>());
    });

    test('TDD Green: Should use non-deprecated component accessors', () {
      // Green Phase: This test validates the corrected implementation
      final testColor = const Color(0xFF2196F3); // Blue (33, 150, 243)
      
      // New non-deprecated syntax
      final redValue = (testColor.r * 255.0).round() & 0xff;
      final greenValue = (testColor.g * 255.0).round() & 0xff;
      final blueValue = (testColor.b * 255.0).round() & 0xff;
      final alphaValue = (testColor.a * 255.0).round() & 0xff;
      
      // Verify correct values
      expect(redValue, equals(33)); // 0x21
      expect(greenValue, equals(150)); // 0x96
      expect(blueValue, equals(243)); // 0xF3
      expect(alphaValue, equals(255)); // 0xFF (fully opaque)
    });

    test('Color component conversion validation', () {
      // Test that new syntax provides same result as deprecated
      final colors = [
        const Color(0xFFFF0000), // Red
        const Color(0xFF00FF00), // Green
        const Color(0xFF0000FF), // Blue
        const Color(0x80808080), // Semi-transparent grey
      ];
      
      for (final color in colors) {
        // Compare deprecated vs modern approach
        final legacyRed = color.red;
        final modernRed = (color.r * 255.0).round() & 0xff;
        
        final legacyGreen = color.green;
        final modernGreen = (color.g * 255.0).round() & 0xff;
        
        final legacyBlue = color.blue;
        final modernBlue = (color.b * 255.0).round() & 0xff;
        
        final legacyAlpha = color.alpha;
        final modernAlpha = (color.a * 255.0).round() & 0xff;
        
        expect(modernRed, equals(legacyRed), 
            reason: 'Modern .r should match deprecated .red for $color');
        expect(modernGreen, equals(legacyGreen), 
            reason: 'Modern .g should match deprecated .green for $color');
        expect(modernBlue, equals(legacyBlue), 
            reason: 'Modern .b should match deprecated .blue for $color');
        expect(modernAlpha, equals(legacyAlpha), 
            reason: 'Modern .a should match deprecated .alpha for $color');
      }
    });
  });
}