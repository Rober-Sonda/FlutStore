import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:isar/isar.dart';
import 'package:tienda_app/models/producto.dart';
import 'package:tienda_app/models/categoria.dart';
import 'package:tienda_app/models/propiedad_categoria.dart';
import 'package:tienda_app/models/valor_propiedad_producto.dart';
import 'package:tienda_app/services/product_service.dart';
import 'package:tienda_app/services/app_config_service.dart';
import 'package:tienda_app/models/app_theme.dart';
import 'package:tienda_app/models/font_config.dart';
import 'package:tienda_app/seed/isar_seed.dart';
import 'package:tienda_app/widgets/product_image_carousel.dart';
import 'package:tienda_app/widgets/image_picker_widget.dart';

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

  // Tema y configuración
  AppTheme? _currentTheme;
  FontConfig? _currentFontConfig;

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
    final configService = ref.read(appConfigServiceProvider);
    final theme = await configService.getSelectedTheme();
    final fontConfig = await configService.getSelectedFontConfig();

    setState(() {
      _currentTheme = theme;
      _currentFontConfig = fontConfig;
    });
  }

  Future<void> _loadData() async {
    setState(() => _loading = true);

    try {
      final productService = ref.read(productServiceProvider);
      final isar = await productService.db;

      // Cargar categorías principales
      _categoriasPrincipales =
          await isar.categorias.filter().parentIsNull().findAll();
      _categoriasActuales = _categoriasPrincipales;

      // Si estamos editando, cargar el producto
      if (_isEditMode && widget.productId != null) {
        _producto = await isar.productos.get(widget.productId!);
        if (_producto != null) {
          _cargarDatosProducto();
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

  void _cargarDatosProducto() {
    if (_producto == null) return;

    _nombreController.text = _producto!.nombre;
    _precioController.text = _producto!.precio?.toString() ?? '';
    _stockController.text = _producto!.stock?.toString() ?? '';

    // Cargar imágenes del producto
    _imagenesProducto = List.from(_producto!.imagenes);
    _imagenPrincipal = _producto!.imagenPrincipal;

    // Cargar valores de propiedades existentes
    for (final propiedad in _producto!.valoresPropiedades) {
      _propiedadesValores[propiedad.nombrePropiedad] = propiedad.valor ?? '';
    }
  }

  Future<void> _onCategoriaSeleccionada(Categoria categoria) async {
    try {
      final productService = ref.read(productServiceProvider);
      final isar = await productService.db;

      // Verificar si tiene subcategorías
      final subcategorias =
          await isar.categorias.filter().parentEqualTo(categoria.id).findAll();

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
          categoriaActual = await isar.categorias.get(categoriaActual.parent!);
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
      producto.nombre = _nombreController.text.trim();
      producto.precio = double.tryParse(_precioController.text) ?? 0.0;
      producto.stock = int.tryParse(_stockController.text) ?? 0;
      producto.categoriaId = _categoriaSeleccionada!.id;

      // Guardar imágenes del producto
      producto.imagenes = List.from(_imagenesProducto);
      producto.imagenPrincipal = _imagenPrincipal;

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
        await isar.productos.put(producto);
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
          (context) => AlertDialog(
            title: const Text('Agregar Imagen'),
            content: const Text(
              'Selecciona una imagen desde tu dispositivo para agregarla al producto.',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancelar'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  // El ImagePickerWidget manejará la selección
                },
                child: const Text('Continuar'),
              ),
            ],
          ),
    );
  }

  Widget _buildCategoriaCard(Categoria categoria) {
    final theme = _currentTheme ?? AppTheme.darkTheme;

    return Card(
      color: theme.surfaceColor,
      child: InkWell(
        onTap: () => _onCategoriaSeleccionada(categoria),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Icon(Icons.folder, color: theme.primaryColor, size: 24),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      categoria.nombre,
                      style: TextStyle(
                        color: theme.textColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (categoria.descripcion != null &&
                        categoria.descripcion!.isNotEmpty)
                      Text(
                        categoria.descripcion!,
                        style: TextStyle(
                          color: theme.textSecondaryColor,
                          fontSize: 14,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: theme.textSecondaryColor,
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFormularioProducto() {
    final theme = _currentTheme ?? AppTheme.darkTheme;
    final fontConfig = _currentFontConfig ?? FontConfig.defaultConfig;

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Información básica
          Card(
            color: theme.surfaceColor,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Información Básica',
                    style: TextStyle(
                      color: theme.textColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: fontConfig.titleFont,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Nombre
                  TextFormField(
                    controller: _nombreController,
                    style: TextStyle(
                      color: theme.textColor,
                      fontFamily: fontConfig.bodyFont,
                    ),
                    decoration: InputDecoration(
                      labelText: 'Nombre del producto *',
                      labelStyle: TextStyle(
                        color: theme.textSecondaryColor,
                        fontFamily: fontConfig.bodyFont,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
                      fillColor: theme.backgroundColor,
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'El nombre es requerido';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // Descripción
                  TextFormField(
                    controller: _descripcionController,
                    style: TextStyle(
                      color: theme.textColor,
                      fontFamily: fontConfig.bodyFont,
                    ),
                    decoration: InputDecoration(
                      labelText: 'Descripción',
                      labelStyle: TextStyle(
                        color: theme.textSecondaryColor,
                        fontFamily: fontConfig.bodyFont,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
                      fillColor: theme.backgroundColor,
                    ),
                    maxLines: 3,
                  ),
                  const SizedBox(height: 16),

                  // Precio y Stock
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _precioController,
                          style: TextStyle(
                            color: theme.textColor,
                            fontFamily: fontConfig.bodyFont,
                          ),
                          decoration: InputDecoration(
                            labelText: 'Precio',
                            labelStyle: TextStyle(
                              color: theme.textSecondaryColor,
                              fontFamily: fontConfig.bodyFont,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            prefixText: '\$',
                            filled: true,
                            fillColor: theme.backgroundColor,
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: TextFormField(
                          controller: _stockController,
                          style: TextStyle(
                            color: theme.textColor,
                            fontFamily: fontConfig.bodyFont,
                          ),
                          decoration: InputDecoration(
                            labelText: 'Stock',
                            labelStyle: TextStyle(
                              color: theme.textSecondaryColor,
                              fontFamily: fontConfig.bodyFont,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            filled: true,
                            fillColor: theme.backgroundColor,
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // SKU y Barcode
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _skuController,
                          style: TextStyle(
                            color: theme.textColor,
                            fontFamily: fontConfig.bodyFont,
                          ),
                          decoration: InputDecoration(
                            labelText: 'SKU',
                            labelStyle: TextStyle(
                              color: theme.textSecondaryColor,
                              fontFamily: fontConfig.bodyFont,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            filled: true,
                            fillColor: theme.backgroundColor,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: TextFormField(
                          controller: _barcodeController,
                          style: TextStyle(
                            color: theme.textColor,
                            fontFamily: fontConfig.bodyFont,
                          ),
                          decoration: InputDecoration(
                            labelText: 'Código de barras',
                            labelStyle: TextStyle(
                              color: theme.textSecondaryColor,
                              fontFamily: fontConfig.bodyFont,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            filled: true,
                            fillColor: theme.backgroundColor,
                          ),
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
          Card(
            color: theme.surfaceColor,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Imágenes del Producto',
                    style: TextStyle(
                      color: theme.textColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: fontConfig.titleFont,
                    ),
                  ),
                  const SizedBox(height: 16),

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
                  const SizedBox(height: 16),

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
            const SizedBox(height: 16),
            Card(
              color: theme.surfaceColor,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Propiedades de ${_categoriaSeleccionada!.nombre}',
                      style: TextStyle(
                        color: theme.textColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: fontConfig.titleFont,
                      ),
                    ),
                    const SizedBox(height: 16),

                    ..._propiedadesCategoria.map((propiedad) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: TextFormField(
                          controller: _propiedadesControllers[propiedad.nombre],
                          style: TextStyle(
                            color: theme.textColor,
                            fontFamily: fontConfig.bodyFont,
                          ),
                          decoration: InputDecoration(
                            labelText: propiedad.nombre,
                            labelStyle: TextStyle(
                              color: theme.textSecondaryColor,
                              fontFamily: fontConfig.bodyFont,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            filled: true,
                            fillColor: theme.backgroundColor,
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

          // Botones
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: _guardarProducto,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.accentColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Text(
                    _isEditMode ? 'Actualizar Producto' : 'Guardar Producto',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: fontConfig.bodyFont,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      final theme = _currentTheme ?? AppTheme.darkTheme;
      return Scaffold(
        backgroundColor: theme.backgroundColor,
        body: Center(
          child: CircularProgressIndicator(color: theme.accentColor),
        ),
      );
    }

    final theme = _currentTheme ?? AppTheme.darkTheme;

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: theme.backgroundColor,
        title: Text(
          _isEditMode ? 'Editar Producto' : 'Agregar Producto',
          style: TextStyle(color: theme.textColor),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: theme.textColor),
          onPressed: () => context.pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Breadcrumb de navegación
            if (_rutaSeleccionada.isNotEmpty) ...[
              Card(
                color: theme.surfaceColor,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back, color: theme.textColor),
                        onPressed: _navegarAtras,
                      ),
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
                                      Icon(
                                        Icons.chevron_right,
                                        color: theme.textSecondaryColor,
                                        size: 16,
                                      ),
                                    Text(
                                      categoria.nombre,
                                      style: TextStyle(
                                        color: theme.textColor,
                                        fontSize: 14,
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
              ),
              const SizedBox(height: 16),
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
