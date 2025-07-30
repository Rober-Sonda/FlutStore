import 'package:flutter/material.dart';
import '../models/product_attribute.dart';

class CustomDropdownInput extends StatelessWidget {
  final ProductAttribute? value;
  final String label;
  final IconData icon;
  final List<ProductAttribute> items;
  final Function(ProductAttribute?) onChanged;

  const CustomDropdownInput({
    super.key,
    required this.value,
    required this.label,
    required this.icon,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<ProductAttribute>(
      value: value,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white70),
        prefixIcon: Icon(icon, color: Colors.white70),
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
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.red.shade700),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.deepPurple.shade700),
        ),
      ),
      dropdownColor: Colors.grey[900],
      items: items
          .map((item) => DropdownMenuItem(
                value: item,
                child: Text(item.name, style: const TextStyle(color: Colors.white)),
              ))
          .toList(),
      onChanged: onChanged,
      validator: (val) => val == null ? 'Requerido' : null,
    );
  }
}
