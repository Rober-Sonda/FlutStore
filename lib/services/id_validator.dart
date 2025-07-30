
/// Servicio de utilidad para validar IDs y evitar IDs negativos
class IdValidator {
  /// Verifica si un ID es válido (positivo)
  static bool isValidId(int id) {
    return id > 0;
  }

  /// Imprime información de debug de manera segura
  static void logEntityInfo(String entityName, int id, String operation) {
    if (isValidId(id)) {
      print('✅ $operation - $entityName ID: $id');
    } else {
      print('⚠️ $operation - $entityName ID inválido: $id');
    }
  }

  /// Imprime información de debug para entidades con nombre
  static void logEntityWithName(
    String entityName,
    int id,
    String name,
    String operation,
  ) {
    if (isValidId(id)) {
      print('✅ $operation - $entityName ID: $id, Nombre: $name');
    } else {
      print('⚠️ $operation - $entityName ID inválido: $id, Nombre: $name');
    }
  }

  /// Verifica y registra el estado de una entidad después de guardar
  static bool validateAndLogEntity(
    int id,
    String entityName,
    String operation,
  ) {
    final isValid = isValidId(id);
    logEntityInfo(entityName, id, operation);
    return isValid;
  }

  /// Verifica y registra el estado de una entidad con nombre después de guardar
  static bool validateAndLogEntityWithName(
    int id,
    String entityName,
    String name,
    String operation,
  ) {
    final isValid = isValidId(id);
    logEntityWithName(entityName, id, name, operation);
    return isValid;
  }
}
