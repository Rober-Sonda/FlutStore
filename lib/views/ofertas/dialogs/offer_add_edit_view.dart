import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:isar/isar.dart';
import '../../../models/oferta.dart';
import '../../../models/producto.dart';
import '../../../services/isar_service.dart';
import '../../../widgets/permission_widget.dart';

class OfferAddEditView extends ConsumerStatefulWidget {
  final int? ofertaId;

  const OfferAddEditView({super.key, this.ofertaId});

  @override
  ConsumerState<OfferAddEditView> createState() => _OfferAddEditViewState();
}

class _OfferAddEditViewState extends ConsumerState<OfferAddEditView> {
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _descripcionController = TextEditingController();
  final _precioOriginalController = TextEditingController();
  final _precioOfertaController = TextEditingController();
  final _porcentajeDescuentoController = TextEditingController();
  final _stockDisponibleController = TextEditingController();
  final _cantidadMinimaController = TextEditingController();
  final _cantidadMaximaController = TextEditingController();
  final _codigoDescuentoController = TextEditingController();
  final _condicionesController = TextEditingController();

  DateTime? _fechaInicio;
  DateTime? _fechaFin;
  bool _activa = true;
  bool _requiereCodigo = false;
  List<Producto> _productos = [];
  Producto? _productoSeleccionado;

  bool _isLoading = true;
  bool _isSaving = false;
  Oferta? _oferta;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  void dispose() {
    _nombreController.dispose();
    _descripcionController.dispose();
    _precioOriginalController.dispose();
    _precioOfertaController.dispose();
    _porcentajeDescuentoController.dispose();
    _stockDisponibleController.dispose();
    _cantidadMinimaController.dispose();
    _cantidadMaximaController.dispose();
    _codigoDescuentoController.dispose();
    _condicionesController.dispose();
    super.dispose();
  }

