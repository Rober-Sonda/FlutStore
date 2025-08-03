import 'package:flutter/material.dart';
import '../../../models/categoria.dart';

class FiltersWidget extends StatelessWidget {
  final String searchQuery;
  final int? selectedCategoryId;
  final String sortBy;
  final bool showLowStock;
  final bool showOutOfStock;
  final List<Categoria>? categorias;
  final Function(String) onSearchChanged;
  final Function(int?) onCategoryChanged;
  final Function(String) onSortChanged;
  final Function(bool) onLowStockChanged;
  final Function(bool) onOutOfStockChanged;

  const FiltersWidget({
    super.key,
    required this.searchQuery,
    required this.selectedCategoryId,
    required this.sortBy,
    required this.showLowStock,
    required this.showOutOfStock,
    required this.categorias,
    required this.onSearchChanged,
    required this.onCategoryChanged,
    required this.onSortChanged,
    required this.onLowStockChanged,
    required this.onOutOfStockChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[850],
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Barra de búsqueda
            TextField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Buscar productos...',
                hintStyle: const TextStyle(
                  color: Colors.white54,
                ),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.white54,
                ),
                filled: true,
                fillColor: Colors.grey[800],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: onSearchChanged,
            ),
            const SizedBox(height: 16),

            // Filtros
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<int?>(
                    value: selectedCategoryId,
                    decoration: const InputDecoration(
                      labelText: 'Categoría',
                      labelStyle: TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                    dropdownColor: Colors.grey[850],
                    items: [
                      const DropdownMenuItem(
                        value: null,
                        child: Text('Todas las categorías'),
                      ),
                      ...(categorias ?? []).map(
                        (cat) => DropdownMenuItem(
                          value: cat.id,
                          child: Text(cat.nombre),
                        ),
                      ),
                    ],
                    onChanged: onCategoryChanged,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: sortBy,
                    decoration: const InputDecoration(
                      labelText: 'Ordenar por',
                      labelStyle: TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                    dropdownColor: Colors.grey[850],
                    items: const [
                      DropdownMenuItem(
                        value: 'nombre',
                        child: Text('Nombre'),
                      ),
                      DropdownMenuItem(
                        value: 'precio',
                        child: Text('Precio'),
                      ),
                      DropdownMenuItem(
                        value: 'stock',
                        child: Text('Stock'),
                      ),
                      DropdownMenuItem(
                        value: 'categoria',
                        child: Text('Categoría'),
                      ),
                    ],
                    onChanged: (value) => onSortChanged(value!),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Checkboxes de filtros
            Row(
              children: [
                Checkbox(
                  value: showLowStock,
                  onChanged: (value) => onLowStockChanged(value!),
                ),
                const Text(
                  'Mostrar solo stock bajo',
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(width: 16),
                Checkbox(
                  value: showOutOfStock,
                  onChanged: (value) => onOutOfStockChanged(value!),
                ),
                const Text(
                  'Mostrar solo sin stock',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
} 