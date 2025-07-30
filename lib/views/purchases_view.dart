// lib/views/purchases_view.dart (pantalla dummy para Compras)
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tienda_app/src/app_routes.dart';

class PurchasesView extends StatelessWidget {
  const PurchasesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Compras')),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Listado de Compras',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const Expanded(
            child: Center(child: Text('Aquí irá la lista de compras.')),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push(AppRoutes.purchaseAdd);
        },
        tooltip: 'Agregar Compra',
        child: const Icon(Icons.add),
      ),
    );
  }
}
