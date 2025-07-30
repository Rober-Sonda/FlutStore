import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../src/app_routes.dart';
import '../models/oferta.dart';
import '../services/isar_service.dart';

class OffersView extends ConsumerStatefulWidget {
  const OffersView({super.key});

  @override
  ConsumerState<OffersView> createState() => _OffersViewState();
}

class _OffersViewState extends ConsumerState<OffersView> {
  List<Oferta> _ofertas = [];
  bool _isLoading = true;
  String _filtroSeleccionado = 'Todas';

  @override
  void initState() {
    super.initState();
    _loadOfertas();
  }

  Future<void> _loadOfertas() async {
    setState(() => _isLoading = true);
    try {
      // TODO: Implementar carga de ofertas cuando el modelo esté listo
      await Future.delayed(const Duration(seconds: 1)); // Simulación de carga
      setState(() {
        _ofertas = []; // Lista vacía por ahora
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al cargar ofertas: $e')),
        );
      }
    }
  }

  List<Oferta> get _ofertasFiltradas {
    switch (_filtroSeleccionado) {
      case 'Activas':
        return _ofertas.where((o) => o.estaActiva).toList();
      case 'Próximamente':
        return _ofertas.where((o) => o.estaPorComenzar).toList();
      case 'Expiradas':
        return _ofertas.where((o) => o.haExpirado).toList();
      case 'Agotadas':
        return _ofertas.where((o) => !o.hayStockDisponible).toList();
      default:
        return _ofertas;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestión de Ofertas'),
        backgroundColor: Colors.amber[700],
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // TODO: Navegar a crear oferta
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Funcionalidad en desarrollo')),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Header con estadísticas
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.amber[50],
              border: Border(
                bottom: BorderSide(color: Colors.amber[200]!),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ofertas',
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Colors.amber[800],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${_ofertasFiltradas.length} ofertas encontradas',
                        style: TextStyle(
                          color: Colors.amber[700],
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                PopupMenuButton<String>(
                  icon: Icon(Icons.filter_list, color: Colors.amber[700]),
                  onSelected: (value) {
                    setState(() => _filtroSeleccionado = value);
                  },
                  itemBuilder: (context) => [
                    const PopupMenuItem(value: 'Todas', child: Text('Todas')),
                    const PopupMenuItem(value: 'Activas', child: Text('Activas')),
                    const PopupMenuItem(value: 'Próximamente', child: Text('Próximamente')),
                    const PopupMenuItem(value: 'Expiradas', child: Text('Expiradas')),
                    const PopupMenuItem(value: 'Agotadas', child: Text('Agotadas')),
                  ],
                ),
              ],
            ),
          ),
          
          // Estadísticas rápidas
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Row(
              children: [
                Expanded(child: _buildStatCard('Activas', _ofertas.where((o) => o.estaActiva).length, Colors.green)),
                const SizedBox(width: 12),
                Expanded(child: _buildStatCard('Próximas', _ofertas.where((o) => o.estaPorComenzar).length, Colors.blue)),
                const SizedBox(width: 12),
                Expanded(child: _buildStatCard('Expiradas', _ofertas.where((o) => o.haExpirado).length, Colors.red)),
              ],
            ),
          ),

          // Lista de ofertas
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _ofertasFiltradas.isEmpty
                    ? _buildEmptyState()
                    : ListView.builder(
                        padding: const EdgeInsets.all(16),
                        itemCount: _ofertasFiltradas.length,
                        itemBuilder: (context, index) {
                          return _buildOfertaCard(_ofertasFiltradas[index]);
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
            Icon(Icons.local_offer, color: color, size: 32),
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
          Icon(
            Icons.local_offer_outlined,
            size: 64,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 16),
          Text(
            'No hay ofertas disponibles',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Crea tu primera oferta para empezar',
            style: TextStyle(color: Colors.grey[500]),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () {
              // TODO: Navegar a crear oferta
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Funcionalidad en desarrollo')),
              );
            },
            icon: const Icon(Icons.add),
            label: const Text('Crear Oferta'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber[700],
              foregroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOfertaCard(Oferta oferta) {
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
                        oferta.nombre,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (oferta.descripcion != null) ...[
                        const SizedBox(height: 4),
                        Text(
                          oferta.descripcion!,
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: _getColorForEstado(oferta.estadoOferta),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    oferta.estadoOferta,
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
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Precio Original',
                        style: TextStyle(color: Colors.grey[600], fontSize: 12),
                      ),
                      Text(
                        oferta.precioOriginalFormateado,
                        style: const TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.arrow_forward, color: Colors.grey),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Precio Oferta',
                        style: TextStyle(color: Colors.grey[600], fontSize: 12),
                      ),
                      Text(
                        oferta.precioOfertaFormateado,
                        style: TextStyle(
                          color: Colors.amber[700],
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.amber[100],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    oferta.porcentajeDescuentoFormateado,
                    style: TextStyle(
                      color: Colors.amber[800],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Icon(Icons.calendar_today, size: 16, color: Colors.grey[600]),
                const SizedBox(width: 4),
                Text(
                  '${oferta.fechaInicio.day}/${oferta.fechaInicio.month} - ${oferta.fechaFin.day}/${oferta.fechaFin.month}',
                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                ),
                const Spacer(),
                if (oferta.stockDisponible != null) ...[
                  Icon(Icons.inventory, size: 16, color: Colors.grey[600]),
                  const SizedBox(width: 4),
                  Text(
                    'Stock: ${oferta.stockDisponible}',
                    style: TextStyle(color: Colors.grey[600], fontSize: 12),
                  ),
                ],
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      // TODO: Editar oferta
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Funcionalidad en desarrollo')),
                      );
                    },
                    icon: const Icon(Icons.edit, size: 16),
                    label: const Text('Editar'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // TODO: Ver detalles
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Funcionalidad en desarrollo')),
                      );
                    },
                    icon: const Icon(Icons.visibility, size: 16),
                    label: const Text('Ver'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber[700],
                      foregroundColor: Colors.white,
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

  Color _getColorForEstado(String estado) {
    switch (estado) {
      case 'Activa':
        return Colors.green;
      case 'Próximamente':
        return Colors.blue;
      case 'Expirada':
      case 'Inactiva':
        return Colors.red;
      case 'Agotada':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }
} 