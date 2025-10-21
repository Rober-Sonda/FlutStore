import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import '../models/pedido.dart';
import '../models/compra.dart';
import '../models/producto.dart';
import '../models/cliente.dart';
import '../models/categoria.dart';
import '../models/proveedor.dart';
import '../models/venta.dart';

class DashboardDataService {
  static Future<Map<String, dynamic>> calculateStats(Isar isar) async {
    final productos = await isar.productos.where().findAll();
    final categorias = await isar.categorias.where().findAll();
    final proveedores = await isar.proveedors.where().findAll();
    final clientes = await isar.clientes.where().findAll();

    final productosCriticos = productos.where((p) => (p.stock ?? 0) < 5).length;
    final productosBajoStock =
        productos.where((p) => (p.stock ?? 0) < 10).length;
    final productosSinStock =
        productos.where((p) => (p.stock ?? 0) == 0).length;
    final totalStock = productos.fold<int>(0, (sum, p) => sum + (p.stock ?? 0));
    final totalValorInventario = productos.fold<double>(
      0,
      (sum, p) => sum + ((p.precio ?? 0) * (p.stock ?? 0)),
    );

    final now = DateTime.now();

    // Fecha actual
    final startOfMonth = DateTime(now.year, now.month, 1);
    final endOfMonth = DateTime(now.year, now.month + 1, 0);

    // Semana actual (empezando el lunes)
    final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    final endOfWeek = startOfWeek.add(const Duration(days: 6));

    // Mes anterior
    final startOfLastMonth = DateTime(now.year, now.month - 1, 1);
    final endOfLastMonth = DateTime(now.year, now.month, 0);

    // Datos del mes actual
    final pedidosMes =
        await isar.pedidos
            .filter()
            .fechaBetween(startOfMonth, endOfMonth)
            .findAll();

    final pedidosSemana =
        await isar.pedidos
            .filter()
            .fechaBetween(startOfWeek, endOfWeek)
            .findAll();

    final comprasMes =
        await isar.compras
            .filter()
            .fechaBetween(startOfMonth, endOfMonth)
            .findAll();

    final ventasDelMes =
        await isar.ventas
            .filter()
            .fechaBetween(startOfMonth, endOfMonth)
            .findAll();

    // Datos del mes anterior para comparaciÃ³n
    final pedidosMesAnterior =
        await isar.pedidos
            .filter()
            .fechaBetween(startOfLastMonth, endOfLastMonth)
            .findAll();

    // CÃ¡lculos financieros
    double totalVentasMes = pedidosMes.fold(
      0,
      (sum, p) => sum + (p.total ?? 0),
    );
    double totalVentasSemana = pedidosSemana.fold(
      0,
      (sum, p) => sum + (p.total ?? 0),
    );
    double totalComprasMes = comprasMes.fold(
      0,
      (sum, c) => sum + (c.total ?? 0),
    );
    double totalVentasMesAnterior = pedidosMesAnterior.fold(
      0,
      (sum, p) => sum + (p.total ?? 0),
    );

    // CÃ¡lculos de inventario
    double valorInventario = productos.fold(
      0,
      (sum, p) => sum + ((p.precio ?? 0) * (p.stock ?? 0)),
    );

    // CÃ¡lculos de rendimiento
    double gananciaMes = totalVentasMes - totalComprasMes;
    double margenGanancia =
        totalVentasMes > 0 ? (gananciaMes / totalVentasMes) * 100 : 0;
    double crecimientoVentas =
        totalVentasMesAnterior > 0
            ? ((totalVentasMes - totalVentasMesAnterior) /
                    totalVentasMesAnterior) *
                100
            : 0;

    // CÃ¡lculos de clientes
    int clientesNuevosMes =
        clientes
            .where(
              (c) =>
                  c.fechaRegistro != null &&
                  c.fechaRegistro!.isAfter(startOfMonth),
            )
            .length;

    double promedioVenta =
        pedidosMes.isNotEmpty ? totalVentasMes / pedidosMes.length : 0;
    double tasaConversion =
        clientes.isNotEmpty ? (pedidosMes.length / clientes.length) * 100 : 0;

    return {
      // MÃ©tricas financieras
      'totalVentasMes': totalVentasMes,
      'totalVentasSemana': totalVentasSemana,
      'totalComprasMes': totalComprasMes,
      'gananciaMes': gananciaMes,
      'margenGanancia': margenGanancia,
      'crecimientoVentas': crecimientoVentas,
      'valorInventario': valorInventario,

      // MÃ©tricas de operaciones
      'pedidosMes': pedidosMes.length,
      'pedidosSemana': pedidosSemana.length,
      'comprasMes': comprasMes.length,
      'promedioVenta': promedioVenta,
      'tasaConversion': tasaConversion,

      // MÃ©tricas de inventario
      'productos': productos.length,
      'productosBajoStock': productosBajoStock,
      'productosSinStock': productosSinStock,
      'productosCriticos': productosCriticos,

      // MÃ©tricas de clientes
      'clientes': clientes.length,
      'clientesNuevosMes': clientesNuevosMes,

      // MÃ©tricas de categorÃ­as y proveedores
      'categorias': categorias.length,
      'proveedores': proveedores.length,
    };
  }

