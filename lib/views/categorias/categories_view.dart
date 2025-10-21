import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../src/app_routes.dart';
import 'package:isar/isar.dart';
import '../../iews/categorias/dialogs/propiedad_dialog.dart';
import '../../models/categoria.dart';
import '../../models/propiedad_categoria.dart';
import '../../models/producto.dart';
import '../../seed/isar_seed.dart';

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
  final Set<int> _categoriasExpandidas = {};

  // NUEVO: Filtros de bÃºsqueda
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    _loadCategorias();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildContent());
  }

  // ===========================================================================
  // 1. CARGA Y INICIALIZACIÃ“N DE DATOS
  // ===========================================================================

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

      if (await isar.categorias.count() == 0) {
        await seedIsar(isar);
      }

      final categorias = await isar.categorias.where().findAll();
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
      print('Error cargando categorÃ­as: $e');
    }
  }

  // ===========================================================================
  // 2. MÃ‰TODOS DE BÃšSQUEDA Y MANIPULACIÃ“N DE CATEGORÃAS
  // ===========================================================================

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

  // NUEVO: Filtro de bÃºsqueda para categorÃ­as
  List<Categoria> _getCategoriasFiltradas(int? parentId) {
    final base = _categorias.where((cat) => cat.parent == parentId).toList();
    if (searchQuery.isEmpty) return base;
    return base
        .where(
          (cat) => cat.nombre.toLowerCase().contains(searchQuery.toLowerCase()),
        )
        .toList();
  }

  // ===========================================================================
  // 3. CONSTRUCCIÃ“N DE LA INTERFAZ DE CATEGORÃAS
  // ===========================================================================

  Widget _buildContent() {
    if (_loading) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Cargando categorÃ­as...'),
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
              'Error al cargar categorÃ­as',
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
                'No hay categorÃ­as creadas',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text(
                'Las categorÃ­as son el molde de tus productos. Cada categorÃ­a define quÃ© propiedades tendrÃ¡n los productos que pertenezcan a ella.\n'
                'Puedes crear categorÃ­as principales y subcategorÃ­as para organizar mejor tu inventario.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey, height: 1.5),
              ),
              const SizedBox(height: 32),
              ElevatedButton.icon(
                onPressed: () => context.push(AppRoutes.categoryAdd),
                icon: const Icon(Icons.add),
                label: const Text('Crear Primera CategorÃ­a'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Ejemplo: Ropa > Remeras > Remeras de AlgodÃ³n',
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

    return Column(
      children: [
        // NUEVO: DescripciÃ³n de la secciÃ³n de categorÃ­as
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            color: Colors.blueGrey[900],
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                'En esta secciÃ³n puedes crear y organizar las categorÃ­as de tus productos. Las categorÃ­as te ayudan a agrupar productos similares y definir sus propiedades. Puedes crear categorÃ­as principales y subcategorÃ­as para una mejor organizaciÃ³n.',
                style: const TextStyle(color: Colors.white70, fontSize: 14),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: [
              // Panel izquierdo - CategorÃ­as
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    // Barra de bÃºsqueda arriba
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Buscar categorÃ­as...',
                          prefixIcon: const Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          isDense: true,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 0,
                            horizontal: 12,
                          ),
                        ),
                        onChanged: (value) =>
                            setState(() => searchQuery = value.trim()),
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        children: _getCategoriasFiltradas(null)
                            .map((categoria) => _buildCategoriaItem(categoria, 0))
                            .toList(),
                      ),
                    ),
                    // BotÃ³n "Nueva CategorÃ­a" al pie y alineado a la derecha
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          FloatingActionButton.extended(
                            onPressed: _mostrarDialogoNuevaCategoria,
                            icon: const Icon(Icons.add),
                            label: const Text('Nueva CategorÃ­a'),
                            heroTag: 'fab_categoria',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const VerticalDivider(width: 1),
              // Panel derecho - Propiedades
              Expanded(flex: 1, child: _buildTableroPropiedades()),
            ],
          ),
        ),
        // FAB para agregar propiedad (abajo a la derecha, solo si hay categorÃ­a seleccionada)
        if (_categoriaSeleccionada != null)
          Positioned(
            bottom: 24,
            right: 24,
            child: FloatingActionButton.extended(
              onPressed: _agregarPropiedad,
              icon: const Icon(Icons.add),
              label: const Text('Nueva Propiedad'),
              heroTag: 'fab_propiedad',
            ),
          ),
      ],
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'CategorÃ­as',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          ElevatedButton.icon(
            onPressed: () => _mostrarDialogoNuevaCategoria(),
            icon: const Icon(Icons.add),
            label: const Text('Nueva CategorÃ­a'),
          ),
        ],
      ),
    );
  }

  Widget _buildLeadingIcon(
    bool tieneHijas,
    bool estaExpandida, [
    Categoria? categoria,
  ]) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (tieneHijas && categoria != null)
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
          color: tieneHijas ? Colors.orange : Colors.grey,
        ),
      ],
    );
  }

  Widget _buildCategoriaItem(Categoria categoria, int nivel) {
    final hijas = _getCategoriasHijas(categoria.id);
    final tieneHijas = hijas.isNotEmpty;
    final estaExpandida = _categoriasExpandidas.contains(categoria.id);
    final esSeleccionada = _categoriaSeleccionada?.id == categoria.id;

    // NUEVO: Oculta las hijas si la bÃºsqueda estÃ¡ activa y no hay coincidencias
    final hijasFiltradas =
        searchQuery.isEmpty
            ? hijas
            : hijas
                .where(
                  (h) => h.nombre.toLowerCase().contains(
                    searchQuery.toLowerCase(),
                  ),
                )
                .toList();

    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: nivel * 20.0),
          decoration: BoxDecoration(
            color: esSeleccionada ? Colors.blue.withOpacity(0.1) : null,
            borderRadius: BorderRadius.circular(8),
          ),
          child: ListTile(
            leading: _buildLeadingIcon(tieneHijas, estaExpandida, categoria),
            title: _buildCategoriaTitle(categoria, nivel, esSeleccionada),
            subtitle:
                categoria.descripcion != null
                    ? Text(categoria.descripcion!)
                    : null,
            onTap: () => setState(() => _categoriaSeleccionada = categoria),
            trailing: _buildCategoriaActions(categoria),
          ),
        ),
        if (tieneHijas && (estaExpandida || searchQuery.isNotEmpty))
          Column(
            children:
                hijasFiltradas
                    .map((hija) => _buildCategoriaItem(hija, nivel + 1))
                    .toList(),
          ),
      ],
    );
  }

  Widget _buildCategoriaTitle(
    Categoria categoria,
    int nivel,
    bool esSeleccionada,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          categoria.nombre,
          style: TextStyle(
            fontWeight: esSeleccionada ? FontWeight.bold : FontWeight.normal,
            color: esSeleccionada ? Colors.blue : null,
          ),
        ),
        if (nivel > 0)
          Text(
            _getRutaCompleta(categoria),
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
              fontStyle: FontStyle.italic,
            ),
          ),
      ],
    );
  }

  Widget _buildCategoriaActions(Categoria categoria) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: const Icon(Icons.add, size: 18),
          onPressed: () => _mostrarDialogoCrearSubcategoria(categoria),
          tooltip: 'Crear subcategorÃ­a',
        ),
        IconButton(
          icon: const Icon(Icons.edit, size: 18),
          onPressed: () => _mostrarDialogoEditarCategoria(categoria),
          tooltip: 'Editar categorÃ­a',
        ),
        IconButton(
          icon: const Icon(Icons.delete, size: 18),
          onPressed: () => _eliminarCategoria(categoria),
          tooltip: 'Eliminar categorÃ­a',
        ),
      ],
    );
  }

  // ===========================================================================
  // 4. DIÃLOGOS DE CATEGORÃAS
  // ===========================================================================

  void _mostrarDialogoNuevaCategoria() {
    String nombre = '';
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Nueva CategorÃ­a'),
            content: StatefulBuilder(
              builder:
                  (context, setState) => Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        decoration: const InputDecoration(labelText: 'Nombre'),
                        onChanged:
                            (value) => setState(() => nombre = value.trim()),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () async {
                          if (nombre.isEmpty) return;
                          final isar = Isar.getInstance();
                          if (isar != null) {
                            await isar.writeTxn(() async {
                              await isar.categorias.put(
                                Categoria()..nombre = nombre,
                              );
                            });
                            await _loadCategorias();
                          }
                          Navigator.pop(context);
                        },
                        child: const Text('Guardar'),
                      ),
                    ],
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

  void _mostrarDialogoCrearSubcategoria(Categoria padre) {
    String nombre = '';
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Nueva SubcategorÃ­a'),
            content: StatefulBuilder(
              builder:
                  (context, setState) => Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        decoration: const InputDecoration(
                          labelText: 'Nombre de subcategorÃ­a',
                        ),
                        onChanged:
                            (value) => setState(() => nombre = value.trim()),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () async {
                          if (nombre.isEmpty) return;
                          final isar = Isar.getInstance();
                          if (isar != null) {
                            await isar.writeTxn(() async {
                              await isar.categorias.put(
                                Categoria()
                                  ..nombre = nombre
                                  ..parent = padre.id,
                              );
                            });
                            await _loadCategorias();
                          }
                          Navigator.pop(context);
                        },
                        child: const Text('Guardar'),
                      ),
                    ],
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

  void _mostrarDialogoEditarCategoria(Categoria categoria) {
    String nombre = categoria.nombre;
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Editar CategorÃ­a'),
            content: StatefulBuilder(
              builder:
                  (context, setState) => Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: TextEditingController(text: nombre),
                        onChanged:
                            (value) => setState(() => nombre = value.trim()),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () async {
                          if (nombre.isEmpty) return;
                          final isar = Isar.getInstance();
                          if (isar != null) {
                            await isar.writeTxn(() async {
                              await isar.categorias.put(
                                categoria..nombre = nombre,
                              );
                            });
                            await _loadCategorias();
                          }
                          Navigator.pop(context);
                        },
                        child: const Text('Guardar'),
                      ),
                    ],
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

  // ===========================================================================
  // 5. ELIMINACIÃ“N DE CATEGORÃAS
  // ===========================================================================

  Future<void> _eliminarCategoria(Categoria categoria) async {
    final hijas = _getCategoriasHijas(categoria.id);
    if (hijas.isNotEmpty) {
      _mostrarSnackBar(
        'No se puede eliminar "${categoria.nombre}" porque tiene ${hijas.length} subcategorÃ­a${hijas.length == 1 ? '' : 's'}.',
        Colors.red,
      );
      return;
    }

    final isar = Isar.getInstance();
    if (isar != null) {
      final productos =
          await isar.productos
              .filter()
              .categoriaIdEqualTo(categoria.id)
              .findAll();
      if (productos.isNotEmpty) {
        _mostrarSnackBar(
          'No se puede eliminar "${categoria.nombre}" porque tiene ${productos.length} producto${productos.length == 1 ? '' : 's'} asociado.',
          Colors.red,
        );
        return;
      }
    }

    final confirmar = await _mostrarDialogoConfirmacion(
      'Â¿Eliminar "${categoria.nombre}"?',
      'Esta acciÃ³n no se puede deshacer.',
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

  // ===========================================================================
  // 6. GESTIÃ“N DE PROPIEDADES
  // ===========================================================================

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
          // NUEVO: Barra de bÃºsqueda para propiedades
          if (_categoriaSeleccionada != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Buscar propiedades...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 12,
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    // Implementa bÃºsqueda de propiedades si lo deseas
                    // Por ahora, solo refresca la vista
                  });
                },
              ),
            ),
          _buildPropiedadesHeader(),
          const SizedBox(height: 16),
          _buildPropiedadesContent(),
        ],
      ),
    );
  }

  Widget _buildPropiedadesHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Tablero de Propiedades',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        // El botÃ³n de agregar propiedad se elimina de aquÃ­, ahora es FAB abajo a la derecha
      ],
    );
  }

  Widget _buildPropiedadesContent() {
    if (_categoriaSeleccionada == null) {
      return const Expanded(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.category_outlined, size: 64, color: Colors.grey),
              SizedBox(height: 16),
              Text(
                'Selecciona una categorÃ­a',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Elige una categorÃ­a del panel izquierdo para ver sus propiedades',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      );
    }

    if (_categoriaSeleccionada!.propiedades.isEmpty) {
      return Expanded(
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
                'Agrega propiedades para definir los campos que tendrÃ¡n los productos.',
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
      );
    }

    return Expanded(child: _buildPropiedadesGrid());
  }

  Widget _buildPropiedadesGrid() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount =
            (constraints.maxWidth / 216).floor().clamp(1, 4).toInt();
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.2,
          ),
          itemCount: _categoriaSeleccionada!.propiedades.length,
          itemBuilder: (context, index) {
            final propiedad = _categoriaSeleccionada!.propiedades[index];
            return _buildPropiedadCard(propiedad, index);
          },
        );
      },
    );
  }

  Widget _buildPropiedadCard(PropiedadCategoria propiedad, int index) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPropiedadHeader(propiedad, index),
            const SizedBox(height: 8),
            Text(
              propiedad.nombre,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Text(
              _getTypeDescription(propiedad.tipo),
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
            if (propiedad.valorPorDefecto != null) ...[
              const SizedBox(height: 4),
              Text(
                'Default: ${propiedad.valorPorDefecto}',
                style: const TextStyle(color: Colors.blue, fontSize: 11),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
            const Spacer(),
            if (propiedad.requerido) _buildRequeridoBadge(),
          ],
        ),
      ),
    );
  }

  Widget _buildPropiedadHeader(PropiedadCategoria propiedad, int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(_getIconForType(propiedad.tipo)),
        PopupMenuButton<String>(
          onSelected: (value) {
            if (value == 'edit') _editarPropiedad(index);
            if (value == 'delete') _eliminarPropiedad(index);
          },
          itemBuilder:
              (context) => [
                const PopupMenuItem(value: 'edit', child: Text('Editar')),
                PopupMenuItem(
                  value: 'delete',
                  child: Text('Eliminar', style: TextStyle(color: Colors.red)),
                ),
              ],
          child: const Icon(Icons.more_vert),
        ),
      ],
    );
  }

  Widget _buildRequeridoBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
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
    );
  }

  void _agregarPropiedad() {
    if (_categoriaSeleccionada == null) {
      _mostrarSnackBar(
        'Selecciona una categorÃ­a para agregar propiedades',
        Colors.orange,
      );
      return;
    }

    showDialog(
      context: context,
      builder:
          (context) => PropiedadDialog(
            onSave: (propiedad) async {
              final isar = Isar.getInstance();
              if (isar != null) {
                _categoriaSeleccionada!.propiedades.add(propiedad);
                await isar.writeTxn(() async {
                  await isar.categorias.put(_categoriaSeleccionada!);
                });
                setState(() {});
              }
            },
          ),
    );
  }

  void _editarPropiedad(int index) async {
    final isar = Isar.getInstance();
    List<Producto> productosAsociados = [];
    if (isar != null) {
      productosAsociados =
          await isar.productos
              .filter()
              .categoriaIdEqualTo(_categoriaSeleccionada!.id)
              .findAll();
    }

    showDialog(
      context: context,
      builder:
          (context) => PropiedadDialog(
            propiedad: _categoriaSeleccionada!.propiedades[index],
            onSave: (propiedad) async {
              if (productosAsociados.isNotEmpty &&
                  propiedad.tipo !=
                      _categoriaSeleccionada!.propiedades[index].tipo) {
                _mostrarSnackBar(
                  'No se puede cambiar el tipo porque hay productos asociados.',
                  Colors.orange,
                );
                _categoriaSeleccionada!.propiedades[index].nombre =
                    propiedad.nombre;
              } else {
                _categoriaSeleccionada!.propiedades[index] = propiedad;
              }
              if (isar != null) {
                await isar.writeTxn(() async {
                  await isar.categorias.put(_categoriaSeleccionada!);
                });
              }
              setState(() {});
            },
          ),
    );
  }

  void _eliminarPropiedad(int index) async {
    final confirm = await _mostrarDialogoConfirmacion(
      'Eliminar Propiedad',
      'Â¿EstÃ¡s seguro de que deseas eliminar esta propiedad?',
    );
    if (confirm != true) return;

    final isar = Isar.getInstance();
    final productosAsociados =
        await isar!.productos
            .filter()
            .categoriaIdEqualTo(_categoriaSeleccionada!.id)
            .findAll();

    if (productosAsociados.isNotEmpty) {
      _mostrarSnackBar(
        'No se puede eliminar la propiedad porque hay productos asociados.',
        Colors.redAccent,
      );
      return;
    }

    final propiedades = List<PropiedadCategoria>.from(
      _categoriaSeleccionada!.propiedades,
    );
    propiedades.removeAt(index);
    _categoriaSeleccionada!.propiedades = propiedades;

    await isar.writeTxn(() async {
      await isar.categorias.put(_categoriaSeleccionada!);
    });
    setState(() {});
  }

  // ===========================================================================
  // 7. MÃ‰TODOS AUXILIARES (ICONOS, MENSAJES, ETC.)
  // ===========================================================================

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
        return 'NÃºmero';
      case TipoPropiedad.booleano:
        return 'SÃ­/No';
      case TipoPropiedad.fecha:
        return 'Fecha';
      case TipoPropiedad.seleccion:
        return 'Lista de opciones';
    }
  }

  void _mostrarSnackBar(String mensaje, Color color) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(mensaje), backgroundColor: color));
  }

  Future<bool?> _mostrarDialogoConfirmacion(String titulo, String contenido) {
    return showDialog<bool>(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(titulo),
            content: Text(contenido),
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
  }

  // ===========================================================================
  // 8. VISTA DE JERARQUÃA (OPCIONAL)
  // ===========================================================================

  void _mostrarVistaJerarquia() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('JerarquÃ­a de CategorÃ­as'),
            content: SizedBox(
              height: 400,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                      _getCategoriasHijas(
                        null,
                      ).map((c) => _buildJerarquiaItem(c, 0)).toList(),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(left: nivel * 20),
          child: Row(
            children: [
              Icon(
                hijas.isNotEmpty ? Icons.folder : Icons.category,
                color: hijas.isNotEmpty ? Colors.orange : Colors.grey,
              ),
              const SizedBox(width: 8),
              Expanded(child: Text(categoria.nombre)),
              if (categoria.descripcion != null)
                Text(
                  '(${categoria.descripcion})',
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
            ],
          ),
        ),
        if (hijas.isNotEmpty)
          ...hijas.map((hija) => _buildJerarquiaItem(hija, nivel + 1)),
      ],
    );
  }
}
