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
      appBar: AppBar(
        title: const Text('Propiedades'),
      ),
      body: Column(
        children: [
          // NUEVO: Descripción de la sección de propiedades
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              color: Colors.blueGrey[900],
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  'Define y gestiona las propiedades que pueden tener los productos y categorías. Personaliza los campos según las necesidades de tu negocio.',
                  style: const TextStyle(color: Colors.white70, fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          const Expanded(
            child: Center(
              child: Text(
                'Aquí irá la lista de propiedades.',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
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
