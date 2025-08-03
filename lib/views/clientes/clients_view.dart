import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../src/app_routes.dart';
import '../../widgets/permission_widget.dart';

class ClientsView extends ConsumerStatefulWidget {
  const ClientsView({super.key});

  @override
  ConsumerState<ClientsView> createState() => _ClientsViewState();
}

class _ClientsViewState extends ConsumerState<ClientsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'Listado de Clientes',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: const Center(
        child: Text(
          'Aquí irá la lista de clientes.',
          style: TextStyle(color: Colors.white),
        ),
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
