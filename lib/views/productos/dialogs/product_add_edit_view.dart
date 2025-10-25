import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:isar/isar.dart';
import '../../../models/producto.dart';
import '../../../models/categoria.dart';
import '../../../models/propiedad_categoria.dart';
import '../../../models/valor_propiedad_producto.dart';
import '../../../services/product_service.dart';
import '../../../widgets/product_image_carousel.dart';
import '../../../widgets/image_picker_widget.dart';
import '../../../widgets/fashion_components.dart';

class ProductAddEditView extends ConsumerStatefulWidget {
  final int? productId;

  const ProductAddEditView({super.key, this.productId});

  @override
  ConsumerState<ProductAddEditView> createState() => _ProductAddEditViewState();
}

class _ProductAddEditViewState extends ConsumerState<ProductAddEditView> {
  bool _loading = true;
  Producto? _producto;

  // Para agregar producto
  List<Categoria> _categoriasPrincipales = [];
  List<Categoria> _categoriasActuales = [];
  final List<Categoria> _rutaSeleccionada = [];
  Categoria? _categoriaSeleccionada;
  List<PropiedadCategoria> _propiedadesCategoria = [];

  // Para editar producto
  bool _isEditMode = false;

  // Formulario
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _descripcionController = TextEditingController();
  final _precioController = TextEditingController();
  final _stockController = TextEditingController();
  final _skuController = TextEditingController();
  final _barcodeController = TextEditingController();

  // Propiedades dinámicas
  final Map<String, TextEditingController> _propiedadesControllers = {};
  final Map<String, String> _propiedadesValores = {};

  // Gestión de imágenes
  List<String> _imagenesProducto = [];
  String? _imagenPrincipal;

  // Tema y configuración - Variables removidas para usar diseño fijo elegante

  @override
  void initState() {
    super.initState();
    _isEditMode = widget.productId != null;
    _loadData();
    _loadTheme();
  }

  @override
  void dispose() {
    _nombreController.dispose();
    _descripcionController.dispose();
    _precioController.dispose();
    _stockController.dispose();
    _skuController.dispose();
    _barcodeController.dispose();
    for (var controller in _propiedadesControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  Future<void> _loadTheme() async {
    // Tema removido - usando diseño fijo elegante
  }

  Future<void> _loadData() async {
    setState(() => _loading = true);

    try {
      final productService = ref.read(productServiceProvider);
      final isar = await productService.db;

      // Cargar categorías principales
      _categoriasPrincipales =
          await isar.collection<Categoria>().filter().parentIsNull().findAll();
      _categoriasActuales = _categoriasPrincipales;

      // Si estamos editando, cargar el producto
      if (_isEditMode && widget.productId != null) {
        _producto = await isar.collection<Producto>().get(widget.productId!);
        if (_producto != null) {
          await _cargarDatosProducto();
        }
      }

      setState(() => _loading = false);
    } catch (e) {
      setState(() => _loading = false);
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error al cargar datos: $e')));
      }
    }
  }

  Future<void> _cargarDatosProducto() async {
    if (_producto == null) return;

    _nombreController.text = _producto!.nombre ?? 'Producto sin nombre';
    _precioController.text = _producto!.precio?.toString() ?? '';
    _stockController.text = _producto!.stockActual?.toString() ?? '';

    // Cargar imágenes del producto
    _imagenesProducto = List.from(_producto!.imagenes);
    _imagenPrincipal = _producto!.imagenPrincipal;

    // Cargar la categoría existente del producto
    if (_producto!.categoriaId != null) {
      try {
        final productService = ref.read(productServiceProvider);
        final isar = await productService.db;

        // Buscar la categoría del producto
        final categoria = await isar.collection<Categoria>().get(
          _producto!.categoriaId!,
        );
        if (categoria != null) {
          // Cargar la ruta completa de categorías
          await _cargarRutaCategoria(categoria);

          // Establecer la categoría seleccionada
          setState(() {
            _categoriaSeleccionada = categoria;
          });

          // Cargar las propiedades de la categoría
          await _cargarPropiedadesCategoria(categoria);
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error al cargar categoría: $e')),
          );
        }
      }
    }

    // Cargar valores de propiedades existentes
    for (final propiedad in _producto!.valoresPropiedades) {
      _propiedadesValores[propiedad.nombrePropiedad] = propiedad.valor ?? '';
    }
  }

