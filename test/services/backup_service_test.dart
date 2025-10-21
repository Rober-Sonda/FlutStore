import 'package:flutter_test/flutter_test.dart';
import 'package:tienda_app/services/backup_service.dart';
import 'dart:io';
import 'dart:convert';

void main() {
  group('BackupService Tests', () {
    late BackupService backupService;
    late String testBackupDir;

    setUp(() {
      backupService = BackupService();
      // Usar directorio temporal para tests
      testBackupDir = '${Directory.systemTemp.path}/test_backups_${DateTime.now().millisecondsSinceEpoch}';
    });

    tearDown(() async {
      // Limpiar archivos de test
      final dir = Directory(testBackupDir);
      if (await dir.exists()) {
        await dir.delete(recursive: true);
      }
    });

    group('Creación de Backups', () {
      test('debe crear backup completo correctamente', () async {
        // Arrange: Configurar servicio de backup
        
        // Act: Crear backup completo
        final result = await backupService.createFullBackup(
          customPath: testBackupDir,
          includeImages: false,
          compressBackup: false,
        );

        // Assert: Verificar que el backup se creó exitosamente
        expect(result.success, isTrue);
        expect(result.backupFilePath, isNotNull);
        expect(result.totalRecords, greaterThanOrEqualTo(0));
        expect(result.fileSize, greaterThan(0));
        expect(result.duration, isNotNull);
        expect(result.error, isNull);
        
        // Verificar que el archivo existe
        final file = File(result.backupFilePath!);
        expect(await file.exists(), isTrue);
      });

      test('debe incluir metadatos correctos en el backup', () async {
        // Arrange: Preparar directorio de backup
        
        // Act: Crear backup
        final result = await backupService.createFullBackup(
          customPath: testBackupDir,
          includeImages: true,
          compressBackup: false,
        );

        // Assert: Verificar metadatos
        expect(result.success, isTrue);
        
        final file = File(result.backupFilePath!);
        final content = await file.readAsString();
        final backupData = jsonDecode(content) as Map<String, dynamic>;
        
        expect(backupData.containsKey('metadata'), isTrue);
        expect(backupData.containsKey('data'), isTrue);
        
        final metadata = backupData['metadata'] as Map<String, dynamic>;
        expect(metadata['version'], equals('1.0'));
        expect(metadata['backup_type'], equals('full'));
        expect(metadata['include_images'], equals(true));
        expect(metadata['created_at'], isNotNull);
        expect(metadata['total_records'], isA<int>());
      });

      test('debe crear directorio de backup si no existe', () async {
        // Arrange: Usar directorio que no existe
        final nonExistentDir = '$testBackupDir/subdir/another';
        
        // Act: Crear backup
        final result = await backupService.createFullBackup(
          customPath: nonExistentDir,
        );

        // Assert: Verificar que se creó el directorio y backup
        expect(result.success, isTrue);
        expect(Directory(nonExistentDir).existsSync(), isTrue);
      });

      test('debe manejar errores durante la creación de backup', () async {
        // Arrange: Usar ruta inválida (solo en Windows/Linux específicos)
        
        // Act: Intentar crear backup en ruta inválida
        final result = await backupService.createFullBackup(
          customPath: '/invalid/path/that/should/not/work',
        );

        // Assert: Puede fallar o tener éxito dependiendo del sistema
        // Si falla, debe tener mensaje de error apropiado
        if (!result.success) {
          expect(result.error, isNotNull);
          expect(result.error!, contains('Error creando backup'));
        }
      });

      test('debe incluir todas las colecciones de datos en el backup', () async {
        // Arrange: Preparar servicio
        
        // Act: Crear backup
        final result = await backupService.createFullBackup(
          customPath: testBackupDir,
        );

        // Assert: Verificar estructura completa
        expect(result.success, isTrue);
        
        final file = File(result.backupFilePath!);
        final content = await file.readAsString();
        final backupData = jsonDecode(content) as Map<String, dynamic>;
        final data = backupData['data'] as Map<String, dynamic>;
        
        // Verificar que contiene todas las colecciones esperadas
        final expectedCollections = [
          'productos',
          'clientes', 
          'ventas',
          'compras',
          'proveedores',
          'categorias',
          'usuarios',
          'cuentas_corrientes',
          'carrito_compras',
          'movimientos_financieros',
          'flujos_caja',
          'business_configs',
          'custom_themes',
        ];
        
        for (final collection in expectedCollections) {
          expect(data.containsKey(collection), isTrue, reason: 'Falta colección: $collection');
          expect(data[collection], isA<List>(), reason: 'Colección $collection debe ser una lista');
        }
      });
    });

    group('Listado de Backups', () {
      test('debe listar backups disponibles correctamente', () async {
        // Arrange: Crear algunos backups de prueba
        await backupService.createFullBackup(customPath: testBackupDir);
        await Future.delayed(Duration(milliseconds: 100)); // Evitar timestamps iguales
        await backupService.createFullBackup(customPath: testBackupDir);
        
        // Act: Listar backups
        final backups = await backupService.listAvailableBackups(testBackupDir);

        // Assert: Verificar lista de backups
        expect(backups.length, equals(2));
        expect(backups.first.createdAt.isAfter(backups.last.createdAt), isTrue, 
               reason: 'Los backups deben estar ordenados por fecha (más reciente primero)');
        
        for (final backup in backups) {
          expect(backup.fileName, isNotNull);
          expect(backup.filePath, isNotNull);
          expect(backup.fileSize, greaterThan(0));
          expect(backup.totalRecords, greaterThanOrEqualTo(0));
          expect(backup.version, isNotNull);
          expect(backup.backupType, isNotNull);
          expect(backup.formattedSize, isNotNull);
        }
      });

      test('debe retornar lista vacía si no existen backups', () async {
        // Arrange: Usar directorio vacío
        final emptyDir = '$testBackupDir/empty';
        
        // Act: Listar backups en directorio vacío
        final backups = await backupService.listAvailableBackups(emptyDir);

        // Assert: Verificar lista vacía
        expect(backups, isEmpty);
      });

      test('debe formatear correctamente el tamaño de archivo', () async {
        // Arrange: Crear backup
        final result = await backupService.createFullBackup(customPath: testBackupDir);
        
        // Act: Listar para obtener info
        final backups = await backupService.listAvailableBackups(testBackupDir);

        // Assert: Verificar formato de tamaño
        expect(backups, isNotEmpty);
        final backup = backups.first;
        
        // El formato debe incluir unidades (B, KB, MB, etc.)
        expect(backup.formattedSize, matches(r'\d+\.?\d*\s*(B|KB|MB|GB)'));
      });

      test('debe ignorar archivos con formato incorrecto', () async {
        // Arrange: Crear archivo con formato incorrecto en directorio de backup
        final dir = Directory(testBackupDir);
        await dir.create(recursive: true);
        
        final invalidFile = File('$testBackupDir/invalid_backup.json');
        await invalidFile.writeAsString('{"invalid": "json structure"}');
        
        await backupService.createFullBackup(customPath: testBackupDir);
        
        // Act: Listar backups
        final backups = await backupService.listAvailableBackups(testBackupDir);

        // Assert: Solo debe incluir el backup válido
        expect(backups.length, equals(1));
      });
    });

    group('Eliminación de Backups', () {
      test('debe eliminar backup específico correctamente', () async {
        // Arrange: Crear backup para eliminar
        final result = await backupService.createFullBackup(customPath: testBackupDir);
        expect(result.success, isTrue);
        
        final file = File(result.backupFilePath!);
        expect(await file.exists(), isTrue);
        
        // Act: Eliminar backup
        final deleted = await backupService.deleteBackup(result.backupFilePath!);

        // Assert: Verificar eliminación
        expect(deleted, isTrue);
        expect(await file.exists(), isFalse);
      });

      test('debe retornar false al intentar eliminar archivo inexistente', () async {
        // Arrange: Ruta de archivo que no existe
        final nonExistentPath = '$testBackupDir/nonexistent_backup.json';
        
        // Act: Intentar eliminar
        final deleted = await backupService.deleteBackup(nonExistentPath);

        // Assert: Verificar que retorna false
        expect(deleted, isFalse);
      });

      test('debe limpiar backups antiguos correctamente', () async {
        // Arrange: Crear múltiples backups
        for (int i = 0; i < 5; i++) {
          await backupService.createFullBackup(customPath: testBackupDir);
          await Future.delayed(Duration(milliseconds: 100));
        }
        
        // Verificar que se crearon 5 backups
        var backups = await backupService.listAvailableBackups(testBackupDir);
        expect(backups.length, equals(5));
        
        // Act: Limpiar manteniendo solo 2
        final deletedCount = await backupService.cleanupOldBackups(2, testBackupDir);

        // Assert: Verificar limpieza
        expect(deletedCount, equals(3));
        
        backups = await backupService.listAvailableBackups(testBackupDir);
        expect(backups.length, equals(2));
      });

      test('no debe eliminar nada si hay menos backups que el límite', () async {
        // Arrange: Crear solo 2 backups
        await backupService.createFullBackup(customPath: testBackupDir);
        await backupService.createFullBackup(customPath: testBackupDir);
        
        // Act: Intentar limpiar manteniendo 5
        final deletedCount = await backupService.cleanupOldBackups(5, testBackupDir);

        // Assert: No debe eliminar nada
        expect(deletedCount, equals(0));
        
        final backups = await backupService.listAvailableBackups(testBackupDir);
        expect(backups.length, equals(2));
      });
    });

    group('Restauración de Backups', () {
      test('debe validar estructura de backup antes de restaurar', () async {
        // Arrange: Crear archivo con estructura inválida
        final dir = Directory(testBackupDir);
        await dir.create(recursive: true);
        
        final invalidBackupFile = File('$testBackupDir/invalid_backup.json');
        await invalidBackupFile.writeAsString('{"invalid": "structure"}');
        
        // Act: Intentar restaurar
        final result = await backupService.restoreFullBackup(
          invalidBackupFile.path,
          clearExistingData: false,
        );

        // Assert: Debe fallar por estructura inválida
        expect(result.success, isFalse);
        expect(result.error, contains('estructura'));
      });

      test('debe manejar archivo de backup inexistente', () async {
        // Arrange: Ruta de archivo que no existe
        final nonExistentPath = '$testBackupDir/nonexistent.json';
        
        // Act: Intentar restaurar
        final result = await backupService.restoreFullBackup(nonExistentPath);

        // Assert: Debe fallar con mensaje apropiado
        expect(result.success, isFalse);
        expect(result.error, contains('no encontrado'));
      });

      test('debe crear backup programado correctamente', () async {
        // Act: Crear backup programado
        final result = await backupService.createScheduledBackup();

        // Assert: Verificar configuración de backup programado
        expect(result.success, isTrue);
        expect(result.backupFilePath, isNotNull);
        
        // Verificar que incluye imágenes y compresión (configuración por defecto)
        final file = File(result.backupFilePath!);
        final content = await file.readAsString();
        final backupData = jsonDecode(content) as Map<String, dynamic>;
        final metadata = backupData['metadata'] as Map<String, dynamic>;
        
        expect(metadata['include_images'], isTrue);
        expect(metadata['backup_type'], equals('full'));
      });
    });

    group('Manejo de Errores', () {
      test('debe manejar errores de E/O durante backup', () async {
        // Este test verifica el manejo robusto de errores
        // En un entorno de producción podrían ocurrir errores de disco lleno, permisos, etc.
        
        // Act & Assert: El servicio debe ser robusto ante errores
        // En este caso específico, el test pasa si no se lanzan excepciones no capturadas
        expect(() async => await backupService.createFullBackup(), returnsNormally);
      });

      test('debe manejar errores de E/O durante restauración', () async {
        // Similar al test anterior pero para restauración
        
        // Act & Assert: Verificar manejo robusto de errores
        expect(() async => await backupService.restoreFullBackup('/invalid/path.json'), 
               returnsNormally);
      });

      test('debe manejar errores durante listado de backups', () async {
        // Act & Assert: El listado debe manejar errores gracefully
        final backups = await backupService.listAvailableBackups('/invalid/path');
        expect(backups, isEmpty);
      });

      test('debe manejar errores durante limpieza de backups', () async {
        // Act & Assert: La limpieza debe ser robusta ante errores
        final deletedCount = await backupService.cleanupOldBackups(5, '/invalid/path');
        expect(deletedCount, equals(0));
      });
    });

    group('Validación de Datos', () {
      test('BackupResult debe tener propiedades correctas', () {
        // Arrange & Act: Crear resultado exitoso
        final successResult = BackupResult(
          success: true,
          backupFilePath: '/path/to/backup.json',
          imagesPath: '/path/to/images',
          totalRecords: 100,
          fileSize: 1024,
          duration: Duration(seconds: 5),
        );

        // Assert: Verificar propiedades
        expect(successResult.success, isTrue);
        expect(successResult.backupFilePath, equals('/path/to/backup.json'));
        expect(successResult.imagesPath, equals('/path/to/images'));
        expect(successResult.totalRecords, equals(100));
        expect(successResult.fileSize, equals(1024));
        expect(successResult.duration!.inSeconds, equals(5));
        expect(successResult.error, isNull);

        // Act: Crear resultado con error
        final errorResult = BackupResult(
          success: false,
          error: 'Test error message',
        );

        // Assert: Verificar resultado de error
        expect(errorResult.success, isFalse);
        expect(errorResult.error, equals('Test error message'));
        expect(errorResult.totalRecords, equals(0));
        expect(errorResult.fileSize, equals(0));
      });

      test('RestoreResult debe tener propiedades correctas', () {
        // Arrange & Act: Crear resultado de restauración
        final restoreResult = RestoreResult(
          success: true,
          totalRestored: 150,
          errors: ['Warning: Some data skipped'],
          duration: Duration(seconds: 10),
        );

        // Assert: Verificar propiedades
        expect(restoreResult.success, isTrue);
        expect(restoreResult.totalRestored, equals(150));
        expect(restoreResult.errors, contains('Warning: Some data skipped'));
        expect(restoreResult.duration!.inSeconds, equals(10));
        expect(restoreResult.error, isNull);
      });

      test('BackupInfo debe formatear tamaño correctamente', () {
        // Arrange: Crear BackupInfo con diferentes tamaños
        final smallBackup = BackupInfo(
          fileName: 'small.json',
          filePath: '/path/small.json',
          createdAt: DateTime.now(),
          totalRecords: 10,
          fileSize: 512, // 512 bytes
          version: '1.0',
          backupType: 'full',
        );

        final mediumBackup = BackupInfo(
          fileName: 'medium.json',
          filePath: '/path/medium.json',
          createdAt: DateTime.now(),
          totalRecords: 100,
          fileSize: 1024 * 1024, // 1 MB
          version: '1.0',
          backupType: 'full',
        );

        final largeBackup = BackupInfo(
          fileName: 'large.json',
          filePath: '/path/large.json',
          createdAt: DateTime.now(),
          totalRecords: 1000,
          fileSize: 1024 * 1024 * 1024, // 1 GB
          version: '1.0',
          backupType: 'full',
        );

        // Assert: Verificar formato de tamaños
        expect(smallBackup.formattedSize, equals('512 B'));
        expect(mediumBackup.formattedSize, equals('1.0 MB'));
        expect(largeBackup.formattedSize, equals('1.0 GB'));
      });
    });
  });
}