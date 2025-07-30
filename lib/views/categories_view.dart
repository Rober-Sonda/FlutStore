import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tienda_app/src/app_routes.dart';
import 'package:isar/isar.dart';
import '../models/categoria.dart';
import '../models/propiedad_categoria.dart';
import '../models/producto.dart';
import '../seed/isar_seed.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({super.key});

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  List<Categoria> _categorias = [];
  Categoria? _categoriaSeleccionada;
  bool _loading = true;
  bool _error = false;
  Set<int> _categoriasExpandidas = {};

  @override
  void initState() {
    super.initState();
    _loadCategorias();
  }

  Future<void> _loadCategorias() async {
    try {
      setState(() {
        _loading = true;
        _error = false;
      });

      final isar = Isar.getInstance();
      if (isar == null) {
        setState(() {
          _loading = false;
          _error = true;
        });
        return;
      }

      // Verificar si hay categorías, si no, hacer seed
      if (await isar.categorias.count() == 0) {
        await seedIsar(isar);
      }

      final categorias = await isar.categorias.where().findAll();
      // Ordenar por parent y luego por orden
      categorias.sort((a, b) {
        if (a.parent == b.parent) {
          return a.orden.compareTo(b.orden);
        }
        return (a.parent ?? 0).compareTo(b.parent ?? 0);
      });

      if (mounted) {
        setState(() {
          _categorias = categorias;
          _loading = false;
          _error = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _loading = false;
          _error = true;
        });
      }
      print('Error cargando categorías: $e');
    }
  }

  List<Categoria> _getCategoriasHijas(int? parentId) {
    return _categorias.where((cat) => cat.parent == parentId).toList();
  }

  List<Categoria> _getCategoriasAncestros(Categoria categoria) {
    List<Categoria> ancestros = [];
    Categoria? actual = categoria;

    while (actual?.parent != null) {
      final padre = _categorias.firstWhere(
        (c) => c.id == actual!.parent,
        orElse: () => actual!,
      );
      ancestros.insert(0, padre);
      actual = padre;
    }

    return ancestros;
  }

  String _getRutaCompleta(Categoria categoria) {
    final ancestros = _getCategoriasAncestros(categoria);
    final rutas = [...ancestros.map((a) => a.nombre), categoria.nombre];
    return rutas.join(' > ');
  }

  Widget _buildCategoriaItem(Categoria categoria, int nivel) {
    final hijas = _getCategoriasHijas(categoria.id);
    final tieneHijas = hijas.isNotEmpty;
    final estaExpandida = _categoriasExpandidas.contains(categoria.id);
    final esSeleccionada = _categoriaSeleccionada?.id == categoria.id;

    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: nivel * 20.0),
          decoration: BoxDecoration(
            color: esSeleccionada ? Colors.blue.withOpacity(0.1) : null,
            borderRadius: BorderRadius.circular(8),
          ),
          child: ListTile(
            leading: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (tieneHijas)
                  IconButton(
                    icon: Icon(
                      estaExpandida ? Icons.expand_more : Icons.chevron_right,
                      size: 20,
                    ),
                    onPressed: () {
                      setState(() {
                        if (estaExpandida) {
                          _categoriasExpandidas.remove(categoria.id);
                        } else {
                          _categoriasExpandidas.add(categoria.id);
                        }
                      });
                    },
                  ),
                Icon(
                  tieneHijas ? Icons.folder : Icons.category,
                  color:
                      esSeleccionada
                          ? Colors.blue
                          : (tieneHijas ? Colors.orange : Colors.grey),
                ),
              ],
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  categoria.nombre,
                  style: TextStyle(
                    fontWeight:
                        esSeleccionada ? FontWeight.bold : FontWeight.normal,
                    color: esSeleccionada ? Colors.blue : null,
                  ),
                ),
                if (nivel > 0)
                  Text(
                    _getRutaCompleta(categoria),
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                      fontStyle: FontStyle.italic,
                    ),
                  ),
              ],
            ),
            subtitle:
                categoria.descripcion != null
                    ? Text(categoria.descripcion!)
                    : null,
            onTap: () {
              setState(() {
                _categoriaSeleccionada = categoria;
              });
            },
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.add, size: 18),
                  onPressed: () {
                    _crearSubcategoria(categoria);
                  },
                  tooltip: 'Crear subcategoría',
                ),
                IconButton(
                  icon: const Icon(Icons.edit, size: 18),
                  onPressed: () {
                    context.push(AppRoutes.categoryAdd, extra: categoria);
                  },
                  tooltip: 'Editar categoría',
                ),
                IconButton(
                  icon: const Icon(Icons.delete, size: 18),
                  onPressed: () => _eliminarCategoria(categoria),
                  tooltip: 'Eliminar categoría',
                ),
              ],
            ),
          ),
        ),
        if (tieneHijas && estaExpandida)
          Column(
            children:
                hijas
                    .map((hija) => _buildCategoriaItem(hija, nivel + 1))
                    .toList(),
          ),
      ],
    );
  }

  void _crearSubcategoria(Categoria categoriaPadre) {
    context.push(
      AppRoutes.categoryAdd,
      extra: {
        'parentId': categoriaPadre.id,
        'parentName': categoriaPadre.nombre,
      },
    );
  }

  Future<void> _eliminarCategoria(Categoria categoria) async {
    // Verificar si tiene categorías hijas
    final hijas = _getCategoriasHijas(categoria.id);
    if (hijas.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'No se puede eliminar "${categoria.nombre}" porque tiene ${hijas.length} subcategoría${hijas.length == 1 ? '' : 's'}. Elimina primero las subcategorías.',
          ),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 4),
        ),
      );
      return;
    }

    // Verificar si tiene productos asociados
    final isar = Isar.getInstance();
    if (isar != null) {
      final productos =
          await isar.productos
              .filter()
              .categoriaIdEqualTo(categoria.id)
              .findAll();

      if (productos.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'No se puede eliminar "${categoria.nombre}" porque tiene ${productos.length} producto${productos.length == 1 ? '' : 's'} asociado${productos.length == 1 ? '' : 's'}.',
            ),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 4),
          ),
        );
        return;
      }
    }

    final confirmar = await showDialog<bool>(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Confirmar eliminación'),
            content: Text(
              '¿Estás seguro de que quieres eliminar la categoría "${categoria.nombre}"?\n\nEsta acción no se puede deshacer.',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('Cancelar'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pop(context, true),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text('Eliminar'),
              ),
            ],
          ),
    );

    if (confirmar == true) {
      final isar = Isar.getInstance();
      if (isar == null) return;

      await isar.writeTxn(() async {
        await isar.categorias.delete(categoria.id);
      });

      if (_categoriaSeleccionada?.id == categoria.id) {
        _categoriaSeleccionada = null;
      }

      await _loadCategorias();
    }
  }

  void _agregarPropiedad() {
    if (_categoriaSeleccionada == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Selecciona una categoría para agregar propiedades'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    showDialog(
      context: context,
      builder:
          (context) => _PropiedadDialog(
            onSave: (propiedad) async {
              final isar = Isar.getInstance();
              if (isar == null) return;

              _categoriaSeleccionada!.propiedades.add(propiedad);

              await isar.writeTxn(() async {
                await isar.categorias.put(_categoriaSeleccionada!);
              });

              setState(() {});
            },
          ),
    );
  }

  void _editarPropiedad(int index) {
    if (_categoriaSeleccionada == null) return;

    showDialog(
      context: context,
      builder:
          (context) => _PropiedadDialog(
            propiedad: _categoriaSeleccionada!.propiedades[index],
            onSave: (propiedad) async {
              final isar = Isar.getInstance();
              if (isar == null) return;

              _categoriaSeleccionada!.propiedades[index] = propiedad;

              await isar.writeTxn(() async {
                await isar.categorias.put(_categoriaSeleccionada!);
              });

              setState(() {});
            },
          ),
    );
  }

  void _eliminarPropiedad(int index) async {
    if (_categoriaSeleccionada == null) return;

    final confirmar = await showDialog<bool>(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Confirmar eliminación'),
            content: Text(
              '¿Estás seguro de que quieres eliminar la propiedad "${_categoriaSeleccionada!.propiedades[index].nombre}"?',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('Cancelar'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pop(context, true),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text('Eliminar'),
              ),
            ],
          ),
    );

    if (confirmar == true) {
      final isar = Isar.getInstance();
      if (isar == null) return;

      _categoriaSeleccionada!.propiedades.removeAt(index);

      await isar.writeTxn(() async {
        await isar.categorias.put(_categoriaSeleccionada!);
      });

      setState(() {});
    }
  }

  Widget _buildTableroPropiedades() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Tablero de Propiedades',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              if (_categoriaSeleccionada != null)
                ElevatedButton.icon(
                  onPressed: _agregarPropiedad,
                  icon: const Icon(Icons.add),
                  label: const Text('Nueva Propiedad'),
                ),
            ],
          ),
          const SizedBox(height: 16),
          if (_categoriaSeleccionada == null)
            const Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.category_outlined, size: 64, color: Colors.grey),
                    SizedBox(height: 16),
                    Text(
                      'Selecciona una categoría',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Elige una categoría del panel izquierdo\npara ver y gestionar sus propiedades',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            )
          else if (_categoriaSeleccionada!.propiedades.isEmpty)
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.tune, size: 64, color: Colors.grey),
                    const SizedBox(height: 16),
                    Text(
                      'Sin propiedades en "${_categoriaSeleccionada!.nombre}"',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Agrega propiedades para definir los campos\nque tendrán los productos de esta categoría',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      onPressed: _agregarPropiedad,
                      icon: const Icon(Icons.add),
                      label: const Text('Agregar Primera Propiedad'),
                    ),
                  ],
                ),
              ),
            )
          else
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  // Calcular el número de columnas basado en el ancho disponible
                  final cardWidth = 200.0; // Ancho fijo de cada card
                  final spacing = 16.0;
                  final crossAxisCount =
                      (constraints.maxWidth / (cardWidth + spacing)).floor();
                  final actualCrossAxisCount =
                      crossAxisCount > 0 ? crossAxisCount : 1;

                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: actualCrossAxisCount,
                      crossAxisSpacing: spacing,
                      mainAxisSpacing: spacing,
                      childAspectRatio: 1.2,
                    ),
                    itemCount: _categoriaSeleccionada!.propiedades.length,
                    itemBuilder: (context, index) {
                      final propiedad =
                          _categoriaSeleccionada!.propiedades[index];
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(_getIconForType(propiedad.tipo)),
                                  PopupMenuButton<String>(
                                    onSelected: (value) {
                                      if (value == 'edit') {
                                        _editarPropiedad(index);
                                      } else if (value == 'delete') {
                                        _eliminarPropiedad(index);
                                      }
                                    },
                                    itemBuilder:
                                        (context) => [
                                          const PopupMenuItem(
                                            value: 'edit',
                                            child: Row(
                                              children: [
                                                Icon(Icons.edit),
                                                SizedBox(width: 8),
                                                Text('Editar'),
                                              ],
                                            ),
                                          ),
                                          const PopupMenuItem(
                                            value: 'delete',
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.delete,
                                                  color: Colors.red,
                                                ),
                                                SizedBox(width: 8),
                                                Text(
                                                  'Eliminar',
                                                  style: TextStyle(
                                                    color: Colors.red,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                    child: const Icon(Icons.more_vert),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(
                                propiedad.nombre,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                _getTypeDescription(propiedad.tipo),
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                              if (propiedad.valorPorDefecto != null) ...[
                                const SizedBox(height: 4),
                                Text(
                                  'Default: ${propiedad.valorPorDefecto}',
                                  style: const TextStyle(
                                    color: Colors.blue,
                                    fontSize: 11,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                              const Spacer(),
                              if (propiedad.requerido)
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.orange,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: const Text(
                                    'Requerido',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    if (_loading) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Cargando categorías...'),
          ],
        ),
      );
    }

    if (_error) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            const Text(
              'Error al cargar categorías',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'No se pudo conectar con la base de datos',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _loadCategorias,
              child: const Text('Reintentar'),
            ),
          ],
        ),
      );
    }

    if (_categorias.isEmpty) {
      return Center(
        child: Container(
          padding: const EdgeInsets.all(32),
          constraints: const BoxConstraints(maxWidth: 600),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.category_outlined, size: 80, color: Colors.grey),
              const SizedBox(height: 24),
              const Text(
                'No hay categorías creadas',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text(
                'Las categorías son el molde de tus productos. Cada categoría define qué propiedades tendrán los productos que pertenezcan a ella.\n\nPuedes crear categorías principales y subcategorías para organizar mejor tu inventario.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey, height: 1.5),
              ),
              const SizedBox(height: 32),
              ElevatedButton.icon(
                onPressed: () {
                  context.push(AppRoutes.categoryAdd);
                },
                icon: const Icon(Icons.add),
                label: const Text('Crear Primera Categoría'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Ejemplo: Ropa > Remeras > Remeras de Algodón',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Row(
      children: [
        // Panel izquierdo - Lista de categorías
        Expanded(
          flex: 1,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Categorías',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        context.push(AppRoutes.categoryAdd);
                      },
                      icon: const Icon(Icons.add),
                      label: const Text('Nueva Categoría'),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children:
                      _getCategoriasHijas(null)
                          .map((categoria) => _buildCategoriaItem(categoria, 0))
                          .toList(),
                ),
              ),
            ],
          ),
        ),
        // Separador vertical
        const VerticalDivider(width: 1),
        // Panel derecho - Tablero de propiedades
        Expanded(flex: 1, child: _buildTableroPropiedades()),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categorías'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loadCategorias,
            tooltip: 'Actualizar',
          ),
          IconButton(
            icon: const Icon(Icons.account_tree),
            onPressed: () {
              _mostrarVistaJerarquia();
            },
            tooltip: 'Ver Jerarquía',
          ),
        ],
      ),
      body: _buildContent(),
    );
  }

  void _mostrarVistaJerarquia() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Jerarquía de Categorías'),
            content: SizedBox(
              width: double.maxFinite,
              height: 400,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                      _getCategoriasHijas(null)
                          .map((categoria) => _buildJerarquiaItem(categoria, 0))
                          .toList(),
                ),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cerrar'),
              ),
            ],
          ),
    );
  }

  Widget _buildJerarquiaItem(Categoria categoria, int nivel) {
    final hijas = _getCategoriasHijas(categoria.id);
    final tieneHijas = hijas.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(left: nivel * 20.0),
          child: Row(
            children: [
              Icon(
                tieneHijas ? Icons.folder : Icons.category,
                size: 20,
                color: tieneHijas ? Colors.orange : Colors.grey,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  categoria.nombre,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              if (categoria.descripcion != null)
                Text(
                  '(${categoria.descripcion})',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                    fontStyle: FontStyle.italic,
                  ),
                ),
            ],
          ),
        ),
        if (tieneHijas)
          ...hijas.map((hija) => _buildJerarquiaItem(hija, nivel + 1)),
      ],
    );
  }

  IconData _getIconForType(TipoPropiedad tipo) {
    switch (tipo) {
      case TipoPropiedad.texto:
        return Icons.text_fields;
      case TipoPropiedad.numero:
        return Icons.numbers;
      case TipoPropiedad.booleano:
        return Icons.check_box;
      case TipoPropiedad.fecha:
        return Icons.calendar_today;
      case TipoPropiedad.seleccion:
        return Icons.list;
    }
  }

  String _getTypeDescription(TipoPropiedad tipo) {
    switch (tipo) {
      case TipoPropiedad.texto:
        return 'Texto libre';
      case TipoPropiedad.numero:
        return 'Número';
      case TipoPropiedad.booleano:
        return 'Sí/No';
      case TipoPropiedad.fecha:
        return 'Fecha';
      case TipoPropiedad.seleccion:
        return 'Lista de opciones';
    }
  }
}

