import 'dart:io';
import 'dart:convert';
import 'package:isar/isar.dart';
import 'package:path/path.dart' as path;
import '../models/producto.dart';
import '../models/cliente.dart';
import '../models/venta.dart';
import '../models/compra.dart';
import '../models/proveedor.dart';
import '../models/categoria.dart';
import '../models/usuario.dart';
import '../models/cuenta_corriente.dart';
import '../models/carrito_compra.dart';
import '../models/movimiento_financiero.dart';
import '../models/flujo_caja.dart';
import '../models/business_config.dart';
import '../models/custom_theme.dart';
import 'isar_service.dart';

/// Servicio completo de respaldo y restauración de la base de datos
/// Especializado para tiendas de ropa con todas las funcionalidades críticas
class BackupService {
  final IsarService _isarService = IsarService();
  
  /// Crear backup completo de la tienda
  /// Incluye productos, clientes, ventas, compras, proveedores, etc.
  Future<BackupResult> createFullBackup({
    String? customPath,
    bool includeImages = false,
    bool compressBackup = true,
  }) async {
    try {
      final isar = await _isarService.db;
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final backupDir = customPath ?? await _getDefaultBackupPath();
      final backupFileName = 'tienda_backup_$timestamp.json';
      final backupFilePath = path.join(backupDir, backupFileName);
      
      // Crear directorio si no existe
      final directory = Directory(backupDir);
      if (!await directory.exists()) {
        await directory.create(recursive: true);
      }
      
      // Obtener todos los datos de todas las colecciones
      final backupData = <String, dynamic>{
        'metadata': {
          'version': '1.0',
          'created_at': DateTime.now().toIso8601String(),
          'app_version': '1.0.0',
          'total_records': 0,
          'include_images': includeImages,
          'backup_type': 'full',
        },
        'data': {},
      };
      
      int totalRecords = 0;
      
      // Productos
      final productos = await isar.productos.where().findAll();
      backupData['data']['productos'] = productos.map((p) => _productoToJson(p)).toList();
      totalRecords = totalRecords + productos.length;
      
      // Clientes
      final clientes = await isar.clientes.where().findAll();
      backupData['data']['clientes'] = clientes.map((c) => _clienteToJson(c)).toList();
      totalRecords = totalRecords + clientes.length;
      
      // Ventas
      final ventas = await isar.ventas.where().findAll();
      backupData['data']['ventas'] = ventas.map((v) => _ventaToJson(v)).toList();
      totalRecords = totalRecords + ventas.length;
      
      // Compras
      final compras = await isar.compras.where().findAll();
      backupData['data']['compras'] = compras.map((c) => _compraToJson(c)).toList();
      totalRecords = totalRecords + compras.length;
      
      // Proveedores
      final proveedores = await isar.proveedors.where().findAll();
      backupData['data']['proveedores'] = proveedores.map((p) => _proveedorToJson(p)).toList();
      totalRecords = totalRecords + proveedores.length;
      
      // Categorías
      final categorias = await isar.categorias.where().findAll();
      backupData['data']['categorias'] = categorias.map((c) => _categoriaToJson(c)).toList();
      totalRecords = totalRecords + categorias.length;
      
      // Usuarios
      final usuarios = await isar.usuarios.where().findAll();
      backupData['data']['usuarios'] = usuarios.map((u) => _usuarioToJson(u)).toList();
      totalRecords = totalRecords + usuarios.length;
      
      // Cuentas Corrientes
      final cuentasCorrientes = await isar.cuentaCorrientes.where().findAll();
      backupData['data']['cuentas_corrientes'] = cuentasCorrientes.map((cc) => _cuentaCorrienteToJson(cc)).toList();
      totalRecords = totalRecords + cuentasCorrientes.length;
      
      // Carrito de Compras (pedidos pendientes)
      final carritoItems = await isar.carritoCompras.where().findAll();
      backupData['data']['carrito_compras'] = carritoItems.map((ci) => _carritoCompraToJson(ci)).toList();
      totalRecords = totalRecords + carritoItems.length;
      
      // Movimientos Financieros - Simulados por ahora
      backupData['data']['movimientos_financieros'] = [];
      
      // Flujo de Caja - Simulados por ahora  
      backupData['data']['flujos_caja'] = [];
      
      // Configuración del Negocio - Simulados por ahora
      backupData['data']['business_configs'] = [];
      
      // Temas Personalizados - Simulados por ahora
      backupData['data']['custom_themes'] = [];
      
      // Actualizar metadatos
      backupData['metadata']['total_records'] = totalRecords;
      
      // Guardar archivo JSON
      final jsonString = compressBackup 
          ? _compressJson(jsonEncode(backupData))
          : jsonEncode(backupData);
      
      final file = File(backupFilePath);
      await file.writeAsString(jsonString);
      
      // Crear backup de imágenes si se solicita
      String? imagesPath;
      if (includeImages) {
        imagesPath = await _backupImages(backupDir, timestamp);
      }
      
      return BackupResult(
        success: true,
        backupFilePath: backupFilePath,
        imagesPath: imagesPath,
        totalRecords: totalRecords,
        fileSize: await file.length(),
        duration: DateTime.now().difference(DateTime.fromMillisecondsSinceEpoch(timestamp)),
      );
      
    } catch (e) {
      return BackupResult(
        success: false,
        error: 'Error creando backup: $e',
      );
    }
  }
  
