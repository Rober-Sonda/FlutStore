import 'package:isar/isar.dart';
import '../models/venta.dart';
import '../models/compra.dart';
import 'isar_service.dart';

class NumeracionService {
  static final NumeracionService _instance = NumeracionService._internal();
  factory NumeracionService() => _instance;
  NumeracionService._internal();

  /// Genera el siguiente número de factura para ventas
  Future<String> generarNumeroFacturaVenta(Isar isar) async {
    final ultimaVenta =
        await isar.ventas
            .where()
            .filter()
            .numeroFacturaIsNotEmpty()
            .sortByFecha()
            .limit(1)
            .findFirst();

    if (ultimaVenta == null || ultimaVenta.numeroFactura == null) {
      return 'FAC-${DateTime.now().year}-000001';
    }

    final numeroActual =
        int.tryParse(ultimaVenta.numeroFactura!.split('-').last) ?? 0;
    final siguienteNumero = numeroActual + 1;
    return 'FAC-${DateTime.now().year}-${siguienteNumero.toString().padLeft(6, '0')}';
  }

  /// Genera el siguiente número de recibo para ventas
  Future<String> generarNumeroReciboVenta(Isar isar) async {
    final ultimaVenta =
        await isar.ventas
            .where()
            .filter()
            .numeroReciboIsNotEmpty()
            .sortByFecha()
            .limit(1)
            .findFirst();

    if (ultimaVenta == null || ultimaVenta.numeroRecibo == null) {
      return 'REC-${DateTime.now().year}-000001';
    }

    final numeroActual =
        int.tryParse(ultimaVenta.numeroRecibo!.split('-').last) ?? 0;
    final siguienteNumero = numeroActual + 1;
    return 'REC-${DateTime.now().year}-${siguienteNumero.toString().padLeft(6, '0')}';
  }

  /// Genera el siguiente número de ticket para ventas
  Future<String> generarNumeroTicketVenta(Isar isar) async {
    final ultimaVenta =
        await isar.ventas
            .where()
            .filter()
            .numeroTicketIsNotEmpty()
            .sortByFecha()
            .limit(1)
            .findFirst();

    if (ultimaVenta == null || ultimaVenta.numeroTicket == null) {
      return 'TKT-${DateTime.now().year}-000001';
    }

    final numeroActual =
        int.tryParse(ultimaVenta.numeroTicket!.split('-').last) ?? 0;
    final siguienteNumero = numeroActual + 1;
    return 'TKT-${DateTime.now().year}-${siguienteNumero.toString().padLeft(6, '0')}';
  }

  /// Genera el siguiente número de factura para compras
  Future<String> generarNumeroFacturaCompra(Isar isar) async {
    final ultimaCompra =
        await isar.compras
            .where()
            .filter()
            .numeroFacturaIsNotEmpty()
            .sortByFecha()
            .limit(1)
            .findFirst();

    if (ultimaCompra == null) {
      return 'FAC-COMP-${DateTime.now().year}-000001';
    }

    final numeroActual =
        int.tryParse(ultimaCompra.numeroFactura!.split('-').last) ?? 0;
    final siguienteNumero = numeroActual + 1;
    return 'FAC-COMP-${DateTime.now().year}-${siguienteNumero.toString().padLeft(6, '0')}';
  }

  /// Genera el siguiente número de orden de compra
  Future<String> generarNumeroOrdenCompra(Isar isar) async {
    final ultimaCompra =
        await isar.compras
            .where()
            .filter()
            .numeroOrdenIsNotEmpty()
            .sortByFecha()
            .limit(1)
            .findFirst();

    if (ultimaCompra == null || ultimaCompra.numeroOrden == null) {
      return 'OC-${DateTime.now().year}-000001';
    }

    final numeroActual =
        int.tryParse(ultimaCompra.numeroOrden!.split('-').last) ?? 0;
    final siguienteNumero = numeroActual + 1;
    return 'OC-${DateTime.now().year}-${siguienteNumero.toString().padLeft(6, '0')}';
  }

  /// Genera el siguiente número de remito para compras
  Future<String> generarNumeroRemitoCompra(Isar isar) async {
    final ultimaCompra =
        await isar.compras
            .where()
            .filter()
            .numeroRemitoIsNotEmpty()
            .sortByFecha()
            .limit(1)
            .findFirst();

    if (ultimaCompra == null || ultimaCompra.numeroRemito == null) {
      return 'REM-${DateTime.now().year}-000001';
    }

    final numeroActual =
        int.tryParse(ultimaCompra.numeroRemito!.split('-').last) ?? 0;
    final siguienteNumero = numeroActual + 1;
    return 'REM-${DateTime.now().year}-${siguienteNumero.toString().padLeft(6, '0')}';
  }

  /// Genera el siguiente número de guía para compras
  Future<String> generarNumeroGuiaCompra(Isar isar) async {
    final ultimaCompra =
        await isar.compras
            .where()
            .filter()
            .numeroGuiaIsNotEmpty()
            .sortByFecha()
            .limit(1)
            .findFirst();

    if (ultimaCompra == null || ultimaCompra.numeroGuia == null) {
      return 'GUI-${DateTime.now().year}-000001';
    }

    final numeroActual =
        int.tryParse(ultimaCompra.numeroGuia!.split('-').last) ?? 0;
    final siguienteNumero = numeroActual + 1;
    return 'GUI-${DateTime.now().year}-${siguienteNumero.toString().padLeft(6, '0')}';
  }

  /// Valida si un número de documento ya existe
  Future<bool> numeroDocumentoExiste(
    Isar isar,
    String numero,
    String tipo,
  ) async {
    switch (tipo) {
      case 'factura_venta':
        final venta =
            await isar.ventas
                .where()
                .filter()
                .numeroFacturaEqualTo(numero)
                .findFirst();
        return venta != null;

      case 'recibo_venta':
        final venta =
            await isar.ventas
                .where()
                .filter()
                .numeroReciboEqualTo(numero)
                .findFirst();
        return venta != null;

      case 'ticket_venta':
        final venta =
            await isar.ventas
                .where()
                .filter()
                .numeroTicketEqualTo(numero)
                .findFirst();
        return venta != null;

      case 'factura_compra':
        final compra =
            await isar.compras
                .where()
                .filter()
                .numeroFacturaEqualTo(numero)
                .findFirst();
        return compra != null;

      case 'orden_compra':
        final compra =
            await isar.compras
                .where()
                .filter()
                .numeroOrdenEqualTo(numero)
                .findFirst();
        return compra != null;

      case 'remito_compra':
        final compra =
            await isar.compras
                .where()
                .filter()
                .numeroRemitoEqualTo(numero)
                .findFirst();
        return compra != null;

      case 'guia_compra':
        final compra =
            await isar.compras
                .where()
                .filter()
                .numeroGuiaEqualTo(numero)
                .findFirst();
        return compra != null;

      default:
        return false;
    }
  }

  /// Formatea un número de documento con el año actual
  String formatearNumeroDocumento(String prefijo, int numero) {
    return '$prefijo-${DateTime.now().year}-${numero.toString().padLeft(6, '0')}';
  }

  /// Extrae el número secuencial de un documento
  int? extraerNumeroSecuencial(String numeroDocumento) {
    try {
      final partes = numeroDocumento.split('-');
      if (partes.length >= 3) {
        return int.tryParse(partes.last);
      }
    } catch (e) {
      return null;
    }
    return null;
  }
}
