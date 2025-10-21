# Tienda NAJAM - Sistema de Gestión Comercial

Un sistema completo de gestión para tiendas de ropa desarrollado en Flutter con soporte para desktop y mobile.

## 📋 Descripción del Proyecto

Sistema integral de punto de venta y gestión comercial que incluye control de inventario, ventas, compras, clientes, proveedores, finanzas y reportes. Diseñado específicamente para tiendas de ropa con funcionalidades avanzadas como manejo de tallas, colores, ofertas y sorteos.

## 🏗️ Arquitectura del Proyecto

### Estructura de Directorios
```
lib/
├── main.dart                    # Punto de entrada de la aplicación
├── components/                  # Componentes UI organizados por módulo
│   ├── categories/             # Gestión de categorías
│   ├── clients/                # Manejo de clientes
│   ├── financial_records/      # Registros financieros
│   ├── orders/                 # Pedidos y órdenes
│   ├── products/               # Productos e inventario
│   ├── properties/             # Propiedades (tallas, colores)
│   ├── providers/              # Proveedores
│   ├── purchases/              # Compras
│   ├── reports/                # Reportes y análisis
│   ├── roles/                  # Gestión de roles de usuario
│   ├── shared/                 # Componentes compartidos
│   ├── stock_movements/        # Movimientos de stock
│   └── users/                  # Gestión de usuarios
├── controllers/                # Controladores de lógica de negocio
├── models/                     # Modelos de datos (con Isar)
├── providers/                  # Estado global (Riverpod)
├── services/                   # Servicios e integraciones
├── utils/                      # Utilidades y helpers
├── views/                      # Pantallas principales
└── widgets/                    # Widgets reutilizables
```

## 🤖 Para Desarrolladores

Este es un **sistema POS completo** para tiendas de ropa con:
- **Arquitectura limpia** (Riverpod + Isar + Flutter)
- **29+ modelos de datos** interconectados
- **Sistema multi-usuario** con roles
- **Funcionalidades financieras** completas
- **UI/UX personalizable** por sección

**Patrón principal**: MVC con providers reactivos y base de datos local.

## 🛠️ Tecnologías Utilizadas

- **Flutter**: Framework de desarrollo multiplataforma
- **Riverpod**: Gestión de estado reactivo
- **Isar**: Base de datos NoSQL local de alto rendimiento
- **bitsdojo_window**: Personalización de ventana para desktop
- **Material 3**: Sistema de diseño moderno

## 📊 Funcionalidades Principales

### 💼 Gestión Comercial
- **Productos**: Catálogo con variantes (tallas, colores), precios, stock
- **Categorías**: Organización jerárquica de productos
- **Inventario**: Control de stock con movimientos automáticos
- **Ofertas**: Sistema de descuentos y promociones
- **Sorteos**: Gestión de sorteos y premios

### 👥 Gestión de Personas
- **Clientes**: Base de datos con historial de compras
- **Proveedores**: Gestión de proveedores y productos asociados
- **Usuarios**: Sistema multi-usuario con roles y permisos
- **Roles**: Control de acceso granular

### 💰 Sistema Financiero
- **Ventas**: Punto de venta con múltiples métodos de pago
- **Compras**: Registro de compras a proveedores
- **Cuentas Corrientes**: Manejo de créditos y pagos a cuotas
- **Flujo de Caja**: Control de ingresos y egresos
- **Gastos Fijos**: Registro de gastos operativos
- **Cierre de Caja**: Arqueos y balances diarios

### 📈 Reportes y Análisis
- **Reportes de Ventas**: Por período, producto, cliente
- **Análisis de Stock**: Productos más vendidos, rotación
- **Reportes Financieros**: Flujo de caja, rentabilidad
- **Movimientos de Stock**: Trazabilidad completa

## 🎨 Características de UI/UX

### Temas Personalizables
- **Colores por Sección**: Cada módulo tiene su paleta de colores
- **Temas Claros/Oscuros**: Soporte completo para ambos modos
- **Tipografía Configurable**: Fuentes personalizables
- **Configuración de Negocio**: Logo, colores corporativos

### Diseño Responsive
- **Desktop First**: Optimizado para pantallas grandes
- **Mobile Friendly**: Adaptable a dispositivos móviles
- **Navegación Intuitiva**: Menús contextuales y breadcrumbs

## 🗄️ Modelos de Datos Principales

### Productos y Catálogo
- `Product` - Información base del producto
- `Categoria` - Categorización jerárquica
- `Propiedad` - Atributos como tallas, colores
- `Oferta` - Sistema de descuentos

### Gestión Comercial
- `Cliente` - Datos de clientes y historial
- `Proveedor` - Información de proveedores
- `Pedido` - Órdenes de venta
- `Compra` - Órdenes de compra

### Sistema Financiero
- `MovimientoFinanciero` - Transacciones financieras
- `CuentaCorriente` - Créditos y financiación
- `FlujoCaja` - Control de caja
- `CierreCaja` - Arqueos diarios

### Configuración
- `Usuario` - Usuarios del sistema
- `Rol` - Permisos y accesos
- `BusinessConfig` - Configuración del negocio
- `CustomTheme` - Temas personalizados

## 🚀 Getting Started

### Prerrequisitos
- Flutter SDK (>=3.0.0)
- Dart SDK
- IDE (VS Code/Android Studio)

### Instalación
```bash
# Clonar el repositorio
git clone https://github.com/tu-usuario/tienda_app.git

# Navegar al directorio
cd tienda_app

# Instalar dependencias
flutter pub get

# Generar archivos Isar
flutter packages pub run build_runner build

# Ejecutar la aplicación
flutter run -d windows  # Para desktop
flutter run              # Para mobile
```

### Configuración Inicial
1. **Primera ejecución**: El sistema creará la base de datos local
2. **Usuario administrador**: Se crea automáticamente en el primer inicio
3. **Configuración de negocio**: Acceder a configuración para personalizar

## 📱 Plataformas Soportadas

- ✅ **Windows Desktop**
- ✅ **macOS Desktop** 
- ✅ **Linux Desktop**
- ✅ **Android Mobile**
- ✅ **iOS Mobile**

## 🔧 Configuración Avanzada

### Temas Personalizados
El sistema permite personalización completa de:
- Colores primarios y secundarios por sección
- Tipografías y tamaños de fuente
- Logos y branding corporativo
- Configuración de ventana desktop

### Base de Datos
- **Isar Database**: Base de datos local de alto rendimiento
- **Migraciones automáticas**: El sistema maneja actualizaciones de esquema
- **Backup/Restore**: Funcionalidades de respaldo incluidas

## 📈 Estado del Desarrollo

Ver `docs/development_status.md` para el estado actual de cada módulo.

## 🤝 Contribución

1. Fork el proyecto
2. Crear una rama para tu feature (`git checkout -b feature/AmazingFeature`)
3. Commit tus cambios (`git commit -m 'Add some AmazingFeature'`)
4. Push a la rama (`git push origin feature/AmazingFeature`)
5. Abrir un Pull Request

## 📄 Licencia

Este proyecto está bajo la Licencia MIT - ver el archivo [LICENSE.md](LICENSE.md) para detalles.

## 👤 Autor

**Tu Nombre**
- GitHub: [@tu-usuario](https://github.com/tu-usuario)
- Email: rober.junin@gmail.com

## 🙏 Agradecimientos

- Flutter Team por el excelente framework
- Isar Database por la base de datos local
- Riverpod por el manejo de estado
- Comunidad Flutter por el apoyo continuo