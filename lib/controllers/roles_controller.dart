import 'package:flutter_riverpod/flutter_riverpod.dart';

final rolesControllerProvider = Provider((ref) => RolesController());

class RolesController {
  // Ejemplo de lista de roles
  final List<String> roles = ['Administrador', 'Vendedor', 'Cajero'];

  List<String> getAll() => roles;

  void add(String role) {
    roles.add(role);
  }

  void remove(String role) {
    roles.remove(role);
  }
}
