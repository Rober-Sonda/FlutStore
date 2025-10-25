import 'package:flutter/material.dart';

class SectionColors {
  static const Map<String, Color> sectionColors = {
    'dashboard': Color(0xFF2196F3), // Azul
    'products': Color(0xFF4CAF50), // Verde
    'categories': Color(0xFF9C27B0), // Púrpura
    'providers': Color(0xFFFF9800), // Naranja
    'purchases': Color(0xFF795548), // Marrón
    'carritoCompra': Color(0xFF607D8B), // Azul gris
    'orders': Color(0xFFE91E63), // Rosa
    'clients': Color(0xFF00BCD4), // Cian
    'accountBalance': Color(0xFF8BC34A), // Verde claro
    'sales': Color(0xFFF44336), // Rojo
    'stockMovements': Color(0xFF9E9E9E), // Gris
    'financialRecords': Color(0xFFFF5722), // Rojo oscuro
    'reports': Color(0xFF673AB7), // Púrpura oscuro
    'roles': Color(0xFF3F51B5), // Índigo
    'users': Color(0xFF009688), // Verde azulado
    'settings': Color(0xFF607D8B), // Azul gris
    'newPurchase': Color(0xFF795548), // Marrón
    'newSale': Color(0xFFF44336), // Rojo
    'offers': Color(0xFFFFC107), // Amarillo
    'cashFlow': Color(0xFF4CAF50), // Verde
    'profitLoss': Color(0xFFE91E63), // Rosa
    'cashRegister': Color(0xFF2196F3), // Azul
    'sweepstakes': Color(0xFF9C27B0), // Púrpura
  };

  static Color getColorForSection(String sectionName) {
    return sectionColors[sectionName.toLowerCase()] ?? Colors.grey;
  }

  static Color getColorForRoute(String route) {
    // Mapear rutas a nombres de sección
    final routeToSection = {
      AppRoutes.dashboard: 'dashboard',
      AppRoutes.products: 'products',
      AppRoutes.categories: 'categories',
      AppRoutes.providers: 'providers',
      AppRoutes.purchases: 'purchases',
      AppRoutes.carritoCompra: 'carritoCompra',
      AppRoutes.orders: 'orders',
      AppRoutes.clients: 'clients',
      AppRoutes.accountBalance: 'accountBalance',
      AppRoutes.sales: 'sales',
      AppRoutes.stockMovements: 'stockMovements',
      AppRoutes.financialRecords: 'financialRecords',
      AppRoutes.reports: 'reports',
      AppRoutes.roles: 'roles',
      AppRoutes.users: 'users',
      AppRoutes.settings: 'settings',
      AppRoutes.newPurchase: 'newPurchase',
      AppRoutes.newSale: 'newSale',
      AppRoutes.offers: 'offers',
      AppRoutes.cashFlow: 'cashFlow',
      AppRoutes.profitLoss: 'profitLoss',
      AppRoutes.cashRegister: 'cashRegister',
      AppRoutes.sweepstakes: 'sweepstakes',
    };

    final sectionName = routeToSection[route];
    return getColorForSection(sectionName ?? 'default');
  }
}

// Constantes para las nuevas rutas
class AppRoutes {
  static const String dashboard = '/dashboard';
  static const String products = '/products';
  static const String categories = '/categories';
  static const String providers = '/providers';
  static const String purchases = '/purchases';
  static const String carritoCompra = '/carrito-compra';
  static const String orders = '/orders';
  static const String clients = '/clients';
  static const String accountBalance = '/account-balance';
  static const String sales = '/sales';
  static const String stockMovements = '/stock-movements';
  static const String financialRecords = '/financial-records';
  static const String reports = '/reports';
  static const String roles = '/roles';
  static const String users = '/users';
  static const String settings = '/settings';

  // Nuevas rutas
  static const String newPurchase = '/purchases/new';
  static const String newSale = '/sales/new';
  static const String offers = '/offers';
  static const String cashFlow = '/cash-flow';
  static const String profitLoss = '/profit-loss';
  static const String cashRegister = '/cash-register';
  static const String sweepstakes = '/sweepstakes';

  // Rutas para registros financieros
  static const String financialRecordAdd = '/financial-records/add';
  static const String financialRecordEdit = '/financial-records/edit';

  // Rutas adicionales para categorías
  static const String categoryAdd = '/categories/add';
  static const String categoryEdit = '/categories/edit';

  // Rutas adicionales para productos
  static const String productAdd = '/products/add';
  static const String productEdit = '/products/edit';
}
