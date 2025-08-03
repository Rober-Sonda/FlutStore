import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tienda_app/models/proveedor.dart';
import 'package:tienda_app/services/isar_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProviderAddEditView extends ConsumerStatefulWidget {
  final Proveedor? proveedor;

  const ProviderAddEditView({super.key, this.proveedor});

  @override
  ConsumerState<ProviderAddEditView> createState() =>
      _ProviderAddEditViewState();
}

class _ProviderAddEditViewState extends ConsumerState<ProviderAddEditView> {
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _razonSocialController = TextEditingController();
  final _emailController = TextEditingController();
  final _telefonoController = TextEditingController();
  final _whatsappController = TextEditingController(); // Nuevo campo
  final _direccionController = TextEditingController();
  final _cuitController = TextEditingController();
  final _contactoController = TextEditingController();
  final _observacionesController = TextEditingController();

  bool _isLoading = false;
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _isEditing = widget.proveedor != null;
    if (_isEditing) {
      _loadProveedorData();
    }
  }

  void _loadProveedorData() {
    final proveedor = widget.proveedor!;
    _nombreController.text = proveedor.nombre;
    _razonSocialController.text = proveedor.razonSocial ?? '';
    _emailController.text = proveedor.email ?? '';
    _telefonoController.text = proveedor.telefono ?? '';
    _whatsappController.text = proveedor.whatsapp ?? ''; // Nuevo campo
    _direccionController.text = proveedor.direccion ?? '';
    _cuitController.text = proveedor.cuit ?? '';
    _contactoController.text = proveedor.contacto ?? '';
    _observacionesController.text = proveedor.observaciones ?? '';
  }

  @override
  void dispose() {
    _nombreController.dispose();
    _razonSocialController.dispose();
    _emailController.dispose();
    _telefonoController.dispose();
    _whatsappController.dispose(); // Nuevo campo
    _direccionController.dispose();
    _cuitController.dispose();
    _contactoController.dispose();
    _observacionesController.dispose();
    super.dispose();
  }

  Future<void> _saveProveedor() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final isar = await ref.read(isarServiceProvider).db;

      final proveedor = _isEditing 
          ? widget.proveedor! 
          : Proveedor(
              nombre: _nombreController.text.trim(),
              razonSocial: _razonSocialController.text.trim(),
              email: _emailController.text.trim(),
              telefono: _telefonoController.text.trim(),
              whatsapp: _whatsappController.text.trim(),
              direccion: _direccionController.text.trim(),
              cuit: _cuitController.text.trim(),
              contacto: _contactoController.text.trim(),
              observaciones: _observacionesController.text.trim(),
            );

      if (_isEditing) {
        proveedor.nombre = _nombreController.text.trim();
        proveedor.razonSocial = _razonSocialController.text.trim();
        proveedor.email = _emailController.text.trim();
        proveedor.telefono = _telefonoController.text.trim();
        proveedor.whatsapp = _whatsappController.text.trim();
        proveedor.direccion = _direccionController.text.trim();
        proveedor.cuit = _cuitController.text.trim();
        proveedor.contacto = _contactoController.text.trim();
        proveedor.observaciones = _observacionesController.text.trim();
        proveedor.fechaRegistro = DateTime.now();
      }

      await isar.writeTxn(() async {
        await isar.proveedors.put(proveedor);
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              _isEditing ? 'Proveedor actualizado' : 'Proveedor creado',
            ),
            backgroundColor: Colors.green,
          ),
        );
        context.pop();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isEditing ? 'Editar Proveedor' : 'Nuevo Proveedor'),
        actions: [
          if (_isEditing)
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: _deleteProveedor,
              tooltip: 'Eliminar Proveedor',
            ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Información de la Empresa',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _nombreController,
                      decoration: const InputDecoration(
                        labelText: 'Nombre de la Empresa *',
                        prefixIcon: Icon(Icons.business),
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
                      controller: _razonSocialController,
                      decoration: const InputDecoration(
                        labelText: 'Razón Social',
                        prefixIcon: Icon(Icons.business_center),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _cuitController,
                            decoration: const InputDecoration(
                              labelText: 'CUIT',
                              prefixIcon: Icon(Icons.numbers),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: TextFormField(
                            controller: _contactoController,
                            decoration: const InputDecoration(
                              labelText: 'Persona de Contacto',
                              prefixIcon: Icon(Icons.person),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Información de Contacto',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.email),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value != null && value.isNotEmpty) {
                          if (!RegExp(
                            r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                          ).hasMatch(value)) {
                            return 'Email inválido';
                          }
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _telefonoController,
                      decoration: const InputDecoration(
                        labelText: 'Teléfono',
                        prefixIcon: Icon(Icons.phone),
                      ),
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _whatsappController, // Nuevo campo
                      decoration: const InputDecoration(
                        labelText: 'WhatsApp',
                        prefixIcon: Icon(Icons.chat_bubble_outline),
                      ),
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _direccionController,
                      decoration: const InputDecoration(
                        labelText: 'Dirección',
                        prefixIcon: Icon(Icons.location_on),
                      ),
                      maxLines: 3,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Información Adicional',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _observacionesController,
                      decoration: const InputDecoration(
                        labelText: 'Observaciones',
                        prefixIcon: Icon(Icons.note),
                        hintText: 'Notas adicionales sobre el proveedor...',
                      ),
                      maxLines: 4,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _isLoading ? null : _saveProveedor,
                child:
                    _isLoading
                        ? const CircularProgressIndicator()
                        : Text(
                          _isEditing
                              ? 'Actualizar Proveedor'
                              : 'Crear Proveedor',
                        ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _deleteProveedor() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Eliminar Proveedor'),
            content: const Text(
              '¿Estás seguro de que quieres eliminar este proveedor?',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('Cancelar'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                style: TextButton.styleFrom(foregroundColor: Colors.red),
                child: const Text('Eliminar'),
              ),
            ],
          ),
    );

    if (confirmed == true) {
      setState(() => _isLoading = true);
      try {
        final isar = await ref.read(isarServiceProvider).db;
        await isar.writeTxn(() async {
          await isar.proveedors.delete(widget.proveedor!.id);
        });

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Proveedor eliminado'),
              backgroundColor: Colors.green,
            ),
          );
          context.pop();
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: $e'), backgroundColor: Colors.red),
          );
        }
      } finally {
        setState(() => _isLoading = false);
      }
    }
  }
}
