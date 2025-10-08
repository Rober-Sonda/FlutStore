import 'package:flutter_riverpod/flutter_riverpod.dart';

class CarritoNotifier extends StateNotifier<List<Map<String, dynamic>>> {
  CarritoNotifier() : super([]);

  void agregar(Map<String, dynamic> item) {
    final index = state.indexWhere((e) =>
      e['producto'].id == item['producto'].id &&
      (e['proveedor']?.id ?? 0) == (item['proveedor']?.id ?? 0)
    );
    if (index >= 0) {
      final nuevo = List<Map<String, dynamic>>.from(state);
      nuevo[index]['cantidad'] += item['cantidad'];
      state = nuevo;
    } else {
      state = [...state, item];
    }
  }

  void limpiar() => state = [];

  // Métodos para incrementar, decrementar y eliminar items del carrito
  void incrementarCantidad(int index) {
    if (index >= 0 && index < state.length) {
      final nuevo = List<Map<String, dynamic>>.from(state);
      nuevo[index]['cantidad'] += 1;
      state = nuevo;
    }
  }

  void decrementarCantidad(int index) {
    if (index >= 0 && index < state.length && state[index]['cantidad'] > 1) {
      final nuevo = List<Map<String, dynamic>>.from(state);
      nuevo[index]['cantidad'] -= 1;
      state = nuevo;
    }
  }

  void eliminarItem(int index) {
    if (index >= 0 && index < state.length) {
      final nuevo = List<Map<String, dynamic>>.from(state);
      nuevo.removeAt(index);
      state = nuevo;
    }
  }

  // NUEVO: Actualizar cantidad directamente
  void actualizarCantidad(int index, int nuevaCantidad) {
    if (index >= 0 && index < state.length && nuevaCantidad > 0) {
      final nuevo = List<Map<String, dynamic>>.from(state);
      nuevo[index]['cantidad'] = nuevaCantidad;
      state = nuevo;
    }
  }

  // NUEVO: Actualizar proveedor directamente
  void actualizarProveedor(int index, dynamic nuevoProveedor) {
    if (index >= 0 && index < state.length) {
      final nuevo = List<Map<String, dynamic>>.from(state);
      nuevo[index]['proveedor'] = nuevoProveedor;
      state = nuevo;
    }
  }
}

final carritoProvider = StateNotifierProvider<CarritoNotifier, List<Map<String, dynamic>>>(
  (ref) => CarritoNotifier(),
);