  /// Restaurar backup completo
  Future<RestoreResult> restoreFullBackup(
    String backupFilePath, {
    bool clearExistingData = false,
    bool restoreImages = false,
  }) async {
    try {
      final startTime = DateTime.now();
      final isar = await _isarService.db;
      
      // Leer archivo de backup
      final file = File(backupFilePath);
      if (!await file.exists()) {
        return RestoreResult(
          success: false,
          error: 'Archivo de backup no encontrado: $backupFilePath',
        );
      }
      
      final jsonString = await file.readAsString();
      final backupData = jsonDecode(jsonString) as Map<String, dynamic>;
      
      // Validar estructura del backup
      if (!_validateBackupStructure(backupData)) {
        return RestoreResult(
          success: false,
          error: 'Estructura de backup inválida',
        );
      }
      
      int totalRestored = 0;
      final errors = <String>[];
      
      // Limpiar datos existentes si se solicita
      if (clearExistingData) {
        await _clearAllData(isar);
      }
      
      await isar.writeTxn(() async {
        // Restaurar cada colección
        final data = backupData['data'] as Map<String, dynamic>;
        
        // Restaurar productos
        if (data.containsKey('productos')) {
          try {
            final productos = (data['productos'] as List)
                .map((p) => _jsonToProducto(p))
                .toList();
            await isar.productos.putAll(productos);
            totalRestored += productos.length;
          } catch (e) {
            errors.add('Error restaurando productos: $e');
          }
        }
        
        // Restaurar clientes
        if (data.containsKey('clientes')) {
          try {
            final clientes = (data['clientes'] as List)
                .map((c) => _jsonToCliente(c))
                .toList();
            await isar.clientes.putAll(clientes);
            totalRestored += clientes.length;
          } catch (e) {
            errors.add('Error restaurando clientes: $e');
          }
        }
        
        // Restaurar ventas
        if (data.containsKey('ventas')) {
          try {
            final ventas = (data['ventas'] as List)
                .map((v) => _jsonToVenta(v))
                .toList();
            await isar.ventas.putAll(ventas);
            totalRestored += ventas.length;
          } catch (e) {
            errors.add('Error restaurando ventas: $e');
          }
        }
        
        // Restaurar compras
        if (data.containsKey('compras')) {
          try {
            final compras = (data['compras'] as List)
                .map((c) => _jsonToCompra(c))
                .toList();
            await isar.compras.putAll(compras);
            totalRestored += compras.length;
          } catch (e) {
            errors.add('Error restaurando compras: $e');
          }
        }
        
        // Restaurar proveedores
        if (data.containsKey('proveedores')) {
          try {
            final proveedores = (data['proveedores'] as List)
                .map((p) => _jsonToProveedor(p))
                .toList();
            await isar.proveedors.putAll(proveedores);
            totalRestored += proveedores.length;
          } catch (e) {
            errors.add('Error restaurando proveedores: $e');
          }
        }
        
        // Restaurar categorías
        if (data.containsKey('categorias')) {
          try {
            final categorias = (data['categorias'] as List)
                .map((c) => _jsonToCategoria(c))
                .toList();
            await isar.categorias.putAll(categorias);
            totalRestored += categorias.length;
          } catch (e) {
            errors.add('Error restaurando categorías: $e');
          }
        }
        
        // Restaurar usuarios
        if (data.containsKey('usuarios')) {
          try {
            final usuarios = (data['usuarios'] as List)
                .map((u) => _jsonToUsuario(u))
                .toList();
            await isar.usuarios.putAll(usuarios);
            totalRestored += usuarios.length;
          } catch (e) {
            errors.add('Error restaurando usuarios: $e');
          }
        }
        
        // Restaurar cuentas corrientes
        if (data.containsKey('cuentas_corrientes')) {
          try {
            final cuentasCorrientes = (data['cuentas_corrientes'] as List)
                .map((cc) => _jsonToCuentaCorriente(cc))
                .toList();
            await isar.cuentaCorrientes.putAll(cuentasCorrientes);
            totalRestored += cuentasCorrientes.length;
          } catch (e) {
            errors.add('Error restaurando cuentas corrientes: $e');
          }
        }
        
        // Restaurar configuraciones - Comentado hasta implementar modelo
        // if (data.containsKey('business_configs')) {
        //   try {
        //     final configs = (data['business_configs'] as List)
        //         .map((bc) => _jsonToBusinessConfig(bc))
        //         .toList();
        //     await isar.businessConfigs.putAll(configs);
        //     totalRestored += configs.length;
        //   } catch (e) {
        //     errors.add('Error restaurando configuraciones: $e');
        //   }
        // }
      });
      
      // Restaurar imágenes si se solicita
      if (restoreImages) {
        await _restoreImages(path.dirname(backupFilePath));
      }
      
      return RestoreResult(
        success: errors.isEmpty,
        totalRestored: totalRestored,
        errors: errors,
        duration: DateTime.now().difference(startTime),
      );
      
    } catch (e) {
      return RestoreResult(
        success: false,
        error: 'Error restaurando backup: $e',
      );
    }
  }
  
