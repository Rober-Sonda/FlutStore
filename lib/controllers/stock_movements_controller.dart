import 'package:flutter_riverpod/flutter_riverpod.dart';

final stockMovementsControllerProvider = Provider(
  (ref) => StockMovementsController(),
);

class StockMovementsController {
  // Ejemplo de lista de movimientos de stock
  final List<String> movements = ['Entrada: 10', 'Salida: 5'];

  List<String> getAll() => movements;

  void add(String movement) {
    movements.add(movement);
  }

  void remove(String movement) {
    movements.remove(movement);
  }
}
