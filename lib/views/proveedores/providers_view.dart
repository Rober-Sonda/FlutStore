import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tienda_app/models/app_theme.dart';
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
      appBar: AppBar(
        title: const Text('Proveedores'),
      ),
      body: Column(
        children: [
          // NUEVO: Descripción de la sección de proveedores
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              color: Colors.blueGrey[900],
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  'Aquí puedes registrar y consultar los datos de tus proveedores. Mantén actualizada la información para gestionar tus compras y reposiciones de stock.',
                  style: const TextStyle(color: Colors.white70, fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                'Aquí irá la lista de proveedores.',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
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
