import 'package:flutter/material.dart';

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.inventory_2_outlined,
            size: 64,
            color: Colors.white54,
          ),
          SizedBox(height: 16),
          Text(
            'No hay productos registrados',
            style: TextStyle(
              color: Colors.white54,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Toca el botón + para agregar tu primer producto',
            style: TextStyle(
              color: Colors.white38,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
} 