import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  ThemeData get themeData => _isDarkMode ? darkTheme : lightTheme;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  // Tema claro elegante
  static final lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primarySwatch: Colors.grey,
    scaffoldBackgroundColor: Colors.white,
    cardColor: Colors.white,
    dividerColor: Colors.grey.shade300,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black87),
      bodyMedium: TextStyle(color: Colors.black87),
      titleLarge: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
    ),
  );

  // Tema oscuro elegante
  static final darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primarySwatch: Colors.grey,
    scaffoldBackgroundColor: Colors.grey.shade900,
    cardColor: Colors.grey.shade800,
    dividerColor: Colors.grey.shade600,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white70),
      bodyMedium: TextStyle(color: Colors.white70),
      titleLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
    ),
  );

  // Colores adaptativos
  Color getBackgroundColor(BuildContext context) {
    return _isDarkMode ? Colors.grey.shade900 : Colors.white;
  }

  Color getCardColor(BuildContext context) {
    return _isDarkMode ? Colors.grey.shade800 : Colors.white;
  }

  Color getTextColor(BuildContext context) {
    return _isDarkMode ? Colors.white70 : Colors.black87;
  }

  Color getTitleColor(BuildContext context) {
    return _isDarkMode ? Colors.white : Colors.black87;
  }

  Color getBorderColor(BuildContext context) {
    return _isDarkMode ? Colors.grey.shade600 : Colors.grey.shade300;
  }

  Color getFieldFillColor(BuildContext context) {
    return _isDarkMode ? Colors.grey.shade700 : Colors.grey.shade50;
  }
}
