# 🛍️ FlutStore - Sistema de Gestión Comercial Fashion Edition

## 🌟 Descripción

**FlutStore Fashion Edition** es una aplicación completa de gestión comercial desarrollada en Flutter, especialmente diseñada para la audiencia juvenil con una estética moderna y vibrante que combina **moda, diversidad, personalidad y alegría**. 

Una solución empresarial completa que mantiene toda la funcionalidad de gestión comercial mientras ofrece una experiencia visual moderna e inclusiva con jóvenes de todas las etnias.

## 🌟 Características Principales

### 🎨 **Fashion Edition - Diseño Juvenil**
- **Estética Moderna**: Paleta de colores vibrantes y diseño glassmorphism
- **Diversidad Visual**: 30+ imágenes de jóvenes de todas las etnias como fondos rotativos
- **Animaciones Fluidas**: Transiciones suaves y efectos visuales modernos
- **UI Responsive**: Diseño adaptable para diferentes tamaños de pantalla

### 💼 **Funcionalidad Empresarial Completa**
- **🛒 Sistema POS**: Punto de venta completo con múltiples métodos de pago
- **📦 Gestión de Inventario**: Control total de stock con trazabilidad
- **👥 CRM Avanzado**: Base de datos de clientes con historial de compras
- **💰 Control Financiero**: Flujo de caja, gastos fijos y reportes detallados
- **📊 Reportes y Analytics**: Gráficos interactivos con métricas empresariales
- **� Sistema Multi-usuario**: Roles y permisos granulares

### 🛠️ **Tecnología de Vanguardia**
- **Flutter 3.24+**: Framework multiplataforma de Google
- **Isar Database**: Base de datos local de alto rendimiento
- **Riverpod**: Gestión de estado reactiva
- **FL Chart**: Gráficos interactivos y visualizaciones
- **Glassmorphism**: Efectos de cristal modernos

## � Módulos del Sistema

### 🏠 **Dashboard Principal**
Dashboard modernizado con KPIs visuales, estadísticas en tiempo real y navegación intuitiva.

### 🛒 **Gestión de Productos**
- Catálogo completo con imágenes
- Búsqueda avanzada y filtros
- Control de stock con alertas
- Categorización flexible
- Código de barras integrado

### 💰 **Sistema de Ventas**
- POS intuitivo y rápido
- Múltiples métodos de pago
- Descuentos y promociones
- Impresión de tickets
- Historial de transacciones

### 👤 **Gestión de Clientes**
- Base de datos completa de clientes
- Historial de compras detallado
- Sistema de cuenta corriente
- Análisis de comportamiento
- Comunicación directa

### 📊 **Reportes Avanzados**
- Gráficos interactivos con FL Chart
- Análisis de ventas por período
- Top productos más vendidos
- Análisis de rentabilidad
- Exportación de datos

### 💳 **Control Financiero**
- Flujo de caja en tiempo real
- Gestión de gastos fijos
- Análisis de rentabilidad
- Proyecciones financieras
- Control de egresos e ingresos

### 🏪 **Proveedores y Compras**
- Base de datos de proveedores
- Gestión de órdenes de compra
- Control de inventario entrante
- Análisis de costos
- Historial de compras

### 👥 **Sistema de Usuarios**
- Múltiples niveles de acceso
- Roles personalizables
- Permisos granulares
- Auditoría de acciones
- Gestión de sesiones

### 📖 **Guía de Usuario Integrada**
- Manual interactivo dentro de la app
- 9 secciones detalladas
- Solución de problemas paso a paso
- Tips y mejores prácticas
- Navegación intuitiva

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
│   └── theme_provider.dart         # ⭐ Sistema de temas adaptativos claro/oscuro
├── seed/                       # Datos de prueba y seeding
├── services/                   # Servicios e integraciones
├── src/                        # Configuraciones y utilidades core
├── utils/                      # Utilidades y helpers
├── views/                      # Pantallas principales
│   ├── categorias/            # ⭐ Sistema de categorías Fashion Edition
│   │   ├── categories_view.dart      # Vista principal elegante transformada
│   │   └── dialogs/
│   │       └── propiedad_dialog.dart # Dialog personalizado con tema adaptativo
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

### ✅ Completado Recientemente - Sistema de Categorías Elegante & Login Fashion (Oct 2025)

#### 🎨 **Nueva Experiencia de Login**
- **Diseño juvenil y energético**: Login renovado con enfoque en moda, juventud y personalidad
- **Galería expandida**: 25+ imágenes de alta calidad mostrando diversidad, estilo urbano y alegría
- **Paleta de colores actualizada**: Negro con opacidad y blanco para mejor contraste y elegancia
- **Formulario reposicionado**: Login a la derecha con imágenes pasando por detrás

#### 🖼️ **Galería Visual Mejorada**
- **Imágenes originales preservadas**: Mantenidas las que más gustaron del diseño anterior
- **Nuevas incorporaciones**: 20+ imágenes adicionales de moda juvenil, street style y diversidad
- **Temática actualizada**: Enfoque en estilo argentino, energía urbana y personalidad auténtica
- **Carousel dinámico**: Transiciones fluidas entre 25+ imágenes de alta calidad

#### 🔧 **Mejoras Técnicas del Login**
- **Botón simplificado**: Diseño más limpio y coherente con el tema general
- **Efectos optimizados**: Shimmer y hover effects actualizados con nueva paleta
- **Responsividad mejorada**: Mejor adaptación a diferentes tamaños de pantalla
- **Eliminación de elementos innecesarios**: Limpieza de referencias francesas y elementos repetitivos

#### 🌟 **Identidad Visual Renovada**
- **Branding consistente**: "TIENDA NAJAM" en letras blancas prominentes
- **Slogan actualizado**: "MODA • JUVENTUD • PERSONALIDAD" reemplaza referencias extranjeras
- **Texto en español**: Eliminación completa de referencias en francés, enfoque 100% argentino
- **Mejor legibilidad**: Alto contraste negro/blanco para optimal UX

#### 🏷️ **Sistema de Categorías Fashion Edition - NUEVO**
- **Transformación completa**: Migración de UI colorful a diseño elegante black/white/grey
- **Eliminación botones duplicados**: Removidos FloatingActionButton y botones redundantes del panel
- **Diálogos optimizados**: Nueva arquitectura con Dialog custom y constraints responsive
- **PropiedadDialog renovado**: Transformación completa de AlertDialog a sistema elegante personalizado
- **Theme system foundation**: Base preparada para temas adaptativos claro/oscuro
- **Typography refinada**: Font sizes optimizados (17-18px) y spacing inteligente
- **UX mejorada**: Diálogos compactos con `maxWidth: 380-420px` para mejor aprovechamiento del espacio

### 📊 Métricas Actuales
- **Critical Errors**: 0 ✅ (todos resueltos)
- **Compilation**: ✅ Exitosa con nuevo diseño elegant
- **Categories System**: ✅ Completamente transformado a Fashion Edition
- **Dialog Architecture**: ✅ Migrado de AlertDialog a Custom Dialog system
- **PropiedadDialog**: ✅ Rediseño completo con tema adaptativo preparado  
- **Visual Assets**: 25+ imágenes curadas de moda juvenil implementadas
- **UI Consistency**: 100% coherencia en paleta black/white/grey elegante
- **Login UX**: Experiencia renovada con enfoque en público joven argentino
- **Button Architecture**: ✅ Eliminación de elementos duplicados y redundantes

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
