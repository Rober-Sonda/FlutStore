import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/compra.dart';

// Servicio de compras (implementación mínima para compilar)
class CompraService {
  Future<List<Compra>> obtenerTodasLasCompras() async {
    return <Compra>[];
  }

  Future<List<Compra>> obtenerComprasPorProveedor(int proveedorId) async {
    return <Compra>[];
  }

  Future<List<Compra>> obtenerComprasPorFecha(DateTime fecha) async {
    return <Compra>[];
  }

  Future<List<Compra>> obtenerComprasPorEstado(String estado) async {
    return <Compra>[];
  }

  Future<Compra?> obtenerCompraPorId(int id) async {
    return null;
  }

  Future<MetricasCompras> obtenerMetricasCompras() async {
    return MetricasCompras(
      comprasDelDia: 0.0,
      comprasDelMes: 0.0,
      comprasDelAno: 0.0,
      totalCompras: 0,
      promedioCompra: 0.0,
      comprasRecientes: <Compra>[],
      comprasPendientes: <Compra>[],
    );
  }

  Future<List<Compra>> obtenerComprasRecientes({int limit = 10}) async {
    return <Compra>[];
  }
}

// Provider para el servicio de compras
final compraServiceProvider = Provider<CompraService>((ref) {
  return CompraService();
});

// Provider para la lista de compras
final comprasProvider = FutureProvider<List<Compra>>((ref) async {
  final compraService = ref.watch(compraServiceProvider);
  return await compraService.obtenerTodasLasCompras();
});

// Provider para obtener compras por proveedor
final comprasPorProveedorProvider = FutureProvider.family<List<Compra>, int>((
  ref,
  proveedorId,
) async {
  final compraService = ref.watch(compraServiceProvider);
  return await compraService.obtenerComprasPorProveedor(proveedorId);
});

// Provider para obtener compras por fecha
final comprasPorFechaProvider = FutureProvider.family<List<Compra>, DateTime>((
  ref,
  fecha,
) async {
  final compraService = ref.watch(compraServiceProvider);
  return await compraService.obtenerComprasPorFecha(fecha);
});

// Provider para obtener compras por estado
final comprasPorEstadoProvider = FutureProvider.family<List<Compra>, String>((
  ref,
  estado,
) async {
  final compraService = ref.watch(compraServiceProvider);
  return await compraService.obtenerComprasPorEstado(estado);
});

// Provider para obtener una compra específica
final compraProvider = FutureProvider.family<Compra?, int>((
  ref,
  compraId,
) async {
  final compraService = ref.watch(compraServiceProvider);
  return await compraService.obtenerCompraPorId(compraId);
});

// Provider para métricas de compras
final metricasComprasProvider = FutureProvider<MetricasCompras>((ref) async {
  final compraService = ref.watch(compraServiceProvider);
  return await compraService.obtenerMetricasCompras();
});

// Provider para compras recientes
final comprasRecientesProvider = FutureProvider<List<Compra>>((ref) async {
  final compraService = ref.watch(compraServiceProvider);
  return await compraService.obtenerComprasRecientes(limit: 10);
});

// Provider para compras pendientes
final comprasPendientesProvider = FutureProvider<List<Compra>>((ref) async {
  final compraService = ref.watch(compraServiceProvider);
  return await compraService.obtenerComprasPorEstado('pendiente');
});

// Clase para métricas de compras
class MetricasCompras {
  final double comprasDelDia;
  final double comprasDelMes;
  final double comprasDelAno;
  final int totalCompras;
  final double promedioCompra;
  final List<Compra> comprasRecientes;
  final List<Compra> comprasPendientes;

  MetricasCompras({
    required this.comprasDelDia,
    required this.comprasDelMes,
    required this.comprasDelAno,
    required this.totalCompras,
    required this.promedioCompra,
    required this.comprasRecientes,
    required this.comprasPendientes,
  });
}
