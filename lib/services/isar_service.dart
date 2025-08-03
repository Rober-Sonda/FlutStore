import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../models/categoria.dart';
import '../models/producto.dart';
import '../models/propiedad.dart';
import '../models/cliente.dart';
import '../models/compra.dart';
import '../models/movimientostock.dart';
import '../models/pedido.dart';
import '../models/proveedor.dart';
import '../models/registrofinanciero.dart';
import '../models/reporte.dart';
import '../models/rol.dart';
import '../models/usuario.dart';
import '../models/custom_theme.dart';
import '../models/carrito_compra.dart';
import '../models/producto_proveedor.dart';
import '../models/oferta.dart';
import '../models/flujo_caja.dart';
import '../models/ganancia_perdida.dart';
import '../models/cierre_caja.dart';
import '../models/sorteo.dart';
import '../models/gasto_fijo.dart';
import '../models/movimiento_financiero.dart';
import '../models/cuenta_corriente.dart';
import '../models/pago_cuota.dart';
import '../models/pedido_proveedor.dart';
import '../models/business_config.dart';
import '../models/venta.dart';
import '../seed/isar_seed.dart';

final isarServiceProvider = Provider<IsarService>((ref) => IsarService());

class IsarService {
  late final Future<Isar> _dbFuture;
  Isar? _isarInstance;

  IsarService() {
    _dbFuture = _initDb();
  }

  Future<Isar> get db async => await _isar;

  Future<Isar> _initDb() async {
    // Intentar obtener una instancia existente
    final existing = Isar.getInstance();
    if (existing != null && existing.isOpen) {
      print('⚠️ Usando instancia existente de Isar');
      return existing;
    }

    // Si hay una instancia pero no está abierta, cerrarla
    if (_isarInstance != null && !_isarInstance!.isOpen) {
      await _isarInstance!.close();
      _isarInstance = null;
    }

    final dir = await getApplicationDocumentsDirectory();
    print('🔄 Abriendo nueva instancia de Isar en ${dir.path}');

    try {
      _isarInstance = await Isar.open(
        [
          CategoriaSchema,
          ProductoSchema,
          PropiedadSchema,
          ClienteSchema,
          CompraSchema,
          MovimientoStockSchema,
          PedidoSchema,
          ProveedorSchema,
          RegistroFinancieroSchema,
          ReporteSchema,
          RolSchema,
          UsuarioSchema,
          CustomThemeSchema,
          CarritoCompraSchema,
          ProductoProveedorSchema,
          OfertaSchema,
          FlujoCajaSchema,
          GananciaPerdidaSchema,
          CierreCajaSchema,
          SorteoSchema,
          GastoFijoSchema,
          MovimientoFinancieroSchema,
          CuentaCorrienteSchema,
          PagoCuotaSchema,
          PedidoProveedorSchema,
          BusinessConfigSchema,
          VentaSchema,
        ],
        directory: 'C:/Flutter-Projects/tienda_app/isar_db',
        name: 'default',
      );

      print('✅ Instancia de Isar abierta exitosamente');
      return _isarInstance!;
    } catch (e) {
      print('❌ Error abriendo Isar: $e');
      rethrow;
    }
  }

  Future<void> clearDatabase() async {
    final isar = await _isar;
    await isar.writeTxn(() async {
      await isar.clear();
    });
  }

  Future<void> deleteDatabaseFiles() async {
    final dir = await getApplicationDocumentsDirectory();
    final dbPath = '${dir.path}/default.isar';

    final file = File(dbPath);
    if (await file.exists()) {
      await file.delete();
    }

    final lockFile = File('$dbPath.lock');
    if (await lockFile.exists()) {
      await lockFile.delete();
    }

    // Luego cierra la instancia para que se pueda abrir una nueva limpia
    if (_isarInstance != null && _isarInstance!.isOpen) {
      await _isarInstance!.close();
      _isarInstance = null;
    }
  }

  Future<Isar> get _isar async {
    // Si ya tenemos una instancia válida, usarla
    if (_isarInstance != null && _isarInstance!.isOpen) {
      return _isarInstance!;
    }

    // Intentar obtener una instancia existente
    final existing = Isar.getInstance();
    if (existing != null && existing.isOpen) {
      _isarInstance = existing;
      return existing;
    }

    // Si no hay instancia válida, crear una nueva
    return await _initDb();
  }

  Future<void> seedDatabase() async {
    final isar = await _isar;
    await seedIsar(isar);
  }
}
