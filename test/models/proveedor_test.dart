import 'package:flutter_test/flutter_test.dart';
import 'package:tienda_app/models/proveedor.dart';

void main() {
  group('Proveedor Model Tests - TDD', () {
    late Proveedor proveedor;
    
    setUp(() {
      // Arrange: Configurar objeto base para cada test
      proveedor = Proveedor(
        nombre: 'Textiles del Norte SA',
        razonSocial: 'Textiles del Norte Sociedad Anónima',
        email: 'ventas@textilesnorte.com',
        telefono: '+54-11-4567-8900',
        whatsapp: '+549114567890',
        direccion: 'Av. Industria 1234, Buenos Aires',
        cuit: '20-12345678-9',
        contacto: 'María Rodríguez',
        sitioWeb: 'www.textilesnorte.com',
        horarioAtencion: 'Lunes a Viernes 8:00-17:00',
        condicionesPago: '30 días',
        plazoEntrega: 15,
        descuento: 5.0,
        categorias: ['Camisas', 'Pantalones', 'Vestidos'],
      )..fechaRegistro = DateTime(2024, 1, 15);
    });

    group('Constructor Tests', () {
      test('debe crear proveedor con campos mínimos requeridos', () {
        // Arrange & Act
        final nuevoProveedor = Proveedor(nombre: 'Proveedor Simple');
        
        // Assert
        expect(nuevoProveedor.id, isA<int>());
        expect(nuevoProveedor.nombre, equals('Proveedor Simple'));
        expect(nuevoProveedor.activo, isTrue);
        expect(nuevoProveedor.estado, equals('activo'));
        expect(nuevoProveedor.categorias, isEmpty);
        expect(nuevoProveedor.fechaRegistro, isA<DateTime>());
      });

      test('debe crear proveedor completo con todos los campos', () {
        // Act & Assert
        expect(proveedor.nombre, equals('Textiles del Norte SA'));
        expect(proveedor.razonSocial, equals('Textiles del Norte Sociedad Anónima'));
        expect(proveedor.email, equals('ventas@textilesnorte.com'));
        expect(proveedor.telefono, equals('+54-11-4567-8900'));
        expect(proveedor.whatsapp, equals('+549114567890'));
        expect(proveedor.direccion, equals('Av. Industria 1234, Buenos Aires'));
        expect(proveedor.cuit, equals('20-12345678-9'));
        expect(proveedor.contacto, equals('María Rodríguez'));
        expect(proveedor.sitioWeb, equals('www.textilesnorte.com'));
        expect(proveedor.condicionesPago, equals('30 días'));
        expect(proveedor.plazoEntrega, equals(15));
        expect(proveedor.descuento, equals(5.0));
      });
    });

    group('Validation Tests', () {
      test('debe validar nombre no vacío', () {
        // Act & Assert
        expect(proveedor.nombre.isNotEmpty, isTrue);
      });

      test('debe validar formato de email válido', () {
        // Arrange & Act
        final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
        
        // Assert
        expect(emailRegex.hasMatch(proveedor.email!), isTrue);
      });

      test('debe validar formato de CUIT argentino', () {
        // Arrange & Act
        final cuitRegex = RegExp(r'^\d{2}-\d{8}-\d{1}$');
        
        // Assert
        expect(cuitRegex.hasMatch(proveedor.cuit!), isTrue);
      });

      test('debe validar formato de WhatsApp argentino', () {
        // Act & Assert
        expect(proveedor.whatsapp!.startsWith('+549'), isTrue);
      });

      test('debe validar descuento como porcentaje válido', () {
        // Act & Assert
        expect(proveedor.descuento, greaterThanOrEqualTo(0));
        expect(proveedor.descuento, lessThanOrEqualTo(100));
      });
    });

    group('Contact Information Tests', () {
      test('debe manejar múltiples formas de contacto', () {
        // Act & Assert
        expect(proveedor.email, isNotNull);
        expect(proveedor.telefono, isNotNull);
        expect(proveedor.whatsapp, isNotNull);
      });

      test('debe permitir contacto alternativo', () {
        // Act
        proveedor.emailAlternativo = 'administracion@textilesnorte.com';
        proveedor.telefonoAlternativo = '+54-11-4567-8901';
        proveedor.personaContacto = 'Juan Carlos López';
        proveedor.cargoContacto = 'Gerente de Ventas';
        
        // Assert
        expect(proveedor.emailAlternativo, equals('administracion@textilesnorte.com'));
        expect(proveedor.telefonoAlternativo, equals('+54-11-4567-8901'));
        expect(proveedor.personaContacto, equals('Juan Carlos López'));
        expect(proveedor.cargoContacto, equals('Gerente de Ventas'));
      });

      test('debe manejar campos de contacto opcionales como null', () {
        // Arrange & Act
        final proveedorMinimo = Proveedor(nombre: 'Proveedor Básico');
        
        // Assert
        expect(proveedorMinimo.email, isNull);
        expect(proveedorMinimo.telefono, isNull);
        expect(proveedorMinimo.whatsapp, isNull);
        expect(proveedorMinimo.emailAlternativo, isNull);
        expect(proveedorMinimo.telefonoAlternativo, isNull);
      });
    });

    group('Business Information Tests', () {
      test('debe manejar información comercial completa', () {
        // Act & Assert
        expect(proveedor.condicionesPago, equals('30 días'));
        expect(proveedor.plazoEntrega, equals(15));
        expect(proveedor.descuento, equals(5.0));
        expect(proveedor.horarioAtencion, equals('Lunes a Viernes 8:00-17:00'));
      });

      test('debe validar plazos de entrega razonables', () {
        // Act & Assert
        expect(proveedor.plazoEntrega, greaterThan(0));
        expect(proveedor.plazoEntrega, lessThan(365)); // Menos de un año
      });

      test('debe manejar diferentes condiciones de pago', () {
        // Arrange
        final condicionesPago = ['Contado', '15 días', '30 días', '60 días', '90 días'];
        
        // Act & Assert
        for (final condicion in condicionesPago) {
          proveedor.condicionesPago = condicion;
          expect(proveedor.condicionesPago, equals(condicion));
        }
      });
    });

    group('Categories Management Tests', () {
      test('debe manejar múltiples categorías de productos', () {
        // Act & Assert
        expect(proveedor.categorias.length, equals(3));
        expect(proveedor.categorias, contains('Camisas'));
        expect(proveedor.categorias, contains('Pantalones'));
        expect(proveedor.categorias, contains('Vestidos'));
      });

      test('debe permitir crear proveedor con categorías específicas', () {
        // Arrange & Act
        final proveedorConCategorias = Proveedor(
          nombre: 'Proveedor Zapatos',
          categorias: ['Zapatos', 'Accesorios'],
        );
        
        // Assert
        expect(proveedorConCategorias.categorias.length, equals(2));
        expect(proveedorConCategorias.categorias, contains('Zapatos'));
        expect(proveedorConCategorias.categorias, contains('Accesorios'));
      });

      test('debe permitir crear proveedor con categorías filtradas', () {
        // Arrange & Act
        final categoriasOriginales = ['Camisas', 'Pantalones', 'Vestidos'];
        final categoriasFiltradas = categoriasOriginales.where((c) => c != 'Vestidos').toList();
        final proveedorFiltrado = Proveedor(
          nombre: 'Proveedor Filtrado',
          categorias: categoriasFiltradas,
        );
        
        // Assert
        expect(proveedorFiltrado.categorias.length, equals(2));
        expect(proveedorFiltrado.categorias, isNot(contains('Vestidos')));
        expect(proveedorFiltrado.categorias, contains('Camisas'));
        expect(proveedorFiltrado.categorias, contains('Pantalones'));
      });

      test('debe manejar proveedor especializado en una categoría', () {
        // Arrange & Act
        final proveedorEspecializado = Proveedor(
          nombre: 'Calzados Especializados',
          categorias: ['Zapatos'],
        );
        
        // Assert
        expect(proveedorEspecializado.categorias.length, equals(1));
        expect(proveedorEspecializado.categorias.first, equals('Zapatos'));
      });
    });

    group('Status Management Tests', () {
      test('debe tener estado activo por defecto', () {
        // Act & Assert
        expect(proveedor.activo, isTrue);
        expect(proveedor.estado, equals('activo'));
      });

      test('debe permitir cambiar estado a inactivo', () {
        // Act
        proveedor.activo = false;
        proveedor.estado = 'inactivo';
        
        // Assert
        expect(proveedor.activo, isFalse);
        expect(proveedor.estado, equals('inactivo'));
      });

      test('debe manejar diferentes estados válidos', () {
        // Arrange
        final estadosValidos = ['activo', 'inactivo', 'suspendido'];
        
        // Act & Assert
        for (final estado in estadosValidos) {
          proveedor.estado = estado;
          expect(proveedor.estado, equals(estado));
        }
      });

      test('debe permitir suspender proveedor temporalmente', () {
        // Act
        proveedor.estado = 'suspendido';
        proveedor.observaciones = 'Suspendido por problemas de calidad';
        
        // Assert
        expect(proveedor.estado, equals('suspendido'));
        expect(proveedor.observaciones, contains('Suspendido'));
      });
    });

    group('Audit and Tracking Tests', () {
      test('debe registrar fecha de registro automáticamente', () {
        // Act & Assert
        expect(proveedor.fechaRegistro, isNotNull);
        expect(proveedor.fechaRegistro.isBefore(DateTime.now().add(Duration(seconds: 1))), isTrue);
      });

      test('debe almacenar observaciones del proveedor', () {
        // Act
        proveedor.observaciones = 'Proveedor confiable con entregas puntuales';
        
        // Assert
        expect(proveedor.observaciones, equals('Proveedor confiable con entregas puntuales'));
      });

      test('debe calcular antigüedad del proveedor', () {
        // Arrange
        final proveedorAntiguo = Proveedor(nombre: 'Proveedor Antiguo')
          ..fechaRegistro = DateTime.now().subtract(Duration(days: 365));
        
        // Act
        final diasRegistrado = DateTime.now().difference(proveedorAntiguo.fechaRegistro).inDays;
        
        // Assert
        expect(diasRegistrado, greaterThanOrEqualTo(365));
      });
    });

    group('Search and Filter Tests', () {
      test('debe permitir búsqueda por nombre', () {
        // Act
        final matchNombre = proveedor.nombre.toLowerCase().contains('textiles');
        
        // Assert
        expect(matchNombre, isTrue);
      });

      test('debe permitir filtrar por categorías', () {
        // Act
        final tieneCamisas = proveedor.categorias.contains('Camisas');
        final tieneZapatos = proveedor.categorias.contains('Zapatos');
        
        // Assert
        expect(tieneCamisas, isTrue);
        expect(tieneZapatos, isFalse);
      });

      test('debe permitir búsqueda por ubicación', () {
        // Act
        final matchDireccion = proveedor.direccion!.toLowerCase().contains('buenos aires');
        
        // Assert
        expect(matchDireccion, isTrue);
      });
    });

    group('Business Logic Tests', () {
      test('debe calcular descuento aplicable', () {
        // Arrange
        final montoCompra = 1000.0;
        
        // Act
        final descuentoAplicado = montoCompra * (proveedor.descuento! / 100);
        final montoFinal = montoCompra - descuentoAplicado;
        
        // Assert
        expect(descuentoAplicado, equals(50.0)); // 5% de 1000
        expect(montoFinal, equals(950.0));
      });

      test('debe manejar proveedor sin descuento', () {
        // Arrange
        proveedor.descuento = null;
        final montoCompra = 1000.0;
        
        // Act
        final descuentoAplicado = proveedor.descuento != null 
            ? montoCompra * (proveedor.descuento! / 100) 
            : 0.0;
        
        // Assert
        expect(descuentoAplicado, equals(0.0));
      });

      test('debe validar disponibilidad del proveedor', () {
        // Act & Assert - Proveedor activo disponible
        expect(proveedor.activo && proveedor.estado == 'activo', isTrue);
        
        // Act - Suspender proveedor
        proveedor.estado = 'suspendido';
        
        // Assert - Proveedor no disponible
        expect(proveedor.activo && proveedor.estado == 'activo', isFalse);
      });
    });

    group('Integration Tests', () {
      test('debe representar proveedor completo para tienda de ropa', () {
        // Act & Assert - Validar datos completos
        expect(proveedor.nombre.isNotEmpty, isTrue);
        expect(proveedor.email, isNotNull);
        expect(proveedor.telefono, isNotNull);
        expect(proveedor.direccion, isNotNull);
        expect(proveedor.condicionesPago, isNotNull);
        expect(proveedor.plazoEntrega, isNotNull);
        expect(proveedor.categorias.isNotEmpty, isTrue);
        expect(proveedor.activo, isTrue);
        
        // Validar categorías apropiadas para tienda de ropa
        final categoriasRopa = ['Camisas', 'Pantalones', 'Vestidos'];
        for (final categoria in categoriasRopa) {
          expect(proveedor.categorias, contains(categoria));
        }
      });

      test('debe simular flujo de selección de proveedor para compra', () {
        // Arrange - Criterios de selección
        final criteriosSeleccion = {
          'activo': proveedor.activo,
          'tieneStock': proveedor.estado == 'activo',
          'entregaRapida': proveedor.plazoEntrega! <= 30,
          'tieneDescuento': proveedor.descuento != null && proveedor.descuento! > 0,
          'categoriaRequerida': proveedor.categorias.contains('Camisas'),
        };
        
        // Act & Assert - Validar elegibilidad
        final esElegible = criteriosSeleccion.values.every((criterio) => criterio);
        expect(esElegible, isTrue);
        
        // Información disponible para decisión de compra
        expect(proveedor.condicionesPago, isNotNull);
        expect(proveedor.plazoEntrega, lessThanOrEqualTo(30));
        expect(proveedor.descuento, greaterThan(0));
      });
    });
  });
}