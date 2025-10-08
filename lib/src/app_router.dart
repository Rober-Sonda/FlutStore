import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tienda_app/views/sorteos/sweepstakes_edit_loader.dart';
import 'package:tienda_app/views/sorteos/sweepstakes_edit_view.dart';
import '../views/productos/dialogs/product_add_edit_view.dart';
import '../views/main_view.dart';
import '../views/dashboard/dashboard_view.dart';
import '../views/productos/products_view.dart';
import '../views/proveedores/providers_view.dart';
import '../views/proveedores/dialogs/provider_add_edit_view.dart';
import '../views/compras/purchases_view.dart';
import '../views/clientes/clients_view.dart';
import '../views/clientes/dialogs/client_add_edit_view.dart';
import '../views/ventas/sales_view.dart';
import '../views/reportes/reports_view.dart';
import '../views/configuracion/settings_view.dart';
import '../views/categorias/categories_view.dart';
import '../views/stock/stock_movements_view.dart';
import '../views/propiedades/properties_view.dart';
import '../views/registros_financieros/financial_records_view.dart';
import '../views/roles/roles_view.dart';
import '../views/roles/dialogs/role_add_edit_view.dart';
import '../views/usuarios/users_view.dart';
import '../views/usuarios/dialogs/user_add_edit_view.dart';
import '../views/pedidos/orders_view.dart';
import '../views/carrito/carrito_compra_view.dart';
import '../views/autenticacion/login_view.dart';
import '../views/ofertas/offers_view.dart';
import '../views/finanzas/cash_flow_view.dart';
import '../views/finanzas/cash_register_view.dart';
import '../views/sorteos/sweepstakes_view.dart';
import '../views/finanzas/fixed_expenses_view.dart';
import '../views/ofertas/dialogs/offer_add_edit_view.dart';
import '../views/finanzas/dialogs/cash_flow_add_edit_view.dart';
import '../views/finanzas/dialogs/cash_register_add_edit_view.dart';
import '../views/cuenta_corriente/cuenta_corriente_view.dart';
import '../views/configuracion/business_config_view.dart';
import '../views/pedidos/pedidos_proveedor_view.dart';
import '../views/pedidos/dialogs/pedido_proveedor_add_edit_view.dart';
import '../views/reportes/utilidad_report_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/auth_service.dart';
import '../views/sorteos/dialogs/sweepstake_add_edit_view.dart';
import '../views/cuenta_corriente/dialogs/cuenta_corriente_add_edit_view.dart';
import '../views/configuracion/optimization_view.dart';
import '../views/finanzas/dialogs/fixed_expense_add_edit_view.dart';
import '../views/ventas/dialogs/sale_add_edit_view.dart';
import '../views/compras/dialogs/purchase_add_edit_view.dart';
import '../views/compras/dialogs/purchase_add_view.dart';
import '../views/registros_financieros/dialogs/financial_record_add_edit_view.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final isAuthenticated = ref.watch(isAuthenticatedProvider);

  return GoRouter(
    initialLocation: isAuthenticated ? '/dashboard' : '/login',
    redirect: (context, state) {
      final isLoggedIn = isAuthenticated;
      final isGoingToLogin = state.matchedLocation == '/login';

      if (!isLoggedIn && !isGoingToLogin) {
        return '/login';
      }

      if (isLoggedIn && isGoingToLogin) {
        return '/dashboard';
      }

      return null;
    },
    routes: [
      // Ruta de login
      GoRoute(path: '/login', builder: (context, state) => const LoginView()),

      // Rutas protegidas
      ShellRoute(
        builder: (context, state, child) => MainView(child: child),
        routes: [
          GoRoute(
            path: '/dashboard',
            builder: (context, state) => const DashboardView(),
          ),
          GoRoute(
            path: '/products',
            builder: (context, state) => const ProductsView(),
          ),
          GoRoute(
            path: '/products/add',
            builder: (context, state) => const ProductAddEditView(),
          ),
          GoRoute(
            path: '/products/edit/:id',
            builder: (context, state) {
              final id = int.parse(state.pathParameters['id']!);
              return ProductAddEditView(productId: id);
            },
          ),
          GoRoute(
            path: '/providers',
            builder: (context, state) => const ProvidersView(),
          ),
          GoRoute(
            path: '/providers/add',
            builder: (context, state) => const ProviderAddEditView(),
          ),
          GoRoute(
            path: '/providers/edit/:id',
            builder: (context, state) {
              final id = int.parse(state.pathParameters['id']!);
              // TODO: Cargar proveedor por ID y pasarlo al constructor
              return const ProviderAddEditView();
            },
          ),
          GoRoute(
            path: '/clients',
            builder: (context, state) => const ClientsView(),
          ),
          GoRoute(
            path: '/clients/add',
            builder: (context, state) => const ClientAddEditView(),
          ),
          GoRoute(
            path: '/clients/edit/:id',
            builder: (context, state) {
              final id = int.parse(state.pathParameters['id']!);
              // TODO: Cargar cliente por ID y pasarlo al constructor
              return const ClientAddEditView();
            },
          ),
          GoRoute(
            path: '/orders',
            builder: (context, state) => const OrdersView(),
          ),
          GoRoute(
            path: '/carrito-compra',
            builder: (context, state) => const CarritoCompraView(),
          ),
          // Nuevas rutas
          GoRoute(
            path: '/offers',
            builder: (context, state) => const OffersView(),
          ),
          GoRoute(
            path: '/offers/add',
            builder: (context, state) => const OfferAddEditView(),
          ),
          GoRoute(
            path: '/offers/edit/:id',
            builder: (context, state) {
              final id = int.parse(state.pathParameters['id']!);
              return OfferAddEditView(ofertaId: id);
            },
          ),
          // Finanzas (unificadas)
          GoRoute(
            path: '/finanzas',
            builder: (context, state) => const CashFlowView(),
          ),
          GoRoute(
            path: '/finanzas/caja',
            builder: (context, state) => const CashRegisterView(),
          ),
          GoRoute(
            path: '/finanzas/gastos-fijos',
            builder: (context, state) => const FixedExpensesView(),
          ),
          GoRoute(
            path: '/finanzas/add-gasto-fijo',
            builder: (context, state) => const FixedExpenseAddEditView(),
          ),
          GoRoute(
            path: '/finanzas/add-flujo',
            builder: (context, state) => const CashFlowAddEditView(),
          ),
          GoRoute(
            path: '/finanzas/add-caja',
            builder: (context, state) => const CashRegisterAddEditView(),
          ),
          // Eliminadas las rutas individuales de /cash-flow, /cash-register, /fixed-expenses
          GoRoute(
            path: '/account-balance',
            builder: (context, state) => const CuentaCorrienteView(),
          ),
          GoRoute(
            path: '/account-balance/add',
            builder: (context, state) => const CuentaCorrienteAddEditView(),
          ),
          GoRoute(
            path: '/account-balance/edit/:id',
            builder: (context, state) {
              final id = int.parse(state.pathParameters['id']!);
              return CuentaCorrienteAddEditView(cuentaId: id);
            },
          ),
          // Ventas
          GoRoute(
            path: '/sales',
            builder: (context, state) => const SalesView(),
          ),
          GoRoute(
            path: '/sales/add',
            builder: (context, state) => const SaleAddEditView(),
          ),
          GoRoute(
            path: '/sales/edit/:id',
            builder: (context, state) {
              final id = int.parse(state.pathParameters['id']!);
              return SaleAddEditView(ventaId: id);
            },
          ),
          // Compras
          GoRoute(
            path: '/purchases',
            builder: (context, state) => const PurchasesView(),
          ),
          GoRoute(
            path: '/purchases/add',
            builder: (context, state) => const PurchaseAddView(),
          ),
          GoRoute(
            path: '/purchases/edit/:id',
            builder: (context, state) {
              final id = int.parse(state.pathParameters['id']!);
              return PurchaseAddEditView(compraId: id);
            },
          ),
          GoRoute(
            path: '/reports',
            builder: (context, state) => const ReportsView(),
          ),
          GoRoute(
            path: '/reports/utilidad',
            builder: (context, state) => const UtilidadReportView(),
          ),
          GoRoute(
            path: '/settings',
            builder: (context, state) => const SettingsView(),
          ),
          GoRoute(
            path: '/categories',
            builder: (context, state) => const CategoriesView(),
          ),
          GoRoute(
            path: '/stock-movements',
            builder: (context, state) => const StockMovementsView(),
          ),
          GoRoute(
            path: '/properties',
            builder: (context, state) => const PropertiesView(),
          ),
          GoRoute(
            path: '/financial-records',
            builder: (context, state) => const FinancialRecordsView(),
          ),
          GoRoute(
            path: '/financial-records/add',
            builder: (context, state) => const FinancialRecordAddEditView(),
          ),
          GoRoute(
            path: '/financial-records/edit/:id',
            builder: (context, state) {
              final id = int.parse(state.pathParameters['id']!);
              return FinancialRecordAddEditView(registroId: id);
            },
          ),
          // Roles
          GoRoute(
            path: '/roles',
            builder: (context, state) => const RolesView(),
          ),
          GoRoute(
            path: '/roles/add',
            builder: (context, state) => const RoleAddEditView(),
          ),
          GoRoute(
            path: '/roles/edit/:id',
            builder: (context, state) {
              final id = int.parse(state.pathParameters['id']!);
              return RoleAddEditView(roleId: id);
            },
          ),
          // Usuarios
          GoRoute(
            path: '/users',
            builder: (context, state) => const UsersView(),
          ),
          GoRoute(
            path: '/users/add',
            builder: (context, state) => const UserAddEditView(),
          ),
          GoRoute(
            path: '/users/edit/:id',
            builder: (context, state) {
              final id = int.parse(state.pathParameters['id']!);
              return UserAddEditView(userId: id);
            },
          ),
          GoRoute(
            path: '/sweepstakes',
            builder: (context, state) => const SweepstakesView(),
          ),
          GoRoute(
            path: '/sweepstakes/add',
            builder: (context, state) => const SweepstakesEditView(),
          ),
          GoRoute(
            path: '/sweepstakes/edit/:id',
            builder: (context, state) {
              final id = int.tryParse(state.pathParameters['id'] ?? '');
              if (id == null) {
                return const Scaffold(
                  body: Center(child: Text('ID de sorteo inválido')),
                );
              }
              return SweepstakesEditLoader(sorteoId: id);
            },
          ),
          // Configuración del Negocio
          GoRoute(
            path: '/business-config',
            builder: (context, state) => const BusinessConfigView(),
          ),
          GoRoute(
            path: '/optimization',
            builder: (context, state) => const OptimizationView(),
          ),
          // Pedidos a Proveedores
          GoRoute(
            path: '/pedidos-proveedor',
            builder: (context, state) => const PedidosProveedorView(),
          ),
          GoRoute(
            path: '/pedidos-proveedor/add',
            builder: (context, state) => const PedidoProveedorAddEditView(),
          ),
          GoRoute(
            path: '/pedidos-proveedor/edit/:id',
            builder: (context, state) {
              final id = int.parse(state.pathParameters['id']!);
              return PedidoProveedorAddEditView(pedidoId: id);
            },
          ),
        ],
      ),
    ],
  );
});
