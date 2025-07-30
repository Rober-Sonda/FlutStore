import 'package:flutter_riverpod/flutter_riverpod.dart';

final reportsControllerProvider = Provider((ref) => ReportsController());

class ReportsController {
  // Ejemplo de lista de reportes
  final List<String> reports = [
    'Ventas Mensuales',
    'Stock Bajo',
    'Clientes Nuevos',
  ];

  List<String> getAll() => reports;

  void add(String report) {
    reports.add(report);
  }

  void remove(String report) {
    reports.remove(report);
  }
}
