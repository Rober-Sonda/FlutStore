import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:isar/isar.dart';
import '../models/categoria.dart';
import '../models/propiedad_categoria.dart';
import '../seed/isar_seed.dart';

class CategoryAddEditView extends StatefulWidget {
  final Categoria? categoria;

  const CategoryAddEditView({super.key, this.categoria});

  @override
  State<CategoryAddEditView> createState() => _CategoryAddEditViewState();
}

class _CategoryAddEditViewState extends State<CategoryAddEditView> {
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _descripcionController = TextEditingController();
  List<PropiedadCategoria> _propiedades = [];
  bool _isEditing = false;
  Categoria? _categoriaPadre;
  List<Categoria> _categoriasDisponibles = [];

  @override
  void initState() {
    super.initState();
    _loadCategorias();
    if (widget.categoria != null) {
      _isEditing = true;
      _nombreController.text = widget.categoria!.nombre;
      _descripcionController.text = widget.categoria!.descripcion ?? '';
      _propiedades = List.from(widget.categoria!.propiedades);
      _categoriaPadre = null; // Se cargará después
    }
  }

  @override
  void dispose() {
    _nombreController.dispose();
    _descripcionController.dispose();
    super.dispose();
  }

  Future<void> _loadCategorias() async {
    final isar = Isar.getInstance();
    if (isar == null) return;

    // Verificar si hay categorías, si no, hacer seed
    if (await isar.categorias.count() == 0) {
      await seedIsar(isar);
    }

    final categorias = await isar.categorias.where().findAll();

    // Filtrar categorías disponibles como padre (excluir la actual si estamos editando)
    _categoriasDisponibles =
        categorias
            .where(
              (c) => widget.categoria == null || c.id != widget.categoria!.id,
            )
            .toList();

    if (_isEditing && widget.categoria != null) {
      // Cargar la categoría padre actual
      if (widget.categoria!.parent != null) {
        _categoriaPadre = categorias.firstWhere(
          (c) => c.id == widget.categoria!.parent,
          orElse: () => categorias.first,
        );
      }
    }

    setState(() {});
  }

  void _agregarPropiedad() {
    showDialog(
      context: context,
      builder:
          (context) => _PropiedadDialog(
            onSave: (propiedad) {
              setState(() {
                _propiedades.add(propiedad);
              });
            },
          ),
    );
  }

  void _editarPropiedad(int index) {
    showDialog(
      context: context,
      builder:
          (context) => _PropiedadDialog(
            propiedad: _propiedades[index],
            onSave: (propiedad) {
              setState(() {
                _propiedades[index] = propiedad;
              });
            },
          ),
    );
  }

  void _eliminarPropiedad(int index) {
    setState(() {
      _propiedades.removeAt(index);
    });
  }

  Future<void> _guardarCategoria() async {
    if (!_formKey.currentState!.validate()) return;

    final isar = Isar.getInstance();
    if (isar == null) return;

    final categoria = _isEditing ? widget.categoria! : Categoria();
    categoria.nombre = _nombreController.text.trim();
    categoria.descripcion =
        _descripcionController.text.trim().isEmpty
            ? null
            : _descripcionController.text.trim();
    categoria.propiedades = List.from(_propiedades);
    categoria.parent = _categoriaPadre?.id;

    // Asignar orden si es nueva categoría
    if (!_isEditing) {
      final categoriasMismoPadre =
          _categoriasDisponibles
              .where((c) => c.parent == _categoriaPadre?.id)
              .toList();
      categoria.orden = categoriasMismoPadre.length;
    }

    await isar.writeTxn(() async {
      await isar.categorias.put(categoria);
    });

    if (mounted) {
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isEditing ? 'Editar Categoría' : 'Nueva Categoría'),
        actions: [
          TextButton(
            onPressed: _guardarCategoria,
            child: const Text('Guardar'),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: _nombreController,
              decoration: const InputDecoration(
                labelText: 'Nombre de la categoría',
                border: OutlineInputBorder(),
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
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<Categoria?>(
              value: _categoriaPadre,
              decoration: const InputDecoration(
                labelText: 'Categoría padre (opcional)',
                border: OutlineInputBorder(),
                helperText: 'Deja vacío para crear una categoría raíz',
              ),
              items: [
                const DropdownMenuItem<Categoria?>(
                  value: null,
                  child: Text('Sin categoría padre (raíz)'),
                ),
                ..._categoriasDisponibles.map((categoria) {
                  return DropdownMenuItem<Categoria?>(
                    value: categoria,
                    child: Text(categoria.nombre),
                  );
                }),
              ],
              onChanged: (value) {
                setState(() {
                  _categoriaPadre = value;
                });
              },
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Propiedades de la categoría',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                ElevatedButton.icon(
                  onPressed: _agregarPropiedad,
                  icon: const Icon(Icons.add),
                  label: const Text('Agregar'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            if (_propiedades.isEmpty)
              const Card(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'No hay propiedades definidas. Agrega propiedades para definir qué campos tendrán los productos de esta categoría.',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.grey,
                    ),
                  ),
                ),
              )
            else
              ..._propiedades.asMap().entries.map(
                (entry) => Card(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: ListTile(
                    leading: Icon(_getIconForType(entry.value.tipo)),
                    title: Text(entry.value.nombre),
                    subtitle: Text(_getTypeDescription(entry.value.tipo)),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () => _editarPropiedad(entry.key),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () => _eliminarPropiedad(entry.key),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
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