  /// Listar backups disponibles
  Future<List<BackupInfo>> listAvailableBackups([String? customPath]) async {
    try {
      final backupDir = customPath ?? await _getDefaultBackupPath();
      final directory = Directory(backupDir);
      
      if (!await directory.exists()) {
        return [];
      }
      
      final files = await directory.list().toList();
      final backupFiles = files
          .where((file) => file is File && file.path.endsWith('.json'))
          .cast<File>()
          .toList();
      
      final backupInfos = <BackupInfo>[];
      
      for (final file in backupFiles) {
        try {
          final content = await file.readAsString();
          final data = jsonDecode(content) as Map<String, dynamic>;
          final metadata = data['metadata'] as Map<String, dynamic>?;
          
          if (metadata != null) {
            backupInfos.add(BackupInfo(
              fileName: path.basename(file.path),
              filePath: file.path,
              createdAt: DateTime.parse(metadata['created_at']),
              totalRecords: metadata['total_records'] ?? 0,
              fileSize: await file.length(),
              version: metadata['version'] ?? 'unknown',
              backupType: metadata['backup_type'] ?? 'unknown',
            ));
          }
        } catch (e) {
          // Ignorar archivos con formato incorrecto
        }
      }
      
      // Ordenar por fecha de creación (más reciente primero)
      backupInfos.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      
      return backupInfos;
    } catch (e) {
      return [];
    }
  }
  
