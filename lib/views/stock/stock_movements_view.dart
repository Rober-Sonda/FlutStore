import 'package:flutter/material.dart';

class StockMovementsView extends StatelessWidget {
  const StockMovementsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[900],
              border: Border(bottom: BorderSide(color: Colors.grey[700]!)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Movimientos de Stock',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange[700],
                    ),
                  ),
                ),
              ],
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