  static Future<List<Map<String, dynamic>>> generateChartData(Isar isar) async {
    final now = DateTime.now();
    final startOfMonth = DateTime(now.year, now.month, 1);
    final endOfMonth = DateTime(now.year, now.month + 1, 0);

    final pedidos =
        await isar.pedidos
            .filter()
            .fechaBetween(startOfMonth, endOfMonth)
            .findAll();

    // Datos de ventas por dÃ­a
    Map<int, double> ventasPorDia = {};
    for (int i = 1; i <= endOfMonth.day; i++) {
      ventasPorDia[i] = 0;
    }

    for (final pedido in pedidos) {
      if (pedido.fecha != null) {
        final dia = pedido.fecha!.day;
        ventasPorDia[dia] = (ventasPorDia[dia] ?? 0) + (pedido.total ?? 0);
      }
    }

    return ventasPorDia.entries
        .map((e) => {'dia': e.key, 'ventas': e.value})
        .toList();
  }

  static Future<List<Map<String, dynamic>>> loadTopProducts(Isar isar) async {
    final now = DateTime.now();
    final startOfMonth = DateTime(now.year, now.month, 1);
    final endOfMonth = DateTime(now.year, now.month + 1, 0);

    final pedidos =
        await isar.pedidos
            .filter()
            .fechaBetween(startOfMonth, endOfMonth)
            .findAll();

    final productos = await isar.productos.where().findAll();

    Map<int, int> ventasPorProducto = {};
    for (final pedido in pedidos) {
      for (final productoId in pedido.productos) {
        ventasPorProducto[productoId] =
            (ventasPorProducto[productoId] ?? 0) + 1;
      }
    }

    final sortedProducts =
        ventasPorProducto.entries.toList()
          ..sort((a, b) => b.value.compareTo(a.value));

    return sortedProducts.take(5).map((entry) {
      final producto = productos.firstWhere(
        (p) => p.id == entry.key,
        orElse: () => Producto()..nombre = 'Producto no encontrado',
      );
      return {
        'id': entry.key,
        'nombre': producto.nombre,
        'ventas': entry.value,
        'stock': producto.stock ?? 0,
        'precio': producto.precio ?? 0,
        'categoria': producto.categoriaId,
      };
    }).toList();
  }

