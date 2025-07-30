import 'package:flutter/material.dart';

class StockMovementsView extends StatelessWidget {
  const StockMovementsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Movimientos de Stock')),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Listado de Movimientos de Stock',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const Expanded(
            child: Center(
              child: Text('Aquí irá la lista de movimientos de stock.'),
            ),
          ),
        ],
      ),
      // FloatingActionButton eliminado para solo consulta
    );
  }
}
