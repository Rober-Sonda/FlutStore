import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:isar/isar.dart';
import '../../../models/categoria.dart';
import '../../../seed/isar_seed.dart';

class CategoriesAddView extends StatefulWidget {
  final Categoria? categoria;
  final Map<String, dynamic>? extra;

  const CategoriesAddView({super.key, this.categoria, this.extra});

  @override
  State<CategoriesAddView> createState() => _CategoriesAddViewState();
}

class _CategoriesAddViewState extends State<CategoriesAddView> {
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _descripcionController = TextEditingController();

  List<Categoria> _categoriasDisponibles = [];
  Categoria? _categoriaPadreSeleccionada;
  bool _isLoading = true;
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _isEditing = widget.categoria != null;

    if (_isEditing) {
      _nombreController.text = widget.categoria!.nombre;
      _descripcionController.text = widget.categoria!.descripcion ?? '';
    }

    _loadCategorias();
  }

  @override
  void dispose() {
    _nombreController.dispose();
    _descripcionController.dispose();
    super.dispose();
  }

  Future<void> _loadCategorias() async {
    try {
      final isar = Isar.getInstance();
      if (isar == null) {
        setState(() => _isLoading = false);
        return;
      }

      // Verificar si hay categorías, si no, hacer seed
      if (await isar.categorias.count() == 0) {
        await seedIsar(isar);
      }

      final categorias = await isar.categorias.where().findAll();

      // Filtrar categorías que no sean la actual (para evitar auto-referencia)
      final categoriasFiltradas =
          categorias
              .where((cat) => !_isEditing || cat.id != widget.categoria!.id)
              .toList();

      // Ordenar por jerarquía
      categoriasFiltradas.sort((a, b) {
        if (a.parent == b.parent) {
          return a.orden.compareTo(b.orden);
        }
        return (a.parent ?? 0).compareTo(b.parent ?? 0);
      });

      setState(() {
        _categoriasDisponibles = categoriasFiltradas;
        _isLoading = false;
      });

      // Si estamos editando, establecer la categoría padre
      if (_isEditing && widget.categoria!.parent != null) {
        _categoriaPadreSeleccionada = categoriasFiltradas.firstWhere(
          (c) => c.id == widget.categoria!.parent,
        );
      }

      // Si se pasó información de categoría padre desde la vista de categorías
      if (widget.extra != null && widget.extra!['parentId'] != null) {
        final parentId = widget.extra!['parentId'] as int;
        _categoriaPadreSeleccionada = categoriasFiltradas.firstWhere(
          (c) => c.id == parentId,
        );
      }
    } catch (e) {
      setState(() => _isLoading = false);
      print('Error cargando categorías: $e');
    }
  }

  String _getRutaCompleta(Categoria categoria) {
    List<String> rutas = [categoria.nombre];
    Categoria? actual = categoria;

    while (actual?.parent != null) {
      final padre = _categoriasDisponibles.firstWhere(
        (c) => c.id == actual!.parent,
        orElse: () => actual!,
      );
      rutas.insert(0, padre.nombre);
      actual = padre;
    }

    return rutas.join(' > ');
  }

  Future<void> _guardar() async {
    if (!_formKey.currentState!.validate()) return;

    try {
      final isar = Isar.getInstance();
      if (isar == null) return;

      final categoria = _isEditing ? widget.categoria! : Categoria();
      categoria.nombre = _nombreController.text.trim();
      categoria.descripcion =
          _descripcionController.text.trim().isEmpty
              ? null
              : _descripcionController.text.trim();
      categoria.parent = _categoriaPadreSeleccionada?.id;

      // Si es nueva categoría, establecer orden
      if (!_isEditing) {
        final maxOrden =
            await isar.categorias
                .filter()
                .parentEqualTo(_categoriaPadreSeleccionada?.id)
                .findAll();
        categoria.orden =
            maxOrden.isEmpty
                ? 0
                : maxOrden.map((c) => c.orden).reduce((a, b) => a > b ? a : b) +
                    1;
      }

      await isar.writeTxn(() async {
        await isar.categorias.put(categoria);
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              _isEditing
                  ? 'Categoría actualizada correctamente'
                  : 'Categoría creada correctamente',
            ),
            backgroundColor: Colors.green,
          ),
        );
        context.pop();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e'), backgroundColor: Colors.red),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isEditing ? 'Editar Categoría' : 'Nueva Categoría'),
        actions: [
          if (_isEditing)
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: _eliminarCategoria,
              tooltip: 'Eliminar categoría',
            ),
        ],
      ),
      body:
          _isLoading
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Información de categoría padre
                      if (_categoriasDisponibles.isNotEmpty) ...[
                        const Text(
                          'Categoría Padre',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      _categoriaPadreSeleccionada != null
                                          ? Icons.folder
                                          : Icons.category,
                                      color:
                                          _categoriaPadreSeleccionada != null
                                              ? Colors.orange
                                              : Colors.grey,
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Text(
                                        _categoriaPadreSeleccionada != null
                                            ? _getRutaCompleta(
                                              _categoriaPadreSeleccionada!,
                                            )
                                            : 'Categoría principal (sin padre)',
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                DropdownButtonFormField<Categoria?>(
                                  value: _categoriaPadreSeleccionada,
                                  decoration: const InputDecoration(
                                    labelText: 'Seleccionar categoría padre',
                                    border: OutlineInputBorder(),
                                  ),
                                  items: [
                                    const DropdownMenuItem<Categoria?>(
                                      value: null,
                                      child: Text(
                                        'Sin categoría padre (categoría principal)',
                                      ),
                                    ),
                                    ..._categoriasDisponibles.map((categoria) {
                                      return DropdownMenuItem<Categoria?>(
                                        value: categoria,
                                        child: Text(
                                          _getRutaCompleta(categoria),
                                        ),
                                      );
                                    }),
                                  ],
                                  onChanged: (value) {
                                    setState(() {
                                      _categoriaPadreSeleccionada = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                      ],

                      // Información de la categoría
                      const Text(
                        'Información de la Categoría',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              TextFormField(
                                controller: _nombreController,
                                decoration: const InputDecoration(
                                  labelText: 'Nombre de la categoría *',
                                  border: OutlineInputBorder(),
                                  prefixIcon: Icon(Icons.category),
                                ),
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'El nombre es requerido';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 16),
                              TextFormField(
                                controller: _descripcionController,
                                decoration: const InputDecoration(
                                  labelText: 'Descripción (opcional)',
                                  border: OutlineInputBorder(),
                                  prefixIcon: Icon(Icons.description),
                                ),
                                maxLines: 3,
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),

                      // Botones
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: _guardar,
                              icon: const Icon(Icons.save),
                              label: Text(_isEditing ? 'Actualizar' : 'Crear'),
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: OutlinedButton.icon(
                              onPressed: () => context.pop(),
                              icon: const Icon(Icons.cancel),
                              label: const Text('Cancelar'),
                              style: OutlinedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),

                      // Información adicional
                      Card(
                        color: Colors.blue.withOpacity(0.1),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Row(
                                children: [
                                  Icon(Icons.info, color: Colors.blue),
                                  SizedBox(width: 8),
                                  Text(
                                    'Información sobre categorías anidadas',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                '• Las categorías pueden tener subcategorías para organizar mejor tu inventario.\n'
                                '• Ejemplo: Ropa > Remeras > Remeras de Algodón\n'
                                '• Las propiedades se heredan de la categoría padre.\n'
                                '• Puedes crear categorías principales (sin padre) o subcategorías.',
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
    );
  }

  Future<void> _eliminarCategoria() async {
    if (!_isEditing) return;

    final confirmar = await showDialog<bool>(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Confirmar eliminación'),
            content: Text(
              '¿Estás seguro de que quieres eliminar la categoría "${widget.categoria!.nombre}"?\n\n'
              'Esta acción eliminará también todas las subcategorías y propiedades asociadas.',
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
      try {
        final isar = Isar.getInstance();
        if (isar == null) return;

        await isar.writeTxn(() async {
          await isar.categorias.delete(widget.categoria!.id);
        });

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Categoría eliminada correctamente'),
              backgroundColor: Colors.green,
            ),
          );
          context.pop();
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: $e'), backgroundColor: Colors.red),
          );
        }
      }
    }
  }
}