class _PropiedadDialog extends StatefulWidget {
  final PropiedadCategoria? propiedad;
  final Function(PropiedadCategoria) onSave;

  const _PropiedadDialog({this.propiedad, required this.onSave});

  @override
  State<_PropiedadDialog> createState() => _PropiedadDialogState();
}

class _PropiedadDialogState extends State<_PropiedadDialog> {
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _valorPorDefectoController = TextEditingController();
  TipoPropiedad _tipoSeleccionado = TipoPropiedad.texto;
  bool _requerido = false;
  List<String> _opciones = [];
  final _opcionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.propiedad != null) {
      _nombreController.text = widget.propiedad!.nombre;
      _valorPorDefectoController.text = widget.propiedad!.valorPorDefecto ?? '';
      _tipoSeleccionado = widget.propiedad!.tipo;
      _requerido = widget.propiedad!.requerido;
      _opciones = List.from(widget.propiedad!.opciones);
    }
  }

  @override
  void dispose() {
    _nombreController.dispose();
    _valorPorDefectoController.dispose();
    _opcionController.dispose();
    super.dispose();
  }

  void _agregarOpcion() {
    if (_opcionController.text.trim().isNotEmpty) {
      setState(() {
        _opciones.add(_opcionController.text.trim());
        _opcionController.clear();
      });
    }
  }

  void _eliminarOpcion(int index) {
    setState(() {
      _opciones.removeAt(index);
    });
  }

  void _guardar() {
    if (!_formKey.currentState!.validate()) return;

    final propiedad =
        PropiedadCategoria()
          ..nombre = _nombreController.text.trim()
          ..tipo = _tipoSeleccionado
          ..valorPorDefecto =
              _valorPorDefectoController.text.trim().isEmpty
                  ? null
                  : _valorPorDefectoController.text.trim()
          ..requerido = _requerido
          ..opciones = List.from(_opciones);

    widget.onSave(propiedad);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        widget.propiedad == null ? 'Nueva Propiedad' : 'Editar Propiedad',
      ),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _nombreController,
                decoration: const InputDecoration(
                  labelText: 'Nombre de la propiedad',
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'El nombre es requerido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<TipoPropiedad>(
                value: _tipoSeleccionado,
                decoration: const InputDecoration(
                  labelText: 'Tipo de propiedad',
                ),
                items:
                    TipoPropiedad.values.map((tipo) {
                      return DropdownMenuItem(
                        value: tipo,
                        child: Text(_getTypeName(tipo)),
                      );
                    }).toList(),
                onChanged: (value) {
                  setState(() {
                    _tipoSeleccionado = value!;
                  });
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _valorPorDefectoController,
                decoration: const InputDecoration(
                  labelText: 'Valor por defecto (opcional)',
                ),
              ),
              const SizedBox(height: 16),
              CheckboxListTile(
                title: const Text('Propiedad requerida'),
                value: _requerido,
                onChanged: (value) {
                  setState(() {
                    _requerido = value ?? false;
                  });
                },
              ),
              if (_tipoSeleccionado == TipoPropiedad.seleccion) ...[
                const SizedBox(height: 16),
                const Text('Opciones disponibles:'),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _opcionController,
                        decoration: const InputDecoration(
                          labelText: 'Nueva opción',
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: _agregarOpcion,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                ..._opciones.asMap().entries.map(
                  (entry) => ListTile(
                    title: Text(entry.value),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => _eliminarOpcion(entry.key),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancelar'),
        ),
        ElevatedButton(onPressed: _guardar, child: const Text('Guardar')),
      ],
    );
  }

  String _getTypeName(TipoPropiedad tipo) {
    switch (tipo) {
      case TipoPropiedad.texto:
        return 'Texto';
      case TipoPropiedad.numero:
        return 'Número';
      case TipoPropiedad.booleano:
        return 'Sí/No';
      case TipoPropiedad.fecha:
        return 'Fecha';
      case TipoPropiedad.seleccion:
        return 'Lista de opciones';
    }
  }
}
