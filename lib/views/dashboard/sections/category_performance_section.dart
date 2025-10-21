import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../../../models/app_theme.dart';
import '../../../models/categoria.dart';
import '../../../models/font_config.dart';
import '../widgets/dashboard_section.dart';

class CategoryPerformanceSection extends StatelessWidget {
  final List<Map<String, dynamic>> categoryPerformance;
  final Map<String, dynamic> stats;
  final AppTheme theme;
  final FontConfig fontConfig;
  final VoidCallback? onTap;
  final bool isDesktop;
  final bool isTablet;

  const CategoryPerformanceSection({
    super.key,
    required this.categoryPerformance,
    required this.stats,
    required this.theme,
    required this.fontConfig,
    this.onTap,
    required this.isDesktop,
    required this.isTablet,
  });

  @override
  Widget build(BuildContext context) {
    if (categoryPerformance.isEmpty) return const SizedBox.shrink();

    // Calcular cuÃ¡ntas categorÃ­as por pÃ¡gina (6 mÃ¡ximo)
    final itemsPerPage = 6;
    final pageCount = (categoryPerformance.length / itemsPerPage).ceil();

    return DashboardSection(
      title: 'ðŸ“ˆ Rendimiento por CategorÃ­as',
      subtitle: 'AnÃ¡lisis de ventas por categorÃ­a de producto',
      theme: theme,
      fontConfig: fontConfig,
      onTap: onTap,
      children: [
        SizedBox(
          height: 200, // Altura fija para las cards
          child: PageView.builder(
            itemCount: pageCount,
            itemBuilder: (context, pageIndex) {
              final startIndex = pageIndex * itemsPerPage;
              final endIndex = (startIndex + itemsPerPage).clamp(
                0,
                categoryPerformance.length,
              );
              final pageItems = categoryPerformance.sublist(
                startIndex,
                endIndex,
              );

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isDesktop ? 3 : (isTablet ? 2 : 1),
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.5,
                ),
                itemCount: pageItems.length,
                itemBuilder: (context, index) {
                  final categoria = pageItems[index];
                  return Card(
                    color: theme.surfaceColor,
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            categoria['nombre'] ?? 'Sin nombre',
                            style: TextStyle(
                              color: theme.textColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${categoria['productos'] ?? 0} productos',
                                      style: TextStyle(
                                        color: theme.textSecondaryColor,
                                        fontSize: 12,
                                      ),
                                    ),
                                    Text(
                                      'Stock: ${categoria['stock'] ?? 0}',
                                      style: TextStyle(
                                        color: theme.textSecondaryColor,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    '\$${(categoria['valor'] as double?)?.toStringAsFixed(2) ?? '0.00'}',
                                    style: TextStyle(
                                      color: theme.accentColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    'Valor total',
                                    style: TextStyle(
                                      color: theme.textSecondaryColor,
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
        // Indicadores de pÃ¡gina si hay mÃ¡s de una pÃ¡gina
        if (pageCount > 1)
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                pageCount,
                (index) => Container(
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        index == 0
                            ? theme.accentColor
                            : theme.textSecondaryColor.withOpacity(0.3),
                  ),
                ),
              ),
            ),
          ),
        // BotÃ³n para agregar nueva categorÃ­a
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              icon: const Icon(Icons.add),
              tooltip: 'Agregar nueva categorÃ­a',
              onPressed: () {
                String nombreCategoria = '';
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
                                    decoration: const InputDecoration(
                                      labelText: 'Nombre de la categorÃ­a',
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        nombreCategoria = value.trim();
                                      });
                                    },
                                  ),
                                  const SizedBox(height: 16),
                                  ElevatedButton(
                                    onPressed: () async {
                                      if (nombreCategoria.isEmpty) return;
                                      final dir =
                                          await getApplicationSupportDirectory();
                                      final isar = await Isar.open([
                                        CategoriaSchema,
                                      ], directory: dir.path);
                                      await isar.writeTxn(() async {
                                        await isar.categorias.put(
                                          Categoria()..nombre = nombreCategoria,
                                        );
                                      });
                                      Navigator.of(context).pop();
                                      if (onTap != null) onTap!();
                                    },
                                    child: const Text('Guardar'),
                                  ),
                                ],
                              ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text('Cerrar'),
                          ),
                        ],
                      ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

