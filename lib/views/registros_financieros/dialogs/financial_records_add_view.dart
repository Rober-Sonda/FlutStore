import 'package:flutter/material.dart';

class FinancialRecordsAddView extends StatelessWidget {
  const FinancialRecordsAddView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Agregar Registro Financiero')),
      body: const Center(
        child: Text('Formulario para agregar registro financiero.'),
      ),
    );
  }
}
