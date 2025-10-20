import 'package:flutter/material.dart';
import '../models/producto.dart';
import '../services/database_service.dart';

class ProductoProvider with ChangeNotifier {
  final DatabaseService _databaseService = DatabaseService();
  List<Producto> _productos = [];
  List<Producto> _productosFiltrados = [];
  bool _isLoading = false;
  String _filtroCategoria = '';
  String _filtroTexto = '';

  List<Producto> get productos => _productos;
  List<Producto> get productosFiltrados => _productosFiltrados;
  bool get isLoading => _isLoading;

  ProductoProvider() {
    _initializeData();
  }

  Future<void> _initializeData() async {
    await _databaseService.initializeTestData();
    cargarProductos();
  }

  // Método público para inicializar datos de prueba
  Future<void> initializeTestData() async {
    await _databaseService.initializeTestData();
    await cargarProductos();
  }

  Future<void> cargarProductos() async {
    _isLoading = true;
    notifyListeners();

    try {
      _productos = await _databaseService.getProductos();
      _aplicarFiltros();
    } catch (e) {
      print('Error cargando productos: $e');
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> agregarProducto(Producto producto) async {
    try {
      await _databaseService.insertProducto(producto);
      await cargarProductos();
    } catch (e) {
      print('Error agregando producto: $e');
      rethrow;
    }
  }

  Future<void> actualizarProducto(Producto producto) async {
    try {
      await _databaseService.updateProducto(producto);
      await cargarProductos();
    } catch (e) {
      print('Error actualizando producto: $e');
      rethrow;
    }
  }

  Future<void> eliminarProducto(int id) async {
    try {
      await _databaseService.deleteProducto(id);
      await cargarProductos();
    } catch (e) {
      print('Error eliminando producto: $e');
      rethrow;
    }
  }

  void filtrarPorCategoria(String categoria) {
    _filtroCategoria = categoria;
    _aplicarFiltros();
    notifyListeners();
  }

  void filtrarPorTexto(String texto) {
    _filtroTexto = texto;
    _aplicarFiltros();
    notifyListeners();
  }

  void limpiarFiltros() {
    _filtroCategoria = '';
    _filtroTexto = '';
    _aplicarFiltros();
    notifyListeners();
  }

  void _aplicarFiltros() {
    _productosFiltrados =
        _productos.where((producto) {
          bool coincideCategoria =
              _filtroCategoria.isEmpty ||
              (producto.categoria?.toLowerCase().contains(
                _filtroCategoria.toLowerCase(),
              ) ?? false);
          bool coincideTexto =
              _filtroTexto.isEmpty ||
              (producto.nombre?.toLowerCase().contains(
                _filtroTexto.toLowerCase(),
              ) ?? false) ||
              (producto.descripcion?.toLowerCase().contains(
                _filtroTexto.toLowerCase(),
              ) ?? false);

          return coincideCategoria && coincideTexto;
        }).toList();
  }

  List<String> get categorias {
    return _productos.map((p) => p.categoria ?? '').where((c) => c.isNotEmpty).toSet().toList()..sort();
  }
}
