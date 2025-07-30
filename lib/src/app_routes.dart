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

  // Carrito de Compras
  static const carritoCompra = '/carrito-compra';
}
