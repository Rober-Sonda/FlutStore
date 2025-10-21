import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:tienda_app/views/productos_view.dart';
import 'package:tienda_app/providers/producto_provider.dart';
import 'package:tienda_app/widgets/loading_indicator.dart';

// Mock simple que NO inicializa datos automáticamente
class TestProductoProvider extends ProductoProvider {
  bool _isLoadingTest = false;
  
  @override
  bool get isLoading => _isLoadingTest;
  
  void setLoading(bool loading) {
    _isLoadingTest = loading;
    notifyListeners();
  }
  
  // Override para evitar inicialización automática
  @override
  Future<void> initializeTestData() async {
    // No hacer nada en tests
  }
}

void main() {
  group('ProductosView Basic Tests', () {
    testWidgets('should display app bar with title', (WidgetTester tester) async {
      final provider = TestProductoProvider();
      
      await tester.pumpWidget(
        MaterialApp(
          home: ChangeNotifierProvider<ProductoProvider>(
            create: (_) => provider,
            child: ProductosView(),
          ),
        ),
      );

      await tester.pump();

      // Assert
      expect(find.text('Productos'), findsOneWidget);
      expect(find.byIcon(Icons.search), findsOneWidget);
      expect(find.byIcon(Icons.filter_list), findsOneWidget);
    });

    testWidgets('should display loading indicator when isLoading is true', (WidgetTester tester) async {
      final provider = TestProductoProvider();
      provider.setLoading(true);
      
      await tester.pumpWidget(
        MaterialApp(
          home: ChangeNotifierProvider<ProductoProvider>(
            create: (_) => provider,
            child: ProductosView(),
          ),
        ),
      );

      await tester.pump();

      // Assert
      expect(find.byType(LoadingIndicator), findsOneWidget);
      expect(find.text('Cargando productos...'), findsOneWidget);
    });

    testWidgets('should display empty state when no products', (WidgetTester tester) async {
      final provider = TestProductoProvider();
      provider.setLoading(false);
      
      await tester.pumpWidget(
        MaterialApp(
          home: ChangeNotifierProvider<ProductoProvider>(
            create: (_) => provider,
            child: ProductosView(),
          ),
        ),
      );

      await tester.pump();

      // Assert
      expect(find.text('No hay productos disponibles'), findsOneWidget);
      expect(find.text('Agrega tu primer producto para comenzar'), findsOneWidget);
    });

    testWidgets('should display floating action button', (WidgetTester tester) async {
      final provider = TestProductoProvider();
      provider.setLoading(false);
      
      await tester.pumpWidget(
        MaterialApp(
          home: ChangeNotifierProvider<ProductoProvider>(
            create: (_) => provider,
            child: ProductosView(),
          ),
        ),
      );

      await tester.pump();

      // Assert
      expect(find.byType(FloatingActionButton), findsOneWidget);
      expect(find.text('Agregar'), findsOneWidget);
    });

    testWidgets('should show snackbar when FAB is pressed', (WidgetTester tester) async {
      final provider = TestProductoProvider();
      provider.setLoading(false);
      
      await tester.pumpWidget(
        MaterialApp(
          home: ChangeNotifierProvider<ProductoProvider>(
            create: (_) => provider,
            child: ProductosView(),
          ),
        ),
      );

      await tester.pump();

      // Act
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pump();

      // Assert
      expect(find.text('Función en desarrollo'), findsOneWidget);
    });

    testWidgets('should show search dialog when search icon is tapped', (WidgetTester tester) async {
      final provider = TestProductoProvider();
      provider.setLoading(false);
      
      await tester.pumpWidget(
        MaterialApp(
          home: ChangeNotifierProvider<ProductoProvider>(
            create: (_) => provider,
            child: ProductosView(),
          ),
        ),
      );

      await tester.pump();

      // Act
      await tester.tap(find.byIcon(Icons.search));
      await tester.pump();

      // Assert
      expect(find.text('Buscar productos'), findsOneWidget);
      expect(find.text('Escribe el nombre del producto...'), findsOneWidget);
    });

    testWidgets('should show filter dialog when filter icon is tapped', (WidgetTester tester) async {
      final provider = TestProductoProvider();
      provider.setLoading(false);
      
      await tester.pumpWidget(
        MaterialApp(
          home: ChangeNotifierProvider<ProductoProvider>(
            create: (_) => provider,
            child: ProductosView(),
          ),
        ),
      );

      await tester.pump();

      // Act
      await tester.tap(find.byIcon(Icons.filter_list));
      await tester.pump();

      // Assert
      expect(find.text('Filtrar por categoría'), findsOneWidget);
      expect(find.text('Todas las categorías'), findsOneWidget);
    });

    testWidgets('should render without exceptions', (WidgetTester tester) async {
      final provider = TestProductoProvider();
      provider.setLoading(false);
      
      await tester.pumpWidget(
        MaterialApp(
          home: ChangeNotifierProvider<ProductoProvider>(
            create: (_) => provider,
            child: ProductosView(),
          ),
        ),
      );

      await tester.pump();

      // Assert
      expect(find.byType(ProductosView), findsOneWidget);
      expect(tester.takeException(), isNull);
    });
  });
}