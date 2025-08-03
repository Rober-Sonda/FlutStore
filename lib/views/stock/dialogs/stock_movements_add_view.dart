import 'package:flutter/material.dart';

class StockMovementsAddView extends StatelessWidget {
  const StockMovementsAddView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Agregar Movimiento de Stock')),
      body: const Center(
        child: Text('Formulario para agregar movimiento de stock.'),
      ),
    );
  }
}
