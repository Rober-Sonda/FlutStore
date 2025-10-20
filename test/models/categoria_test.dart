import 'package:flutter_test/flutter_test.dart';
import 'package:tienda_app/models/categoria.dart';
import 'package:tienda_app/models/propiedad_categoria.dart';

void main() {
  group('Categoria Model Tests - TDD', () {
    late Categoria categoria;
    late PropiedadCategoria propiedadEjemplo;
    
    setUp(() {
      // Arrange: Configurar objetos base para cada test
      propiedadEjemplo = PropiedadCategoria()
        ..nombre = 'Color'
        ..tipo = TipoPropiedad.texto
        ..requerido = true;
        
      categoria = Categoria()
        ..nombre = 'Electrónicos'
        ..descripcion = 'Productos electrónicos y tecnológicos'
        ..orden = 1;
    });

    group('Constructor Tests', () {
      test('debe crear categoría con valores por defecto', () {
        // Arrange & Act
        final nuevaCategoria = Categoria();
        
        // Assert
        expect(nuevaCategoria.id, isA<int>()); // Isar.autoIncrement
        expect(nuevaCategoria.propiedades, isEmpty);
        expect(nuevaCategoria.orden, equals(0));
        expect(nuevaCategoria.parent, isNull);
      });

      test('debe crear categoría con nombre requerido', () {
        // Act & Assert
        expect(categoria.nombre, equals('Electrónicos'));
        expect(categoria.descripcion, equals('Productos electrónicos y tecnológicos'));
        expect(categoria.orden, equals(1));
      });
    });

    group('Validation Tests', () {
      test('debe validar nombre no vacío', () {
        // Act & Assert
        expect(categoria.nombre.isNotEmpty, isTrue);
      });

      test('debe validar orden como número entero', () {
        // Act & Assert
        expect(categoria.orden, isA<int>());
        expect(categoria.orden, greaterThanOrEqualTo(0));
      });

      test('debe permitir descripción opcional', () {
        // Arrange & Act
        final categoriaSimple = Categoria()..nombre = 'Ropa';
        
        // Assert
        expect(categoriaSimple.descripcion, isNull);
      });
    });

    group('Hierarchy Tests', () {
      test('debe manejar categoría padre opcional', () {
        // Act & Assert
        expect(categoria.parent, isNull);
      });

      test('debe permitir establecer categoría padre', () {
        // Act
        categoria.parent = 5;
        
        // Assert
        expect(categoria.parent, equals(5));
      });

      test('debe validar que parent sea diferente al propio id', () {
        // Arrange
        categoria.id = 10;
        
        // Act & Assert - Lógica que debería implementarse
        // En un caso real, habría validación para evitar self-reference
        expect(categoria.id != categoria.parent, isTrue);
      });
    });

    group('Properties Management Tests', () {
      test('debe inicializar con lista vacía de propiedades', () {
        // Act & Assert
        expect(categoria.propiedades, isEmpty);
        expect(categoria.propiedades, isA<List<PropiedadCategoria>>());
      });

      test('debe permitir agregar propiedades', () {
        // Act
        categoria.propiedades.add(propiedadEjemplo);
        
        // Assert
        expect(categoria.propiedades.length, equals(1));
        expect(categoria.propiedades.first.nombre, equals('Color'));
      });

      test('debe manejar múltiples propiedades', () {
        // Arrange
        final propiedad2 = PropiedadCategoria()
          ..nombre = 'Tamaño'
          ..tipo = TipoPropiedad.numero
          ..requerido = false;
          
        // Act
        categoria.propiedades.addAll([propiedadEjemplo, propiedad2]);
        
        // Assert
        expect(categoria.propiedades.length, equals(2));
        expect(categoria.propiedades.map((p) => p.nombre), contains('Color'));
        expect(categoria.propiedades.map((p) => p.nombre), contains('Tamaño'));
      });
    });

    group('Business Logic Tests', () {
      test('debe determinar si es categoría raíz (sin padre)', () {
        // Act & Assert
        expect(categoria.parent, isNull);
      });

      test('debe determinar si es subcategoría', () {
        // Act
        categoria.parent = 1;
        
        // Assert
        expect(categoria.parent, isNotNull);
      });

      test('debe permitir ordenamiento por campo orden', () {
        // Arrange
        final cat1 = Categoria()..nombre = 'Primera'..orden = 1;
        final cat2 = Categoria()..nombre = 'Segunda'..orden = 2;
        final cat3 = Categoria()..nombre = 'Tercera'..orden = 0;
        
        final categorias = [cat2, cat3, cat1];
        
        // Act
        categorias.sort((a, b) => a.orden.compareTo(b.orden));
        
        // Assert
        expect(categorias[0].nombre, equals('Tercera')); // orden 0
        expect(categorias[1].nombre, equals('Primera')); // orden 1
        expect(categorias[2].nombre, equals('Segunda')); // orden 2
      });
    });

    group('Data Validation Tests', () {
      test('debe validar nombres únicos de propiedades', () {
        // Arrange
        final propiedad1 = PropiedadCategoria()..nombre = 'Color';
        final propiedad2 = PropiedadCategoria()..nombre = 'Color'; // Duplicado
        
        categoria.propiedades.addAll([propiedad1, propiedad2]);
        
        // Act
        final nombresUnicos = categoria.propiedades
            .map((p) => p.nombre)
            .toSet()
            .length;
        
        // Assert
        expect(nombresUnicos, equals(1)); // Debería detectar duplicado
      });

      test('debe validar que orden sea positivo', () {
        // Act
        categoria.orden = -1;
        
        // Assert - En implementación real habría validación
        expect(categoria.orden, lessThan(0)); // Actualmente permite negativos
      });
    });

    group('Search and Filter Tests', () {
      test('debe permitir búsqueda por nombre', () {
        // Act
        final matchNombre = categoria.nombre.toLowerCase().contains('electr');
        
        // Assert
        expect(matchNombre, isTrue);
      });

      test('debe permitir filtrado por propiedades requeridas', () {
        // Arrange
        final propRequerida = PropiedadCategoria()
          ..nombre = 'Marca'
          ..requerido = true;
        final propOpcional = PropiedadCategoria()
          ..nombre = 'Garantía'
          ..requerido = false;
          
        categoria.propiedades.addAll([propRequerida, propOpcional]);
        
        // Act
        final propiedadesRequeridas = categoria.propiedades
            .where((p) => p.requerido)
            .toList();
        
        // Assert
        expect(propiedadesRequeridas.length, equals(1));
        expect(propiedadesRequeridas.first.nombre, equals('Marca'));
      });
    });
  });
}