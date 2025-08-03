import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:isar/isar.dart';
import '../../models/categoria.dart';
import '../../models/propiedad_categoria.dart';
import '../../seed/isar_seed.dart';
import '../../src/app_routes.dart';

class CategoriesHierarchyView extends StatefulWidget {
  const CategoriesHierarchyView({super.key});

  @override
  State<CategoriesHierarchyView> createState() =>
      _CategoriesHierarchyViewState();
}

class _CategoriesHierarchyViewState extends State<CategoriesHierarchyView> {
  List<Categoria> _categorias = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadCategorias();
  }

  Future<void> _loadCategorias() async {
    final isar = Isar.getInstance();
    if (isar == null) return;

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

    setState(() {
      _categorias = categorias;
      _loading = false;
    });
  }

  List<Categoria> _getCategoriasHijas(int? parentId) {
    return _categorias.where((cat) => cat.parent == parentId).toList();
  }

  Future<void> _eliminarCategoria(Categoria categoria) async {
    // Verificar si tiene categorías hijas
    final hijas = _getCategoriasHijas(categoria.id);
    if (hijas.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'No se puede eliminar una categoría que tiene subcategorías',
          ),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    final confirmar = await showDialog<bool>(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Confirmar eliminación'),
            content: Text(
              '¿Estás seguro de que quieres eliminar la categoría "${categoria.nombre}"?',
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

      await _loadCategorias();
    }
  }

  Future<void> _moverCategoria(
    Categoria categoria,
    Categoria? nuevaPadre,
  ) async {
    final isar = Isar.getInstance();
    if (isar == null) return;

    // Verificar que no se mueva a sí misma o a una de sus hijas
    if (nuevaPadre != null) {
      if (nuevaPadre.id == categoria.id) return;

      // Verificar que no sea una hija de la categoría actual
      var padreActual = nuevaPadre;
      while (padreActual.parent != null) {
        if (padreActual.parent == categoria.id) return;
        padreActual = _categorias.firstWhere((c) => c.id == padreActual.parent);
      }
    }

    categoria.parent = nuevaPadre?.id;

    await isar.writeTxn(() async {
      await isar.categorias.put(categoria);
    });

    await _loadCategorias();
  }

  Widget _buildCategoriaItem(Categoria categoria, int nivel) {
    final hijas = _getCategoriasHijas(categoria.id);
    final tieneHijas = hijas.isNotEmpty;

    return Column(
      children: [
        Card(
          margin: EdgeInsets.only(left: nivel * 20.0, right: 8.0, bottom: 8.0),
          child: ExpansionTile(
            leading: Icon(
              tieneHijas ? Icons.folder : Icons.category,
              color: tieneHijas ? Colors.orange : Colors.blue,
            ),
            title: Text(
              categoria.nombre,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle:
                categoria.descripcion != null
                    ? Text(categoria.descripcion!)
                    : null,
            children: [
              if (categoria.propiedades.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Propiedades:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      ...categoria.propiedades.map(
                        (prop) => Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: Row(
                            children: [
                              Icon(_getIconForType(prop.tipo), size: 16),
                              const SizedBox(width: 8),
                              Text(prop.nombre),
                              if (prop.requerido)
                                const Padding(
                                  padding: EdgeInsets.only(left: 8),
                                  child: Chip(
                                    label: Text('Requerido'),
                                    backgroundColor: Colors.orange,
                                    labelStyle: TextStyle(fontSize: 10),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              OverflowBar(
                children: [
                  TextButton.icon(
                    onPressed: () {
                      context.push(AppRoutes.categoryAdd, extra: categoria);
                    },
                    icon: const Icon(Icons.edit),
                    label: const Text('Editar'),
                  ),
                  if (!tieneHijas)
                    TextButton.icon(
                      onPressed: () => _eliminarCategoria(categoria),
                      icon: const Icon(Icons.delete),
                      label: const Text('Eliminar'),
                      style: TextButton.styleFrom(foregroundColor: Colors.red),
                    ),
                  PopupMenuButton<Categoria?>(
                    onSelected:
                        (nuevaPadre) => _moverCategoria(categoria, nuevaPadre),
                    itemBuilder:
                        (context) => [
                          const PopupMenuItem(
                            value: null,
                            child: Text('Mover a raíz'),
                          ),
                          const PopupMenuDivider(),
                          ..._categorias
                              .where((c) => c.id != categoria.id)
                              .map(
                                (c) => PopupMenuItem(
                                  value: c,
                                  child: Text('Mover a ${c.nombre}'),
                                ),
                              ),
                        ],
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.more_vert),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        if (tieneHijas)
          ...hijas.map((hija) => _buildCategoriaItem(hija, nivel + 1)),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jerarquía de Categorías'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loadCategorias,
            tooltip: 'Actualizar',
          ),
        ],
      ),
      body:
          _loading
              ? const Center(child: CircularProgressIndicator())
              : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Categorías (${_categorias.length})',
                          style: const TextStyle(
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
                    child:
                        _categorias.isEmpty
                            ? const Center(
                              child: Text(
                                'No hay categorías. Agrega la primera categoría.',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                            )
                            : ListView(
                              padding: const EdgeInsets.all(16),
                              children:
                                  _getCategoriasHijas(null)
                                      .map(
                                        (categoria) =>
                                            _buildCategoriaItem(categoria, 0),
                                      )
                                      .toList(),
                            ),
                  ),
                ],
              ),
    );
  }
}
