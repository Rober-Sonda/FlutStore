import 'package:isar/isar.dart';
import '../models/categoria.dart';
import '../models/propiedad_categoria.dart';
import '../models/producto.dart';
import '../models/cliente.dart';
import '../models/proveedor.dart';
import '../models/usuario.dart';
import '../models/rol.dart';
import '../models/compra.dart';
import '../models/pedido.dart';
import '../models/valor_propiedad_producto.dart';
import '../models/venta.dart';

Future<void> seedIsar(Isar isar) async {
  // Solo ejecutar si la base de datos está vacía
  if (await isar.categorias.count() > 0) return;

  await isar.writeTxn(() async {
    // 1. Crear roles
    final adminRol =
        Rol()
          ..nombre = 'Administrador'
          ..descripcion = 'Acceso completo al sistema'
          ..permisos = [
            'productos',
            'categorias',
            'clientes',
            'proveedores',
            'compras',
            'ventas',
            'pedidos',
            'usuarios',
            'roles',
            'finanzas',
            'reportes',
            'stock',
          ]
          ..fechaCreacion = DateTime.now();

    final vendedorRol =
        Rol()
          ..nombre = 'Vendedor'
          ..descripcion = 'Acceso a ventas y clientes'
          ..permisos = ['productos', 'clientes', 'ventas', 'pedidos']
          ..fechaCreacion = DateTime.now();

    final almacenRol =
        Rol()
          ..nombre = 'Almacén'
          ..descripcion = 'Gestión de inventario'
          ..permisos = [
            'productos',
            'categorias',
            'proveedores',
            'compras',
            'stock',
          ]
          ..fechaCreacion = DateTime.now();

    await isar.rols.putAll([adminRol, vendedorRol, almacenRol]);

    // 2. Crear usuarios
    final adminUser =
        Usuario()
          ..nombre = 'Admin'
          ..apellido = 'Sistema'
          ..email = 'admin@tienda.com'
          ..username = 'admin'
          ..password = 'admin123'
          ..rolId = adminRol.id
          ..fechaCreacion = DateTime.now();

    final vendedorUser =
        Usuario()
          ..nombre = 'Juan'
          ..apellido = 'Pérez'
          ..email = 'juan@tienda.com'
          ..username = 'juan'
          ..password = 'vendedor123'
          ..rolId = vendedorRol.id
          ..fechaCreacion = DateTime.now();

    final almacenUser =
        Usuario()
          ..nombre = 'María'
          ..apellido = 'González'
          ..email = 'maria@tienda.com'
          ..username = 'maria'
          ..password = 'almacen123'
          ..rolId = almacenRol.id
          ..fechaCreacion = DateTime.now();

    await isar.usuarios.putAll([adminUser, vendedorUser, almacenUser]);

    // 3. Crear categorías
    final propiedadesRemeras = [
      PropiedadCategoria()
        ..nombre = 'Color'
        ..tipo = TipoPropiedad.seleccion
        ..opciones = ['Negro', 'Blanco', 'Azul', 'Rojo', 'Verde', 'Amarillo']
        ..requerido = true,
      PropiedadCategoria()
        ..nombre = 'Talle'
        ..tipo = TipoPropiedad.seleccion
        ..opciones = ['XS', 'S', 'M', 'L', 'XL', 'XXL']
        ..requerido = true,
      PropiedadCategoria()
        ..nombre = 'Material'
        ..tipo = TipoPropiedad.seleccion
        ..opciones = ['Algodón', 'Poliéster', 'Lino', 'Seda']
        ..requerido = false,
      PropiedadCategoria()
        ..nombre = 'Manga'
        ..tipo = TipoPropiedad.seleccion
        ..opciones = ['Corta', 'Larga', 'Sin mangas']
        ..requerido = true,
    ];

    final propiedadesPantalones = [
      PropiedadCategoria()
        ..nombre = 'Color'
        ..tipo = TipoPropiedad.seleccion
        ..opciones = ['Negro', 'Azul', 'Gris', 'Beige', 'Blanco']
        ..requerido = true,
      PropiedadCategoria()
        ..nombre = 'Talle'
        ..tipo = TipoPropiedad.seleccion
        ..opciones = ['28', '30', '32', '34', '36', '38', '40', '42']
        ..requerido = true,
      PropiedadCategoria()
        ..nombre = 'Tipo de Tela'
        ..tipo = TipoPropiedad.seleccion
        ..opciones = ['Denim', 'Algodón', 'Lino', 'Poliéster']
        ..requerido = false,
      PropiedadCategoria()
        ..nombre = 'Largo'
        ..tipo = TipoPropiedad.seleccion
        ..opciones = ['Corto', 'Medio', 'Largo']
        ..requerido = true,
    ];

    final propiedadesZapatillas = [
      PropiedadCategoria()
        ..nombre = 'Color'
        ..tipo = TipoPropiedad.seleccion
        ..opciones = ['Negro', 'Blanco', 'Gris', 'Azul', 'Rojo', 'Verde']
        ..requerido = true,
      PropiedadCategoria()
        ..nombre = 'Talle'
        ..tipo = TipoPropiedad.numero
        ..valorPorDefecto = '40'
        ..requerido = true,
      PropiedadCategoria()
        ..nombre = 'Marca'
        ..tipo = TipoPropiedad.texto
        ..requerido = false,
      PropiedadCategoria()
        ..nombre = 'Deportivo'
        ..tipo = TipoPropiedad.booleano
        ..valorPorDefecto = 'Sí'
        ..requerido = false,
    ];

    final remeras =
        Categoria()
          ..nombre = 'Remeras'
          ..descripcion = 'Remeras de todo tipo'
          ..propiedades = propiedadesRemeras
          ..parent = null
          ..orden = 1;

    final deportivas =
        Categoria()
          ..nombre = 'Remeras Deportivas'
          ..descripcion = 'Remeras para deporte'
          ..propiedades = [
            PropiedadCategoria()
              ..nombre = 'Color'
              ..tipo = TipoPropiedad.seleccion
              ..opciones = ['Negro', 'Blanco', 'Azul', 'Rojo', 'Verde']
              ..requerido = true,
            PropiedadCategoria()
              ..nombre = 'Talle'
              ..tipo = TipoPropiedad.seleccion
              ..opciones = ['S', 'M', 'L', 'XL']
              ..requerido = true,
            PropiedadCategoria()
              ..nombre = 'Tecnología'
              ..tipo = TipoPropiedad.texto
              ..requerido = false,
          ]
          ..parent = remeras.id
          ..orden = 1;

    final urbanas =
        Categoria()
          ..nombre = 'Remeras Urbanas'
          ..descripcion = 'Remeras para uso urbano'
          ..propiedades = [
            PropiedadCategoria()
              ..nombre = 'Color'
              ..tipo = TipoPropiedad.seleccion
              ..opciones = ['Negro', 'Blanco', 'Gris', 'Azul', 'Verde']
              ..requerido = true,
            PropiedadCategoria()
              ..nombre = 'Talle'
              ..tipo = TipoPropiedad.seleccion
              ..opciones = ['XS', 'S', 'M', 'L', 'XL', 'XXL']
              ..requerido = true,
            PropiedadCategoria()
              ..nombre = 'Estilo'
              ..tipo = TipoPropiedad.seleccion
              ..opciones = ['Casual', 'Elegante', 'Vintage', 'Moderno']
              ..requerido = false,
          ]
          ..parent = remeras.id
          ..orden = 2;

    final pantalones =
        Categoria()
          ..nombre = 'Pantalones'
          ..descripcion = 'Pantalones de todo tipo'
          ..propiedades = propiedadesPantalones
          ..parent = null
          ..orden = 2;

    final jeans =
        Categoria()
          ..nombre = 'Jeans'
          ..descripcion = 'Jeans de mezclilla'
          ..propiedades = [
            PropiedadCategoria()
              ..nombre = 'Color'
              ..tipo = TipoPropiedad.seleccion
              ..opciones = ['Azul', 'Negro', 'Gris', 'Blanco']
              ..requerido = true,
            PropiedadCategoria()
              ..nombre = 'Talle'
              ..tipo = TipoPropiedad.seleccion
              ..opciones = ['28', '30', '32', '34', '36', '38', '40', '42']
              ..requerido = true,
            PropiedadCategoria()
              ..nombre = 'Lavado'
              ..tipo = TipoPropiedad.seleccion
              ..opciones = ['Claro', 'Medio', 'Oscuro', 'Vintage']
              ..requerido = false,
          ]
          ..parent = pantalones.id
          ..orden = 1;

    final joggers =
        Categoria()
          ..nombre = 'Joggers'
          ..descripcion = 'Joggers deportivos'
          ..propiedades = [
            PropiedadCategoria()
              ..nombre = 'Color'
              ..tipo = TipoPropiedad.seleccion
              ..opciones = ['Negro', 'Gris', 'Azul', 'Verde']
              ..requerido = true,
            PropiedadCategoria()
              ..nombre = 'Talle'
              ..tipo = TipoPropiedad.seleccion
              ..opciones = ['S', 'M', 'L', 'XL']
              ..requerido = true,
            PropiedadCategoria()
              ..nombre = 'Con Bolsillos'
              ..tipo = TipoPropiedad.booleano
              ..valorPorDefecto = 'Sí'
              ..requerido = false,
          ]
          ..parent = pantalones.id
          ..orden = 2;

    final zapatillas =
        Categoria()
          ..nombre = 'Zapatillas'
          ..descripcion = 'Zapatillas deportivas y casuales'
          ..propiedades = propiedadesZapatillas
          ..parent = null
          ..orden = 3;

    final accesorios =
        Categoria()
          ..nombre = 'Accesorios'
          ..descripcion = 'Accesorios varios'
          ..propiedades = [
            PropiedadCategoria()
              ..nombre = 'Color'
              ..tipo = TipoPropiedad.seleccion
              ..opciones = ['Negro', 'Blanco', 'Dorado', 'Plateado', 'Bronce']
              ..requerido = true,
            PropiedadCategoria()
              ..nombre = 'Material'
              ..tipo = TipoPropiedad.texto
              ..requerido = false,
            PropiedadCategoria()
              ..nombre = 'Tamaño'
              ..tipo = TipoPropiedad.seleccion
              ..opciones = ['Pequeño', 'Mediano', 'Grande']
              ..requerido = true,
          ]
          ..parent = null
          ..orden = 4;

    await isar.categorias.putAll([
      remeras,
      deportivas,
      urbanas,
      pantalones,
      jeans,
      joggers,
      zapatillas,
      accesorios,
    ]);

    // 4. Crear proveedores
    final proveedor1 = Proveedor(
      nombre: 'Textil Argentina S.A.',
      razonSocial: 'Textil Argentina Sociedad Anónima',
      email: 'contacto@textilar.com.ar',
      telefono: '011-4567-8901',
      direccion: 'Av. Corrientes 1234, CABA',
      cuit: '30-12345678-9',
      contacto: 'Carlos Rodríguez',
      observaciones: 'Proveedor principal de telas',
    );

    final proveedor2 = Proveedor(
      nombre: 'Deportes Max',
      razonSocial: 'Deportes Max S.R.L.',
      email: 'ventas@deportesmax.com',
      telefono: '011-2345-6789',
      direccion: 'Belgrano 567, CABA',
      cuit: '30-98765432-1',
      contacto: 'Ana Martínez',
      observaciones: 'Especialista en ropa deportiva',
    );

    final proveedor3 = Proveedor(
      nombre: 'Calzado Premium',
      razonSocial: 'Calzado Premium S.A.',
      email: 'info@calzadopremium.com',
      telefono: '011-3456-7890',
      direccion: 'Florida 890, CABA',
      cuit: '30-11223344-5',
      contacto: 'Roberto Silva',
      observaciones: 'Zapatillas de alta calidad',
    );

    final proveedor4 = Proveedor(
      nombre: 'Accesorios Plus',
      razonSocial: 'Accesorios Plus S.R.L.',
      email: 'info@accesoriosplus.com',
      telefono: '011-5678-1234',
      direccion: 'Av. Rivadavia 321, CABA',
      cuit: '30-55667788-2',
      contacto: 'Lucía Fernández',
      observaciones: 'Proveedor de accesorios',
    );
    await isar.proveedors.putAll([
      proveedor1,
      proveedor2,
      proveedor3,
      proveedor4,
    ]);

    // 5. Crear clientes
    final cliente1 = Cliente(
      id: 0,
      nombre: 'María',
      apellido: 'García',
      email: 'maria.garcia@email.com',
      whatsapp: '011-1234-5678',
      direccion: 'Av. Santa Fe 123, CABA',
      dni: '12345678',
      cuil: '20-12345678-9',
      fechaRegistro: DateTime.now(),
    );

    final cliente2 = Cliente(
      id: 0,
      nombre: 'Carlos',
      apellido: 'López',
      email: 'carlos.lopez@email.com',
      whatsapp: '011-2345-6789',
      direccion: 'Corrientes 456, CABA',
      dni: '23456789',
      cuil: '20-23456789-0',
      fechaRegistro: DateTime.now(),
    );

    final cliente3 = Cliente(
      id: 0,
      nombre: 'Ana',
      apellido: 'Martínez',
      email: 'ana.martinez@email.com',
      whatsapp: '011-3456-7890',
      direccion: 'Belgrano 789, CABA',
      dni: '34567890',
      cuil: '20-34567890-1',
      fechaRegistro: DateTime.now(),
    );

    final cliente4 = Cliente(
      id: 0,
      nombre: 'Roberto',
      apellido: 'Fernández',
      email: 'roberto.fernandez@email.com',
      whatsapp: '011-4567-8901',
      direccion: 'Mitre 321, CABA',
      dni: '45678901',
      cuil: '20-45678901-2',
      fechaRegistro: DateTime.now().subtract(const Duration(days: 10)),
    );

    final cliente5 = Cliente(
      id: 0,
      nombre: 'Laura',
      apellido: 'Sánchez',
      email: 'laura.sanchez@email.com',
      whatsapp: '011-5678-1234',
      direccion: 'San Martín 654, CABA',
      dni: '56789012',
      cuil: '20-56789012-3',
      fechaRegistro: DateTime.now().subtract(const Duration(days: 20)),
    );

    await isar.clientes.putAll([
      cliente1,
      cliente2,
      cliente3,
      cliente4,
      cliente5,
    ]);

    // 6. Crear productos
    final producto1 =
        Producto()
          ..nombre = 'Remera Básica Negra'
          ..precio = 2500.0
          ..stock = 50
          ..categoriaId = remeras.id
          ..valoresPropiedades = [
            ValorPropiedadProducto()
              ..nombrePropiedad = 'Color'
              ..valor = 'Negro',
            ValorPropiedadProducto()
              ..nombrePropiedad = 'Talle'
              ..valor = 'M',
            ValorPropiedadProducto()
              ..nombrePropiedad = 'Material'
              ..valor = 'Algodón',
            ValorPropiedadProducto()
              ..nombrePropiedad = 'Manga'
              ..valor = 'Corta',
          ];

    final producto2 =
        Producto()
          ..nombre = 'Jeans Azul Clásico'
          ..precio = 4500.0
          ..stock = 25
          ..categoriaId = jeans.id
          ..valoresPropiedades = [
            ValorPropiedadProducto()
              ..nombrePropiedad = 'Color'
              ..valor = 'Azul',
            ValorPropiedadProducto()
              ..nombrePropiedad = 'Talle'
              ..valor = '32',
            ValorPropiedadProducto()
              ..nombrePropiedad = 'Lavado'
              ..valor = 'Medio',
          ];

    final producto3 =
        Producto()
          ..nombre = 'Zapatillas Deportivas Blancas'
          ..precio = 8500.0
          ..stock = 30
          ..categoriaId = zapatillas.id
          ..valoresPropiedades = [
            ValorPropiedadProducto()
              ..nombrePropiedad = 'Color'
              ..valor = 'Blanco',
            ValorPropiedadProducto()
              ..nombrePropiedad = 'Talle'
              ..valor = '42',
            ValorPropiedadProducto()
              ..nombrePropiedad = 'Marca'
              ..valor = 'Nike',
            ValorPropiedadProducto()
              ..nombrePropiedad = 'Deportivo'
              ..valor = 'Sí',
          ];

    final producto4 =
        Producto()
          ..nombre = 'Remera Deportiva Roja'
          ..precio = 3200.0
          ..stock = 15
          ..categoriaId = deportivas.id
          ..valoresPropiedades = [
            ValorPropiedadProducto()
              ..nombrePropiedad = 'Color'
              ..valor = 'Rojo',
            ValorPropiedadProducto()
              ..nombrePropiedad = 'Talle'
              ..valor = 'L',
            ValorPropiedadProducto()
              ..nombrePropiedad = 'Tecnología'
              ..valor = 'Dry-Fit',
          ];

    final producto5 =
        Producto()
          ..nombre = 'Joggers Grises'
          ..precio = 3800.0
          ..stock = 20
          ..categoriaId = joggers.id
          ..valoresPropiedades = [
            ValorPropiedadProducto()
              ..nombrePropiedad = 'Color'
              ..valor = 'Gris',
            ValorPropiedadProducto()
              ..nombrePropiedad = 'Talle'
              ..valor = 'M',
            ValorPropiedadProducto()
              ..nombrePropiedad = 'Con Bolsillos'
              ..valor = 'Sí',
          ];

    final producto6 =
        Producto()
          ..nombre = 'Accesorio Pulsera Dorada'
          ..precio = 1200.0
          ..stock = 40
          ..categoriaId = accesorios.id
          ..valoresPropiedades = [
            ValorPropiedadProducto()
              ..nombrePropiedad = 'Color'
              ..valor = 'Dorado',
            ValorPropiedadProducto()
              ..nombrePropiedad = 'Material'
              ..valor = 'Metal',
            ValorPropiedadProducto()
              ..nombrePropiedad = 'Tamaño'
              ..valor = 'Mediano',
          ];
    final producto7 =
        Producto()
          ..nombre = 'Remera Urbana Vintage'
          ..precio = 2800.0
          ..stock = 10
          ..categoriaId = urbanas.id
          ..valoresPropiedades = [
            ValorPropiedadProducto()
              ..nombrePropiedad = 'Color'
              ..valor = 'Gris',
            ValorPropiedadProducto()
              ..nombrePropiedad = 'Talle'
              ..valor = 'L',
            ValorPropiedadProducto()
              ..nombrePropiedad = 'Estilo'
              ..valor = 'Vintage',
          ];
    await isar.productos.putAll([
      producto1,
      producto2,
      producto3,
      producto4,
      producto5,
      producto6,
      producto7,
    ]);

    // 7. Crear compras
    final compra1 = Compra(
      numeroFactura: 'FAC-001-2024',
      fecha: DateTime.now().subtract(const Duration(days: 5)),
      total: 7000.0,
      proveedorId: proveedor1.id,
      observaciones: 'Compra inicial de stock',
      estado: 'Pagado',
    );

    final compra2 = Compra(
      numeroFactura: 'FAC-002-2024',
      fecha: DateTime.now().subtract(const Duration(days: 3)),
      total: 7000.0,
      proveedorId: proveedor2.id,
      observaciones: 'Ropa deportiva',
      estado: 'Pendiente',
    );

    final compra3 = Compra(
      numeroFactura: 'FAC-003-2024',
      fecha: DateTime.now().subtract(const Duration(days: 2)),
      total: 3000.0,
      proveedorId: proveedor3.id,
      observaciones: 'Compra de zapatillas',
      estado: 'Pagado',
    );
    final compra4 = Compra(
      numeroFactura: 'FAC-004-2024',
      fecha: DateTime.now().subtract(const Duration(days: 1)),
      total: 1200.0,
      proveedorId: proveedor4.id,
      observaciones: 'Accesorios varios',
      estado: 'Pendiente',
    );
    await isar.compras.putAll([compra1, compra2, compra3, compra4]);

    // 8. Crear pedidos
    final pedido1 =
        Pedido()
          ..clienteId = cliente1.id
          ..productos = [producto1.id, producto3.id]
          ..fecha = DateTime.now().subtract(const Duration(days: 2))
          ..estado = 'Entregado';

    final pedido2 =
        Pedido()
          ..clienteId = cliente2.id
          ..productos = [producto2.id, producto4.id]
          ..fecha = DateTime.now().subtract(const Duration(days: 1))
          ..estado = 'En preparación';

    final pedido3 =
        Pedido()
          ..clienteId = cliente3.id
          ..productos = [producto5.id]
          ..fecha = DateTime.now()
          ..estado = 'Nuevo';

    final pedido4 =
        Pedido()
          ..clienteId = cliente4.id
          ..productos = [producto6.id, producto7.id]
          ..fecha = DateTime.now().subtract(const Duration(hours: 12))
          ..estado = 'Entregado';
    final pedido5 =
        Pedido()
          ..clienteId = cliente5.id
          ..productos = [producto1.id, producto2.id, producto6.id]
          ..fecha = DateTime.now().subtract(const Duration(hours: 6))
          ..estado = 'En preparación';

    await isar.pedidos.putAll([pedido1, pedido2, pedido3, pedido4, pedido5]);

    // 9. Crear ventas
    final venta1 = Venta(
      clienteId: cliente1.id,
      fecha: DateTime.now().subtract(const Duration(days: 1)),
      total: 2500.0,
      metodoPago: 'Efectivo',
      estado: 'Pagado',
      usuarioId: adminUser.id,
      // productosVendidos: [producto1.id], // Si tienes este campo en el modelo
    );
    final venta2 = Venta(
      clienteId: cliente2.id,
      fecha: DateTime.now().subtract(const Duration(hours: 20)),
      total: 8500.0,
      metodoPago: 'Tarjeta',
      estado: 'Pagado',
      usuarioId: vendedorUser.id,
      // productosVendidos: [producto3.id],
    );
    final venta3 = Venta(
      clienteId: cliente4.id,
      fecha: DateTime.now().subtract(const Duration(hours: 5)),
      total: 1200.0,
      metodoPago: 'Efectivo',
      estado: 'Pendiente',
      usuarioId: almacenUser.id,
      // productosVendidos: [producto6.id],
    );
    await isar.ventas.putAll([venta1, venta2, venta3]);
  });
}

// Función para limpiar toda la base de datos
Future<void> clearIsar(Isar isar) async {
  await isar.writeTxn(() async {
    await isar.pedidos.clear();
    await isar.compras.clear();
    await isar.productos.clear();
    await isar.clientes.clear();
    await isar.proveedors.clear();
    await isar.usuarios.clear();
    await isar.rols.clear();
    await isar.categorias.clear();
  });
}

// Función para verificar si la base de datos tiene datos
Future<bool> hasData(Isar isar) async {
  final categoriasCount = await isar.categorias.count();
  final productosCount = await isar.productos.count();
  final clientesCount = await isar.clientes.count();
  final proveedoresCount = await isar.proveedors.count();

  return categoriasCount > 0 ||
      productosCount > 0 ||
      clientesCount > 0 ||
      proveedoresCount > 0;
}
