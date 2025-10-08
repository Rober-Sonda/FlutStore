import 'package:flutter_riverpod/flutter_riverpod.dart';
// Importa tu modelo y servicio de clientes
import '../models/cliente.dart';
import '../services/cliente_service.dart';

// Provider que obtiene la lista de clientes
final clientesProvider = FutureProvider<List<Cliente>>((ref) async {
  return await ClienteService().getClientes();
});
