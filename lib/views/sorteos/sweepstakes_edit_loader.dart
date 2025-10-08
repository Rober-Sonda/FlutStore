import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/sorteo.dart';
import '../../services/isar_service.dart';
import 'sweepstakes_edit_view.dart';

class SweepstakesEditLoader extends ConsumerWidget {
  final int sorteoId;
  const SweepstakesEditLoader({super.key, required this.sorteoId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder<Sorteo?>(
      future: ref
          .read(isarServiceProvider)
          .db
          .then((isar) => isar.sorteos.get(sorteoId)),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        final sorteo = snapshot.data;
        if (sorteo == null) {
          return const Scaffold(
            body: Center(child: Text('Sorteo no encontrado')),
          );
        }
        return SweepstakesEditView(sorteo: sorteo);
      },
    );
  }
}
