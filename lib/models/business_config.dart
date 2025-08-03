import 'package:isar/isar.dart';

part 'business_config.g.dart';

@Collection()
class BusinessConfig {
  Id id = Isar.autoIncrement;

  late String businessName;
  String? logoUrl;
  String? address;
  String? city;
  String? phone;
  String? whatsapp;
  String? email;
  String? website;
  String? cuit;
  String? description;
  DateTime? lastUpdated;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is BusinessConfig && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
} 