import 'package:flutter/material.dart';

class StockMovementsView extends StatelessWidget {
  const StockMovementsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movimientos de Stock'),
      ),
      body: Column(
        children: [
          // NUEVO: Descripción de la sección de movimientos de stock
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              color: Colors.blueGrey[900],
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  'Consulta y registra los movimientos de stock de tus productos. Controla entradas, salidas y ajustes para mantener tu inventario actualizado.',
                  style: const TextStyle(color: Colors.white70, fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                'Aquí irá la lista de movimientos de stock.',
                style: TextStyle(color: Colors.grey[300]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}