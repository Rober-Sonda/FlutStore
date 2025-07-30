import 'package:flutter_riverpod/flutter_riverpod.dart';

final propertiesControllerProvider = Provider((ref) => PropertiesController());

class PropertiesController {
  // Ejemplo de lista de propiedades
  final List<String> properties = ['Color', 'Tamaño', 'Material'];

  List<String> getAll() => properties;

  void add(String property) {
    properties.add(property);
  }

  void remove(String property) {
    properties.remove(property);
  }
}
