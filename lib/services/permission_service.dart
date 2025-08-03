import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import '../models/usuario.dart';
import '../models/rol.dart';
import 'auth_service.dart';

final permissionServiceProvider = Provider<PermissionService>(
  (ref) => PermissionService(),
);

class PermissionService {
  Future<Isar?> get db async {
    return Isar.getInstance();
  }

  /// Verifica si el usuario puede realizar una operación específica
  Future<bool> canPerformAction(
    Usuario? user,
    String action,
    String resource,
  ) async {
    if (user == null) return false;

    try {
      final isar = await db;
      if (isar == null) return false;

      if (user.rolId == null) return false;

      final rol = await isar.rols.get(user.rolId!);
      if (rol == null) return false;

      // Solo administradores tienen todos los permisos
      if (rol.nombre.toLowerCase() == 'administrador') {
        return true;
      }

      // Para otros roles, definir permisos específicos
      switch (rol.nombre.toLowerCase()) {
        case 'vendedor':
          return _canVendedorPerformAction(action, resource);
        case 'inventario':
          return _canInventarioPerformAction(action, resource);
        case 'finanzas':
          return _canFinanzasPerformAction(action, resource);
        default:
          return false;
      }
    } catch (e) {
      print('Error verificando permisos: $e');
      return false;
    }
  }

  /// Permisos para rol Vendedor
  bool _canVendedorPerformAction(String action, String resource) {
    switch (resource) {
      case 'usuarios':
        return false; // Los vendedores no pueden gestionar usuarios
      case 'roles':
        return false; // Los vendedores no pueden gestionar roles
      case 'productos':
        return action == 'read'; // Solo pueden ver productos
      case 'clientes':
        return action == 'create' ||
            action == 'read' ||
            action == 'update'; // Pueden gestionar clientes
      case 'ventas':
        return action == 'create' ||
            action == 'read'; // Pueden crear y ver ventas
      case 'pedidos':
        return action == 'read'; // Solo pueden ver pedidos
      case 'proveedores':
        return action == 'read'; // Solo pueden ver proveedores
      case 'compras':
        return false; // No pueden gestionar compras
      case 'finanzas':
        return action == 'read'; // Solo pueden ver registros financieros
      case 'reportes':
        return action == 'read'; // Solo pueden ver reportes
      case 'configuracion':
        return false; // No pueden modificar configuración
      default:
        return false;
    }
  }

  /// Permisos para rol Inventario
  bool _canInventarioPerformAction(String action, String resource) {
    switch (resource) {
      case 'usuarios':
        return false;
      case 'roles':
        return false;
      case 'productos':
        return action == 'create' ||
            action == 'read' ||
            action == 'update'; // Pueden gestionar productos
      case 'clientes':
        return action == 'read'; // Solo pueden ver clientes
      case 'ventas':
        return action == 'read'; // Solo pueden ver ventas
      case 'pedidos':
        return action == 'create' ||
            action == 'read' ||
            action == 'update'; // Pueden gestionar pedidos
      case 'proveedores':
        return action == 'create' ||
            action == 'read' ||
            action == 'update'; // Pueden gestionar proveedores
      case 'compras':
        return action == 'create' ||
            action == 'read' ||
            action == 'update'; // Pueden gestionar compras
      case 'finanzas':
        return action == 'read'; // Solo pueden ver registros financieros
      case 'reportes':
        return action == 'read'; // Solo pueden ver reportes
      case 'configuracion':
        return false;
      default:
        return false;
    }
  }

