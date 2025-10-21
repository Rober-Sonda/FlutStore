import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../models/sorteo.dart';
import '../../models/registrofinanciero.dart';
import '../../services/isar_service.dart';
import '../../widgets/permission_widget.dart';

class SweepstakesView extends ConsumerStatefulWidget {
  const SweepstakesView({super.key});

  @override
  ConsumerState<SweepstakesView> createState() => _SweepstakesViewState();
}

class _SweepstakesViewState extends ConsumerState<SweepstakesView> {
  List<Sorteo> _sorteos = [];
  bool _isLoading = true;
  String _filtroSeleccionado = 'Todos';

  // NUEVO: Método para importar participantes desde Instagram
  Future<void> _importarParticipantesInstagram(Sorteo sorteo) async {
    // Aquí deberías integrar la API de Instagram (requiere backend y permisos)
    // Este ejemplo solo muestra el flujo de UI
    final confirm = await showDialog<bool>(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Importar participantes de Instagram'),
            content: const Text(
              'Esta opción permite agregar como participantes a todos los usuarios que dieron like, comentaron o compartieron una publicación específica de tu cuenta de Instagram.\n\nDebes conectar tu cuenta y seleccionar la publicación.',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('Cancelar'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pop(context, true),
                child: const Text('Importar'),
              ),
            ],
          ),
    );
    if (confirm == true) {
      // Simulación de importación
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Participantes importados desde Instagram'),
            backgroundColor: Colors.purple,
          ),
        );
      }
      // TODO: Implementa la integración real con Instagram y agrega los usuarios al sorteo
    }
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      setState(() => _isLoading = true);

      final isar = await ref.read(isarServiceProvider).db;
      final sorteosRaw = await isar.sorteos.getAll([0]);
      final sorteos = sorteosRaw.whereType<Sorteo>().toList();

      setState(() {
        _sorteos = sorteos;
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error al cargar datos: $e')));
      }
    }
  }

  List<Sorteo> get _sorteosFiltrados {
    switch (_filtroSeleccionado) {
      case 'Activos':
        return _sorteos.where((s) => s.estaActivo).toList();
      case 'Borradores':
        return _sorteos.where((s) => s.esBorrador).toList();
      case 'Finalizados':
        return _sorteos.where((s) => s.estaFinalizado).toList();
      case 'Cancelados':
        return _sorteos.where((s) => s.estaCancelado).toList();
      default:
        return _sorteos;
    }
  }

  int get _totalSorteos => _sorteos.length;
  int get _sorteosActivos => _sorteos.where((s) => s.estaActivo).length;
  int get _sorteosFinalizados => _sorteos.where((s) => s.estaFinalizado).length;

  Color _getEstadoColor(Sorteo sorteo) {
    switch (sorteo.estado) {
      case 'borrador':
        return Colors.grey;
      case 'activo':
        return Colors.green;
      case 'finalizado':
        return Colors.blue;
      case 'cancelado':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  Future<void> _iniciarSorteo(Sorteo sorteo) async {
    try {
      final isar = await ref.read(isarServiceProvider).db;

      sorteo.iniciarSorteo();

      await isar.writeTxn(() async {
        await isar.sorteos.put(sorteo);
      });

      setState(() {});

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Sorteo iniciado exitosamente'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error al iniciar sorteo: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _finalizarSorteo(Sorteo sorteo) async {
    try {
      final isar = await ref.read(isarServiceProvider).db;

      sorteo.finalizarSorteo();

      await isar.writeTxn(() async {
        await isar.sorteos.put(sorteo);
      });

      setState(() {});

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Sorteo finalizado exitosamente'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error al finalizar sorteo: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _cancelarSorteo(Sorteo sorteo) async {
    final confirmacion = await showDialog<bool>(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Confirmar cancelación'),
            content: Text(
              '¿Estás seguro de que quieres cancelar el sorteo "${sorteo.nombre}"?',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('Cancelar'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pop(context, true),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text('Confirmar'),
              ),
            ],
          ),
    );

    if (confirmacion == true) {
      try {
        final isar = await ref.read(isarServiceProvider).db;

        sorteo.cancelarSorteo();

        await isar.writeTxn(() async {
          await isar.sorteos.put(sorteo);
        });

        setState(() {});

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Sorteo cancelado exitosamente'),
              backgroundColor: Colors.orange,
            ),
          );
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error al cancelar sorteo: $e'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    }
  }

  Future<void> _registrarPerdidaSorteo(Sorteo sorteo) async {
    try {
      final isar = await ref.read(isarServiceProvider).db;

      // Calcular pérdida total de premios
      double perdidaTotal = 0.0;
      for (final premio in sorteo.premios) {
        perdidaTotal += premio.valorTotal;
      }

      // Crear registro de pérdida por sorteo
      final perdidaSorteo = RegistroFinanciero(
        concepto: 'Pérdida por sorteo: ${sorteo.nombre}',
        descripcion: 'Pérdida generada por premios de sorteo',
        monto: perdidaTotal,
        tipo: 'egreso',
        categoria: 'sorteos',
        fecha: DateTime.now(),
        usuarioId: 1, // TODO: Obtener ID del usuario actual
      );

      await isar.writeTxn(() async {
        await isar.registroFinancieros.put(perdidaSorteo);
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Pérdida registrada: \$${perdidaSorteo.monto.toStringAsFixed(2)}',
            ),
            backgroundColor: Colors.orange,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error al registrar pérdida: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Widget _buildSorteoCard(Sorteo sorteo) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        sorteo.nombre,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (sorteo.descripcion != null) ...[
                        const SizedBox(height: 4),
                        Text(
                          sorteo.descripcion!,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: _getEstadoColor(sorteo).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: _getEstadoColor(sorteo),
                      width: 1,
                    ),
                  ),
                  child: Text(
                    sorteo.estadoFormateado,
                    style: const TextStyle(
                      // Usa 'const' solo si no hay variables, y FontWeight.bold sin paréntesis
                      color:
                          Colors
                              .grey, // Si necesitas color dinámico, quita 'const'
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildStatItem(
                    'Participantes',
                    sorteo.totalParticipantes.toString(),
                    Icons.people,
                  ),
                ),
                Expanded(
                  child: _buildStatItem(
                    'Ganadores',
                    sorteo.totalGanadores.toString(),
                    Icons.emoji_events,
                  ),
                ),
                Expanded(
                  child: _buildStatItem(
                    'Premios',
                    sorteo.premios.length.toString(),
                    Icons.card_giftcard,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Detalles de premios
            if (sorteo.premios.isNotEmpty) ...[
              const Divider(),
              const SizedBox(height: 8),
              const Text(
                'Premios:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              const SizedBox(height: 8),
              ...sorteo.premios.map(
                (premio) => Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.card_giftcard,
                        size: 16,
                        color: Colors.orange,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          premio.descripcionPremio,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),
            ],

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Botón Ver Detalles
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      context.push('/sweepstakes/edit/${sorteo.id}');
                    },
                    icon: const Icon(Icons.visibility, size: 16),
                    label: const Text('Ver'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.blue,
                      side: const BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
                const SizedBox(width: 8),

                // Botón Iniciar (solo si es borrador)
                if (sorteo.esBorrador && sorteo.puedeIniciar)
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () => _iniciarSorteo(sorteo),
                      icon: const Icon(Icons.play_arrow, size: 16),
                      label: const Text('Iniciar'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ),

                // Botón Finalizar (solo si está activo)
                if (sorteo.estaActivo && sorteo.puedeFinalizar)
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () => _finalizarSorteo(sorteo),
                      icon: const Icon(Icons.stop, size: 16),
                      label: const Text('Finalizar'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ),

                const SizedBox(width: 8),

                // Botón Cancelar (solo si no está finalizado)
                if (!sorteo.estaFinalizado)
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () => _cancelarSorteo(sorteo),
                      icon: const Icon(Icons.cancel, size: 16),
                      label: const Text('Cancelar'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.red,
                        side: const BorderSide(color: Colors.red),
                      ),
                    ),
                  ),

                const SizedBox(width: 8),

                // Botón Registrar Pérdida (solo si tiene premios)
                if (sorteo.premios.isNotEmpty)
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () => _registrarPerdidaSorteo(sorteo),
                      icon: const Icon(Icons.account_balance_wallet, size: 16),
                      label: const Text('Registrar Pérdida'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.orange,
                        side: const BorderSide(color: Colors.orange),
                      ),
                    ),
                  ),

                // Botón para importar participantes desde Instagram
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => _importarParticipantesInstagram(sorteo),
                    icon: const Icon(Icons.import_contacts, size: 16),
                    label: const Text('Importar IG'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.purple,
                      side: const BorderSide(color: Colors.purple),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String title, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, size: 20, color: Colors.grey),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(title, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Sorteos', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.filter_list, color: Colors.white),
            onSelected: (value) {
              setState(() => _filtroSeleccionado = value);
            },
            itemBuilder:
                (context) => [
                  const PopupMenuItem(value: 'Todos', child: Text('Todos')),
                  const PopupMenuItem(value: 'Activos', child: Text('Activos')),
                  const PopupMenuItem(
                    value: 'Borradores',
                    child: Text('Borradores'),
                  ),
                  const PopupMenuItem(
                    value: 'Finalizados',
                    child: Text('Finalizados'),
                  ),
                  const PopupMenuItem(
                    value: 'Cancelados',
                    child: Text('Cancelados'),
                  ),
                ],
          ),
        ],
      ),
      body:
          _isLoading
              ? const Center(child: CircularProgressIndicator())
              : _sorteosFiltrados.isEmpty
              ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.celebration,
                      size: 80,
                      color: Colors.purple[200],
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'No hay sorteos registrados',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Crea tu primer sorteo para premiar a tus clientes y seguidores.',
                      style: TextStyle(color: Colors.white54, fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton.icon(
                      onPressed: () {
                        context.push('/sweepstakes/add');
                      },
                      icon: const Icon(Icons.add),
                      label: const Text('Crear Sorteo'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              )
              : Column(
                children: [
                  // Resumen de sorteos
                  Card(
                    margin: const EdgeInsets.all(16),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          const Text(
                            'Resumen de Sorteos',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: _buildStatCard(
                                  'Total',
                                  _totalSorteos.toDouble(),
                                  Colors.blue,
                                  Icons.list,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: _buildStatCard(
                                  'Activos',
                                  _sorteosActivos.toDouble(),
                                  Colors.green,
                                  Icons.play_circle,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: _buildStatCard(
                                  'Finalizados',
                                  _sorteosFinalizados.toDouble(),
                                  Colors.orange,
                                  Icons.check_circle,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Lista de sorteos
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      itemCount: _sorteosFiltrados.length,
                      itemBuilder: (context, index) {
                        return _buildSorteoCard(_sorteosFiltrados[index]);
                      },
                    ),
                  ),
                ],
              ),
      floatingActionButton:
          _sorteosFiltrados.isNotEmpty
              ? PermissionFAB(
                onPressed: () {
                  context.push('/sweepstakes/add');
                },
                action: 'create',
                resource: 'sorteos',
                icon: Icons.add,
                tooltip: 'Nuevo Sorteo',
                backgroundColor: Colors.purple,
                foregroundColor: Colors.white,
              )
              : null,
    );
  }

  Widget _buildStatCard(
    String title,
    double amount,
    Color color,
    IconData icon,
  ) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              color: color,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            amount.toInt().toString(),
            style: TextStyle(
              color: color,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
