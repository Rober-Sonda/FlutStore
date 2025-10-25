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
  if (await isar.collection<Categoria>().count() > 0) return;

  await isar.writeTxn(() async {
    // 1. Crear roles
    final adminRol = Rol(
      nombre: 'Administrador',
      descripcion: 'Acceso completo al sistema',
      permisos: [
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
      ],
      activo: true,
      esSistema: true,
      fechaCreacion: DateTime.now(),
    );

    final vendedorRol = Rol(
      nombre: 'Vendedor',
      descripcion: 'Acceso a ventas y clientes',
      permisos: ['productos', 'clientes', 'ventas', 'pedidos'],
      activo: true,
      esSistema: true,
      fechaCreacion: DateTime.now(),
    );

    final almacenRol = Rol(
      nombre: 'Almacén',
      descripcion: 'Gestión de inventario',
      permisos: ['productos', 'categorias', 'proveedores', 'compras', 'stock'],
      activo: true,
      esSistema: true,
      fechaCreacion: DateTime.now(),
    );

    await isar.collection<Rol>().putAll([adminRol, vendedorRol, almacenRol]);

    // 2. Crear usuarios
    final adminUser =
        Usuario()
          ..nombre = 'Admin'
          ..apellido = 'Sistema'
          ..email = 'admin@tienda.com'
          ..username = 'admin'
          ..password = 'admin123'
          ..rolId = adminRol.id
          ..activo = true
          ..rolNombre = adminRol.nombre
          ..rolDescripcion = adminRol.descripcion
          ..rolPermisos = adminRol.permisos
          ..fechaCreacion = DateTime.now();

    final vendedorUser =
        Usuario()
          ..nombre = 'Juan'
          ..apellido = 'Pérez'
          ..email = 'juan@tienda.com'
          ..username = 'juan'
          ..password = 'vendedor123'
          ..rolId = vendedorRol.id
          ..activo = true
          ..rolNombre = vendedorRol.nombre
          ..rolDescripcion = vendedorRol.descripcion
          ..rolPermisos = vendedorRol.permisos
          ..fechaCreacion = DateTime.now();

    final almacenUser =
        Usuario()
          ..nombre = 'María'
          ..apellido = 'González'
          ..email = 'maria@tienda.com'
          ..username = 'maria'
          ..password = 'almacen123'
          ..rolId = almacenRol.id
          ..activo = true
          ..rolNombre = almacenRol.nombre
          ..rolDescripcion = almacenRol.descripcion
          ..rolPermisos = almacenRol.permisos
          ..fechaCreacion = DateTime.now();

    await isar.collection<Usuario>().putAll([
      adminUser,
      vendedorUser,
      almacenUser,
    ]);

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

    await isar.collection<Categoria>().putAll([
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
    await isar.collection<Proveedor>().putAll([
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

    await isar.collection<Cliente>().putAll([
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
          ..stockActual = 50
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
          ..stockActual = 25
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
          ..stockActual = 30
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
          ..stockActual = 15
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
          ..stockActual = 20
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
          ..stockActual = 40
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
          ..stockActual = 10
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
    await isar.collection<Producto>().putAll([
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
      proveedorNombre: proveedor1.nombre,
      proveedorEmail: proveedor1.email ?? '',
      proveedorTelefono: proveedor1.telefono ?? '',
      proveedorDocumento: proveedor1.cuit ?? '',
      proveedorDireccion: proveedor1.direccion ?? '',
      proveedorContacto: proveedor1.contacto ?? '',
      proveedorTipoProveedor: proveedor1.razonSocial ?? '',
      observaciones: 'Compra inicial de stock',
      estado: 'Pagado',
    );

    final compra2 = Compra(
      numeroFactura: 'FAC-002-2024',
      fecha: DateTime.now().subtract(const Duration(days: 3)),
      total: 7000.0,
      proveedorId: proveedor2.id,
      proveedorNombre: proveedor2.nombre,
      proveedorEmail: proveedor2.email ?? '',
      proveedorTelefono: proveedor2.telefono ?? '',
      proveedorDocumento: proveedor2.cuit ?? '',
      proveedorDireccion: proveedor2.direccion ?? '',
      proveedorContacto: proveedor2.contacto ?? '',
      proveedorTipoProveedor: proveedor2.razonSocial ?? '',
      observaciones: 'Ropa deportiva',
      estado: 'Pendiente',
    );

    final compra3 = Compra(
      numeroFactura: 'FAC-003-2024',
      fecha: DateTime.now().subtract(const Duration(days: 2)),
      total: 3000.0,
      proveedorId: proveedor3.id,
      proveedorNombre: proveedor3.nombre,
      proveedorEmail: proveedor3.email ?? '',
      proveedorTelefono: proveedor3.telefono ?? '',
      proveedorDocumento: proveedor3.cuit ?? '',
      proveedorDireccion: proveedor3.direccion ?? '',
      proveedorContacto: proveedor3.contacto ?? '',
      proveedorTipoProveedor: proveedor3.razonSocial ?? '',
      observaciones: 'Compra de zapatillas',
      estado: 'Pagado',
    );
    final compra4 = Compra(
      numeroFactura: 'FAC-004-2024',
      fecha: DateTime.now().subtract(const Duration(days: 1)),
      total: 1200.0,
      proveedorId: proveedor4.id,
      proveedorNombre: proveedor4.nombre,
      proveedorEmail: proveedor4.email ?? '',
      proveedorTelefono: proveedor4.telefono ?? '',
      proveedorDocumento: proveedor4.cuit ?? '',
      proveedorDireccion: proveedor4.direccion ?? '',
      proveedorContacto: proveedor4.contacto ?? '',
      proveedorTipoProveedor: proveedor4.razonSocial ?? '',
      observaciones: 'Accesorios varios',
      estado: 'Pendiente',
    );
    await isar.collection<Compra>().putAll([
      compra1,
      compra2,
      compra3,
      compra4,
    ]);

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

    await isar.collection<Pedido>().putAll([
      pedido1,
      pedido2,
      pedido3,
      pedido4,
      pedido5,
    ]);

    // 9. Crear ventas
    final venta1 = Venta(
      clienteId: cliente1.id,
      clienteNombre: '${cliente1.nombre} ${cliente1.apellido ?? ''}',
      clienteEmail: cliente1.email ?? '',
      clienteTelefono: cliente1.whatsapp ?? '',
      clienteDocumento: cliente1.dni ?? '',
      clienteDireccion: cliente1.direccion ?? '',
      clienteTipoCliente: 'particular',
      fecha: DateTime.now().subtract(const Duration(days: 1)),
      total: 2500.0,
      metodoPago: 'Efectivo',
      estado: 'completada',
      usuarioId: adminUser.id,
      numeroFactura: 'VTA-001-2024',
      vendedor: '${adminUser.nombre} ${adminUser.apellido}',
    );

    final venta2 = Venta(
      clienteId: cliente2.id,
      clienteNombre: '${cliente2.nombre} ${cliente2.apellido ?? ''}',
      clienteEmail: cliente2.email ?? '',
      clienteTelefono: cliente2.whatsapp ?? '',
      clienteDocumento: cliente2.dni ?? '',
      clienteDireccion: cliente2.direccion ?? '',
      clienteTipoCliente: 'particular',
      fecha: DateTime.now().subtract(const Duration(hours: 20)),
      total: 8500.0,
      metodoPago: 'tarjeta',
      estado: 'completada',
      usuarioId: vendedorUser.id,
      numeroFactura: 'VTA-002-2024',
      vendedor: '${vendedorUser.nombre} ${vendedorUser.apellido}',
    );

    final venta3 = Venta(
      clienteId: cliente4.id,
      clienteNombre: '${cliente4.nombre} ${cliente4.apellido ?? ''}',
      clienteEmail: cliente4.email ?? '',
      clienteTelefono: cliente4.whatsapp ?? '',
      clienteDocumento: cliente4.dni ?? '',
      clienteDireccion: cliente4.direccion ?? '',
      clienteTipoCliente: 'particular',
      fecha: DateTime.now().subtract(const Duration(hours: 5)),
      total: 1200.0,
      metodoPago: 'efectivo',
      estado: 'pendiente',
      usuarioId: almacenUser.id,
      numeroFactura: 'VTA-003-2024',
      vendedor: '${almacenUser.nombre} ${almacenUser.apellido}',
    );

    // Agregar detalles de productos a las ventas
    venta1.detalles = [
      ProductoVentaCompleto(
        productoId: producto1.id,
        codigo: producto1.codigoBarras ?? 'REM-001',
        nombre: producto1.nombre ?? 'Remera Básica Negra',
        descripcion: producto1.descripcion ?? '',
        categoria: 'Remeras',
        marca: producto1.marca ?? 'Generic',
        precioCompra: 1500.0,
        precioVenta: 2500.0,
        precioFinal: 2500.0,
        cantidad: 1,
      ),
    ];

    venta2.detalles = [
      ProductoVentaCompleto(
        productoId: producto3.id,
        codigo: producto3.codigoBarras ?? 'ZAP-001',
        nombre: producto3.nombre ?? 'Zapatillas Deportivas Blancas',
        descripcion: producto3.descripcion ?? '',
        categoria: 'Zapatillas',
        marca: producto3.marca ?? 'Nike',
        precioCompra: 6000.0,
        precioVenta: 8500.0,
        precioFinal: 8500.0,
        cantidad: 1,
      ),
    ];

    venta3.detalles = [
      ProductoVentaCompleto(
        productoId: producto6.id,
        codigo: producto6.codigoBarras ?? 'ACC-001',
        nombre: producto6.nombre ?? 'Accesorio Pulsera Dorada',
        descripcion: producto6.descripcion ?? '',
        categoria: 'Accesorios',
        marca: producto6.marca ?? 'Generic',
        precioCompra: 800.0,
        precioVenta: 1200.0,
        precioFinal: 1200.0,
        cantidad: 1,
      ),
    ];

    await isar.collection<Venta>().putAll([venta1, venta2, venta3]);
  });
}

// Función para limpiar toda la base de datos
Future<void> clearIsar(Isar isar) async {
  await isar.writeTxn(() async {
    await isar.collection<Pedido>().clear();
    await isar.collection<Compra>().clear();
    await isar.collection<Producto>().clear();
    await isar.collection<Cliente>().clear();
    await isar.collection<Proveedor>().clear();
    await isar.collection<Usuario>().clear();
    await isar.collection<Rol>().clear();
    await isar.collection<Categoria>().clear();
  });
}

// Función para verificar si la base de datos tiene datos
Future<bool> hasData(Isar isar) async {
  final categoriasCount = await isar.collection<Categoria>().count();
  final productosCount = await isar.collection<Producto>().count();
  final clientesCount = await isar.collection<Cliente>().count();
  final proveedoresCount = await isar.collection<Proveedor>().count();

  return categoriasCount > 0 ||
      productosCount > 0 ||
      clientesCount > 0 ||
      proveedoresCount > 0;
}