  /// Eliminar backup específico
  Future<bool> deleteBackup(String backupFilePath) async {
    try {
      final file = File(backupFilePath);
      if (await file.exists()) {
        await file.delete();
        
        // También eliminar carpeta de imágenes si existe
        final imagesDir = Directory('${backupFilePath}_images');
        if (await imagesDir.exists()) {
          await imagesDir.delete(recursive: true);
        }
        
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }
  
  /// Crear backup automático programado
  Future<BackupResult> createScheduledBackup() async {
    return await createFullBackup(
      includeImages: true,
      compressBackup: true,
    );
  }
  
  /// Limpiar backups antiguos (mantener solo los N más recientes)
  Future<int> cleanupOldBackups(int keepCount, [String? customPath]) async {
    try {
      final backups = await listAvailableBackups(customPath);
      
      if (backups.length <= keepCount) {
        return 0;
      }
      
      final backupsToDelete = backups.skip(keepCount).toList();
      int deletedCount = 0;
      
      for (final backup in backupsToDelete) {
        if (await deleteBackup(backup.filePath)) {
          deletedCount++;
        }
      }
      
      return deletedCount;
    } catch (e) {
      return 0;
    }
  }
  
  // Métodos auxiliares privados
  
  Future<String> _getDefaultBackupPath() async {
    // En producción, usar Documents o directorio apropiado
    // Por ahora usar directorio temporal
    final tempDir = Directory.systemTemp;
    final backupDir = path.join(tempDir.path, 'tienda_app_backups');
    return backupDir;
  }
  
  bool _validateBackupStructure(Map<String, dynamic> data) {
    return data.containsKey('metadata') && 
           data.containsKey('data') &&
           data['metadata'] is Map<String, dynamic> &&
           data['data'] is Map<String, dynamic>;
  }
  
  Future<void> _clearAllData(Isar isar) async {
    await isar.writeTxn(() async {
      await isar.productos.clear();
      await isar.clientes.clear();
      await isar.ventas.clear();
      await isar.compras.clear();
      await isar.proveedors.clear();
      await isar.categorias.clear();
      await isar.usuarios.clear();
      await isar.cuentaCorrientes.clear();
      await isar.carritoCompras.clear();
      // Comentado hasta implementar modelos
      // await isar.movimientoFinancieros.clear();
      // await isar.flujoCajas.clear();
      // await isar.businessConfigs.clear();
      // await isar.customThemes.clear();
    });
  }
  
  String _compressJson(String jsonString) {
    // Implementación simple de compresión (en producción usar gzip)
    return jsonString;
  }
  
  Future<String?> _backupImages(String backupDir, int timestamp) async {
    // Implementar backup de imágenes de productos
    // Copiar archivos de assets/images a backup_images_timestamp/
    return null;
  }
  
  Future<void> _restoreImages(String backupDir) async {
    // Implementar restauración de imágenes
    // Copiar de backup_images/ de vuelta a assets/images/
  }
  
  // Métodos de conversión JSON (implementar para cada modelo)
  
  Map<String, dynamic> _productoToJson(Producto producto) {
    return {
      'id': producto.id,
      'nombre': producto.nombre,
      'descripcion': producto.descripcion,
      'precio': producto.precio,
      'precioCosto': producto.precioCosto,
      'utilidad': producto.utilidad,
      'stock': producto.stock,
      'categoriaId': producto.categoriaId,
      'categoria': producto.categoria,
      'imagen': producto.imagen,
      'codigoBarras': producto.codigoBarras,
      'sku': producto.sku,
      'fechaCreacion': producto.fechaCreacion?.toIso8601String(),
      'imagenes': producto.imagenes,
    };
  }
  
  Producto _jsonToProducto(Map<String, dynamic> json) {
    final producto = Producto();
    producto.id = json['id'];
    producto.nombre = json['nombre'];
    producto.descripcion = json['descripcion'];
    producto.precio = json['precio']?.toDouble();
    producto.precioCosto = json['precioCosto']?.toDouble();
    producto.utilidad = json['utilidad']?.toDouble();
    producto.stock = json['stock'];
    producto.categoriaId = json['categoriaId'];
    producto.categoria = json['categoria'];
    producto.imagen = json['imagen'];
    producto.codigoBarras = json['codigoBarras'];
    producto.sku = json['sku'];
    producto.fechaCreacion = json['fechaCreacion'] != null 
        ? DateTime.parse(json['fechaCreacion']) 
        : null;
    producto.imagenes = (json['imagenes'] as List?)?.cast<String>() ?? [];
    return producto;
  }
  
  Map<String, dynamic> _clienteToJson(Cliente cliente) {
    return {
      'id': cliente.id,
      'nombre': cliente.nombre,
      'apellido': cliente.apellido,
      'email': cliente.email,
      'whatsapp': cliente.whatsapp,
      'instagram': cliente.instagram,
      'direccion': cliente.direccion,
      'dni': cliente.dni,
      'cuil': cliente.cuil,
      'fechaRegistro': cliente.fechaRegistro?.toIso8601String(),
    };
  }
  
  Cliente _jsonToCliente(Map<String, dynamic> json) {
    return Cliente(
      id: json['id'],
      nombre: json['nombre'],
      apellido: json['apellido'],
      email: json['email'],
      whatsapp: json['whatsapp'],
      instagram: json['instagram'],
      direccion: json['direccion'],
      dni: json['dni'],
      cuil: json['cuil'],
      fechaRegistro: json['fechaRegistro'] != null 
          ? DateTime.parse(json['fechaRegistro']) 
          : null,
    );
  }
  
  // Implementar métodos similares para otros modelos...
  Map<String, dynamic> _ventaToJson(Venta venta) => {
    'id': venta.id,
    'clienteId': venta.clienteId,
    'fecha': venta.fecha.toIso8601String(),
    'total': venta.total,
    'metodoPago': venta.metodoPago,
    'estado': venta.estado,
    'usuarioId': venta.usuarioId,
  };
  
  Venta _jsonToVenta(Map<String, dynamic> json) => Venta(
    clienteId: json['clienteId'] ?? 0,
    fecha: json['fecha'] != null ? DateTime.parse(json['fecha']) : DateTime.now(),
    total: json['total']?.toDouble() ?? 0.0,
    metodoPago: json['metodoPago'] ?? 'efectivo',
    estado: json['estado'] ?? 'pendiente',
    usuarioId: json['usuarioId'] ?? 1,
  );
  
  Map<String, dynamic> _compraToJson(Compra compra) => {
    'id': compra.id,
    'numeroFactura': compra.numeroFactura,
    'fecha': compra.fecha?.toIso8601String(),
    'total': compra.total,
    'estado': compra.estado,
  };
  
  Compra _jsonToCompra(Map<String, dynamic> json) => Compra(
    numeroFactura: json['numeroFactura'] ?? 'SIN-NUM',
    fecha: json['fecha'] != null ? DateTime.parse(json['fecha']) : DateTime.now(),
    total: json['total']?.toDouble() ?? 0.0,
    estado: json['estado'] ?? 'pendiente',
  );
  
  Map<String, dynamic> _proveedorToJson(Proveedor proveedor) => {
    'id': proveedor.id,
    'nombre': proveedor.nombre,
    'telefono': proveedor.telefono,
    'email': proveedor.email,
    'direccion': proveedor.direccion,
  };
  
  Proveedor _jsonToProveedor(Map<String, dynamic> json) => Proveedor(
    nombre: json['nombre'] ?? 'Proveedor Sin Nombre',
  );
  
  Map<String, dynamic> _categoriaToJson(Categoria categoria) => {
    'id': categoria.id,
    'nombre': categoria.nombre,
    'descripcion': categoria.descripcion,
    'parent': categoria.parent,
    'orden': categoria.orden,
  };
  
  Categoria _jsonToCategoria(Map<String, dynamic> json) => Categoria()
    ..nombre = json['nombre'] ?? 'Sin Categoría'
    ..descripcion = json['descripcion']
    ..parent = json['parent']
    ..orden = json['orden'] ?? 0;
  
  Map<String, dynamic> _usuarioToJson(Usuario usuario) => {
    'id': usuario.id,
    'nombre': usuario.nombre,
    'apellido': usuario.apellido,
    'email': usuario.email,
    'username': usuario.username,
    'password': usuario.password,
    'rolId': usuario.rolId,
    'fechaCreacion': usuario.fechaCreacion?.toIso8601String(),
    'avatarUrl': usuario.avatarUrl,
  };
  
  Usuario _jsonToUsuario(Map<String, dynamic> json) => Usuario()
    ..nombre = json['nombre'] ?? 'Usuario'
    ..apellido = json['apellido']
    ..email = json['email']
    ..username = json['username'] ?? 'usuario'
    ..password = json['password'] ?? '123456'
    ..rolId = json['rolId']
    ..fechaCreacion = json['fechaCreacion'] != null 
        ? DateTime.parse(json['fechaCreacion']) 
        : DateTime.now()
    ..avatarUrl = json['avatarUrl'];
  
  Map<String, dynamic> _cuentaCorrienteToJson(CuentaCorriente cuenta) => {
    'id': cuenta.id,
    'clienteId': cuenta.clienteId,
    'nombreCliente': cuenta.nombreCliente,
    'montoTotal': cuenta.montoTotal,
    'fechaCreacion': cuenta.fechaCreacion.toIso8601String(),
    'fechaVencimiento': cuenta.fechaVencimiento.toIso8601String(),
  };
  
  CuentaCorriente _jsonToCuentaCorriente(Map<String, dynamic> json) => CuentaCorriente(
    clienteId: json['clienteId'] ?? 0, 
    nombreCliente: json['nombreCliente'] ?? 'Cliente', 
    montoTotal: json['montoTotal']?.toDouble() ?? 0.0, 
    fechaCreacion: json['fechaCreacion'] != null 
        ? DateTime.parse(json['fechaCreacion'])
        : DateTime.now(), 
    fechaVencimiento: json['fechaVencimiento'] != null 
        ? DateTime.parse(json['fechaVencimiento'])
        : DateTime.now().add(Duration(days: 30)),
  );
  
  Map<String, dynamic> _carritoCompraToJson(CarritoCompra item) => {
    'id': item.id,
    'nombreProducto': item.nombreProducto,
    'productoId': item.productoId,
    'proveedorId': item.proveedorId,
    'nombreProveedor': item.nombreProveedor,
    'cantidad': item.cantidad,
    'precioUnitario': item.precioUnitario,
    'precioTotal': item.precioTotal,
    'fechaAgregado': item.fechaAgregado.toIso8601String(),
    'esUrgente': item.esUrgente,
    'notas': item.notas,
    'estado': item.estado,
  };
  
  // Métodos placeholder para modelos futuros
  Map<String, dynamic> _businessConfigToJson(dynamic config) => {};
  dynamic _jsonToBusinessConfig(Map<String, dynamic> json) => null;
}

/// Resultado de operación de backup
class BackupResult {
  final bool success;
  final String? backupFilePath;
  final String? imagesPath;
  final int totalRecords;
  final int fileSize;
  final Duration? duration;
  final String? error;

  BackupResult({
    required this.success,
    this.backupFilePath,
    this.imagesPath,
    this.totalRecords = 0,
    this.fileSize = 0,
    this.duration,
    this.error,
  });
}

/// Resultado de operación de restauración
class RestoreResult {
  final bool success;
  final int totalRestored;
  final List<String> errors;
  final Duration? duration;
  final String? error;

  RestoreResult({
    required this.success,
    this.totalRestored = 0,
    this.errors = const [],
    this.duration,
    this.error,
  });
}

/// Información de backup disponible
class BackupInfo {
  final String fileName;
  final String filePath;
  final DateTime createdAt;
  final int totalRecords;
  final int fileSize;
  final String version;
  final String backupType;

  BackupInfo({
    required this.fileName,
    required this.filePath,
    required this.createdAt,
    required this.totalRecords,
    required this.fileSize,
    required this.version,
    required this.backupType,
  });
  
  String get formattedSize {
    if (fileSize < 1024) return '$fileSize B';
    if (fileSize < 1024 * 1024) return '${(fileSize / 1024).toStringAsFixed(1)} KB';
    if (fileSize < 1024 * 1024 * 1024) return '${(fileSize / (1024 * 1024)).toStringAsFixed(1)} MB';
    return '${(fileSize / (1024 * 1024 * 1024)).toStringAsFixed(1)} GB';
  }
}