import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../src/app_routes.dart';
import '../../widgets/permission_widget.dart';
import '../../providers/clientes_provider.dart';

class ClientsView extends ConsumerStatefulWidget {
  const ClientsView({super.key});

  @override
  ConsumerState<ClientsView> createState() => _ClientsViewState();
}

class _ClientsViewState extends ConsumerState<ClientsView> {
  @override
  Widget build(BuildContext context) {
    final clientesAsync = ref.watch(clientesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Clientes')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              color: Colors.blueGrey[900],
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  'En esta sección puedes registrar y consultar los datos de tus clientes. Mantén actualizada la información para mejorar la atención y el seguimiento de ventas.',
                  style: const TextStyle(color: Colors.white70, fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Expanded(
            child: clientesAsync.when(
              data: (clientes) {
                if (clientes.isEmpty) {
                  return const Center(
                    child: Text(
                      'No hay clientes registrados.',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: clientes.length,
                  itemBuilder: (context, index) {
                    final cliente = clientes[index];
                    return ListTile(
                      title: Text(
                        cliente.nombre,
                        style: const TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        cliente.email ?? '',
                        style: const TextStyle(color: Colors.white70),
                      ),
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error:
                  (err, stack) => Center(
                    child: Text(
                      'Error: $err',
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
            ),
          ),
        ],
      ),
      floatingActionButton: PermissionFAB(
        onPressed: () {
          context.push(AppRoutes.clientAdd);
        },
        action: 'create',
        resource: 'clientes',
        icon: Icons.add,
        tooltip: 'Agregar Cliente',
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
    );
  }
}
