import 'package:flutter/material.dart';

class RolesAddView extends StatelessWidget {
  const RolesAddView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Agregar Rol')),
      body: const Center(child: Text('Formulario para agregar rol.')),
    );
  }
}
