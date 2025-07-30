import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/sorteo.dart';
import '../services/isar_service.dart';

class SweepstakesView extends ConsumerStatefulWidget {
  const SweepstakesView({super.key});

  @override
  ConsumerState<SweepstakesView> createState() => _SweepstakesViewState();
}

class _SweepstakesViewState extends ConsumerState<SweepstakesView> {
  List<Sorteo> _sorteos = [];
  bool _isLoading = true;
  String _filtroSeleccionado = 'Todos';

  @override
  void initState() {
    super.initState();
    _loadSorteos();
  }

  Future<void> _loadSorteos() async {
    setState(() => _isLoading = true);
    try {
      // TODO: Implementar carga de sorteos cuando el modelo esté listo
      await Future.delayed(const Duration(seconds: 1)); // Simulación de carga
      setState(() {
        _sorteos = []; // Lista vacía por ahora
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error al cargar sorteos: $e')));
      }
    }
  }

  List<Sorteo> get _sorteosFiltrados {
    switch (_filtroSeleccionado) {
      case 'Activos':
        return _sorteos.where((s) => s.estaActivo).toList();
      case 'Próximamente':
        return _sorteos.where((s) => s.estaPorComenzar).toList();
      case 'Finalizados':
        return _sorteos.where((s) => s.finalizado).toList();
      case 'Expirados':
        return _sorteos.where((s) => s.haExpirado).toList();
      default:
        return _sorteos;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sorteos'),
        backgroundColor: Colors.purple[700],
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _crearNuevoSorteo(),
          ),
        ],
      ),
      body: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.purple[50],
              border: Border(bottom: BorderSide(color: Colors.purple[200]!)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sorteos de Instagram',
                        style: Theme.of(
                          context,
                        ).textTheme.headlineSmall?.copyWith(
                          color: Colors.purple[800],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Gestiona sorteos y promociones',
                        style: TextStyle(
                          color: Colors.purple[700],
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                PopupMenuButton<String>(
                  icon: Icon(Icons.filter_list, color: Colors.purple[700]),
                  onSelected: (value) {
                    setState(() => _filtroSeleccionado = value);
                  },
                  itemBuilder:
                      (context) => [
                        const PopupMenuItem(
                          value: 'Todos',
                          child: Text('Todos'),
                        ),
                        const PopupMenuItem(
                          value: 'Activos',
                          child: Text('Activos'),
                        ),
                        const PopupMenuItem(
                          value: 'Próximamente',
                          child: Text('Próximamente'),
                        ),
                        const PopupMenuItem(
                          value: 'Finalizados',
                          child: Text('Finalizados'),
                        ),
                        const PopupMenuItem(
                          value: 'Expirados',
                          child: Text('Expirados'),
                        ),
                      ],
                ),
              ],
            ),
          ),

