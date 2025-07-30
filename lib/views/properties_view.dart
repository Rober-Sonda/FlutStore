import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tienda_app/src/app_routes.dart';

class PropertiesView extends StatelessWidget {
  const PropertiesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Propiedades')),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Listado de Propiedades',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const Expanded(
            child: Center(child: Text('Aquí irá la lista de propiedades.')),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.go(AppRoutes.propertyAdd);
        },
        tooltip: 'Agregar Propiedad',
        child: const Icon(Icons.add),
      ),
    );
  }
}
