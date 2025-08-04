import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:isar/isar.dart';
import '../../../models/sorteo.dart';
import '../../../models/premio_sorteo.dart';
import '../../../models/producto.dart';
import '../../../services/isar_service.dart';
import '../../../widgets/permission_widget.dart';

class SweepstakeAddEditView extends ConsumerStatefulWidget {
  final int? sorteoId;

  const SweepstakeAddEditView({super.key, this.sorteoId});

  @override
  ConsumerState<SweepstakeAddEditView> createState() =>
      _SweepstakeAddEditViewState();
}

class _SweepstakeAddEditViewState extends ConsumerState<SweepstakeAddEditView> {
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _descripcionController = TextEditingController();
  final _numGanadoresController = TextEditingController();
  final _maxParticipantesController = TextEditingController();

  DateTime? _fechaInicio;
  DateTime? _fechaFin;
  String _estado = 'borrador';
  String _tipoSorteo = 'aleatorio';
  List<PremioSorteo> _premios = [];
  List<Producto> _productos = [];

  bool _isLoading = true;
  bool _isSaving = false;
  Sorteo? _sorteo;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  void dispose() {
    _nombreController.dispose();
    _descripcionController.dispose();
    _numGanadoresController.dispose();
    _maxParticipantesController.dispose();
    super.dispose();
  }

