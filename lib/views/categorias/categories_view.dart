import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import '../../views/categorias/dialogs/propiedad_dialog.dart';
import '../../models/categoria.dart';
import '../../models/propiedad_categoria.dart';
import '../../models/producto.dart';
import '../../seed/isar_seed.dart';
import '../../widgets/fashion_components.dart';

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
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Categorías',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.8,
                      ),
                    ),
                  ),
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
                        onTap: _mostrarDialogoNuevaCategoria,
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.add, color: Colors.white, size: 18),
                              SizedBox(width: 8),
                              Text(
                                'Nueva Categoría',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: _buildContent(),
    );
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

      if (await isar.collection<Categoria>().count() == 0) {
        await seedIsar(isar);
      }

      final categorias = await isar.collection<Categoria>().where().findAll();
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
            CircularProgressIndicator(color: Colors.black, strokeWidth: 2),
            SizedBox(height: 16),
            Text(
              'Cargando categorías...',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      );
    }

    if (_error) {
      return Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400),
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.red.shade50,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(
                  Icons.error_outline,
                  size: 48,
                  color: Colors.red.shade400,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Error al cargar categorías',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'No se pudo conectar con la base de datos',
                style: TextStyle(color: Colors.grey.shade600, fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
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
                    onTap: _loadCategorias,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      child: Text(
                        'Reintentar',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    if (_categorias.isEmpty) {
      return Center(
        child: Container(
          padding: const EdgeInsets.all(40),
          constraints: const BoxConstraints(maxWidth: 600),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(
                  Icons.category_outlined,
                  size: 64,
                  color: Colors.grey.shade400,
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                'No hay categorías creadas',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Las categorías son el molde de tus productos. Cada categoría define qué propiedades tendrán los productos que pertenezcan a ella.\n\nPuedes crear categorías principales y subcategorías para organizar mejor tu inventario.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade600,
                  height: 1.6,
                ),
              ),
              const SizedBox(height: 40),
              Container(
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
                    onTap: _mostrarDialogoNuevaCategoria,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.add, color: Colors.white, size: 20),
                          SizedBox(width: 12),
                          Text(
                            'Crear Primera Categoría',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Text(
                  'Ejemplo: Ropa → Remeras → Remeras de Algodón',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Column(
      children: [
        // Descripción de la sección de categorías
        Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(20),
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
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.info_outline,
                  color: Colors.grey.shade600,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  'En esta sección puedes crear y organizar las categorías de tus productos. Las categorías te ayudan a agrupar productos similares y definir sus propiedades.',
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    height: 1.4,
                  ),
                ),
              ),
            ],
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
                    // Barra de búsqueda elegante
                    Container(
                      margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.grey.shade200),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: TextField(
                        style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Buscar categorías...',
                          hintStyle: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Icon(
                              Icons.search,
                              color: Colors.grey.shade400,
                              size: 20,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.transparent,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 16,
                          ),
                        ),
                        onChanged:
                            (value) =>
                                setState(() => searchQuery = value.trim()),
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        children:
                            _getCategoriasFiltradas(null)
                                .map(
                                  (categoria) =>
                                      _buildCategoriaItem(categoria, 0),
                                )
                                .toList(),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 1,
                color: Colors.grey.shade200,
                margin: const EdgeInsets.symmetric(vertical: 20),
              ),
              // Panel derecho - Propiedades
              Expanded(flex: 1, child: _buildTableroPropiedades()),
            ],
          ),
        ),
      ],
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
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () {
                  setState(() {
                    if (estaExpandida) {
                      _categoriasExpandidas.remove(categoria.id);
                    } else {
                      _categoriasExpandidas.add(categoria.id);
                    }
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: Icon(
                    estaExpandida ? Icons.expand_more : Icons.chevron_right,
                    size: 16,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
          ),
        if (tieneHijas && categoria != null) const SizedBox(width: 8),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: tieneHijas ? Colors.orange.shade50 : Colors.grey.shade100,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            tieneHijas ? Icons.folder_outlined : Icons.category_outlined,
            color: tieneHijas ? Colors.orange.shade600 : Colors.grey.shade600,
            size: 20,
          ),
        ),
      ],
    );
  }

  Widget _buildCategoriaItem(Categoria categoria, int nivel) {
    final hijas = _getCategoriasHijas(categoria.id);
    final tieneHijas = hijas.isNotEmpty;
    final estaExpandida = _categoriasExpandidas.contains(categoria.id);
    final esSeleccionada = _categoriaSeleccionada?.id == categoria.id;

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
          margin: EdgeInsets.fromLTRB(20 + (nivel * 20.0), 0, 20, 8),
          decoration: BoxDecoration(
            color:
                esSeleccionada ? Colors.black.withOpacity(0.05) : Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: esSeleccionada ? Colors.black87 : Colors.grey.shade200,
              width: esSeleccionada ? 2 : 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () => setState(() => _categoriaSeleccionada = categoria),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    _buildLeadingIcon(tieneHijas, estaExpandida, categoria),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildCategoriaTitle(
                        categoria,
                        nivel,
                        esSeleccionada,
                      ),
                    ),
                    const SizedBox(width: 8),
                    _buildCategoriaActions(categoria),
                  ],
                ),
              ),
            ),
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
            fontWeight: esSeleccionada ? FontWeight.w600 : FontWeight.w500,
            color: esSeleccionada ? Colors.black87 : Colors.black87,
            fontSize: 16,
            letterSpacing: -0.3,
          ),
        ),
        if (categoria.descripcion != null &&
            categoria.descripcion!.isNotEmpty) ...[
          const SizedBox(height: 4),
          Text(
            categoria.descripcion!,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w400,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
        if (nivel > 0) ...[
          const SizedBox(height: 4),
          Text(
            _getRutaCompleta(categoria),
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade500,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.italic,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ],
    );
  }

  Widget _buildCategoriaActions(Categoria categoria) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.green.shade50,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(6),
              onTap: () => _mostrarDialogoCrearSubcategoria(categoria),
              child: Padding(
                padding: const EdgeInsets.all(6),
                child: Icon(Icons.add, size: 16, color: Colors.green.shade600),
              ),
            ),
          ),
        ),
        const SizedBox(width: 6),
        Container(
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(6),
              onTap: () => _mostrarDialogoEditarCategoria(categoria),
              child: Padding(
                padding: const EdgeInsets.all(6),
                child: Icon(
                  Icons.edit_outlined,
                  size: 16,
                  color: Colors.blue.shade600,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 6),
        Container(
          decoration: BoxDecoration(
            color: Colors.red.shade50,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(6),
              onTap: () => _eliminarCategoria(categoria),
              child: Padding(
                padding: const EdgeInsets.all(6),
                child: Icon(
                  Icons.delete_outline,
                  size: 16,
                  color: Colors.red.shade600,
                ),
              ),
            ),
          ),
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
          (context) => Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Container(
              constraints: const BoxConstraints(maxWidth: 380),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: StatefulBuilder(
                builder:
                    (context, setState) => Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Nueva Categoría',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            letterSpacing: -0.5,
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          decoration: InputDecoration(
                            labelText: 'Nombre de la categoría',
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
                          onChanged:
                              (value) => setState(() => nombre = value.trim()),
                        ),
                        const SizedBox(height: 24),
                        Row(
                          children: [
                            Expanded(
                              child: TextButton(
                                onPressed: () => Navigator.pop(context),
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                  ),
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
                                  color:
                                      nombre.isEmpty
                                          ? Colors.grey.shade300
                                          : Colors.black,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(12),
                                    onTap:
                                        nombre.isEmpty
                                            ? null
                                            : () async {
                                              final isar = Isar.getInstance();
                                              if (isar != null) {
                                                await isar.writeTxn(() async {
                                                  await isar
                                                      .collection<Categoria>()
                                                      .put(
                                                        Categoria()
                                                          ..nombre = nombre,
                                                      );
                                                });
                                                await _loadCategorias();
                                              }
                                              Navigator.pop(context);
                                            },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 12,
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Guardar',
                                          style: TextStyle(
                                            color:
                                                nombre.isEmpty
                                                    ? Colors.grey.shade600
                                                    : Colors.white,
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
          ),
    );
  }

  void _mostrarDialogoCrearSubcategoria(Categoria padre) {
    String nombre = '';
    showDialog(
      context: context,
      builder:
          (context) => Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Container(
              constraints: const BoxConstraints(maxWidth: 400),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: StatefulBuilder(
                builder:
                    (context, setState) => Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nueva Subcategoría de "${padre.nombre}"',
                          style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            letterSpacing: -0.5,
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          decoration: InputDecoration(
                            labelText: 'Nombre de la subcategoría',
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
                          onChanged:
                              (value) => setState(() => nombre = value.trim()),
                        ),
                        const SizedBox(height: 24),
                        Row(
                          children: [
                            Expanded(
                              child: TextButton(
                                onPressed: () => Navigator.pop(context),
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                  ),
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
                                  color:
                                      nombre.isEmpty
                                          ? Colors.grey.shade300
                                          : Colors.black,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(12),
                                    onTap:
                                        nombre.isEmpty
                                            ? null
                                            : () async {
                                              final isar = Isar.getInstance();
                                              if (isar != null) {
                                                await isar.writeTxn(() async {
                                                  await isar
                                                      .collection<Categoria>()
                                                      .put(
                                                        Categoria()
                                                          ..nombre = nombre
                                                          ..parent = padre.id,
                                                      );
                                                });
                                                await _loadCategorias();
                                              }
                                              Navigator.pop(context);
                                            },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 12,
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Guardar',
                                          style: TextStyle(
                                            color:
                                                nombre.isEmpty
                                                    ? Colors.grey.shade600
                                                    : Colors.white,
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
          ),
    );
  }

  void _mostrarDialogoEditarCategoria(Categoria categoria) {
    String nombre = categoria.nombre;
    showDialog(
      context: context,
      builder:
          (context) => Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Container(
              constraints: const BoxConstraints(maxWidth: 400),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: StatefulBuilder(
                builder:
                    (context, setState) => Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Editar Categoría',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            letterSpacing: -0.5,
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          controller: TextEditingController(text: nombre),
                          style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          decoration: InputDecoration(
                            labelText: 'Nombre de la categoría',
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
                          onChanged:
                              (value) => setState(() => nombre = value.trim()),
                        ),
                        const SizedBox(height: 24),
                        Row(
                          children: [
                            Expanded(
                              child: TextButton(
                                onPressed: () => Navigator.pop(context),
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                  ),
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
                                  color:
                                      nombre.isEmpty
                                          ? Colors.grey.shade300
                                          : Colors.black,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(12),
                                    onTap:
                                        nombre.isEmpty
                                            ? null
                                            : () async {
                                              final isar = Isar.getInstance();
                                              if (isar != null) {
                                                await isar.writeTxn(() async {
                                                  await isar
                                                      .collection<Categoria>()
                                                      .put(
                                                        categoria
                                                          ..nombre = nombre,
                                                      );
                                                });
                                                await _loadCategorias();
                                              }
                                              Navigator.pop(context);
                                            },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 12,
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Guardar Cambios',
                                          style: TextStyle(
                                            color:
                                                nombre.isEmpty
                                                    ? Colors.grey.shade600
                                                    : Colors.white,
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
      final todosLosProductos =
          await isar.collection<Producto>().where().findAll();
      final productos =
          todosLosProductos
              .where((p) => p.categoriaId == categoria.id)
              .toList();
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
        await isar.collection<Categoria>().delete(categoria.id);
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
      margin: const EdgeInsets.all(20),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Barra de búsqueda para propiedades
          if (_categoriaSeleccionada != null)
            Container(
              margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: TextField(
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                  hintText: 'Buscar propiedades...',
                  hintStyle: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Icon(
                      Icons.search,
                      color: Colors.grey.shade400,
                      size: 18,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 16,
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    // Implementa búsqueda de propiedades si lo deseas
                  });
                },
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: _buildPropiedadesHeader(),
          ),
          Expanded(child: _buildPropiedadesContent()),
        ],
      ),
    );
  }

  Widget _buildPropiedadesHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Propiedades',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
            letterSpacing: -0.5,
          ),
        ),
        if (_categoriaSeleccionada != null)
          Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: _agregarPropiedad,
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.add, color: Colors.white, size: 16),
                      SizedBox(width: 6),
                      Text(
                        'Agregar',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildPropiedadesContent() {
    if (_categoriaSeleccionada == null) {
      return Center(
        child: Container(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(
                  Icons.category_outlined,
                  size: 48,
                  color: Colors.grey.shade400,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Selecciona una categoría',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Elige una categoría del panel izquierdo para ver y gestionar sus propiedades',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 16,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      );
    }

    if (_categoriaSeleccionada!.propiedades.isEmpty) {
      return Center(
        child: Container(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(Icons.tune, size: 48, color: Colors.grey.shade400),
              ),
              const SizedBox(height: 24),
              Text(
                'Sin propiedades en "${_categoriaSeleccionada!.nombre}"',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                'Agrega propiedades para definir los campos que tendrán los productos de esta categoría.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 16,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 24),
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
                    onTap: _agregarPropiedad,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.add, color: Colors.white, size: 18),
                          SizedBox(width: 8),
                          Text(
                            'Agregar Primera Propiedad',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return _buildPropiedadesGrid();
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
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPropiedadHeader(propiedad, index),
            const SizedBox(height: 16),
            Text(
              propiedad.nombre,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Colors.black87,
                letterSpacing: -0.3,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                _getTypeDescription(propiedad.tipo),
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            if (propiedad.valorPorDefecto != null) ...[
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  'Default: ${propiedad.valorPorDefecto}',
                  style: TextStyle(
                    color: Colors.blue.shade600,
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
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
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: _getColorForType(propiedad.tipo).withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            _getIconForType(propiedad.tipo),
            color: _getColorForType(propiedad.tipo),
            size: 20,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(8),
          ),
          child: PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'edit') _editarPropiedad(index);
              if (value == 'delete') _eliminarPropiedad(index);
            },
            itemBuilder:
                (context) => [
                  PopupMenuItem(
                    value: 'edit',
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.edit_outlined,
                          size: 16,
                          color: Colors.blue.shade600,
                        ),
                        const SizedBox(width: 8),
                        const Text('Editar'),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 'delete',
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.delete_outline,
                          size: 16,
                          color: Colors.red.shade600,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Eliminar',
                          style: TextStyle(color: Colors.red.shade600),
                        ),
                      ],
                    ),
                  ),
                ],
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Icon(
                Icons.more_vert,
                color: Colors.grey.shade600,
                size: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRequeridoBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.orange.shade600,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.orange.withOpacity(0.2),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: const Text(
        'Requerido',
        style: TextStyle(
          color: Colors.white,
          fontSize: 11,
          fontWeight: FontWeight.w600,
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
                  await isar.collection<Categoria>().put(
                    _categoriaSeleccionada!,
                  );
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
      final todosLosProductos =
          await isar.collection<Producto>().where().findAll();
      productosAsociados =
          todosLosProductos
              .where((p) => p.categoriaId == _categoriaSeleccionada!.id)
              .toList();
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
                  await isar.collection<Categoria>().put(
                    _categoriaSeleccionada!,
                  );
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
    final todosLosProductos =
        await isar!.collection<Producto>().where().findAll();
    final productosAsociados =
        todosLosProductos
            .where((p) => p.categoriaId == _categoriaSeleccionada!.id)
            .toList();

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
      await isar.collection<Categoria>().put(_categoriaSeleccionada!);
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

  Color _getColorForType(TipoPropiedad tipo) {
    switch (tipo) {
      case TipoPropiedad.texto:
        return Colors.blue;
      case TipoPropiedad.numero:
        return Colors.green;
      case TipoPropiedad.booleano:
        return Colors.orange;
      case TipoPropiedad.fecha:
        return Colors.purple;
      case TipoPropiedad.seleccion:
        return Colors.red;
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
          (context) => Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Container(
              constraints: const BoxConstraints(maxWidth: 380),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.red.shade50,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          Icons.warning_outlined,
                          color: Colors.red.shade600,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          titulo,
                          style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            letterSpacing: -0.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    contenido,
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () => Navigator.pop(context, false),
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
                            color: Colors.red.shade600,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.red.withOpacity(0.2),
                                blurRadius: 6,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(12),
                              onTap: () => Navigator.pop(context, true),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(vertical: 12),
                                child: Center(
                                  child: Text(
                                    'Eliminar',
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

  // ===========================================================================
  // 8. VISTA DE JERARQUÃA (OPCIONAL)
}
