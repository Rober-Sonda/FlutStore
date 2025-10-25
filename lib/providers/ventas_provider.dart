import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/venta.dart';

// Provider para el servicio de ventas
final ventaServiceProvider = Provider<VentaService>((ref) {
  return VentaService();
});

// Provider para la lista de ventas
final ventasProvider = FutureProvider<List<Venta>>((ref) async {
  final ventaService = ref.watch(ventaServiceProvider);
  return await ventaService.obtenerTodasLasVentas();
});

// Provider para obtener ventas por cliente
final ventasPorClienteProvider = FutureProvider.family<List<Venta>, int>((
  ref,
  clienteId,
) async {
  final ventaService = ref.watch(ventaServiceProvider);
  return await ventaService.obtenerVentasPorCliente(clienteId);
});

// Provider para obtener ventas por fecha
final ventasPorFechaProvider = FutureProvider.family<List<Venta>, DateTime>((
  ref,
  fecha,
) async {
  final ventaService = ref.watch(ventaServiceProvider);
  return await ventaService.obtenerVentasPorFecha(fecha);
});

// Provider para obtener ventas por estado
final ventasPorEstadoProvider = FutureProvider.family<List<Venta>, String>((
  ref,
  estado,
) async {
  final ventaService = ref.watch(ventaServiceProvider);
  return await ventaService.obtenerVentasPorEstado(estado);
});

// Provider para obtener una venta específica
final ventaProvider = FutureProvider.family<Venta?, int>((ref, ventaId) async {
  final ventaService = ref.watch(ventaServiceProvider);
  return await ventaService.obtenerVentaPorId(ventaId);
});

// Provider para métricas de ventas
final metricasVentasProvider = FutureProvider<MetricasVentas>((ref) async {
  final ventaService = ref.watch(ventaServiceProvider);
  return await ventaService.obtenerMetricasVentas();
});

// Provider para ventas recientes
final ventasRecientesProvider = FutureProvider<List<Venta>>((ref) async {
  final ventaService = ref.watch(ventaServiceProvider);
  return await ventaService.obtenerVentasRecientes(limit: 10);
});

// Clase para métricas de ventas
class MetricasVentas {
  final double ventasDelDia;
  final double ventasDelMes;
  final double ventasDelAno;
  final int totalVentas;
  final double promedioVenta;
  final List<Venta> ventasRecientes;

  MetricasVentas({
    required this.ventasDelDia,
    required this.ventasDelMes,
    required this.ventasDelAno,
    required this.totalVentas,
    required this.promedioVenta,
    required this.ventasRecientes,
  });
}

// Implementación mínima del servicio de ventas para compilar.
// Reemplaza esto por la implementación real que haga llamadas a API/DB.
class VentaService {
  Future<List<Venta>> obtenerTodasLasVentas() async {
    // TODO: implementar lógica real
    return [];
  }

  Future<List<Venta>> obtenerVentasPorCliente(int clienteId) async {
    // TODO: implementar lógica real
    return [];
  }

  Future<List<Venta>> obtenerVentasPorFecha(DateTime fecha) async {
    // TODO: implementar lógica real
    return [];
  }

  Future<List<Venta>> obtenerVentasPorEstado(String estado) async {
    // TODO: implementar lógica real
    return [];
  }

  Future<Venta?> obtenerVentaPorId(int ventaId) async {
    // TODO: implementar lógica real
    return null;
  }

  Future<MetricasVentas> obtenerMetricasVentas() async {
    // Devuelve valores por defecto; reemplazar con cálculo real.
    return MetricasVentas(
      ventasDelDia: 0.0,
      ventasDelMes: 0.0,
      ventasDelAno: 0.0,
      totalVentas: 0,
      promedioVenta: 0.0,
      ventasRecientes: [],
    );
  }

  Future<List<Venta>> obtenerVentasRecientes({int limit = 10}) async {
    // TODO: implementar lógica real
    return [];
  }
}
