import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../src/app_routes.dart';
import '../../widgets/permission_widget.dart';

class FinancialRecordsView extends ConsumerStatefulWidget {
  const FinancialRecordsView({super.key});

  @override
  ConsumerState<FinancialRecordsView> createState() =>
      _FinancialRecordsViewState();
}

class _FinancialRecordsViewState extends ConsumerState<FinancialRecordsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'Registros Financieros',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: const Center(
        child: Text(
          'Aquí irá la lista de registros financieros.',
          style: TextStyle(color: Colors.white),
        ),
      ),
      floatingActionButton: PermissionFAB(
        onPressed: () {
          context.go(AppRoutes.financialRecordAdd);
        },
        action: 'create',
        resource: 'finanzas',
        icon: Icons.add,
        tooltip: 'Agregar Registro',
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
    );
  }
}
