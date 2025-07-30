import 'package:isar/isar.dart';

part 'registrofinanciero.g.dart';

@Collection()
class RegistroFinanciero {
  Id id = Isar.autoIncrement;

  String? tipo;
  double? monto;
  DateTime? fecha;
}