  Future<void> _loadData() async {
    try {
      setState(() => _isLoading = true);

      // Cargar productos
      final isar = await ref.read(isarServiceProvider).db;
      _productos = await isar.productos.where().findAll();

      if (widget.sorteoId != null) {
        _sorteo = await isar.sorteos.get(widget.sorteoId!);

        if (_sorteo != null) {
          _loadSorteoData();
        }
      } else {
        // Valores por defecto para nuevo sorteo
        _numGanadoresController.text = '1';
        _maxParticipantesController.text = '0';
        _addPremio(); // Agregar un premio por defecto
      }

      setState(() => _isLoading = false);
    } catch (e) {
      setState(() => _isLoading = false);
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error al cargar datos: $e')));
      }
    }
  }

  void _loadSorteoData() {
    if (_sorteo == null) return;

    _nombreController.text = _sorteo!.nombre;
    _descripcionController.text = _sorteo!.descripcion ?? '';
    _numGanadoresController.text = _sorteo!.numGanadores.toString();
    _maxParticipantesController.text = _sorteo!.maxParticipantes.toString();
    _fechaInicio = _sorteo!.fechaInicio;
    _fechaFin = _sorteo!.fechaFin;
    _estado = _sorteo!.estado;
    _tipoSorteo = _sorteo!.tipoSorteo;
    _premios = List.from(_sorteo!.premios);
  }

  void _addPremio() {
    setState(() {
      _premios.add(PremioSorteo(cantidad: 1, valorManual: 0.0));
    });
  }

  void _removePremio(int index) {
    setState(() {
      _premios.removeAt(index);
    });
  }

  void _updatePremio(int index, PremioSorteo premio) {
    setState(() {
      _premios[index] = premio;
    });
  }

  Future<void> _guardarSorteo() async {
    if (!_formKey.currentState!.validate()) return;

    try {
      setState(() => _isSaving = true);

      final isar = await ref.read(isarServiceProvider).db;

      final sorteo =
          _sorteo ??
          Sorteo(
            nombre: _nombreController.text.trim(),
            descripcion: _descripcionController.text.trim(),
            fechaInicio: _fechaInicio,
            fechaFin: _fechaFin,
            estado: _estado,
            maxParticipantes:
                int.tryParse(_maxParticipantesController.text) ?? 0,
            numGanadores: int.tryParse(_numGanadoresController.text) ?? 1,
            tipoSorteo: _tipoSorteo,
            usuarioId: 1, // TODO: Obtener ID del usuario actual
          );

      // Actualizar datos del sorteo
      sorteo.nombre = _nombreController.text.trim();
      sorteo.descripcion = _descripcionController.text.trim();
      sorteo.fechaInicio = _fechaInicio;
      sorteo.fechaFin = _fechaFin;
      sorteo.estado = _estado;
      sorteo.maxParticipantes =
          int.tryParse(_maxParticipantesController.text) ?? 0;
      sorteo.numGanadores = int.tryParse(_numGanadoresController.text) ?? 1;
      sorteo.tipoSorteo = _tipoSorteo;
      sorteo.premios = _premios;

      await isar.writeTxn(() async {
        await isar.sorteos.put(sorteo);
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Sorteo guardado exitosamente')),
        );
        context.pop();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error al guardar sorteo: $e')));
      }
    } finally {
      setState(() => _isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.sorteoId == null ? 'Nuevo Sorteo' : 'Editar Sorteo'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body:
          _isLoading
              ? const Center(child: CircularProgressIndicator())
              : PermissionWidget(
                resource: 'sorteos',
                action: widget.sorteoId == null ? 'create' : 'update',
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Información básica
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Información del Sorteo',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                TextFormField(
                                  controller: _nombreController,
                                  decoration: const InputDecoration(
                                    labelText: 'Nombre del Sorteo',
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
                                    labelText: 'Descripción',
                                    border: OutlineInputBorder(),
                                  ),
                                  maxLines: 3,
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        controller: _numGanadoresController,
                                        decoration: const InputDecoration(
                                          labelText: 'Número de Ganadores',
                                          border: OutlineInputBorder(),
                                        ),
                                        keyboardType: TextInputType.number,
                                        validator: (value) {
                                          if (value == null ||
                                              value.trim().isEmpty) {
                                            return 'Requerido';
                                          }
                                          final num = int.tryParse(value);
                                          if (num == null || num <= 0) {
                                            return 'Debe ser mayor a 0';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: TextFormField(
                                        controller: _maxParticipantesController,
                                        decoration: const InputDecoration(
                                          labelText:
                                              'Máx. Participantes (0 = sin límite)',
                                          border: OutlineInputBorder(),
                                        ),
                                        keyboardType: TextInputType.number,
                                        validator: (value) {
                                          if (value == null ||
                                              value.trim().isEmpty) {
                                            return 'Requerido';
                                          }
                                          final num = int.tryParse(value);
                                          if (num == null || num < 0) {
                                            return 'Debe ser >= 0';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  children: [
                                    Expanded(
                                      child: ListTile(
                                        title: const Text('Fecha de Inicio'),
                                        subtitle: Text(
                                          _fechaInicio?.toString().split(
                                                ' ',
                                              )[0] ??
                                              'No establecida',
                                        ),
                                        trailing: IconButton(
                                          onPressed: () async {
                                            final fecha = await showDatePicker(
                                              context: context,
                                              initialDate:
                                                  _fechaInicio ??
                                                  DateTime.now(),
                                              firstDate: DateTime.now(),
                                              lastDate: DateTime.now().add(
                                                const Duration(days: 365),
                                              ),
                                            );
                                            if (fecha != null) {
                                              setState(
                                                () => _fechaInicio = fecha,
                                              );
                                            }
                                          },
                                          icon: const Icon(
                                            Icons.calendar_today,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: ListTile(
                                        title: const Text('Fecha de Fin'),
                                        subtitle: Text(
                                          _fechaFin?.toString().split(' ')[0] ??
                                              'No establecida',
                                        ),
                                        trailing: IconButton(
                                          onPressed: () async {
                                            final fecha = await showDatePicker(
                                              context: context,
                                              initialDate:
                                                  _fechaFin ?? DateTime.now(),
                                              firstDate: DateTime.now(),
                                              lastDate: DateTime.now().add(
                                                const Duration(days: 365),
                                              ),
                                            );
                                            if (fecha != null) {
                                              setState(() => _fechaFin = fecha);
                                            }
                                          },
                                          icon: const Icon(
                                            Icons.calendar_today,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                DropdownButtonFormField<String>(
                                  value: _estado,
                                  decoration: const InputDecoration(
                                    labelText: 'Estado',
                                    border: OutlineInputBorder(),
                                  ),
                                  items: const [
                                    DropdownMenuItem(
                                      value: 'borrador',
                                      child: Text('Borrador'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'activo',
                                      child: Text('Activo'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'finalizado',
                                      child: Text('Finalizado'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'cancelado',
                                      child: Text('Cancelado'),
                                    ),
                                  ],
                                  onChanged: (value) {
                                    setState(() => _estado = value!);
                                  },
                                ),
                                const SizedBox(height: 16),
                                DropdownButtonFormField<String>(
                                  value: _tipoSorteo,
                                  decoration: const InputDecoration(
                                    labelText: 'Tipo de Sorteo',
                                    border: OutlineInputBorder(),
                                  ),
                                  items: const [
                                    DropdownMenuItem(
                                      value: 'aleatorio',
                                      child: Text('Aleatorio'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'manual',
                                      child: Text('Manual'),
                                    ),
                                  ],
                                  onChanged: (value) {
                                    setState(() => _tipoSorteo = value!);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Premios
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Premios',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: _addPremio,
                                      icon: const Icon(Icons.add),
                                      tooltip: 'Agregar Premio',
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                if (_premios.isEmpty)
                                  const Text(
                                    'No hay premios configurados',
                                    style: TextStyle(color: Colors.grey),
                                  )
                                else
                                  ...List.generate(_premios.length, (index) {
                                    return _buildPremioCard(index);
                                  }),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: _isSaving ? null : _guardarSorteo,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child:
                    _isSaving
                        ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                        : const Text('Guardar Sorteo'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPremioCard(int index) {
    final premio = _premios[index];

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Premio ${index + 1}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                IconButton(
                  onPressed: () => _removePremio(index),
                  icon: const Icon(Icons.remove_circle, color: Colors.red),
                  tooltip: 'Eliminar Premio',
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Selector de producto
            DropdownButtonFormField<int?>(
              value: premio.productoId,
              decoration: const InputDecoration(
                labelText: 'Producto',
                border: OutlineInputBorder(),
              ),
              items: [
                const DropdownMenuItem<int?>(
                  value: null,
                  child: Text('Seleccionar producto...'),
                ),
                ..._productos.map(
                  (producto) => DropdownMenuItem<int?>(
                    value: producto.id,
                    child: Text(producto.nombre ?? 'Producto sin nombre'),
                  ),
                ),
              ],
              onChanged: (productoId) {
                final producto = _productos.firstWhere(
                  (p) => p.id == productoId,
                  orElse: () => Producto(),
                );
                _updatePremio(
                  index,
                  PremioSorteo(
                    productoId: productoId,
                    nombreProducto:
                        productoId != null
                            ? (producto.nombre ?? 'Producto sin nombre')
                            : null,
                    cantidad: premio.cantidad,
                    valorManual: premio.valorManual,
                    descripcion: premio.descripcion,
                  ),
                );
              },
            ),
            const SizedBox(height: 16),

            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    initialValue: premio.cantidad.toString(),
                    decoration: const InputDecoration(
                      labelText: 'Cantidad',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      final cantidad = int.tryParse(value) ?? 1;
                      _updatePremio(
                        index,
                        PremioSorteo(
                          productoId: premio.productoId,
                          nombreProducto: premio.nombreProducto,
                          cantidad: cantidad,
                          valorManual: premio.valorManual,
                          descripcion: premio.descripcion,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextFormField(
                    initialValue: premio.valorManual.toString(),
                    decoration: const InputDecoration(
                      labelText: 'Valor Manual',
                      border: OutlineInputBorder(),
                      prefixText: '\$',
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      final valor = double.tryParse(value) ?? 0.0;
                      _updatePremio(
                        index,
                        PremioSorteo(
                          productoId: premio.productoId,
                          nombreProducto: premio.nombreProducto,
                          cantidad: premio.cantidad,
                          valorManual: valor,
                          descripcion: premio.descripcion,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            TextFormField(
              initialValue: premio.descripcion,
              decoration: const InputDecoration(
                labelText: 'Descripción adicional (opcional)',
                border: OutlineInputBorder(),
              ),
              maxLines: 2,
              onChanged: (value) {
                _updatePremio(
                  index,
                  PremioSorteo(
                    productoId: premio.productoId,
                    nombreProducto: premio.nombreProducto,
                    cantidad: premio.cantidad,
                    valorManual: premio.valorManual,
                    descripcion: value.isEmpty ? null : value,
                  ),
                );
              },
            ),

            if (premio.productoId != null && premio.nombreProducto != null)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  'Valor total: \$${premio.valorTotal.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
