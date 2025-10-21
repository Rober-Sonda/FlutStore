import 'package:flutter/material.dart';
import '../models/venta.dart';
import '../services/database_service.dart';

class VentaProvider with ChangeNotifier {
  final DatabaseService _databaseService = DatabaseService();
  List<Venta> _ventas = [];
  bool _isLoading = false;

  List<Venta> get ventas => _ventas;
  bool get isLoading => _isLoading;

  VentaProvider() {
    cargarVentas();
  }

  Future<void> cargarVentas() async {
    _isLoading = true;
    notifyListeners();

    try {
      _ventas = await _databaseService.getVentas();
    } catch (e) {
      print('Error cargando ventas: $e');
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> registrarVenta(Venta venta) async {
    try {
      await _databaseService.insertVenta(venta);
      await cargarVentas();
    } catch (e) {
      print('Error registrando venta: $e');
      rethrow;
    }
  }

  double get totalVentasHoy {
    final hoy = DateTime.now();
    return _ventas
        .where(
          (venta) =>
              venta.fecha.year == hoy.year &&
              venta.fecha.month == hoy.month &&
              venta.fecha.day == hoy.day,
        )
        .fold(0.0, (sum, venta) => sum + venta.total);
  }

  double get totalVentasMes {
    final ahora = DateTime.now();
    return _ventas
        .where(
          (venta) =>
              venta.fecha.year == ahora.year &&
              venta.fecha.month == ahora.month,
        )
        .fold(0.0, (sum, venta) => sum + venta.total);
  }
}
