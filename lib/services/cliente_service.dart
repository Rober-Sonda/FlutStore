import '../models/cliente.dart';
import 'package:isar/isar.dart';

class ClienteService {
  Future<List<Cliente>> getClientes() async {
    final isar = Isar.getInstance(); // Obtén la instancia de Isar
    if (isar == null) {
      throw Exception('Isar no inicializado');
    }
    // Consulta todos los clientes de la colección
    final clientes = await isar.clientes.where().findAll();
    return clientes;
  }
}