  Future<void> _cargarRutaCategoria(Categoria categoria) async {
    try {
      final productService = ref.read(productServiceProvider);
      final isar = await productService.db;

      List<Categoria> ruta = [];
      Categoria? categoriaActual = categoria;

      // Construir la ruta desde la categoría actual hasta la raíz
      while (categoriaActual != null) {
        ruta.insert(
          0,
          categoriaActual,
        ); // Insertar al inicio para mantener orden
        if (categoriaActual.parent != null) {
          categoriaActual = await isar.collection<Categoria>().get(
            categoriaActual.parent!,
          );
        } else {
          categoriaActual = null;
        }
      }

      // Determinar las categorías actuales antes del setState
      List<Categoria> categoriasActuales;
      if (ruta.length > 1) {
        final categoriaPadre = ruta[ruta.length - 2];
        categoriasActuales =
            await isar
                .collection<Categoria>()
                .filter()
                .parentEqualTo(categoriaPadre.id)
                .findAll();
      } else {
        categoriasActuales = _categoriasPrincipales;
      }

      setState(() {
        _rutaSeleccionada.clear();
        _rutaSeleccionada.addAll(ruta);
        _categoriasActuales = categoriasActuales;
      });
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al cargar ruta de categoría: $e')),
        );
      }
    }
  }

  Future<void> _onCategoriaSeleccionada(Categoria categoria) async {
    try {
      final productService = ref.read(productServiceProvider);
      final isar = await productService.db;

      // Verificar si tiene subcategorías
      final subcategorias =
          await isar
              .collection<Categoria>()
              .filter()
              .parentEqualTo(categoria.id)
              .findAll();

      if (subcategorias.isNotEmpty) {
        // Navegar a subcategorías
        setState(() {
          _rutaSeleccionada.add(categoria);
          _categoriasActuales = subcategorias;
        });
      } else {
        // Categoría final seleccionada
        setState(() {
          _categoriaSeleccionada = categoria;
          _rutaSeleccionada.add(categoria);
        });

        // Cargar propiedades de la categoría
        await _cargarPropiedadesCategoria(categoria);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al seleccionar categoría: $e')),
        );
      }
    }
  }

  Future<void> _cargarPropiedadesCategoria(Categoria categoria) async {
    try {
      final productService = ref.read(productServiceProvider);
      final isar = await productService.db;

      // Usar las propiedades reales de la categoría
      List<PropiedadCategoria> propiedades = [];

      // Obtener propiedades de la categoría actual y todas sus categorías padre
      Categoria? categoriaActual = categoria;
      Set<String> propiedadesUnicas = {};

      while (categoriaActual != null) {
        // Agregar propiedades de la categoría actual (sin duplicados)
        for (final propiedad in categoriaActual.propiedades) {
          if (!propiedadesUnicas.contains(propiedad.nombre)) {
            propiedades.add(propiedad);
            propiedadesUnicas.add(propiedad.nombre);
          }
        }

        // Buscar categoría padre
        if (categoriaActual.parent != null) {
          categoriaActual = await isar.collection<Categoria>().get(
            categoriaActual.parent!,
          );
        } else {
          categoriaActual = null;
        }
      }

      setState(() {
        _propiedadesCategoria = propiedades;
        _propiedadesControllers.clear();

        // Crear controllers para cada propiedad
        for (final propiedad in propiedades) {
          _propiedadesControllers[propiedad.nombre] = TextEditingController();

          // Si estamos editando, cargar valores existentes
          if (_isEditMode && _producto != null) {
            final valorExistente =
                _producto!.valoresPropiedades
                    .firstWhere(
                      (vp) => vp.nombrePropiedad == propiedad.nombre,
                      orElse:
                          () =>
                              ValorPropiedadProducto()
                                ..nombrePropiedad = propiedad.nombre
                                ..valor = '',
                    )
                    .valor;
            _propiedadesControllers[propiedad.nombre]!.text =
                valorExistente ?? '';
          }
        }
      });
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al cargar propiedades: $e')),
        );
      }
    }
  }

  Future<void> _navegarAtras() async {
    if (_rutaSeleccionada.isNotEmpty) {
      setState(() {
        _rutaSeleccionada.removeLast();

        if (_rutaSeleccionada.isEmpty) {
          _categoriasActuales = _categoriasPrincipales;
          _categoriaSeleccionada = null;
          _propiedadesCategoria.clear();
          _propiedadesControllers.clear();
        } else {
          _categoriaSeleccionada = _rutaSeleccionada.last;
          _cargarPropiedadesCategoria(_categoriaSeleccionada!);
        }
      });
    }
  }

  Future<void> _guardarProducto() async {
    if (!_formKey.currentState!.validate()) return;
    if (_categoriaSeleccionada == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Debes seleccionar una categoría')),
      );
      return;
    }

    try {
      final productService = ref.read(productServiceProvider);
      final isar = await productService.db;

      // Crear o actualizar producto
      final producto = _producto ?? Producto();
      producto.nombre =
          _nombreController.text.trim().isEmpty
              ? null
              : _nombreController.text.trim();
      producto.precio = double.tryParse(_precioController.text) ?? 0.0;
      producto.stockActual = int.tryParse(_stockController.text) ?? 0;
      producto.categoriaId = _categoriaSeleccionada!.id;

      // Guardar imágenes del producto
      producto.imagenes.clear();
      producto.imagenes.addAll(_imagenesProducto);
      // La imagen principal ahora se determina automáticamente (primera imagen o la del campo imagen)

      // Agregar valores de propiedades
      producto.valoresPropiedades.clear();
      for (final propiedad in _propiedadesCategoria) {
        final controller = _propiedadesControllers[propiedad.nombre];
        if (controller != null && controller.text.isNotEmpty) {
          final valorPropiedad =
              ValorPropiedadProducto()
                ..nombrePropiedad = propiedad.nombre
                ..valor = controller.text.trim();
          producto.valoresPropiedades.add(valorPropiedad);
        }
      }

      // Guardar en base de datos
      await isar.writeTxn(() async {
        await isar.collection<Producto>().put(producto);
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              _isEditMode ? 'Producto actualizado' : 'Producto guardado',
            ),
          ),
        );
        context.pop(true);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error al guardar: $e')));
      }
    }
  }

  void _mostrarSelectorImagenes() {
    showDialog(
      context: context,
      builder:
          (context) => Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Agregar Imagen',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      letterSpacing: -0.5,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Selecciona una imagen desde tu dispositivo para agregarla al producto.',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () => Navigator.pop(context),
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                          child: Text(
                            'Cancelar',
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(12),
                              onTap: () {
                                Navigator.pop(context);
                                // El ImagePickerWidget manejará la selección
                              },
                              child: const Padding(
                                padding: EdgeInsets.symmetric(vertical: 12),
                                child: Center(
                                  child: Text(
                                    'Continuar',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
    );
  }

  Widget _buildCategoriaCard(Categoria categoria) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () => _onCategoriaSeleccionada(categoria),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.folder_outlined,
                    color: Colors.black87,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        categoria.nombre,
                        style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.3,
                        ),
                      ),
                      if (categoria.descripcion != null &&
                          categoria.descripcion!.isNotEmpty) ...[
                        const SizedBox(height: 4),
                        Text(
                          categoria.descripcion!,
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey.shade600,
                    size: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFormularioProducto() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Información básica
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey.shade200),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Información Básica',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      letterSpacing: -0.5,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Nombre
                  TextFormField(
                    controller: _nombreController,
                    style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      labelText: 'Nombre del producto *',
                      labelStyle: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.black87),
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade50,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'El nombre es requerido';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  // Descripción
                  TextFormField(
                    controller: _descripcionController,
                    style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      labelText: 'Descripción',
                      labelStyle: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.black87),
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade50,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                    ),
                    maxLines: 3,
                  ),
                  const SizedBox(height: 20),

                  // Precio y Stock
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _precioController,
                          style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          decoration: InputDecoration(
                            labelText: 'Precio',
                            labelStyle: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: Colors.grey.shade300,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: Colors.grey.shade300,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: Colors.black87,
                              ),
                            ),
                            prefixText: '\$',
                            prefixStyle: const TextStyle(
                              color: Colors.black87,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            filled: true,
                            fillColor: Colors.grey.shade50,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 16,
                            ),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: TextFormField(
                          controller: _stockController,
                          style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          decoration: InputDecoration(
                            labelText: 'Stock',
                            labelStyle: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: Colors.grey.shade300,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: Colors.grey.shade300,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: Colors.black87,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.grey.shade50,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 16,
                            ),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Sección de imágenes
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey.shade200),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Imágenes del Producto',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      letterSpacing: -0.5,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Carrusel de imágenes
                  ProductImageCarousel(
                    imagenes: _imagenesProducto,
                    imagenPrincipal: _imagenPrincipal,
                    esEditable: true,
                    altura: 250,
                    onImagenSeleccionada: (imagen) {
                      setState(() {
                        _imagenPrincipal = imagen;
                      });
                    },
                    onImagenEliminada: (imagen) {
                      setState(() {
                        _imagenesProducto.remove(imagen);
                        if (_imagenPrincipal == imagen) {
                          _imagenPrincipal =
                              _imagenesProducto.isNotEmpty
                                  ? _imagenesProducto.first
                                  : null;
                        }
                      });
                    },
                    onAgregarImagen: () {
                      _mostrarSelectorImagenes();
                    },
                  ),
                  const SizedBox(height: 20),

                  // Widget para agregar imágenes
                  ImagePickerWidget(
                    imagenesExistentes: _imagenesProducto,
                    onImagenAgregada: (urlImagen) {
                      setState(() {
                        _imagenesProducto.add(urlImagen);
                        _imagenPrincipal ??= urlImagen;
                      });
                    },
                    onImagenEliminada: (urlImagen) {
                      setState(() {
                        _imagenesProducto.remove(urlImagen);
                        if (_imagenPrincipal == urlImagen) {
                          _imagenPrincipal =
                              _imagenesProducto.isNotEmpty
                                  ? _imagenesProducto.first
                                  : null;
                        }
                      });
                    },
                  ),
                ],
              ),
            ),
          ),

          // Propiedades dinámicas
          if (_propiedadesCategoria.isNotEmpty) ...[
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade200),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Propiedades de ${_categoriaSeleccionada!.nombre}',
                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.5,
                      ),
                    ),
                    const SizedBox(height: 24),

                    ..._propiedadesCategoria.map((propiedad) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: TextFormField(
                          controller: _propiedadesControllers[propiedad.nombre],
                          style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          decoration: InputDecoration(
                            labelText: propiedad.nombre,
                            labelStyle: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: Colors.grey.shade300,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: Colors.grey.shade300,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: Colors.black87,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.grey.shade50,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 16,
                            ),
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
          ],

          const SizedBox(height: 24),

          // Botón de guardar
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 8),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: _guardarProducto,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    child: Center(
                      child: Text(
                        _isEditMode
                            ? 'Actualizar Producto'
                            : 'Guardar Producto',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.3,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return FashionScaffold(
        overlayOpacity: 0.9,
        overlayColor: Colors.white,
        body: const Center(
          child: CircularProgressIndicator(color: Colors.black, strokeWidth: 2),
        ),
      );
    }

    return FashionScaffold(
      overlayOpacity: 0.9,
      overlayColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.95),
            border: Border(
              bottom: BorderSide(color: Colors.grey.shade200, width: 1),
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: () => context.pop(),
                        child: const Padding(
                          padding: EdgeInsets.all(12),
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      _isEditMode ? 'Editar Producto' : 'Agregar Producto',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Breadcrumb de navegación
            if (_rutaSeleccionada.isNotEmpty) ...[
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey.shade200),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(8),
                          onTap: _navegarAtras,
                          child: const Padding(
                            padding: EdgeInsets.all(8),
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.black87,
                              size: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Wrap(
                        children:
                            _rutaSeleccionada.asMap().entries.map((entry) {
                              final index = entry.key;
                              final categoria = entry.value;
                              return Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  if (index > 0)
                                    const Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 4,
                                      ),
                                      child: Icon(
                                        Icons.chevron_right,
                                        color: Colors.grey,
                                        size: 16,
                                      ),
                                    ),
                                  Text(
                                    categoria.nombre,
                                    style: const TextStyle(
                                      color: Colors.black87,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              );
                            }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ],

            // Contenido principal
            Expanded(
              child:
                  _categoriaSeleccionada == null
                      ? ListView.builder(
                        itemCount: _categoriasActuales.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: _buildCategoriaCard(
                              _categoriasActuales[index],
                            ),
                          );
                        },
                      )
                      : SingleChildScrollView(
                        child: _buildFormularioProducto(),
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
