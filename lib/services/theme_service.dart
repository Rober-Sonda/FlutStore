import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:tienda_app/models/app_theme.dart';
import 'package:tienda_app/models/custom_theme.dart';
import 'package:tienda_app/services/auth_service.dart';
import 'package:tienda_app/services/id_validator.dart';

final themeServiceProvider = Provider<ThemeService>((ref) => ThemeService());

final currentThemeProvider = StateProvider<AppTheme>(
  (ref) => AppTheme.darkTheme,
);

final customThemesProvider = FutureProvider<List<CustomTheme>>((ref) async {
  final themeService = ref.read(themeServiceProvider);
  final currentUser = ref.read(currentUserProvider);
  if (currentUser == null) return [];
  return await themeService.getCustomThemes(currentUser.username);
});

class ThemeService {
  // Obtener temas personalizados de un usuario
  Future<List<CustomTheme>> getCustomThemes(String userId) async {
    try {
      final isar = Isar.getInstance();
      if (isar == null) return [];

      final themes =
          await isar.customThemes
              .filter()
              .userIdEqualTo(userId)
              .sortByCreatedAt()
              .findAll();
      return themes;
    } catch (e) {
      print('Error obteniendo temas personalizados: $e');
      return [];
    }
  }

  // Guardar un tema personalizado
  Future<bool> saveCustomTheme(CustomTheme theme) async {
    try {
      print('🔍 Intentando guardar tema: ${theme.name}');
      final isar = Isar.getInstance();
      if (isar == null) {
        print('❌ Isar es null');
        return false;
      }

      print('🔍 Isar obtenido correctamente');
      await isar.writeTxn(() async {
        print('🔍 Iniciando transacción de escritura');
        await isar.customThemes.put(theme);
        print('🔍 Tema guardado en la transacción');
      });
      print('🔍 Transacción completada');

      // Verificar que el ID sea válido después del guardado
      _logThemeInfo(theme, 'Tema guardado');

      return IdValidator.isValidId(theme.id);
    } catch (e) {
      print('❌ Error guardando tema personalizado: $e');
      return false;
    }
  }

  // Actualizar un tema personalizado
  Future<bool> updateCustomTheme(CustomTheme theme) async {
    try {
      print('🔍 Actualizando tema: ${theme.name}');
      final isar = Isar.getInstance();
      if (isar == null) return false;

      await isar.writeTxn(() async {
        await isar.customThemes.put(theme);
      });

      _logThemeInfo(theme, 'Tema actualizado');
      return IdValidator.isValidId(theme.id);
    } catch (e) {
      print('Error actualizando tema personalizado: $e');
      return false;
    }
  }

  // Eliminar un tema personalizado
  Future<bool> deleteCustomTheme(int themeId) async {
    try {
      final isar = Isar.getInstance();
      if (isar == null) return false;

      await isar.writeTxn(() async {
        await isar.customThemes.delete(themeId);
      });
      return true;
    } catch (e) {
      print('Error eliminando tema personalizado: $e');
      return false;
    }
  }

  // Obtener un tema personalizado por ID
  Future<CustomTheme?> getCustomThemeById(int themeId) async {
    try {
      final isar = Isar.getInstance();
      if (isar == null) return null;

      final theme = await isar.customThemes.get(themeId);
      return theme;
    } catch (e) {
      print('Error obteniendo tema personalizado: $e');
      return null;
    }
  }

  // Crear un tema personalizado desde colores
  CustomTheme createCustomTheme({
    required String userId,
    required String name,
    required bool isDark,
    required Color primaryColor,
    required Color secondaryColor,
    required Color accentColor,
    required Color backgroundColor,
    required Color surfaceColor,
    required Color textColor,
    required Color textSecondaryColor,
    required Color errorColor,
    required Color successColor,
    required Color warningColor,
    required Color infoColor,
  }) {
    return CustomTheme.fromColors(
      userId: userId,
      name: name,
      isDark: isDark,
      primaryColor: primaryColor,
      secondaryColor: secondaryColor,
      accentColor: accentColor,
      backgroundColor: backgroundColor,
      surfaceColor: surfaceColor,
      textColor: textColor,
      textSecondaryColor: textSecondaryColor,
      errorColor: errorColor,
      successColor: successColor,
      warningColor: warningColor,
      infoColor: infoColor,
    );
  }

  // Obtener todos los temas disponibles (incluyendo personalizados)
  Future<List<AppTheme>> getAllAvailableThemes(String userId) async {
    final builtInThemes = AppTheme.availableThemes;
    final customThemes = await getCustomThemes(userId);

    final customAppThemes = customThemes.map((ct) => ct.toAppTheme()).toList();

    return [...builtInThemes, ...customAppThemes];
  }

  // Validar si un nombre de tema ya existe para el usuario
  Future<bool> isThemeNameTaken(
    String userId,
    String name, {
    int? excludeId,
  }) async {
    try {
      final isar = Isar.getInstance();
      if (isar == null) return false;

      final existingTheme =
          await isar.customThemes
              .filter()
              .userIdEqualTo(userId)
              .and()
              .nameEqualTo(name)
              .findFirst();

      if (existingTheme == null) return false;
      if (excludeId != null && existingTheme.id == excludeId) return false;
      return true;
    } catch (e) {
      print('Error verificando nombre de tema: $e');
      return false;
    }
  }

  // Obtener tema actual del usuario
  Future<AppTheme> getCurrentUserTheme(String userId) async {
    // Por ahora retornamos el tema oscuro por defecto
    // En el futuro se puede implementar persistencia del tema seleccionado
    return AppTheme.darkTheme;
  }

  // Establecer tema actual del usuario
  Future<void> setCurrentUserTheme(String userId, AppTheme theme) async {
    // Por ahora no implementamos persistencia del tema seleccionado
    // En el futuro se puede guardar en SharedPreferences o Isar
  }

  // Método de prueba para verificar que todo funciona
  Future<bool> testCreateTheme() async {
    try {
      print('🧪 Iniciando prueba de creación de tema');

      final testTheme = createCustomTheme(
        userId: 'test_user',
        name: 'Tema de Prueba',
        isDark: true,
        primaryColor: Colors.blue,
        secondaryColor: Colors.blueAccent,
        accentColor: Colors.blue.shade300,
        backgroundColor: Colors.grey[900]!,
        surfaceColor: Colors.grey[800]!,
        textColor: Colors.white,
        textSecondaryColor: Colors.grey[400]!,
        errorColor: Colors.red,
        successColor: Colors.green,
        warningColor: Colors.orange,
        infoColor: Colors.blue,
      );

      print('🧪 Tema de prueba creado: ${testTheme.name}');

      final success = await saveCustomTheme(testTheme);
      print('🧪 Resultado de la prueba: $success');

      return success;
    } catch (e) {
      print('❌ Error en prueba: $e');
      return false;
    }
  }

  // Método de utilidad para imprimir información de debug de manera segura
  void _logThemeInfo(CustomTheme theme, String operation) {
    IdValidator.logEntityWithName('Tema', theme.id, theme.name, operation);
  }
}
