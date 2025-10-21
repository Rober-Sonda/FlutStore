import 'package:flutter/material.dart';
import '../../../models/propiedad_categoria.dart';

class PropiedadDialog extends StatefulWidget {
  final PropiedadCategoria? propiedad;
  final Function(PropiedadCategoria) onSave;

  const PropiedadDialog({this.propiedad, required this.onSave});

  @override
  State<PropiedadDialog> createState() => _PropiedadDialogState();
}

class _PropiedadDialogState extends State<PropiedadDialog> {
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
                          labelText: 'Nueva opciÃ³n',
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
        return 'NÃºmero';
      case TipoPropiedad.booleano:
        return 'SÃ­/No';
      case TipoPropiedad.fecha:
        return 'Fecha';
      case TipoPropiedad.seleccion:
        return 'Lista de opciones';
    }
  }
}

