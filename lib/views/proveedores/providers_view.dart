import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../src/app_routes.dart';
import '../../widgets/permission_widget.dart';

class ProvidersView extends ConsumerStatefulWidget {
  const ProvidersView({super.key});

  @override
  ConsumerState<ProvidersView> createState() => _ProvidersViewState();
}

class _ProvidersViewState extends ConsumerState<ProvidersView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'Listado de Proveedores',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: const Center(
        child: Text(
          'Aquí irá la lista de proveedores.',
          style: TextStyle(color: Colors.white),
        ),
      ),
      floatingActionButton: PermissionFAB(
        onPressed: () {
          context.push(AppRoutes.providerAdd);
        },
        action: 'create',
        resource: 'proveedores',
        icon: Icons.add,
        tooltip: 'Agregar Proveedor',
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
    );
  }
}
