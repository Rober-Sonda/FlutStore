import 'package:flutter/material.dart';

/// Widget optimizado para mostrar listas con mejor rendimiento
class OptimizedListView<T> extends StatefulWidget {
  final List<T> items;
  final Widget Function(BuildContext context, T item, int index) itemBuilder;
  final Widget? Function(BuildContext context, int index)? separatorBuilder;
  final bool shrinkWrap;
  final ScrollPhysics? physics;
  final EdgeInsetsGeometry? padding;

  const OptimizedListView({
    super.key,
    required this.items,
    required this.itemBuilder,
    this.separatorBuilder,
    this.shrinkWrap = false,
    this.physics,
    this.padding,
  });

  @override
  State<OptimizedListView<T>> createState() => _OptimizedListViewState<T>();
}

class _OptimizedListViewState<T> extends State<OptimizedListView<T>> {
  @override
  Widget build(BuildContext context) {
    if (widget.separatorBuilder != null) {
      return ListView.separated(
        itemCount: widget.items.length,
        itemBuilder:
            (context, index) =>
                widget.itemBuilder(context, widget.items[index], index),
        separatorBuilder:
            (context, index) =>
                widget.separatorBuilder!(context, index) ??
                const SizedBox.shrink(),
        shrinkWrap: widget.shrinkWrap,
        physics: widget.physics,
        padding: widget.padding,
      );
    } else {
      return ListView.builder(
        itemCount: widget.items.length,
        itemBuilder:
            (context, index) =>
                widget.itemBuilder(context, widget.items[index], index),
        shrinkWrap: widget.shrinkWrap,
        physics: widget.physics,
        padding: widget.padding,
      );
    }
  }
}

/// Widget optimizado para mostrar grids con mejor rendimiento
class OptimizedGridView<T> extends StatefulWidget {
  final List<T> items;
  final Widget Function(BuildContext context, T item, int index) itemBuilder;
  final int crossAxisCount;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final double childAspectRatio;
  final double mainAxisExtent;
  final bool shrinkWrap;
  final ScrollPhysics? physics;
  final EdgeInsetsGeometry? padding;

  const OptimizedGridView({
    super.key,
    required this.items,
    required this.itemBuilder,
    required this.crossAxisCount,
    this.mainAxisSpacing = 0.0,
    this.crossAxisSpacing = 0.0,
    this.childAspectRatio = 1.0,
    this.mainAxisExtent = 0.0,
    this.shrinkWrap = false,
    this.physics,
    this.padding,
  });

  @override
  State<OptimizedGridView<T>> createState() => _OptimizedGridViewState<T>();
}

class _OptimizedGridViewState<T> extends State<OptimizedGridView<T>> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: widget.items.length,
      itemBuilder:
          (context, index) =>
              widget.itemBuilder(context, widget.items[index], index),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: widget.crossAxisCount,
        mainAxisSpacing: widget.mainAxisSpacing,
        crossAxisSpacing: widget.crossAxisSpacing,
        childAspectRatio: widget.childAspectRatio,
        mainAxisExtent: widget.mainAxisExtent,
      ),
      shrinkWrap: widget.shrinkWrap,
      physics: widget.physics,
      padding: widget.padding,
    );
  }
}

/// Widget optimizado para mostrar listas con búsqueda
class OptimizedSearchableListView<T> extends StatefulWidget {
  final List<T> items;
  final Widget Function(BuildContext context, T item, int index) itemBuilder;
  final Widget? Function(BuildContext context, int index)? separatorBuilder;
  final String Function(T item) searchField;
  final String hintText;
  final bool shrinkWrap;
  final ScrollPhysics? physics;
  final EdgeInsetsGeometry? padding;

  const OptimizedSearchableListView({
    super.key,
    required this.items,
    required this.itemBuilder,
    this.separatorBuilder,
    required this.searchField,
    this.hintText = 'Buscar...',
    this.shrinkWrap = false,
    this.physics,
    this.padding,
  });

  @override
  State<OptimizedSearchableListView<T>> createState() =>
      _OptimizedSearchableListViewState<T>();
}

class _OptimizedSearchableListViewState<T>
    extends State<OptimizedSearchableListView<T>> {
  final TextEditingController _searchController = TextEditingController();
  List<T> _filteredItems = [];

  @override
  void initState() {
    super.initState();
    _filteredItems = widget.items;
    _searchController.addListener(_filterItems);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterItems() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        _filteredItems = widget.items;
      } else {
        _filteredItems =
            widget.items
                .where(
                  (item) =>
                      widget.searchField(item).toLowerCase().contains(query),
                )
                .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: widget.hintText,
              prefixIcon: const Icon(Icons.search),
              border: const OutlineInputBorder(),
            ),
          ),
        ),
        Expanded(
          child: OptimizedListView<T>(
            items: _filteredItems,
            itemBuilder: widget.itemBuilder,
            separatorBuilder: widget.separatorBuilder,
            shrinkWrap: widget.shrinkWrap,
            physics: widget.physics,
            padding: widget.padding,
          ),
        ),
      ],
    );
  }
}
