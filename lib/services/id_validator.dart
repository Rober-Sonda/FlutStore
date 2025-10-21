
/// Servicio de utilidad para validar IDs y evitar IDs negativos
class IdValidator {
  /// Verifica si un ID es vÃ¡lido (positivo)
  static bool isValidId(int id) {
    return id > 0;
  }

  /// Imprime informaciÃ³n de debug de manera segura
  static void logEntityInfo(String entityName, int id, String operation) {
    if (isValidId(id)) {
      // TODO: Replace with logger - print('âœ… $operation - $entityName ID: $id');
    } else {
      // TODO: Replace with logger - print('âš ï¸ $operation - $entityName ID invÃ¡lido: $id');
    }
  }

  /// Imprime informaciÃ³n de debug para entidades con nombre
  static void logEntityWithName(
    String entityName,
    int id,
    String name,
    String operation,
  ) {
    if (isValidId(id)) {
      // TODO: Replace with logger - print('âœ… $operation - $entityName ID: $id, Nombre: $name');
    } else {
      // TODO: Replace with logger - print('âš ï¸ $operation - $entityName ID invÃ¡lido: $id, Nombre: $name');
    }
  }

  /// Verifica y registra el estado de una entidad despuÃ©s de guardar
  static bool validateAndLogEntity(
    int id,
    String entityName,
    String operation,
  ) {
    final isValid = isValidId(id);
    logEntityInfo(entityName, id, operation);
    return isValid;
  }

  /// Verifica y registra el estado de una entidad con nombre despuÃ©s de guardar
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