  static Future<List<Map<String, dynamic>>> loadRecentOrders(Isar isar) async {
    final pedidos = await isar.pedidos.where().sortByFecha().limit(5).findAll();
    final clientes = await isar.clientes.where().findAll();

    return pedidos.map((pedido) {
      final cliente = clientes.firstWhere(
        (c) => c.id == pedido.clienteId,
        orElse: () => Cliente(id: -1, nombre: 'Cliente no encontrado'),
      );
      return {
        'id': pedido.id,
        'cliente': cliente.nombre,
        'total': pedido.total ?? 0,
        'fecha': pedido.fecha,
        'estado': pedido.estado ?? 'Pendiente',
        'productos': pedido.productos.length,
      };
    }).toList();
  }

  static Future<List<Map<String, dynamic>>> loadCategoryPerformance(
    Isar isar,
  ) async {
    final productos = await isar.productos.where().findAll();
    final categorias = await isar.categorias.where().findAll();

    Map<int, Map<String, dynamic>> performancePorCategoria = {};

    for (final producto in productos) {
      if (producto.categoriaId != null) {
        if (!performancePorCategoria.containsKey(producto.categoriaId)) {
          performancePorCategoria[producto.categoriaId!] = {
            'productos': 0,
            'stock': 0,
            'valor': 0.0,
          };
        }

        performancePorCategoria[producto.categoriaId!]!['productos'] =
            (performancePorCategoria[producto.categoriaId!]!['productos']
                as int) +
            1;
        performancePorCategoria[producto.categoriaId!]!['stock'] =
            (performancePorCategoria[producto.categoriaId!]!['stock'] as int) +
            (producto.stock ?? 0);
        performancePorCategoria[producto.categoriaId!]!['valor'] =
            (performancePorCategoria[producto.categoriaId!]!['valor']
                as double) +
            ((producto.precio ?? 0) * (producto.stock ?? 0));
      }
    }

    return performancePorCategoria.entries.map((entry) {
      final categoria = categorias.firstWhere(
        (c) => c.id == entry.key,
        orElse: () => Categoria()..nombre = 'Sin categorÃ­a',
      );
      return {
        'id': entry.key,
        'nombre': categoria.nombre,
        'productos': entry.value['productos'] as int,
        'stock': entry.value['stock'] as int,
        'valor': entry.value['valor'] as double,
      };
    }).toList();
  }

  static Future<List<Map<String, dynamic>>> loadStockAlerts(Isar isar) async {
    final productos = await isar.productos.where().findAll();
    final categorias = await isar.categorias.where().findAll();

    List<Map<String, dynamic>> alertas = [];

    for (final producto in productos) {
      final stock = producto.stock ?? 0;
      String nivel = '';
      Color color = Colors.green;

      if (stock == 0) {
        nivel = 'Sin stock';
        color = Colors.red;
      } else if (stock < 5) {
        nivel = 'CrÃ­tico';
        color = Colors.red;
      } else if (stock < 10) {
        nivel = 'Bajo';
        color = Colors.orange;
      }

      if (stock < 10) {
        final categoria = categorias.firstWhere(
          (c) => c.id == producto.categoriaId,
          orElse: () => Categoria()..nombre = 'Sin categorÃ­a',
        );

        alertas.add({
          'id': producto.id,
          'nombre': producto.nombre,
          'stock': stock,
          'nivel': nivel,
          'color': color,
          'categoria': categoria.nombre,
          'precio': producto.precio ?? 0,
        });
      }
    }

    // Ordenar por nivel de urgencia
    alertas.sort((a, b) {
      final niveles = {'Sin stock': 3, 'CrÃ­tico': 2, 'Bajo': 1};
      return (niveles[b['nivel']] ?? 0).compareTo(niveles[a['nivel']] ?? 0);
    });

    return alertas.take(10).toList();
  }

