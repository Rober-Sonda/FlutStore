import 'package:flutter/foundation.dart';

void logDev(Object? message) {
  if (kDebugMode) {
    // Solo muestra logs en modo desarrollo
    print(message);
  }
}
