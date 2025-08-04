class AppRoutes {
  // Dashboard
  static const dashboard = '/dashboard';

  // Productos
  static const products = '/products';
  static const productAdd = '/products/add';
  static const productEdit = '/products/edit/:id';

  // Proveedores
  static const providers = '/providers';
  static const providerAdd = '/providers/add';
  static const providerEdit = '/providers/edit/:id';
  static const providerDetail = '/providers/:id';

  // Compras
  static const purchases = '/purchases';
  static const purchaseAdd = '/purchases/add';
  static const purchaseEdit = '/purchases/edit/:id';
  static const purchaseDetail = '/purchases/:id';
  static const newPurchase = '/purchases/new';

  // Clientes
  static const clients = '/clients';
  static const clientAdd = '/clients/add';
  static const clientEdit = '/clients/edit/:id';
  static const clientDetail = '/clients/:id';

  // Cuenta Corriente
  static const accountBalance = '/account-balance';
  static const accountBalanceDetail = '/account-balance/:id';

  // Ventas
  static const sales = '/sales';
  static const saleAdd = '/sales/add';
  static const saleEdit = '/sales/edit/:id';
  static const saleDetail = '/sales/:id';
  static const newSale = '/sales/new';

  // Informes
  static const reports = '/reports';

  // Configuración
  static const settings = '/settings';

  // Perfil de usuario
  static const profile = '/profile';
  static const profileEdit =
      '/profile/edit/:id'; // opcional, si permites editar perfil

  // Categorías
  static const categories = '/categories';
  static const categoryAdd = '/categories/add';
  static const categoryEdit = '/categories/edit/:id';
  static const categoryHierarchy = '/categories/hierarchy';

  // Movimientos de Stock
  static const stockMovements = '/stock-movements';
  static const stockMovementAdd = '/stock-movements/add';
  static const stockMovementEdit = '/stock-movements/edit/:id';

  // Propiedades
  static const properties = '/properties';
  static const propertyAdd = '/properties/add';
  static const propertyEdit = '/properties/edit/:id';

  // Registros Financieros
  static const financialRecords = '/financial-records';
  static const financialRecordAdd = '/financial-records/add';
  static const financialRecordEdit = '/financial-records/edit/:id';

  // Reportes
  static const reportAdd = '/reports/add';
  static const reportEdit = '/reports/edit/:id';
  static const utilidadReport = '/reports/utilidad';

  // Roles
  static const roles = '/roles';
  static const roleAdd = '/roles/add';
  static const roleEdit = '/roles/edit/:id';

  // Usuarios
  static const users = '/users';
  static const userAdd = '/users/add';
  static const userEdit = '/users/edit/:id';

  // Pedidos
  static const orders = '/orders';
  static const orderAdd = '/orders/add';
  static const orderEdit = '/orders/edit/:id';

  // Pedidos a Proveedores
  static const pedidosProveedor = '/pedidos-proveedor';
  static const pedidoProveedorAdd = '/pedidos-proveedor/add';
  static const pedidoProveedorEdit = '/pedidos-proveedor/edit/:id';

  // Carrito de Compras
  static const carritoCompra = '/carrito-compra';

  // Nuevas funcionalidades
  // Ofertas
  static const offers = '/offers';
  static const offerAdd = '/offers/add';
  static const offerEdit = '/offers/edit/:id';

  // Flujo de Caja
  static const cashFlow = '/cash-flow';
  static const cashFlowAdd = '/cash-flow/add';
  static const cashFlowEdit = '/cash-flow/edit/:id';

  // Cierre de Caja
  static const cashRegister = '/cash-register';
  static const cashRegisterAdd = '/cash-register/add';
  static const cashRegisterEdit = '/cash-register/edit/:id';

  // Sorteos
  static const sweepstakes = '/sweepstakes';
  static const sweepstakesAdd = '/sweepstakes/add';
  static const sweepstakesEdit = '/sweepstakes/edit/:id';

  // Gastos Fijos
  static const fixedExpenses = '/fixed-expenses';
  static const fixedExpenseAdd = '/fixed-expenses/add';
  static const fixedExpenseEdit = '/fixed-expenses/edit/:id';

  // Movimientos Financieros
  static const financialMovements = '/financial-movements';
  static const financialMovementAdd = '/financial-movements/add';
  static const financialMovementEdit = '/financial-movements/edit/:id';
}
