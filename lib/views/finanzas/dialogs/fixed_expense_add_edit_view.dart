import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../models/gasto_fijo.dart';
import '../../../models/app_theme.dart';
import '../../../models/font_config.dart';
import '../../../services/app_config_service.dart';
import '../../../services/isar_service.dart';
import '../../../widgets/permission_widget.dart';

class FixedExpenseAddEditView extends ConsumerStatefulWidget {
  final int? gastoId;

  const FixedExpenseAddEditView({super.key, this.gastoId});

  @override
  ConsumerState<FixedExpenseAddEditView> createState() => _FixedExpenseAddEditViewState();
}

class _FixedExpenseAddEditViewState extends ConsumerState<FixedExpenseAddEditView> {
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _descripcionController = TextEditingController();
  final _montoController = TextEditingController();
  final _fechaVencimientoController = TextEditingController();
  
  String _frecuenciaSeleccionada = 'mensual';
  String _categoriaSeleccionada = 'servicios';
  int _diaVencimiento = 1;
  bool _activo = true;
  bool _isLoading = false;
  AppTheme? _currentTheme;
  FontConfig? _currentFontConfig;

  final List<String> _frecuencias = ['mensual', 'bimestral', 'trimestral', 'semestral', 'anual'];
  final List<String> _categorias = ['servicios', 'alquiler', 'impuestos', 'seguros', 'otros'];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  void dispose() {
    _nombreController.dispose();
    _descripcionController.dispose();
    _montoController.dispose();
    _fechaVencimientoController.dispose();
    super.dispose();
  }

