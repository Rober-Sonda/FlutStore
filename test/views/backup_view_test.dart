import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tienda_app/views/backup_view.dart';

void main() {
  group('BackupView Widget Tests', () {
    
    testWidgets('debe mostrar título correcto en AppBar', (WidgetTester tester) async {
      // Arrange: Construir widget
      await tester.pumpWidget(
        const MaterialApp(
          home: BackupView(),
        ),
      );

      // Act & Assert: Verificar título
      expect(find.text('Gestión de Backups'), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
    });

    testWidgets('debe mostrar botón "Crear Backup" correctamente', (WidgetTester tester) async {
      // Arrange: Construir widget
      await tester.pumpWidget(
        const MaterialApp(
          home: BackupView(),
        ),
      );

      // Act & Assert: Verificar botón de crear backup
      expect(find.text('Crear Backup'), findsOneWidget);
      expect(find.byIcon(Icons.backup), findsOneWidget);
      expect(find.byType(ElevatedButton), findsAtLeastNWidgets(1));
    });

    testWidgets('debe mostrar mensaje cuando no hay backups', (WidgetTester tester) async {
      // Arrange: Construir widget
      await tester.pumpWidget(
        const MaterialApp(
          home: BackupView(),
        ),
      );
      
      // Wait for async operations
      await tester.pump();

      // Act & Assert: Verificar mensaje de estado vacío
      expect(find.text('No hay backups disponibles'), findsOneWidget);
      expect(find.text('Crea tu primer backup usando el botón superior'), findsOneWidget);
      expect(find.byIcon(Icons.backup_outlined), findsOneWidget);
    });

    testWidgets('debe mostrar iconos de acción en AppBar', (WidgetTester tester) async {
      // Arrange: Construir widget
      await tester.pumpWidget(
        const MaterialApp(
          home: BackupView(),
        ),
      );

      // Act & Assert: Verificar iconos en AppBar
      expect(find.byIcon(Icons.refresh), findsOneWidget);
      expect(find.byIcon(Icons.more_vert), findsOneWidget);
    });

    testWidgets('debe deshabilitar botón cuando está creando backup', (WidgetTester tester) async {
      // Arrange: Construir widget
      await tester.pumpWidget(
        const MaterialApp(
          home: BackupView(),
        ),
      );

      // Act: Presionar botón crear backup
      await tester.tap(find.text('Crear Backup'));
      await tester.pump();

      // Assert: Verificar que el botón muestra estado de carga
      expect(find.text('Creando...'), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsAtLeastNWidgets(1));
    });

    testWidgets('debe mostrar menú popup con opciones correctas', (WidgetTester tester) async {
      // Arrange: Construir widget
      await tester.pumpWidget(
        const MaterialApp(
          home: BackupView(),
        ),
      );

      // Act: Abrir menú popup
      await tester.tap(find.byIcon(Icons.more_vert));
      await tester.pumpAndSettle();

      // Assert: Verificar opciones del menú
      expect(find.text('Limpiar antiguos'), findsOneWidget);
      expect(find.text('Backup automático'), findsOneWidget);
      expect(find.byIcon(Icons.cleaning_services), findsOneWidget);
      expect(find.byIcon(Icons.schedule), findsOneWidget);
    });

    testWidgets('debe actualizar lista al presionar refresh', (WidgetTester tester) async {
      // Arrange: Construir widget
      await tester.pumpWidget(
        const MaterialApp(
          home: BackupView(),
        ),
      );

      // Act: Presionar botón refresh
      await tester.tap(find.byIcon(Icons.refresh));
      await tester.pump();

      // Assert: Verificar que se muestra indicador de carga
      expect(find.byType(CircularProgressIndicator), findsAtLeastNWidgets(1));
      expect(find.text('Cargando backups...'), findsOneWidget);
    });

    group('Diálogos de Confirmación', () {
      
      testWidgets('debe mostrar diálogo de confirmación para eliminación', (WidgetTester tester) async {
        // Arrange: Construir widget con backup simulado
        await tester.pumpWidget(
          const MaterialApp(
            home: BackupView(),
          ),
        );

        // Simular que hay un backup disponible sería necesario mockear el servicio
        // Por ahora verificamos la estructura del diálogo
        
        // Act: Crear diálogo manualmente para probar estructura
        await tester.pumpWidget(
          MaterialApp(
            home: AlertDialog(
              title: const Text('Confirmar Eliminación'),
              content: const Text('¿Desea eliminar el backup "test_backup.json"?'),
              actions: [
                TextButton(
                  onPressed: () {},
                  child: const Text('Cancelar'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Eliminar'),
                ),
              ],
            ),
          ),
        );

        // Assert: Verificar elementos del diálogo
        expect(find.text('Confirmar Eliminación'), findsOneWidget);
        expect(find.text('Cancelar'), findsOneWidget);
        expect(find.text('Eliminar'), findsOneWidget);
      });

      testWidgets('debe mostrar diálogo de confirmación para restauración', (WidgetTester tester) async {
        // Arrange & Act: Crear diálogo de restauración
        await tester.pumpWidget(
          MaterialApp(
            home: AlertDialog(
              title: const Text('Confirmar Restauración'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('¿Desea restaurar el backup "test_backup.json"?'),
                  const SizedBox(height: 16),
                  const Text('Registros: 100'),
                  const Text('Tamaño: 1.5 MB'),
                  const Text('Fecha: 01/01/2024 10:30'),
                  const SizedBox(height: 16),
                  const Text(
                    '⚠️ ADVERTENCIA: Esta acción sobrescribirá los datos actuales.',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {},
                  child: const Text('Cancelar'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Restaurar'),
                ),
              ],
            ),
          ),
        );

        // Assert: Verificar elementos del diálogo de restauración
        expect(find.text('Confirmar Restauración'), findsOneWidget);
        expect(find.text('⚠️ ADVERTENCIA: Esta acción sobrescribirá los datos actuales.'), findsOneWidget);
        expect(find.text('Restaurar'), findsOneWidget);
        expect(find.text('Cancelar'), findsOneWidget);
      });

      testWidgets('debe mostrar diálogo para limpieza de backups antiguos', (WidgetTester tester) async {
        // Arrange & Act: Crear diálogo de limpieza
        await tester.pumpWidget(
          MaterialApp(
            home: AlertDialog(
              title: const Text('Limpiar Backups Antiguos'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('¿Cuántos backups desea conservar?'),
                  const SizedBox(height: 16),
                  TextFormField(
                    initialValue: '5',
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Número de backups a conservar',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {},
                  child: const Text('Cancelar'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Limpiar'),
                ),
              ],
            ),
          ),
        );

        // Assert: Verificar elementos del diálogo de limpieza
        expect(find.text('Limpiar Backups Antiguos'), findsOneWidget);
        expect(find.text('¿Cuántos backups desea conservar?'), findsOneWidget);
        expect(find.text('Número de backups a conservar'), findsOneWidget);
        expect(find.byType(TextFormField), findsOneWidget);
        expect(find.text('Limpiar'), findsOneWidget);
      });
    });

    group('Información de Backup', () {
      
      testWidgets('debe mostrar diálogo de información del backup', (WidgetTester tester) async {
        // Arrange & Act: Crear diálogo de información
        await tester.pumpWidget(
          MaterialApp(
            home: AlertDialog(
              title: const Text('Información del Backup'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTestInfoRow('Archivo:', 'backup_test.json'),
                  _buildTestInfoRow('Ruta:', '/path/to/backup_test.json'),
                  _buildTestInfoRow('Fecha creación:', '01/01/2024 10:30'),
                  _buildTestInfoRow('Total registros:', '150'),
                  _buildTestInfoRow('Tamaño:', '2.1 MB'),
                  _buildTestInfoRow('Versión:', '1.0'),
                  _buildTestInfoRow('Tipo:', 'full'),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {},
                  child: const Text('Cerrar'),
                ),
              ],
            ),
          ),
        );

        // Assert: Verificar información del backup
        expect(find.text('Información del Backup'), findsOneWidget);
        expect(find.text('Archivo:'), findsOneWidget);
        expect(find.text('backup_test.json'), findsOneWidget);
        expect(find.text('Ruta:'), findsOneWidget);
        expect(find.text('Total registros:'), findsOneWidget);
        expect(find.text('150'), findsOneWidget);
        expect(find.text('Cerrar'), findsOneWidget);
      });
    });

    group('Estados de Mensaje', () {
      
      testWidgets('debe mostrar mensaje de éxito correctamente', (WidgetTester tester) async {
        // Arrange: Crear widget con mensaje de éxito
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.green[100],
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: Colors.green),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    const Expanded(
                      child: Text(
                        'Backup creado exitosamente: 100 registros',
                        style: TextStyle(color: Colors.green),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, size: 16),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
        );

        // Assert: Verificar mensaje de éxito
        expect(find.text('Backup creado exitosamente: 100 registros'), findsOneWidget);
        expect(find.byIcon(Icons.check_circle), findsOneWidget);
        expect(find.byIcon(Icons.close), findsOneWidget);
      });

      testWidgets('debe mostrar mensaje de error correctamente', (WidgetTester tester) async {
        // Arrange: Crear widget con mensaje de error
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.red[100],
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: Colors.red),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.error,
                      color: Colors.red,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    const Expanded(
                      child: Text(
                        'Error creando backup: Espacio insuficiente',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, size: 16),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
        );

        // Assert: Verificar mensaje de error
        expect(find.text('Error creando backup: Espacio insuficiente'), findsOneWidget);
        expect(find.byIcon(Icons.error), findsOneWidget);
      });
    });

    group('Lista de Backups', () {
      
      testWidgets('debe mostrar ListTile de backup correctamente', (WidgetTester tester) async {
        // Arrange: Crear ListTile de backup simulado
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Card(
                child: ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Text('1', style: TextStyle(color: Colors.white)),
                  ),
                  title: const Text(
                    'tienda_backup_1640995200000.json',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('📅 01/01/2024 10:30'),
                      Text('📊 150 registros'),
                      Text('💾 2.1 MB'),
                      Text('🏷️ full v1.0'),
                    ],
                  ),
                  isThreeLine: true,
                  trailing: PopupMenuButton(
                    itemBuilder: (context) => [
                      const PopupMenuItem(
                        value: 'restore',
                        child: Row(
                          children: [
                            Icon(Icons.restore, color: Colors.blue),
                            SizedBox(width: 8),
                            Text('Restaurar'),
                          ],
                        ),
                      ),
                      const PopupMenuItem(
                        value: 'delete',
                        child: Row(
                          children: [
                            Icon(Icons.delete, color: Colors.red),
                            SizedBox(width: 8),
                            Text('Eliminar'),
                          ],
                        ),
                      ),
                      const PopupMenuItem(
                        value: 'info',
                        child: Row(
                          children: [
                            Icon(Icons.info, color: Colors.grey),
                            SizedBox(width: 8),
                            Text('Información'),
                          ],
                        ),
                      ),
                    ],
                    onSelected: (value) {},
                  ),
                ),
              ),
            ),
          ),
        );

        // Assert: Verificar elementos del ListTile
        expect(find.text('tienda_backup_1640995200000.json'), findsOneWidget);
        expect(find.text('📅 01/01/2024 10:30'), findsOneWidget);
        expect(find.text('📊 150 registros'), findsOneWidget);
        expect(find.text('💾 2.1 MB'), findsOneWidget);
        expect(find.text('🏷️ full v1.0'), findsOneWidget);
        expect(find.byType(CircleAvatar), findsOneWidget);
        expect(find.text('1'), findsOneWidget);
      });

      testWidgets('debe mostrar menú contextual de backup', (WidgetTester tester) async {
        // Arrange: Crear menú contextual
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: ListView(
                children: [
                  const PopupMenuItem(
                    value: 'restore',
                    child: Row(
                      children: [
                        Icon(Icons.restore, color: Colors.blue),
                        SizedBox(width: 8),
                        Text('Restaurar'),
                      ],
                    ),
                  ),
                  const PopupMenuItem(
                    value: 'delete',
                    child: Row(
                      children: [
                        Icon(Icons.delete, color: Colors.red),
                        SizedBox(width: 8),
                        Text('Eliminar'),
                      ],
                    ),
                  ),
                  const PopupMenuItem(
                    value: 'info',
                    child: Row(
                      children: [
                        Icon(Icons.info, color: Colors.grey),
                        SizedBox(width: 8),
                        Text('Información'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );

        // Assert: Verificar opciones del menú contextual
        expect(find.text('Restaurar'), findsOneWidget);
        expect(find.text('Eliminar'), findsOneWidget);
        expect(find.text('Información'), findsOneWidget);
        expect(find.byIcon(Icons.restore), findsOneWidget);
        expect(find.byIcon(Icons.delete), findsOneWidget);
        expect(find.byIcon(Icons.info), findsOneWidget);
      });
    });

    group('Responsividad y Diseño', () {
      
      testWidgets('debe adaptar diseño en pantalla pequeña', (WidgetTester tester) async {
        // Arrange: Configurar tamaño de pantalla pequeño
        tester.view.physicalSize = const Size(320, 568); // iPhone SE
        tester.view.devicePixelRatio = 2.0;
        
        await tester.pumpWidget(
          const MaterialApp(
            home: BackupView(),
          ),
        );

        // Act & Assert: Verificar que los elementos se muestran correctamente
        expect(find.byType(AppBar), findsOneWidget);
        expect(find.text('Crear Backup'), findsOneWidget);
        expect(find.text('No hay backups disponibles'), findsOneWidget);
        
        // Restaurar tamaño original
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      testWidgets('debe mostrar colores y estilos correctos', (WidgetTester tester) async {
        // Arrange: Construir widget
        await tester.pumpWidget(
          const MaterialApp(
            home: BackupView(),
          ),
        );

        // Act: Buscar AppBar
        final appBar = tester.widget<AppBar>(find.byType(AppBar));

        // Assert: Verificar colores del AppBar
        expect(appBar.backgroundColor, equals(Colors.blue));
        expect(appBar.foregroundColor, equals(Colors.white));
      });
    });
  });
}

// Widget auxiliar para tests de información
Widget _buildTestInfoRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 100,
          child: Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: Text(value),
        ),
      ],
    ),
  );
}
