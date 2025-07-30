import 'package:go_router/go_router.dart';
import 'package:tienda_app/views/product_add_edit_view.dart';
import '../views/main_view.dart';
import '../views/dashboard_view.dart';
import '../views/products_view.dart';
import '../views/providers_view.dart';
import '../views/purchases_view.dart';
import '../views/clients_view.dart';
import '../views/sales_view.dart';
import '../views/reports_view.dart';
import '../views/settings_view.dart';
import '../views/categories_view.dart';
import '../views/stock_movements_view.dart';
import '../views/properties_view.dart';
import '../views/financial_records_view.dart';
import '../views/roles_view.dart';
import '../views/role_add_edit_view.dart';
import '../views/users_view.dart';
import '../views/orders_view.dart';
import '../views/carrito_compra_view.dart';
import '../views/login_view.dart';
import '../views/offers_view.dart';
import '../views/cash_flow_view.dart';
import '../views/profit_loss_view.dart';
import '../views/cash_register_view.dart';
import '../views/sweepstakes_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/auth_service.dart';

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
            path: '/purchases',
            builder: (context, state) => const PurchasesView(),
          ),
          GoRoute(
            path: '/clients',
            builder: (context, state) => const ClientsView(),
          ),
          GoRoute(
            path: '/sales',
            builder: (context, state) => const SalesView(),
          ),
          GoRoute(
            path: '/reports',
            builder: (context, state) => const ReportsView(),
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
          GoRoute(
            path: '/users',
            builder: (context, state) => const UsersView(),
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
            path: '/cash-flow',
            builder: (context, state) => const CashFlowView(),
          ),
          GoRoute(
            path: '/profit-loss',
            builder: (context, state) => const ProfitLossView(),
          ),
          GoRoute(
            path: '/cash-register',
            builder: (context, state) => const CashRegisterView(),
          ),
          GoRoute(
            path: '/sweepstakes',
            builder: (context, state) => const SweepstakesView(),
          ),
        ],
      ),
    ],
  );
});
