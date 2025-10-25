# FlutStore - Sistema de Gestión Comercial Profesional

Un sistema completo de gestión para tiendas de ropa desarrollado en Flutter con soporte para desktop y mobile, diseñado con principios UX/UI modernos y arquitectura profesional.

## 📋 Descripción del Proyecto

Sistema integral de punto de venta y gestión comercial que incluye control de inventario, ventas, compras, clientes, proveedores, finanzas y reportes. Diseñado específicamente para tiendas de ropa con funcionalidades avanzadas como manejo de tallas, colores, ofertas y sorteos.

**✨ Recién actualizado con diseño profesional:**
- Sistema de glassmorphismo y efectos modernos
- AppBar profesional con gradientes
- Navegación lateral rediseñada con armonía de colores
- Paleta de colores profesional (#1E293B, #3B82F6, #334155)
- Formularios con transparencia para mostrar backgrounds
- Componentes reutilizables con principios UX/UI

## 🏗️ Arquitectura del Proyecto

### Estructura de Directorios
`
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
│   ├── shared/                 # ⭐ Componentes profesionales compartidos
│   │   ├── professional_app_bar.dart     # AppBar moderno con gradientes
│   │   ├── glass_containers.dart         # Efectos glassmorphismo
│   │   └── professional_navigation_rail.dart # Navegación modernizada
│   ├── stock_movements/        # Movimientos de stock
│   └── users/                  # Gestión de usuarios
├── controllers/                # Controladores de lógica de negocio
├── docs/                       # 📚 Documentación técnica del proyecto
├── models/                     # Modelos de datos (con Isar)
├── providers/                  # Estado global (Riverpod)
├── seed/                       # Datos de prueba y seeding
├── services/                   # Servicios e integraciones
├── src/                        # Configuraciones y utilidades core
├── utils/                      # Utilidades y helpers
├── views/                      # Pantallas principales
│   ├── usuarios/              # ⭐ Vista modernizada de usuarios
│   │   └── modern_users_roles_view.dart
│   └── productos_view.dart    # ⭐ Vista modernizada de productos
└── widgets/                    # Widgets reutilizables
    ├── app_design_system.dart  # ⭐ Sistema de diseño profesional
    ├── theme_switcher.dart     # Cambio de tema integrado
    └── ...                     # Otros widgets UI
`

## 🎨 Nuevo Sistema de Diseño Profesional

### Paleta de Colores Moderna
- **navPrimary**: #1E293B (Slate-800) - Color principal profesional
- **navAccent**: #3B82F6 (Blue-500) - Azul de acento moderno  
- **navSecondary**: #334155 (Slate-700) - Gris medio armónico
- **navHover**: #475569 (Slate-600) - Estado hover consistente

### Componentes Modernos Implementados

#### 🏗️ ProfessionalAppBar
`dart
ProfessionalAppBar(
  title: 'Productos',
  actions: [...], // Acciones personalizadas
  showThemeSwitcher: true, // Integración de cambio de tema
)
`

#### 🔮 GlassContainers (Glassmorphismo)
`dart
GlassFormContainer(
  child: // Formularios con efecto cristal
),
GlassCard(
  child: // Tarjetas con blur backdrop
)
`

#### 🧭 ProfessionalNavigationRail
- Header moderno con logo
- Animaciones fluidas de 200ms
- Colores armoniosos profesionales
- Estados hover e interacción mejorados

### Efectos Visuales Modernos
- **Glassmorphismo**: Transparencias elegantes con backdrop blur
- **Gradientes profesionales**: Fondos con degradados sutiles
- **Sombras profesionales**: Sistema de depth y elevación
- **Animaciones fluidas**: Transiciones de 200ms en componentes
- **Chips animados**: Filtros con efectos hover y estado activo

## 🛠️ Tecnologías Utilizadas

- **Flutter**: Framework de desarrollo multiplataforma
- **Riverpod**: Gestión de estado reactivo
- **Isar**: Base de datos NoSQL local de alto rendimiento
- **bitsdojo_window**: Personalización de ventana para desktop
- **Material 3**: Sistema de diseño moderno con componentes personalizados

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

## 🎨 Características de UI/UX Modernas

### Diseño Profesional Actualizado
- **Glassmorphismo**: Efectos de cristal con transparencias elegantes
- **Gradientes modernos**: Fondos con degradados profesionales
- **Paleta armoniosa**: Colores seleccionados siguiendo principios de diseño
- **Tipografía consistente**: Sistema de fuentes unificado

### Temas Personalizables
- **Colores por Sección**: Cada módulo tiene su paleta de colores
- **Temas Claros/Oscuros**: Soporte completo para ambos modos
- **Tipografía Configurable**: Fuentes personalizables
- **Configuración de Negocio**: Logo, colores corporativos

### Diseño Responsive
- **Desktop First**: Optimizado para pantallas grandes
- **Mobile Friendly**: Adaptable a dispositivos móviles
- **Navegación Intuitiva**: Menús contextuales y breadcrumbs
- **Formularios transparentes**: Para apreciar backgrounds de moda

## 🚀 Getting Started

### Prerrequisitos
- Flutter SDK (>=3.0.0)
- Dart SDK
- IDE (VS Code/Android Studio)

### Instalación
`ash
# Clonar el repositorio
git clone https://github.com/Rober-Sonda/FlutStore.git

# Navegar al directorio
cd tienda_app

# Instalar dependencias
flutter pub get

# Generar archivos Isar
flutter packages pub run build_runner build

# Ejecutar la aplicación
flutter run -d windows  # Para desktop
flutter run              # Para mobile
`

## 📱 Plataformas Soportadas

- ✅ **Windows Desktop**
- ✅ **macOS Desktop** 
- ✅ **Linux Desktop**
- ✅ **Android Mobile**
- ✅ **iOS Mobile**

## 📈 Estado del Desarrollo

### ✅ Completado Recientemente - Modernización UI/UX (Oct 2024)

#### 🎨 **Sistema de Diseño Profesional**
- **AppDesignSystem renovado**: Paleta de colores profesional implementada
- **Componentes glassmorphismo**: GlassFormContainer y GlassCard creados
- **ProfessionalAppBar**: AppBar moderno con gradientes y tema switcher
- **Navigation Rail modernizado**: Colores armoniosos y animaciones fluidas

#### 🔧 **Correcciones Técnicas**
- **Imports corregidos**: Rutas de importación (../widgets/ → ../../widgets/)
- **Errores críticos**: 0 errores de compilación restantes
- **ThemeSwitcher integration**: Integración completa del cambio de tema

#### 🏗️ **Vistas Modernizadas**
- **ModernUsersRolesView**: Glassmorphismo y filtros animados implementados
- **ProductosView**: Tarjetas con efectos cristal y filtros profesionales
- **Chips animados**: Filtros con estados hover y transiciones fluidas

### 📊 Métricas Actuales
- **Critical Errors**: 0 ✅ (todos resueltos)
- **Compilation**: ✅ Exitosa (APK debug generado)
- **UI Components**: 3 nuevos componentes profesionales creados
- **Views Updated**: 2 vistas principales modernizadas

### 🎯 Próximos Objetivos
1. **Complete UI Modernization**: Aplicar nuevo diseño a todas las vistas
2. **Performance Optimization**: Optimización de rendimiento con nuevo sistema
3. **Accessibility**: Mejorar accesibilidad con componentes modernos

## 🤝 Contribución

1. Fork el proyecto
2. Crear una rama para tu feature (git checkout -b feature/AmazingFeature)
3. Commit tus cambios siguiendo [Conventional Commits](https://www.conventionalcommits.org/)
4. Push a la rama (git push origin feature/AmazingFeature)
5. Abrir un Pull Request

### Conventional Commits
Utilizamos la convención de commits para mantener un historial limpio:
`ash
feat: nueva funcionalidad
fix: corrección de errores
refactor: refactorización de código
style: cambios de estilo/formato
docs: actualizaciones de documentación
test: agregar o corregir tests
`

## 👤 Autor

**Rober-Sonda**
- GitHub: [@Rober-Sonda](https://github.com/Rober-Sonda)
- Email: rober.junin@gmail.com
- Proyecto: [FlutStore](https://github.com/Rober-Sonda/FlutStore)

---

**⭐ Si te gusta este proyecto, no olvides darle una estrella!**
