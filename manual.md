# Manual y Arquitectura de la Aplicación NAJAM

## 1. Arquitectura General

La aplicación está desarrollada en **Flutter** para escritorio, usando **Riverpod** para la gestión de estado y **Isar** como base de datos local. El diseño modular permite escalar y mantener el proyecto fácilmente.

### 1.1 Riverpod

- **Desacoplamiento de lógica y UI:** Riverpod permite que la lógica de negocio (servicios, consultas, validaciones) esté separada de la interfaz de usuario. Los widgets solo consumen Providers, sin conocer detalles internos.
- **Pruebas y escalabilidad:** Puedes testear Providers y servicios sin depender de la UI. Si agregas nuevas vistas, solo necesitas crear el Provider y consumirlo.
- **Ejemplo:** Un Provider expone la lista de productos, y cualquier vista puede consumirlo con `ref.watch(productosProvider)`.

### 1.2 Isar

- **Eficiencia:** Isar es una base de datos local rápida, ideal para escritorio y móvil.
- **Relaciones y consultas:** Permite definir relaciones entre modelos (por ejemplo, productos y categorías) y realizar consultas rápidas.
- **Extensión:** Para agregar un modelo, crea la clase en `models/`, actualiza el servicio en `isar_service.dart` y usa los métodos de Isar para consultar/guardar datos.
- **Ejemplo:** Para consultar productos:  
  ```dart
  final productos = await isar.productos.where().findAll();
  ```

### 1.3 Modularización

- **Separación clara:** Servicios (`services/`), modelos (`models/`), vistas (`views/`), utilidades (`utils/`).
- **Mantenimiento y extensión:** Si agregas una nueva funcionalidad, crea el módulo correspondiente y vincúlalo mediante Providers y rutas.
- **Ejemplo:** Un nuevo servicio para estadísticas se crea en `services/dashboard_data_service.dart`.

### 1.4 Rutas Centralizadas

- **Navegación fácil:** Todas las rutas están en `src/app_router.dart`.  
- **Escalabilidad:** Para agregar una vista, crea el widget y registra la ruta en el router.
- **Ejemplo:**  
  ```dart
  GoRoute(
    path: '/productos',
    builder: (context, state) => ProductosView(),
  )
  ```

### 1.5 Utilidades

- **Logging solo en desarrollo:** El archivo `utils/logger.dart` contiene la función `logDev`, que solo muestra mensajes en modo desarrollo.
- **Depuración segura:** No afecta la producción, solo ayuda al desarrollador.

---

## 2. Vistas, Modelos y Servicios

### 2.1 Vistas

- **DashboardView:** Vista principal, muestra métricas, operaciones, inventario, categorías, ventas, pedidos y acciones rápidas.
- **Otras vistas:** Se agregan en `views/` y se vinculan en el router.
- **Responsividad:** Uso de MediaQuery y escalado de texto para adaptarse a diferentes dispositivos.

### 2.2 Modelos

- **Definición:** Cada modelo representa una entidad de la base de datos (ej. Producto, Usuario, Categoría).
- **Ubicación:** Carpeta `models/`.
- **Ejemplo:**
  ```dart
  @Collection()
  class Producto {
    Id id = Isar.autoIncrement;
    late String nombre;
    late double precio;
    // ...otros campos...
  }
  ```

### 2.3 Servicios

- **Definición:** Clases que encapsulan la lógica de negocio y acceso a datos.
- **Ubicación:** Carpeta `services/`.
- **Ejemplo:** `isar_service.dart` gestiona la conexión y consultas a la base de datos.

### 2.4 Consultas a la Base de Datos

- **Uso:** Se realizan mediante los servicios y Providers.
- **Ejemplo:**
  ```dart
  final productos = await isar.productos.where().findAll();
  ```
- **Recomendación:** Siempre encapsula las consultas en servicios para mantener la modularidad.

---

## 3. Corrección de Errores Visuales

- **Overflow en Column:** Si ves un error de overflow, usa `SingleChildScrollView` o ajusta el layout con `Flexible`/`Expanded`.
- **Responsividad:** Se usa `MediaQuery` y escalado de texto para que la UI no se rompa en diferentes resoluciones.
- **Scroll:** Se habilita el scroll para mouse, touch y stylus.
- **Carga de datos:** Se muestra un `CircularProgressIndicator` mientras se cargan los datos.
- **Logging:** Todos los mensajes de depuración usan `logDev` para no afectar la producción.

---

## 4. Manual de Usuario - NAJAM Tienda

Bienvenido al sistema de gestión de negocios NAJAM. Este manual está pensado para usuarios que no tienen experiencia con sistemas de gestión. Aquí encontrarás instrucciones claras y simples para usar la aplicación.

---

### 1. Iniciar Sesión

- Abre la aplicación.
- Ingresa tu usuario y contraseña.
- Haz clic en **Ingresar**.

Si olvidaste tu contraseña, contacta al administrador.

---

### 2. Menú Principal

Al ingresar verás el **Dashboard** con información resumida de tu negocio: ventas, productos, pedidos y alertas.

