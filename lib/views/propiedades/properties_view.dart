import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../src/app_routes.dart';
import '../../widgets/permission_widget.dart';

class PropertiesView extends ConsumerStatefulWidget {
  const PropertiesView({super.key});

  @override
  ConsumerState<PropertiesView> createState() => _PropertiesViewState();
}

class _PropertiesViewState extends ConsumerState<PropertiesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Propiedades', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: const Center(
        child: Text(
          'Aquí irá la lista de propiedades.',
          style: TextStyle(color: Colors.white),
        ),
      ),
      floatingActionButton: PermissionFAB(
        onPressed: () {
          context.go(AppRoutes.propertyAdd);
        },
        action: 'create',
        resource:
            'productos', // Las propiedades están relacionadas con productos
        icon: Icons.add,
        tooltip: 'Agregar Propiedad',
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
    );
  }
}