  /// Permisos para rol Finanzas
  bool _canFinanzasPerformAction(String action, String resource) {
    switch (resource) {
      case 'usuarios':
        return false;
      case 'roles':
        return false;
      case 'productos':
        return action == 'read'; // Solo pueden ver productos
      case 'clientes':
        return action == 'read'; // Solo pueden ver clientes
      case 'ventas':
        return action == 'read'; // Solo pueden ver ventas
      case 'pedidos':
        return action == 'read'; // Solo pueden ver pedidos
      case 'proveedores':
        return action == 'read'; // Solo pueden ver proveedores
      case 'compras':
        return action == 'read'; // Solo pueden ver compras
      case 'finanzas':
        return action == 'create' ||
            action == 'read' ||
            action == 'update'; // Pueden gestionar finanzas
      case 'reportes':
        return action == 'create' ||
            action == 'read' ||
            action == 'update'; // Pueden gestionar reportes
      case 'configuracion':
        return false;
      default:
        return false;
    }
  }

  // Métodos específicos para operaciones comunes
  Future<bool> canCreateUser(Usuario? user) async {
    return await canPerformAction(user, 'create', 'usuarios');
  }

  Future<bool> canUpdateUser(Usuario? user) async {
    return await canPerformAction(user, 'update', 'usuarios');
  }

  Future<bool> canDeleteUser(Usuario? user) async {
    return await canPerformAction(user, 'delete', 'usuarios');
  }

  Future<bool> canCreateProduct(Usuario? user) async {
    return await canPerformAction(user, 'create', 'productos');
  }

  Future<bool> canUpdateProduct(Usuario? user) async {
    return await canPerformAction(user, 'update', 'productos');
  }

  Future<bool> canDeleteProduct(Usuario? user) async {
    return await canPerformAction(user, 'delete', 'productos');
  }

  Future<bool> canCreateClient(Usuario? user) async {
    return await canPerformAction(user, 'create', 'clientes');
  }

  Future<bool> canUpdateClient(Usuario? user) async {
    return await canPerformAction(user, 'update', 'clientes');
  }

  Future<bool> canDeleteClient(Usuario? user) async {
    return await canPerformAction(user, 'delete', 'clientes');
  }

  Future<bool> canCreateProvider(Usuario? user) async {
    return await canPerformAction(user, 'create', 'proveedores');
  }

  Future<bool> canUpdateProvider(Usuario? user) async {
    return await canPerformAction(user, 'update', 'proveedores');
  }

  Future<bool> canDeleteProvider(Usuario? user) async {
    return await canPerformAction(user, 'delete', 'proveedores');
  }

  Future<bool> canCreateOrder(Usuario? user) async {
    return await canPerformAction(user, 'create', 'pedidos');
  }

  Future<bool> canUpdateOrder(Usuario? user) async {
    return await canPerformAction(user, 'update', 'pedidos');
  }

  Future<bool> canDeleteOrder(Usuario? user) async {
    return await canPerformAction(user, 'delete', 'pedidos');
  }

  Future<bool> canCreatePurchase(Usuario? user) async {
    return await canPerformAction(user, 'create', 'compras');
  }

  Future<bool> canUpdatePurchase(Usuario? user) async {
    return await canPerformAction(user, 'update', 'compras');
  }

  Future<bool> canDeletePurchase(Usuario? user) async {
    return await canPerformAction(user, 'delete', 'compras');
  }

  Future<bool> canCreateFinancialRecord(Usuario? user) async {
    return await canPerformAction(user, 'create', 'finanzas');
  }

  Future<bool> canUpdateFinancialRecord(Usuario? user) async {
    return await canPerformAction(user, 'update', 'finanzas');
  }

  Future<bool> canDeleteFinancialRecord(Usuario? user) async {
    return await canPerformAction(user, 'delete', 'finanzas');
  }

  Future<bool> canCreateReport(Usuario? user) async {
    return await canPerformAction(user, 'create', 'reportes');
  }

  Future<bool> canUpdateReport(Usuario? user) async {
    return await canPerformAction(user, 'update', 'reportes');
  }

  Future<bool> canDeleteReport(Usuario? user) async {
    return await canPerformAction(user, 'delete', 'reportes');
  }

  Future<bool> canUpdateConfiguration(Usuario? user) async {
    return await canPerformAction(user, 'update', 'configuracion');
  }
}