En la parte izquierda (o superior) tienes el menú para acceder a las distintas secciones:

- **Productos**: Lista y gestiona tus productos.
- **Categorías**: Organiza los productos por tipo.
- **Proveedores**: Registra y consulta tus proveedores.
- **Clientes**: Registra y consulta tus clientes.
- **Pedidos**: Consulta y crea pedidos de venta.
- **Carrito de compras**: Agrega productos para crear un pedido rápido.
- **Compras**: Registra compras a proveedores.
- **Ventas**: Consulta ventas realizadas.
- **Reportes**: Visualiza informes y estadísticas.
- **Configuración**: Ajusta opciones del sistema.

---

### 3. Productos

- Para agregar un producto, haz clic en **Nuevo Producto**.
- Completa los datos (nombre, precio, stock, categoría).
- Guarda el producto.

Puedes editar o eliminar productos desde la lista.

---

### 4. Categorías

- Las categorías agrupan productos similares.
- Puedes crear categorías principales y subcategorías.
- Para agregar una categoría, haz clic en **Nueva Categoría**.
- Puedes editar o eliminar categorías desde la lista.

---

### 5. Proveedores

- Registra los datos de tus proveedores.
- Puedes agregar, editar o eliminar proveedores.

---

### 6. Clientes

- Registra los datos de tus clientes.
- Puedes agregar, editar o eliminar clientes.

---

### 7. Pedidos

- Los pedidos son ventas a clientes.
- Para crear un pedido, haz clic en **Nuevo Pedido** desde la sección de pedidos o desde el carrito de compras.
- Completa los datos y confirma.

---

### 8. Carrito de Compras

- Agrega productos al carrito para crear un pedido rápido.
- Puedes modificar cantidades y eliminar productos antes de confirmar el pedido.

---

### 9. Compras

- Registra compras a proveedores para reponer tu stock.
- Completa los datos y guarda la compra.

---

### 10. Ventas

- Consulta todas las ventas realizadas.
- Puedes filtrar por fechas y clientes.

---

### 11. Reportes

- Visualiza estadísticas de ventas, compras y productos.
- Usa los reportes para tomar mejores decisiones.

---

### 12. Configuración

- Ajusta opciones del sistema, usuarios y permisos.
- Cambia el tema visual si lo deseas.

---

## Finanzas y Caja

En la sección **Finanzas** puedes gestionar todo lo relacionado con el dinero de tu negocio:

- **Flujo de Caja:** Consulta y registra los movimientos de dinero (ingresos y egresos).
- **Caja:** Controla el dinero físico disponible.
- **Gastos Fijos:** Registra los gastos que se repiten cada mes (alquiler, servicios, sueldos, etc). Los gastos fijos se agregan automáticamente como egresos en las fechas que configures.

### ¿Cómo usar la sección Finanzas?

1. Ingresa a **Finanzas** desde el menú principal.
2. Usa las pestañas para navegar entre **Flujo de Caja**, **Caja** y **Gastos Fijos**.
3. Para agregar un gasto fijo, ve a la pestaña **Gastos Fijos** y haz clic en **Agregar Gasto Fijo**.

> Los gastos fijos se sumarán automáticamente a tus egresos en las fechas que indiques, para que no tengas que preocuparte por agregarlos manualmente cada mes.

---

# ¿Para qué sirve la sección de Flujo de Caja?

La sección **Flujo de Caja** te permite llevar el control de todos los movimientos de dinero de tu negocio, tanto ingresos como egresos.

## ¿Qué puedes hacer en Flujo de Caja?

- Registrar cada vez que entra dinero (ventas, cobros, otros ingresos).
- Registrar cada vez que sale dinero (compras, pagos, gastos fijos, retiros).
- Ver el saldo neto disponible en tu negocio.
- Filtrar los movimientos por ingresos, egresos o ver todos juntos.
- Consultar el historial de movimientos para saber en qué se gasta y de dónde provienen los ingresos.

## ¿Por qué es importante?

El flujo de caja te ayuda a saber si tu negocio está ganando o perdiendo dinero, y te permite tomar mejores decisiones para evitar problemas de liquidez.

> **Consejo:**  
> Usa esta sección todos los días para registrar tus movimientos y tener siempre claro el estado financiero de tu negocio.

---

## Recomendaciones

- Si tienes dudas, busca el botón de ayuda o consulta este manual.
- Los datos de finanzas están protegidos y solo los usuarios autorizados pueden verlos o modificarlos.

---

## Ejemplo rápido

- Para registrar un gasto fijo, entra a **Finanzas > Gastos Fijos** y haz clic en **Agregar Gasto Fijo**.
- Para ver el saldo de caja, entra a **Finanzas > Caja**.

---

**Recuerda:**  
La sección de Finanzas está pensada para que cualquier usuario pueda entender y controlar el dinero del negocio sin complicaciones.

---

**Este manual se irá ampliando a medida que se agreguen nuevas funcionalidades.**

**Este manual se irá ampliando a medida que se agreguen nuevas funcionalidades.**

