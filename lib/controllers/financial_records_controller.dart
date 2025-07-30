import 'package:flutter_riverpod/flutter_riverpod.dart';

final financialRecordsControllerProvider = Provider(
  (ref) => FinancialRecordsController(),
);

class FinancialRecordsController {
  // Ejemplo de lista de registros financieros
  final List<String> _records = ['Ingreso: \$1000', 'Egreso: \$500'];

  List<String> getAll() => _records;

  void add(String record) {
    _records.add(record);
  }

  void remove(String record) {
    _records.remove(record);
  }
}
