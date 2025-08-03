import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:isar/isar.dart';
import '../../../models/sorteo.dart';
import '../../../services/isar_service.dart';
import '../../../widgets/permission_widget.dart';

class SweepstakeAddEditView extends ConsumerStatefulWidget {
  final int? sorteoId;

  const SweepstakeAddEditView({super.key, this.sorteoId});

  @override
  ConsumerState<SweepstakeAddEditView> createState() => _SweepstakeAddEditViewState();
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
  List<String> _premios = [];
  List<double> _valoresPremios = [];
  List<TextEditingController> _premioControllers = [];
  List<TextEditingController> _valorControllers = [];

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
    for (final controller in _premioControllers) {
      controller.dispose();
    }
    for (final controller in _valorControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  Future<void> _loadData() async {
    try {
      setState(() => _isLoading = true);

      if (widget.sorteoId != null) {
        final isar = await ref.read(isarServiceProvider).db;
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
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al cargar datos: $e')),
        );
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
    _valoresPremios = List.from(_sorteo!.valoresPremios);

    // Crear controllers para premios existentes
    _premioControllers.clear();
    _valorControllers.clear();
    for (int i = 0; i < _premios.length; i++) {
      _premioControllers.add(TextEditingController(text: _premios[i]));
      _valorControllers.add(TextEditingController(text: _valoresPremios[i].toString()));
    }
  }

  void _addPremio() {
    setState(() {
      _premioControllers.add(TextEditingController());
      _valorControllers.add(TextEditingController());
    });
  }

  void _removePremio(int index) {
    setState(() {
      _premioControllers[index].dispose();
      _valorControllers[index].dispose();
      _premioControllers.removeAt(index);
      _valorControllers.removeAt(index);
    });
  }

  Future<void> _saveSorteo() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSaving = true);

    try {
      final isar = await ref.read(isarServiceProvider).db;

      // Recopilar premios
      _premios.clear();
      _valoresPremios.clear();
      for (int i = 0; i < _premioControllers.length; i++) {
        final premio = _premioControllers[i].text.trim();
        final valor = double.tryParse(_valorControllers[i].text.trim()) ?? 0.0;
        
        if (premio.isNotEmpty) {
          _premios.add(premio);
          _valoresPremios.add(valor);
        }
      }

      if (_sorteo == null) {
        // Crear nuevo sorteo
        _sorteo = Sorteo(
          nombre: _nombreController.text.trim(),
          descripcion: _descripcionController.text.trim().isEmpty 
              ? null 
              : _descripcionController.text.trim(),
          fechaInicio: _fechaInicio,
          fechaFin: _fechaFin,
          estado: _estado,
          maxParticipantes: int.tryParse(_maxParticipantesController.text) ?? 0,
          numGanadores: int.tryParse(_numGanadoresController.text) ?? 1,
          tipoSorteo: _tipoSorteo,
          usuarioId: 1, // TODO: Obtener ID del usuario actual
        );
      } else {
        // Actualizar sorteo existente
        _sorteo!.nombre = _nombreController.text.trim();
        _sorteo!.descripcion = _descripcionController.text.trim().isEmpty 
            ? null 
            : _descripcionController.text.trim();
        _sorteo!.fechaInicio = _fechaInicio;
        _sorteo!.fechaFin = _fechaFin;
        _sorteo!.estado = _estado;
        _sorteo!.maxParticipantes = int.tryParse(_maxParticipantesController.text) ?? 0;
        _sorteo!.numGanadores = int.tryParse(_numGanadoresController.text) ?? 1;
        _sorteo!.tipoSorteo = _tipoSorteo;
      }

      // Asignar premios
      _sorteo!.premios = _premios;
      _sorteo!.valoresPremios = _valoresPremios;

      await isar.writeTxn(() async {
        await isar.sorteos.put(_sorteo!);
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Sorteo guardado exitosamente'),
            backgroundColor: Colors.green,
          ),
        );
        context.pop(true);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error al guardar sorteo: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isSaving = false);
      }
    }
  }

  Future<void> _selectDate(bool isInicio) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isInicio ? (_fechaInicio ?? DateTime.now()) : (_fechaFin ?? DateTime.now()),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (picked != null) {
      setState(() {
        if (isInicio) {
          _fechaInicio = picked;
        } else {
          _fechaFin = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          widget.sorteoId == null ? 'Nuevo Sorteo' : 'Editar Sorteo',
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          PermissionWidget(
            action: widget.sorteoId == null ? 'create' : 'update',
            resource: 'sorteos',
            child: IconButton(
              icon: const Icon(Icons.save, color: Colors.white),
              onPressed: _isSaving ? null : _saveSorteo,
              tooltip: 'Guardar',
            ),
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Form(
              key: _formKey,
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  // Información básica
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Información Básica',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            controller: _nombreController,
                            decoration: const InputDecoration(
                              labelText: 'Nombre del Sorteo *',
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
                                    labelText: 'Número de Ganadores *',
                                    border: OutlineInputBorder(),
                                  ),
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    final num = int.tryParse(value ?? '');
                                    if (num == null || num <= 0) {
                                      return 'Debe ser un número mayor a 0';
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
                                    labelText: 'Máximo Participantes (0 = sin límite)',
                                    border: OutlineInputBorder(),
                                  ),
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    final num = int.tryParse(value ?? '');
                                    if (num == null || num < 0) {
                                      return 'Debe ser un número mayor o igual a 0';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Fechas
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Fechas',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: ListTile(
                                  title: const Text('Fecha de Inicio'),
                                  subtitle: Text(
                                    _fechaInicio != null
                                        ? '${_fechaInicio!.day}/${_fechaInicio!.month}/${_fechaInicio!.year}'
                                        : 'No seleccionada',
                                  ),
                                  trailing: const Icon(Icons.calendar_today),
                                  onTap: () => _selectDate(true),
                                ),
                              ),
                              Expanded(
                                child: ListTile(
                                  title: const Text('Fecha de Fin'),
                                  subtitle: Text(
                                    _fechaFin != null
                                        ? '${_fechaFin!.day}/${_fechaFin!.month}/${_fechaFin!.year}'
                                        : 'No seleccionada',
                                  ),
                                  trailing: const Icon(Icons.calendar_today),
                                  onTap: () => _selectDate(false),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Configuración
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Configuración',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          DropdownButtonFormField<String>(
                            value: _estado,
                            decoration: const InputDecoration(
                              labelText: 'Estado',
                              border: OutlineInputBorder(),
                            ),
                            items: const [
                              DropdownMenuItem(value: 'borrador', child: Text('Borrador')),
                              DropdownMenuItem(value: 'activo', child: Text('Activo')),
                              DropdownMenuItem(value: 'finalizado', child: Text('Finalizado')),
                              DropdownMenuItem(value: 'cancelado', child: Text('Cancelado')),
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
                              DropdownMenuItem(value: 'aleatorio', child: Text('Aleatorio')),
                              DropdownMenuItem(value: 'manual', child: Text('Manual')),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          if (_premioControllers.isEmpty)
                            const Text(
                              'No hay premios configurados',
                              style: TextStyle(color: Colors.grey),
                            )
                          else
                            ...List.generate(_premioControllers.length, (index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: TextFormField(
                                        controller: _premioControllers[index],
                                        decoration: InputDecoration(
                                          labelText: 'Premio ${index + 1}',
                                          border: const OutlineInputBorder(),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: TextFormField(
                                        controller: _valorControllers[index],
                                        decoration: const InputDecoration(
                                          labelText: 'Valor',
                                          border: OutlineInputBorder(),
                                          prefixText: '\$',
                                        ),
                                        keyboardType: TextInputType.number,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    IconButton(
                                      onPressed: () => _removePremio(index),
                                      icon: const Icon(Icons.remove_circle, color: Colors.red),
                                      tooltip: 'Eliminar Premio',
                                    ),
                                  ],
                                ),
                              );
                            }),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
} 