          // Estadísticas
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    'Activos',
                    _sorteos.where((s) => s.estaActivo).length,
                    Colors.green,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildStatCard(
                    'Finalizados',
                    _sorteos.where((s) => s.finalizado).length,
                    Colors.blue,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildStatCard(
                    'Participantes',
                    _sorteos.fold(0, (sum, s) => sum + s.numeroParticipantes),
                    Colors.orange,
                  ),
                ),
              ],
            ),
          ),

          // Lista de sorteos
          Expanded(
            child:
                _isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : _sorteosFiltrados.isEmpty
                    ? _buildEmptyState()
                    : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: _sorteosFiltrados.length,
                      itemBuilder: (context, index) {
                        return _buildSorteoCard(_sorteosFiltrados[index]);
                      },
                    ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String title, int value, Color color) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(Icons.card_giftcard, color: color, size: 32),
            const SizedBox(height: 8),
            Text(
              value.toString(),
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: color,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              title,
              style: TextStyle(color: color.withOpacity(0.7), fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.card_giftcard_outlined, size: 64, color: Colors.grey[400]),
          const SizedBox(height: 16),
          Text(
            'No hay sorteos disponibles',
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(color: Colors.grey[600]),
          ),
          const SizedBox(height: 8),
          Text(
            'Crea tu primer sorteo para empezar',
            style: TextStyle(color: Colors.grey[500]),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: _crearNuevoSorteo,
            icon: const Icon(Icons.add),
            label: const Text('Crear Sorteo'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple[700],
              foregroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSorteoCard(Sorteo sorteo) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        sorteo.titulo,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (sorteo.descripcion != null) ...[
                        const SizedBox(height: 4),
                        Text(
                          sorteo.descripcion!,
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: _getColorForEstado(sorteo.estadoSorteo),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    sorteo.estadoSorteo,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Información del premio
            if (sorteo.premio != null) ...[
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.purple[50],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.card_giftcard,
                      color: Colors.purple[700],
                      size: 24,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Premio',
                            style: TextStyle(
                              color: Colors.purple[700],
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            sorteo.premio!,
                            style: TextStyle(
                              color: Colors.purple[800],
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          if (sorteo.valorPremio != null) ...[
                            const SizedBox(height: 4),
                            Text(
                              'Valor: ${sorteo.valorPremioFormateado}',
                              style: TextStyle(
                                color: Colors.purple[600],
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
            ],

            // Fechas y progreso
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Inicio',
                        style: TextStyle(color: Colors.grey[600], fontSize: 12),
                      ),
                      Text(
                        '${sorteo.fechaInicio.day}/${sorteo.fechaInicio.month}/${sorteo.fechaInicio.year}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Fin',
                        style: TextStyle(color: Colors.grey[600], fontSize: 12),
                      ),
                      Text(
                        '${sorteo.fechaFin.day}/${sorteo.fechaFin.month}/${sorteo.fechaFin.year}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Duración',
                        style: TextStyle(color: Colors.grey[600], fontSize: 12),
                      ),
                      Text(
                        sorteo.duracionFormateada,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Progreso del sorteo
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Progreso',
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    ),
                    Text(
                      '${(sorteo.progresoSorteo * 100).toStringAsFixed(0)}%',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                LinearProgressIndicator(
                  value: sorteo.progresoSorteo,
                  backgroundColor: Colors.grey[300],
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.purple[700]!,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Estadísticas del sorteo
            Row(
              children: [
                Expanded(
                  child: _buildSorteoStat(
                    'Participantes',
                    sorteo.numeroParticipantes,
                    Icons.people,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildSorteoStat(
                    'Ganadores',
                    sorteo.cantidadGanadores,
                    Icons.star,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildSorteoStat(
                    'Días Restantes',
                    sorteo.diasRestantes,
                    Icons.schedule,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Criterios de participación
            if (sorteo.criteriosParticipacion.isNotEmpty) ...[
              Text(
                'Criterios de Participación',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 4,
                children:
                    sorteo.criteriosParticipacion
                        .map(
                          (criterio) => Chip(
                            label: Text(
                              criterio,
                              style: const TextStyle(fontSize: 11),
                            ),
                            backgroundColor: Colors.purple[100],
                            labelStyle: TextStyle(color: Colors.purple[800]),
                          ),
                        )
                        .toList(),
              ),
              const SizedBox(height: 16),
            ],

            // Botones de acción
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => _verDetallesSorteo(sorteo),
                    icon: const Icon(Icons.visibility, size: 16),
                    label: const Text('Ver Detalles'),
                  ),
                ),
                const SizedBox(width: 8),
                if (sorteo.puedeSeleccionarGanadores) ...[
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () => _seleccionarGanadores(sorteo),
                      icon: const Icon(Icons.emoji_events, size: 16),
                      label: const Text('Seleccionar Ganadores'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple[700],
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ),
                ] else if (sorteo.estaActivo) ...[
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () => _finalizarSorteo(sorteo),
                      icon: const Icon(Icons.stop, size: 16),
                      label: const Text('Finalizar'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange[700],
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSorteoStat(String title, int value, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.purple[50],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.purple[700], size: 20),
          const SizedBox(height: 4),
          Text(
            value.toString(),
            style: TextStyle(
              color: Colors.purple[800],
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Text(
            title,
            style: TextStyle(color: Colors.purple[600], fontSize: 10),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Color _getColorForEstado(String estado) {
    switch (estado) {
      case 'Activo':
        return Colors.green;
      case 'Próximamente':
        return Colors.blue;
      case 'Finalizado':
        return Colors.purple;
      case 'Expirado':
      case 'Inactivo':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  void _crearNuevoSorteo() {
    // TODO: Implementar creación de nuevo sorteo
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Funcionalidad en desarrollo')),
    );
  }

  void _verDetallesSorteo(Sorteo sorteo) {
    // TODO: Implementar vista de detalles
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Funcionalidad en desarrollo')),
    );
  }

  void _seleccionarGanadores(Sorteo sorteo) {
    // TODO: Implementar selección de ganadores
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Funcionalidad en desarrollo')),
    );
  }

  void _finalizarSorteo(Sorteo sorteo) {
    // TODO: Implementar finalización de sorteo
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Funcionalidad en desarrollo')),
    );
  }
}