  Future<void> _loadData() async {
    try {
      setState(() => _isLoading = true);

      // Cargar tema
      final configService = ref.read(appConfigServiceProvider);
      final theme = await configService.getSelectedTheme();
      final fontConfig = await configService.getSelectedFontConfig();

      setState(() {
        _currentTheme = theme;
        _currentFontConfig = fontConfig;
        _isLoading = false;
      });

      // Si es edición, cargar datos del gasto
      if (widget.gastoId != null) {
        await _loadGastoData();
      }
    } catch (e) {
      setState(() => _isLoading = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al cargar datos: $e')),
        );
      }
    }
  }

  Future<void> _loadGastoData() async {
    try {
      final isar = await ref.read(isarServiceProvider).db;
      final gasto = await isar.gastoFijos.get(widget.gastoId!);
      
      if (gasto != null) {
        setState(() {
          _nombreController.text = gasto.nombre;
          _descripcionController.text = gasto.descripcion ?? '';
          _montoController.text = gasto.monto.toString();
          _frecuenciaSeleccionada = gasto.frecuencia;
          _categoriaSeleccionada = gasto.categoria;
          _diaVencimiento = gasto.diaVencimiento;
          _activo = gasto.activo;
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al cargar gasto: $e')),
        );
      }
    }
  }

  Future<void> _selectDiaVencimiento() async {
    final int? picked = await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Seleccionar día de vencimiento'),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 31,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('${index + 1}'),
                  onTap: () => Navigator.of(context).pop(index + 1),
                );
              },
            ),
          ),
        );
      },
    );
    
    if (picked != null) {
      setState(() {
        _diaVencimiento = picked;
      });
    }
  }

  Future<void> _saveGasto() async {
    if (!_formKey.currentState!.validate()) return;

    try {
      setState(() => _isLoading = true);

      final isar = await ref.read(isarServiceProvider).db;
      final gasto = widget.gastoId != null 
          ? await isar.gastoFijos.get(widget.gastoId!)
          : GastoFijo(
              nombre: '',
              monto: 0,
              categoria: 'servicios',
              frecuencia: 'mensual',
              diaVencimiento: 1,
              usuarioId: 1, // TODO: Obtener usuario actual
            );

      if (gasto != null) {
        gasto.nombre = _nombreController.text.trim();
        gasto.descripcion = _descripcionController.text.trim();
        gasto.monto = double.parse(_montoController.text);
        gasto.frecuencia = _frecuenciaSeleccionada;
        gasto.categoria = _categoriaSeleccionada;
        gasto.diaVencimiento = _diaVencimiento;
        gasto.activo = _activo;
        gasto.fechaCreacion = DateTime.now();

        await isar.writeTxn(() async {
          await isar.gastoFijos.put(gasto);
        });

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(widget.gastoId != null 
                  ? 'Gasto fijo actualizado exitosamente'
                  : 'Gasto fijo creado exitosamente'),
              backgroundColor: Colors.green,
            ),
          );
          context.pop();
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error al guardar gasto: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      final theme = _currentTheme ?? AppTheme.darkTheme;
      return Scaffold(
        backgroundColor: theme.backgroundColor,
        body: Center(
          child: CircularProgressIndicator(color: theme.primaryColor),
        ),
      );
    }

    final theme = _currentTheme ?? AppTheme.darkTheme;
    final fontConfig = _currentFontConfig ?? FontConfig.defaultConfig;

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: theme.backgroundColor,
        title: Text(
          widget.gastoId != null ? 'Editar Gasto Fijo' : 'Nuevo Gasto Fijo',
          style: TextStyle(color: theme.textColor),
        ),
        actions: [
          PermissionWidget(
            action: widget.gastoId != null ? 'update' : 'create',
            resource: 'gastos_fijos',
            child: IconButton(
              icon: Icon(Icons.save, color: theme.textColor),
              onPressed: _saveGasto,
              tooltip: 'Guardar',
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Nombre
              TextFormField(
                controller: _nombreController,
                decoration: InputDecoration(
                  labelText: 'Nombre del Gasto',
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.receipt),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'El nombre es requerido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Descripción
              TextFormField(
                controller: _descripcionController,
                decoration: const InputDecoration(
                  labelText: 'Descripción',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.description),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 16),

              // Monto
              TextFormField(
                controller: _montoController,
                decoration: const InputDecoration(
                  labelText: 'Monto',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.attach_money),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'El monto es requerido';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Ingrese un monto válido';
                  }
                  if (double.parse(value) <= 0) {
                    return 'El monto debe ser mayor a 0';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Frecuencia
              DropdownButtonFormField<String>(
                value: _frecuenciaSeleccionada,
                decoration: const InputDecoration(
                  labelText: 'Frecuencia',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.repeat),
                ),
                items: _frecuencias.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() => _frecuenciaSeleccionada = newValue!);
                },
              ),
              const SizedBox(height: 16),

              // Categoría
              DropdownButtonFormField<String>(
                value: _categoriaSeleccionada,
                decoration: const InputDecoration(
                  labelText: 'Categoría',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.category),
                ),
                items: _categorias.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() => _categoriaSeleccionada = newValue!);
                },
              ),
              const SizedBox(height: 16),

              // Día de Vencimiento
              TextFormField(
                controller: TextEditingController(text: _diaVencimiento.toString()),
                decoration: InputDecoration(
                  labelText: 'Día de Vencimiento',
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.calendar_today),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.calendar_month),
                    onPressed: _selectDiaVencimiento,
                  ),
                ),
                readOnly: true,
                onTap: _selectDiaVencimiento,
                              ),
                const SizedBox(height: 16),

                // Estado Activo
                SwitchListTile(
                  title: const Text('Activo'),
                  subtitle: const Text('El gasto fijo está activo'),
                  value: _activo,
                  onChanged: (bool value) {
                    setState(() => _activo = value);
                  },
                ),
                const SizedBox(height: 24),

                // Botón Guardar
              SizedBox(
                width: double.infinity,
                child: PermissionWidget(
                  action: widget.gastoId != null ? 'update' : 'create',
                  resource: 'gastos_fijos',
                  child: ElevatedButton(
                    onPressed: _saveGasto,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.primaryColor,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: Text(
                      widget.gastoId != null ? 'Actualizar Gasto' : 'Crear Gasto',
                      style: TextStyle(
                        color: theme.textColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: fontConfig.bodyFont,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
} 