  Future<void> _loadData() async {
    try {
      setState(() => _isLoading = true);

      final isar = await ref.read(isarServiceProvider).db;

      // Cargar productos
      final productosRaw = await isar.productos.getAll([0]);
      final productos = productosRaw.whereType<Producto>().toList();

      if (widget.ofertaId != null) {
        _oferta = await isar.ofertas.get(widget.ofertaId!);

        if (_oferta != null) {
          _loadOfertaData();
        }
      } else {
        // Valores por defecto para nueva oferta
        _fechaInicio = DateTime.now();
        _fechaFin = DateTime.now().add(const Duration(days: 30));
        _activa = true;
        _requiereCodigo = false;
      }

      setState(() {
        _productos = productos;
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

  void _loadOfertaData() {
    if (_oferta == null) return;

    _nombreController.text = _oferta!.nombre;
    _descripcionController.text = _oferta!.descripcion ?? '';
    _precioOriginalController.text = _oferta!.precioOriginal.toString();
    _precioOfertaController.text = _oferta!.precioOferta.toString();
    _porcentajeDescuentoController.text =
        _oferta!.porcentajeDescuento.toString();
    _fechaInicio = _oferta!.fechaInicio;
    _fechaFin = _oferta!.fechaFin;
    _activa = _oferta!.activa;
    _requiereCodigo = _oferta!.requiereCodigo;
    _codigoDescuentoController.text = _oferta!.codigoDescuento ?? '';
    _condicionesController.text = _oferta!.condiciones ?? '';

    if (_oferta!.stockDisponible != null) {
      _stockDisponibleController.text = _oferta!.stockDisponible.toString();
    }
    if (_oferta!.cantidadMinima != null) {
      _cantidadMinimaController.text = _oferta!.cantidadMinima.toString();
    }
    if (_oferta!.cantidadMaxima != null) {
      _cantidadMaximaController.text = _oferta!.cantidadMaxima.toString();
    }

    // Buscar el producto asociado
    _productoSeleccionado = _productos.firstWhere(
      (p) => p.id == _oferta!.productoId,
      orElse: () => Producto(),
    );
  }

  void _calcularDescuento() {
    final precioOriginal =
        double.tryParse(_precioOriginalController.text) ?? 0.0;
    final precioOferta = double.tryParse(_precioOfertaController.text) ?? 0.0;

    if (precioOriginal > 0 && precioOferta > 0) {
      final descuento =
          ((precioOriginal - precioOferta) / precioOriginal) * 100;
      _porcentajeDescuentoController.text = descuento.toStringAsFixed(0);
    }
  }

  void _calcularPrecioOferta() {
    final precioOriginal =
        double.tryParse(_precioOriginalController.text) ?? 0.0;
    final descuento =
        double.tryParse(_porcentajeDescuentoController.text) ?? 0.0;

    if (precioOriginal > 0 && descuento > 0) {
      final precioOferta = precioOriginal * (1 - descuento / 100);
      _precioOfertaController.text = precioOferta.toStringAsFixed(2);
    }
  }

  Future<void> _saveOferta() async {
    if (!_formKey.currentState!.validate()) return;
    if (_productoSeleccionado == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Debe seleccionar un producto'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() => _isSaving = true);

    try {
      final isar = await ref.read(isarServiceProvider).db;

      if (_oferta == null) {
        // Crear nueva oferta
        _oferta = Oferta(
          nombre: _nombreController.text.trim(),
          descripcion:
              _descripcionController.text.trim().isEmpty
                  ? null
                  : _descripcionController.text.trim(),
          productoId: _productoSeleccionado!.id,
          precioOriginal: double.parse(_precioOriginalController.text),
          precioOferta: double.parse(_precioOfertaController.text),
          porcentajeDescuento: double.parse(
            _porcentajeDescuentoController.text,
          ),
          fechaInicio: _fechaInicio!,
          fechaFin: _fechaFin!,
          stockDisponible:
              _stockDisponibleController.text.isNotEmpty
                  ? int.parse(_stockDisponibleController.text)
                  : null,
          cantidadMinima:
              _cantidadMinimaController.text.isNotEmpty
                  ? int.parse(_cantidadMinimaController.text)
                  : null,
          cantidadMaxima:
              _cantidadMaximaController.text.isNotEmpty
                  ? int.parse(_cantidadMaximaController.text)
                  : null,
          codigoDescuento:
              _codigoDescuentoController.text.trim().isEmpty
                  ? null
                  : _codigoDescuentoController.text.trim(),
          requiereCodigo: _requiereCodigo,
          condiciones:
              _condicionesController.text.trim().isEmpty
                  ? null
                  : _condicionesController.text.trim(),
        );
      } else {
        // Actualizar oferta existente
        _oferta!.nombre = _nombreController.text.trim();
        _oferta!.descripcion =
            _descripcionController.text.trim().isEmpty
                ? null
                : _descripcionController.text.trim();
        _oferta!.productoId = _productoSeleccionado!.id;
        _oferta!.precioOriginal = double.parse(_precioOriginalController.text);
        _oferta!.precioOferta = double.parse(_precioOfertaController.text);
        _oferta!.porcentajeDescuento = double.parse(
          _porcentajeDescuentoController.text,
        );
        _oferta!.fechaInicio = _fechaInicio!;
        _oferta!.fechaFin = _fechaFin!;
        _oferta!.activa = _activa;
        _oferta!.stockDisponible =
            _stockDisponibleController.text.isNotEmpty
                ? int.parse(_stockDisponibleController.text)
                : null;
        _oferta!.cantidadMinima =
            _cantidadMinimaController.text.isNotEmpty
                ? int.parse(_cantidadMinimaController.text)
                : null;
        _oferta!.cantidadMaxima =
            _cantidadMaximaController.text.isNotEmpty
                ? int.parse(_cantidadMaximaController.text)
                : null;
        _oferta!.codigoDescuento =
            _codigoDescuentoController.text.trim().isEmpty
                ? null
                : _codigoDescuentoController.text.trim();
        _oferta!.requiereCodigo = _requiereCodigo;
        _oferta!.condiciones =
            _condicionesController.text.trim().isEmpty
                ? null
                : _condicionesController.text.trim();
        _oferta!.fechaActualizacion = DateTime.now();
      }

      await isar.writeTxn(() async {
        await isar.ofertas.put(_oferta!);
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Oferta guardada exitosamente'),
            backgroundColor: Colors.green,
          ),
        );
        context.pop(true);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error al guardar oferta: $e'),
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
      initialDate:
          isInicio
              ? (_fechaInicio ?? DateTime.now())
              : (_fechaFin ?? DateTime.now()),
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
          widget.ofertaId == null ? 'Nueva Oferta' : 'Editar Oferta',
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          PermissionWidget(
            action: widget.ofertaId == null ? 'create' : 'update',
            resource: 'ofertas',
            child: IconButton(
              icon: const Icon(Icons.save, color: Colors.white),
              onPressed: _isSaving ? null : _saveOferta,
              tooltip: 'Guardar',
            ),
          ),
        ],
      ),
      body:
          _isLoading
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
                                labelText: 'Nombre de la Oferta *',
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
                            DropdownButtonFormField<Producto>(
                              value: _productoSeleccionado,
                              decoration: const InputDecoration(
                                labelText: 'Producto *',
                                border: OutlineInputBorder(),
                              ),
                              items:
                                  _productos.map((producto) {
                                    return DropdownMenuItem(
                                      value: producto,
                                      child: Text(producto.nombre),
                                    );
                                  }).toList(),
                              onChanged: (Producto? producto) {
                                setState(() {
                                  _productoSeleccionado = producto;
                                  if (producto != null) {
                                    _precioOriginalController.text =
                                        producto.precio.toString();
                                    _calcularPrecioOferta();
                                  }
                                });
                              },
                              validator: (value) {
                                if (value == null) {
                                  return 'Debe seleccionar un producto';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Precios y descuentos
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Precios y Descuentos',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: _precioOriginalController,
                                    decoration: const InputDecoration(
                                      labelText: 'Precio Original *',
                                      border: OutlineInputBorder(),
                                      prefixText: '\$',
                                    ),
                                    keyboardType: TextInputType.number,
                                    onChanged:
                                        (value) => _calcularPrecioOferta(),
                                    validator: (value) {
                                      final precio = double.tryParse(
                                        value ?? '',
                                      );
                                      if (precio == null || precio <= 0) {
                                        return 'Debe ser un precio válido';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: TextFormField(
                                    controller: _porcentajeDescuentoController,
                                    decoration: const InputDecoration(
                                      labelText: 'Descuento (%) *',
                                      border: OutlineInputBorder(),
                                      suffixText: '%',
                                    ),
                                    keyboardType: TextInputType.number,
                                    onChanged:
                                        (value) => _calcularPrecioOferta(),
                                    validator: (value) {
                                      final descuento = double.tryParse(
                                        value ?? '',
                                      );
                                      if (descuento == null ||
                                          descuento < 0 ||
                                          descuento > 100) {
                                        return 'Debe ser entre 0 y 100';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              controller: _precioOfertaController,
                              decoration: const InputDecoration(
                                labelText: 'Precio con Oferta *',
                                border: OutlineInputBorder(),
                                prefixText: '\$',
                              ),
                              keyboardType: TextInputType.number,
                              onChanged: (value) => _calcularDescuento(),
                              validator: (value) {
                                final precio = double.tryParse(value ?? '');
                                if (precio == null || precio <= 0) {
                                  return 'Debe ser un precio válido';
                                }
                                return null;
                              },
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

                    // Configuración adicional
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Configuración Adicional',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 16),
                            SwitchListTile(
                              title: const Text('Oferta Activa'),
                              subtitle: const Text(
                                'La oferta estará disponible',
                              ),
                              value: _activa,
                              onChanged: (value) {
                                setState(() => _activa = value);
                              },
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: _stockDisponibleController,
                                    decoration: const InputDecoration(
                                      labelText: 'Stock Disponible (opcional)',
                                      border: OutlineInputBorder(),
                                    ),
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: TextFormField(
                                    controller: _cantidadMinimaController,
                                    decoration: const InputDecoration(
                                      labelText: 'Cantidad Mínima (opcional)',
                                      border: OutlineInputBorder(),
                                    ),
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              controller: _cantidadMaximaController,
                              decoration: const InputDecoration(
                                labelText:
                                    'Cantidad Máxima por Cliente (opcional)',
                                border: OutlineInputBorder(),
                              ),
                              keyboardType: TextInputType.number,
                            ),
                            const SizedBox(height: 16),
                            SwitchListTile(
                              title: const Text('Requiere Código de Descuento'),
                              subtitle: const Text(
                                'Los clientes necesitarán un código',
                              ),
                              value: _requiereCodigo,
                              onChanged: (value) {
                                setState(() => _requiereCodigo = value);
                              },
                            ),
                            if (_requiereCodigo) ...[
                              const SizedBox(height: 16),
                              TextFormField(
                                controller: _codigoDescuentoController,
                                decoration: const InputDecoration(
                                  labelText: 'Código de Descuento',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ],
                            const SizedBox(height: 16),
                            TextFormField(
                              controller: _condicionesController,
                              decoration: const InputDecoration(
                                labelText: 'Condiciones (opcional)',
                                border: OutlineInputBorder(),
                              ),
                              maxLines: 3,
                            ),
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
