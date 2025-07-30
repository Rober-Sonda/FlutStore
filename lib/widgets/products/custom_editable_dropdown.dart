import 'package:flutter/material.dart';
import 'package:tienda_app/models/product_attribute.dart';

class EditableDropdown<T extends ProductAttribute> extends StatefulWidget {
  final List<T> items;
  final T? selectedItem;
  final String label;
  final IconData icon;
  final String addOptionText;
  final Future<T?> Function(String name) onAdd;
  final ValueChanged<T?> onChanged;
  final FormFieldValidator<T>? validator;

  const EditableDropdown({
    required this.items,
    required this.selectedItem,
    required this.label,
    required this.icon,
    required this.addOptionText,
    required this.onAdd,
    required this.onChanged,
    this.validator,
    super.key,
  });

  @override
  _EditableDropdownState<T> createState() => _EditableDropdownState<T>();
}

class _EditableDropdownState<T extends ProductAttribute> extends State<EditableDropdown<T>> {
  late TextEditingController _textController;
  T? selectedItem;

  @override
  void initState() {
    super.initState();
    selectedItem = widget.selectedItem;
    _textController = TextEditingController(text: selectedItem?.name ?? '');
  }

  @override
  void didUpdateWidget(covariant EditableDropdown<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedItem != selectedItem) {
      selectedItem = widget.selectedItem;
      _textController.text = selectedItem?.name ?? '';
    }
  }

  Future<void> _handleAdd(String name) async {
    final newItem = await widget.onAdd(name);
    if (newItem != null) {
      setState(() {
        selectedItem = newItem;
        _textController.text = newItem.name;
      });
      widget.onChanged(newItem);
    }
  }

  @override
  Widget build(BuildContext context) {
    final options = List<T>.from(widget.items);
    final addFakeItem = _FakeProductAttribute(name: widget.addOptionText) as T;
    options.add(addFakeItem);

    return FormField<T>(
      initialValue: selectedItem,
      validator: widget.validator,
      builder: (field) {
        return Autocomplete<T>(
          displayStringForOption: (opt) => opt.name,
          optionsBuilder: (textEditingValue) {
            if (textEditingValue.text == '') return options;
            return options.where((T option) =>
                option.name.toLowerCase().contains(textEditingValue.text.toLowerCase()));
          },
          onSelected: (T selection) async {
            if (selection is _FakeProductAttribute) {
              final result = await showDialog<String>(
                context: context,
                builder: (context) {
                  final newController = TextEditingController();
                  return AlertDialog(
                    title: Text(widget.addOptionText),
                    content: TextField(
                      controller: newController,
                      decoration: const InputDecoration(labelText: 'Nuevo valor'),
                      autofocus: true,
                    ),
                    actions: [
                      TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancelar')),
                      TextButton(
                        onPressed: () {
                          if (newController.text.trim().isNotEmpty) {
                            Navigator.pop(context, newController.text.trim());
                          }
                        },
                        child: const Text('Agregar'),
                      ),
                    ],
                  );
                },
              );

              if (result != null && result.isNotEmpty) {
                await _handleAdd(result);
                field.didChange(selectedItem);
              }
            } else {
              setState(() {
                selectedItem = selection;
                _textController.text = selection.name;
              });
              widget.onChanged(selection);
              field.didChange(selection);
            }
          },
          fieldViewBuilder: (context, controller, focusNode, onEditingComplete) {
            controller.text = _textController.text;
            controller.selection = TextSelection.collapsed(offset: controller.text.length);
            return TextFormField(
              controller: controller,
              focusNode: focusNode,
              decoration: InputDecoration(
                labelText: widget.label,
                prefixIcon: Icon(widget.icon),
                filled: true,
                fillColor: Colors.grey[900],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.deepPurple.shade700),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.deepPurpleAccent, width: 2),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.deepPurple.shade700),
                ),
              ),
              style: const TextStyle(color: Colors.white),
              onEditingComplete: onEditingComplete,
              onChanged: (text) {
                setState(() {
                  selectedItem = null;
                });
                widget.onChanged(null);
                field.didChange(null);
              },
              validator: (_) => field.errorText,
            );
          },
        );
      },
    );
  }
}

/// Clase usada para representar la opción "Agregar nuevo..."
class _FakeProductAttribute extends ProductAttribute {
  _FakeProductAttribute({required String name}) {
    this.name = name;
    value = '';
    type = AttributeType.category;
    createdAt = DateTime.now();
  }
}
