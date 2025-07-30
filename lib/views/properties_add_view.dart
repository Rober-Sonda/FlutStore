import 'package:flutter/material.dart';

class PropertiesAddView extends StatelessWidget {
  const PropertiesAddView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Agregar Propiedad')),
      body: const Center(child: Text('Formulario para agregar propiedad.')),
    );
  }
}
