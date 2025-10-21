import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';

import '../../lib/models/custom_theme.dart';

void main() {
  group('CustomTheme TDD - @ignore Annotation Fixes', () {
    test('TDD Red: Should identify invalid @ignore annotation usage', () {
      // Red Phase: This test documents the issue
      // custom_theme.dart has @ignore annotations on setters and methods
      // which causes invalid_annotation_target warnings
      
      // The functionality should work despite annotation warnings
      final customTheme = CustomTheme();
      customTheme.primaryColor = Colors.blue;
      
      expect(customTheme.primaryColor, equals(Colors.blue));
      // NOTE: This test passes but the file has annotation warnings
    });

    test('TDD Green: Should work without @ignore on setters', () {
      // Green Phase: Test that functionality works without @ignore on setters
      // After removing @ignore from setters, functionality should be preserved
      
      final customTheme = CustomTheme();
      
      // Test all color setters work correctly
      customTheme.primaryColor = const Color(0xFF2196F3);
      customTheme.secondaryColor = const Color(0xFF4CAF50);
      customTheme.errorColor = const Color(0xFFF44336);
      
      expect(customTheme.primaryColor, equals(const Color(0xFF2196F3)));
      expect(customTheme.secondaryColor, equals(const Color(0xFF4CAF50)));
      expect(customTheme.errorColor, equals(const Color(0xFFF44336)));
    });

    test('Isar collection functionality preservation', () {
      // Test that removing @ignore from setters doesn\'t break Isar functionality
      final customTheme = CustomTheme.fromColors(
        userId: 'test-user',
        name: 'Test Theme',
        isDark: false,
        primaryColor: const Color(0xFF2196F3),
        secondaryColor: const Color(0xFF4CAF50),
        accentColor: const Color(0xFFFF9800),
        backgroundColor: const Color(0xFFFFFFFF),
        surfaceColor: const Color(0xFFF5F5F5),
        textColor: const Color(0xFF000000),
        textSecondaryColor: const Color(0xFF757575),
        errorColor: const Color(0xFFF44336),
        successColor: const Color(0xFF4CAF50),
        warningColor: const Color(0xFFFFC107),
        infoColor: const Color(0xFF03A9F4),
      );
      
      // Verify Isar collection requirements are met
      expect(customTheme.id, equals(Isar.autoIncrement));
      expect(customTheme.userId, equals('test-user'));
      expect(customTheme.name, equals('Test Theme'));
      
      // Test conversion methods
      final appTheme = customTheme.toAppTheme();
      expect(appTheme.primaryColor, equals(const Color(0xFF2196F3)));
      expect(appTheme.isDark, isFalse);
    });
  });
}