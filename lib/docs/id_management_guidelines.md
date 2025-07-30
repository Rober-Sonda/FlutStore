# Guía de Manejo de IDs - Prevención de IDs Negativos

## 🎯 Objetivo
Asegurar que todos los IDs en la aplicación sean positivos y válidos, evitando IDs negativos que pueden causar problemas en la base de datos.

## 📋 Reglas Principales

### 1. **Nunca Imprimir IDs Antes de Guardar**
```dart
// ❌ INCORRECTO
print('ID: ${entity.id}'); // ID puede ser negativo
await isar.collection.put(entity);

// ✅ CORRECTO
await isar.collection.put(entity);
print('ID: ${entity.id}'); // ID será positivo después de guardar
```

### 2. **Usar IdValidator para Logging**
```dart
import 'package:tienda_app/services/id_validator.dart';

// Para entidades con nombre
IdValidator.validateAndLogEntityWithName(
  entity.id, 
  'Entidad', 
  entity.name, 
  'Operación'
);

// Para entidades sin nombre
IdValidator.validateAndLogEntity(
  entity.id, 
  'Entidad', 
  'Operación'
);
```

### 3. **Validar IDs Después de Operaciones**
```dart
final id = await isar.collection.put(entity);
entity.id = id;

// Validar que el ID sea válido
if (!IdValidator.isValidId(id)) {
  throw Exception('ID inválido generado');
}
```

## 🔧 Servicios Actualizados

### ✅ ProductService
- ✅ Usa `IdValidator` para logging
- ✅ Valida IDs después de guardar productos
- ✅ Valida IDs después de guardar atributos

### ✅ AuthService
- ✅ Usa `IdValidator` para logging de usuarios
- ✅ Usa `IdValidator` para logging de roles
- ✅ Valida IDs después de crear administradores

### ✅ ThemeService
- ✅ Usa `IdValidator` para logging de temas
- ✅ Valida IDs después de guardar temas
- ✅ Retorna `false` si el ID es inválido

## 📝 Checklist para Nuevos Servicios

- [ ] Importar `IdValidator`
- [ ] No imprimir IDs antes de guardar
- [ ] Usar `IdValidator` para logging después de guardar
- [ ] Validar IDs después de operaciones de escritura
- [ ] Manejar casos donde el ID sea inválido

## 🚨 Casos de Uso Comunes

### Crear Nueva Entidad
```dart
Future<bool> createEntity(Entity entity) async {
  try {
    final isar = await db;
    final id = await isar.entities.put(entity);
    entity.id = id;
    
    // Validar y registrar
    return IdValidator.validateAndLogEntityWithName(
      id, 'Entidad', entity.name, 'Entidad creada'
    );
  } catch (e) {
    print('Error: $e');
    return false;
  }
}
```

### Actualizar Entidad Existente
```dart
Future<bool> updateEntity(Entity entity) async {
  try {
    final isar = await db;
    final id = await isar.entities.put(entity);
    
    // Validar y registrar
    return IdValidator.validateAndLogEntityWithName(
      id, 'Entidad', entity.name, 'Entidad actualizada'
    );
  } catch (e) {
    print('Error: $e');
    return false;
  }
}
```

## 🔍 Verificación

Para verificar que no hay IDs negativos:

1. **Buscar prints de IDs**:
   ```bash
   grep -r "print.*ID" lib/
   ```

2. **Verificar que usen IdValidator**:
   ```bash
   grep -r "IdValidator" lib/
   ```

3. **Revisar logs en tiempo de ejecución**:
   - Los logs deben mostrar "✅" para IDs válidos
   - Los logs deben mostrar "⚠️" para IDs inválidos

## 📊 Métricas de Éxito

- ✅ 0 IDs negativos en logs
- ✅ Todos los servicios usan `IdValidator`
- ✅ Validación consistente en toda la aplicación
- ✅ Manejo de errores apropiado para IDs inválidos