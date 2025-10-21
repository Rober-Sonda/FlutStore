import 'package:flutter/material.dart';
import '../services/backup_service.dart';
import 'dart:io';

class BackupView extends StatefulWidget {
  const BackupView({Key? key}) : super(key: key);

  @override
  State<BackupView> createState() => _BackupViewState();
}

class _BackupViewState extends State<BackupView> {
  final BackupService _backupService = BackupService();
  List<BackupInfo> _backups = [];
  bool _isLoading = false;
  bool _isCreatingBackup = false;
  String? _statusMessage;
  
  @override
  void initState() {
    super.initState();
    _loadBackups();
  }

  Future<void> _loadBackups() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final backups = await _backupService.listAvailableBackups();
      setState(() {
        _backups = backups;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _statusMessage = 'Error cargando backups: $e';
      });
    }
  }

  Future<void> _createBackup() async {
    setState(() {
      _isCreatingBackup = true;
      _statusMessage = null;
    });

    try {
      final result = await _backupService.createFullBackup(
        includeImages: true,
        compressBackup: true,
      );

      setState(() {
        _isCreatingBackup = false;
        if (result.success) {
          _statusMessage = 'Backup creado exitosamente: ${result.totalRecords} registros';
        } else {
          _statusMessage = 'Error creando backup: ${result.error}';
        }
      });

      if (result.success) {
        await _loadBackups();
      }
    } catch (e) {
      setState(() {
        _isCreatingBackup = false;
        _statusMessage = 'Error creando backup: $e';
      });
    }
  }

  Future<void> _restoreBackup(BackupInfo backup) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirmar RestauraciÃ³n'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Â¿Desea restaurar el backup "${backup.fileName}"?'),
            const SizedBox(height: 16),
            Text('Registros: ${backup.totalRecords}'),
            Text('TamaÃ±o: ${backup.formattedSize}'),
            Text('Fecha: ${_formatDateTime(backup.createdAt)}'),
            const SizedBox(height: 16),
            const Text(
              'âš ï¸ ADVERTENCIA: Esta acciÃ³n sobrescribirÃ¡ los datos actuales.',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: const Text('Restaurar'),
          ),
        ],
      ),
    );

    if (confirmed != true) return;

    setState(() {
      _isLoading = true;
      _statusMessage = 'Restaurando backup...';
    });

    try {
      final result = await _backupService.restoreFullBackup(
        backup.filePath,
        clearExistingData: true,
        restoreImages: true,
      );

      setState(() {
        _isLoading = false;
        if (result.success) {
          _statusMessage = 'Backup restaurado exitosamente: ${result.totalRestored} registros';
        } else {
          _statusMessage = 'Error restaurando backup: ${result.error}';
          if (result.errors.isNotEmpty) {
            _statusMessage = (_statusMessage ?? '') + '\nErrores: ${result.errors.join(', ')}';
          }
        }
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _statusMessage = 'Error restaurando backup: $e';
      });
    }
  }

  Future<void> _deleteBackup(BackupInfo backup) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirmar EliminaciÃ³n'),
        content: Text('Â¿Desea eliminar el backup "${backup.fileName}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: const Text('Eliminar'),
          ),
        ],
      ),
    );

    if (confirmed != true) return;

    try {
      final deleted = await _backupService.deleteBackup(backup.filePath);
      
      if (deleted) {
        setState(() {
          _statusMessage = 'Backup eliminado exitosamente';
        });
        await _loadBackups();
      } else {
        setState(() {
          _statusMessage = 'Error eliminando backup';
        });
      }
    } catch (e) {
      setState(() {
        _statusMessage = 'Error eliminando backup: $e';
      });
    }
  }

  Future<void> _cleanupOldBackups() async {
    final keepCount = await showDialog<int>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Limpiar Backups Antiguos'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Â¿CuÃ¡ntos backups desea conservar?'),
            const SizedBox(height: 16),
            TextFormField(
              initialValue: '5',
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'NÃºmero de backups a conservar',
                border: OutlineInputBorder(),
              ),
              onFieldSubmitted: (value) {
                final count = int.tryParse(value);
                if (count != null && count > 0) {
                  Navigator.of(context).pop(count);
                }
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(5); // Valor por defecto
            },
            child: const Text('Limpiar'),
          ),
        ],
      ),
    );

    if (keepCount == null) return;

    try {
      final deletedCount = await _backupService.cleanupOldBackups(keepCount);
      
      setState(() {
        _statusMessage = 'Se eliminaron $deletedCount backups antiguos';
      });
      
      await _loadBackups();
    } catch (e) {
      setState(() {
        _statusMessage = 'Error limpiando backups: $e';
      });
    }
  }

  String _formatDateTime(DateTime dateTime) {
    return '${dateTime.day.toString().padLeft(2, '0')}/'
           '${dateTime.month.toString().padLeft(2, '0')}/'
           '${dateTime.year} '
           '${dateTime.hour.toString().padLeft(2, '0')}:'
           '${dateTime.minute.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GestiÃ³n de Backups'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _isLoading ? null : _loadBackups,
            tooltip: 'Actualizar lista',
          ),
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'cleanup',
                child: const Row(
                  children: [
                    Icon(Icons.cleaning_services),
                    SizedBox(width: 8),
                    Text('Limpiar antiguos'),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 'auto_backup',
                child: const Row(
                  children: [
                    Icon(Icons.schedule),
                    SizedBox(width: 8),
                    Text('Backup automÃ¡tico'),
                  ],
                ),
              ),
            ],
            onSelected: (value) {
              switch (value) {
                case 'cleanup':
                  _cleanupOldBackups();
                  break;
                case 'auto_backup':
                  _createScheduledBackup();
                  break;
              }
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Panel de estado y acciones
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              border: Border(
                bottom: BorderSide(color: Colors.grey[300]!),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: _isCreatingBackup ? null : _createBackup,
                        icon: _isCreatingBackup
                            ? const SizedBox(
                                width: 16,
                                height: 16,
                                child: CircularProgressIndicator(strokeWidth: 2),
                              )
                            : const Icon(Icons.backup),
                        label: Text(_isCreatingBackup ? 'Creando...' : 'Crear Backup'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                if (_statusMessage != null) ...[
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: _statusMessage!.contains('Error') 
                          ? Colors.red[100] 
                          : Colors.green[100],
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: _statusMessage!.contains('Error') 
                            ? Colors.red 
                            : Colors.green,
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          _statusMessage!.contains('Error') 
                              ? Icons.error 
                              : Icons.check_circle,
                          color: _statusMessage!.contains('Error') 
                              ? Colors.red 
                              : Colors.green,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            _statusMessage!,
                            style: TextStyle(
                              color: _statusMessage!.contains('Error') 
                                  ? Colors.red[800] 
                                  : Colors.green[800],
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close, size: 16),
                          onPressed: () {
                            setState(() {
                              _statusMessage = null;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
          
          // Lista de backups
          Expanded(
            child: _isLoading
                ? const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 16),
                        Text('Cargando backups...'),
                      ],
                    ),
                  )
                : _backups.isEmpty
                    ? const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.backup_outlined,
                              size: 64,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 16),
                            Text(
                              'No hay backups disponibles',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Crea tu primer backup usando el botÃ³n superior',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        itemCount: _backups.length,
                        itemBuilder: (context, index) {
                          final backup = _backups[index];
                          return Card(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 4,
                            ),
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.blue,
                                child: Text(
                                  '${index + 1}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              title: Text(
                                backup.fileName,
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('ðŸ“… ${_formatDateTime(backup.createdAt)}'),
                                  Text('ðŸ“Š ${backup.totalRecords} registros'),
                                  Text('ðŸ’¾ ${backup.formattedSize}'),
                                  Text('ðŸ·ï¸ ${backup.backupType} v${backup.version}'),
                                ],
                              ),
                              isThreeLine: true,
                              trailing: PopupMenuButton(
                                itemBuilder: (context) => [
                                  PopupMenuItem(
                                    value: 'restore',
                                    child: const Row(
                                      children: [
                                        Icon(Icons.restore, color: Colors.blue),
                                        SizedBox(width: 8),
                                        Text('Restaurar'),
                                      ],
                                    ),
                                  ),
                                  PopupMenuItem(
                                    value: 'delete',
                                    child: const Row(
                                      children: [
                                        Icon(Icons.delete, color: Colors.red),
                                        SizedBox(width: 8),
                                        Text('Eliminar'),
                                      ],
                                    ),
                                  ),
                                  PopupMenuItem(
                                    value: 'info',
                                    child: const Row(
                                      children: [
                                        Icon(Icons.info, color: Colors.grey),
                                        SizedBox(width: 8),
                                        Text('InformaciÃ³n'),
                                      ],
                                    ),
                                  ),
                                ],
                                onSelected: (value) {
                                  switch (value) {
                                    case 'restore':
                                      _restoreBackup(backup);
                                      break;
                                    case 'delete':
                                      _deleteBackup(backup);
                                      break;
                                    case 'info':
                                      _showBackupInfo(backup);
                                      break;
                                  }
                                },
                              ),
                            ),
                          );
                        },
                      ),
          ),
        ],
      ),
    );
  }

  Future<void> _createScheduledBackup() async {
    setState(() {
      _isCreatingBackup = true;
      _statusMessage = 'Creando backup programado...';
    });

    try {
      final result = await _backupService.createScheduledBackup();
      
      setState(() {
        _isCreatingBackup = false;
        if (result.success) {
          _statusMessage = 'Backup programado creado exitosamente';
        } else {
          _statusMessage = 'Error creando backup programado: ${result.error}';
        }
      });

      if (result.success) {
        await _loadBackups();
      }
    } catch (e) {
      setState(() {
        _isCreatingBackup = false;
        _statusMessage = 'Error creando backup programado: $e';
      });
    }
  }

  void _showBackupInfo(BackupInfo backup) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('InformaciÃ³n del Backup'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoRow('Archivo:', backup.fileName),
            _buildInfoRow('Ruta:', backup.filePath),
            _buildInfoRow('Fecha creaciÃ³n:', _formatDateTime(backup.createdAt)),
            _buildInfoRow('Total registros:', backup.totalRecords.toString()),
            _buildInfoRow('TamaÃ±o:', backup.formattedSize),
            _buildInfoRow('VersiÃ³n:', backup.version),
            _buildInfoRow('Tipo:', backup.backupType),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cerrar'),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
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
}