  static Future<List<Map<String, dynamic>>> loadCustomerInsights(
    Isar isar,
  ) async {
    try {
      final clientes = await isar.clientes.where().findAll();
      final pedidos = await isar.pedidos.where().findAll();

      Map<int, Map<String, dynamic>> insightsPorCliente = {};

      for (final pedido in pedidos) {
        if (pedido.clienteId != null) {
          if (!insightsPorCliente.containsKey(pedido.clienteId)) {
            insightsPorCliente[pedido.clienteId!] = {
              'pedidos': 0,
              'total': 0.0,
              'ultimoPedido': null,
            };
          }

          insightsPorCliente[pedido.clienteId!]!['pedidos'] =
              (insightsPorCliente[pedido.clienteId!]!['pedidos'] as int) + 1;
          insightsPorCliente[pedido.clienteId!]!['total'] =
              (insightsPorCliente[pedido.clienteId!]!['total'] as double) +
              (pedido.total ?? 0);

          final fecha = pedido.fecha;
          if (fecha != null) {
            final ultimo =
                insightsPorCliente[pedido.clienteId!]!['ultimoPedido']
                    as DateTime?;
            if (ultimo == null || fecha.isAfter(ultimo)) {
              insightsPorCliente[pedido.clienteId!]!['ultimoPedido'] = fecha;
            }
          }
        }
      }

      return insightsPorCliente.entries.map((entry) {
          final cliente = clientes.firstWhere(
            (c) => c.id == entry.key,
            orElse: () => Cliente(id: -1, nombre: 'Cliente no encontrado'),
          );
          return {
            'id': entry.key,
            'nombre': cliente.nombre,
            'pedidos': entry.value['pedidos'] as int,
            'total': entry.value['total'] as double,
            'ultimoPedido': entry.value['ultimoPedido'] as DateTime?,
            'promedio':
                entry.value['pedidos'] > 0
                    ? (entry.value['total'] as double) /
                        (entry.value['pedidos'] as int)
                    : 0.0,
          };
        }).toList()
        ..sort(
          (a, b) => (b['total'] as double).compareTo(a['total'] as double),
        );
    } catch (e) {
      // Si ocurre cualquier error, retorna una lista vacÃ­a
      return [];
    }
  }

  static Future<List<Map<String, dynamic>>> loadSupplierData(Isar isar) async {
    final proveedores = await isar.proveedors.where().findAll();
    final compras = await isar.compras.where().findAll();

    Map<int, Map<String, dynamic>> dataPorProveedor = {};

    for (final compra in compras) {
      if (compra.proveedorId != null) {
        if (!dataPorProveedor.containsKey(compra.proveedorId)) {
          dataPorProveedor[compra.proveedorId!] = {
            'compras': 0,
            'total': 0.0,
            'ultimaCompra': null,
          };
        }

        dataPorProveedor[compra.proveedorId!]!['compras'] =
            (dataPorProveedor[compra.proveedorId!]!['compras'] as int) + 1;
        dataPorProveedor[compra.proveedorId!]!['total'] =
            (dataPorProveedor[compra.proveedorId!]!['total'] as double) +
            (compra.total ?? 0);

        final fecha = compra.fecha;
        final ultima =
            dataPorProveedor[compra.proveedorId!]!['ultimaCompra'] as DateTime?;
        if (ultima == null || fecha.isAfter(ultima)) {
          dataPorProveedor[compra.proveedorId!]!['ultimaCompra'] = fecha;
        }
      }
    }

    return dataPorProveedor.entries.map((entry) {
        final proveedor = proveedores.firstWhere(
          (p) => p.id == entry.key,
          orElse: () => Proveedor(nombre: 'Proveedor no encontrado'),
        );
        return {
          'id': entry.key,
          'nombre': proveedor.nombre,
          'compras': entry.value['compras'] as int,
          'total': entry.value['total'] as double,
          'ultimaCompra': entry.value['ultimaCompra'] as DateTime?,
          'promedio':
              entry.value['compras'] > 0
                  ? (entry.value['total'] as double) /
                      (entry.value['compras'] as int)
                  : 0.0,
        };
      }).toList()
      ..sort((a, b) => (b['total'] as double).compareTo(a['total'] as double));
  }
}

