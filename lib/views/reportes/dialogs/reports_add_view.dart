import 'package:flutter/material.dart';

class ReportsAddView extends StatelessWidget {
  const ReportsAddView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Agregar Reporte')),
      body: const Center(child: Text('Formulario para agregar reporte.')),
    );
  }
}
