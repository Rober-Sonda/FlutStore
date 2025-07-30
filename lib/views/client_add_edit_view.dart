import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tienda_app/src/app_routes.dart';
import 'package:tienda_app/models/cliente.dart';
import 'package:tienda_app/services/isar_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ClientAddEditView extends ConsumerStatefulWidget {
  final Cliente? cliente;

  const ClientAddEditView({super.key, this.cliente});

  @override
  ConsumerState<ClientAddEditView> createState() => _ClientAddEditViewState();
}

class _ClientAddEditViewState extends ConsumerState<ClientAddEditView> {
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _apellidoController = TextEditingController();
  final _emailController = TextEditingController();
  final _telefonoController = TextEditingController();
  final _direccionController = TextEditingController();
  final _dniController = TextEditingController();
  final _cuilController = TextEditingController();
  
  bool _isLoading = false;
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _isEditing = widget.cliente != null;
    if (_isEditing) {
      _loadClienteData();
    }
  }

  void _loadClienteData() {
    final cliente = widget.cliente!;
    _nombreController.text = cliente.nombre;
    _apellidoController.text = cliente.apellido ?? '';
    _emailController.text = cliente.email ?? '';
    _telefonoController.text = cliente.telefono ?? '';
    _direccionController.text = cliente.direccion ?? '';
    _dniController.text = cliente.dni ?? '';
    _cuilController.text = cliente.cuil ?? '';
  }

  @override
  void dispose() {
    _nombreController.dispose();
    _apellidoController.dispose();
    _emailController.dispose();
    _telefonoController.dispose();
    _direccionController.dispose();
    _dniController.dispose();
    _cuilController.dispose();
    super.dispose();
  }

  Future<void> _saveCliente() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final isar = await ref.read(isarServiceProvider).db;
      
      final cliente = _isEditing ? widget.cliente! : Cliente();
      cliente.nombre = _nombreController.text.trim();
      cliente.apellido = _apellidoController.text.trim();
      cliente.email = _emailController.text.trim();
      cliente.telefono = _telefonoController.text.trim();
      cliente.direccion = _direccionController.text.trim();
      cliente.dni = _dniController.text.trim();
      cliente.cuil = _cuilController.text.trim();
      cliente.fechaRegistro = DateTime.now();

      await isar.writeTxn(() async {
        await isar.clientes.put(cliente);
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(_isEditing ? 'Cliente actualizado' : 'Cliente creado'),
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
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isEditing ? 'Editar Cliente' : 'Nuevo Cliente'),
        actions: [
          if (_isEditing)
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: _deleteCliente,
              tooltip: 'Eliminar Cliente',
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
                      'Información Personal',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _nombreController,
                            decoration: const InputDecoration(
                              labelText: 'Nombre *',
                              prefixIcon: Icon(Icons.person),
                            ),
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'El nombre es requerido';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: TextFormField(
                            controller: _apellidoController,
                            decoration: const InputDecoration(
                              labelText: 'Apellido',
                              prefixIcon: Icon(Icons.person_outline),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _dniController,
                            decoration: const InputDecoration(
                              labelText: 'DNI',
                              prefixIcon: Icon(Icons.badge),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: TextFormField(
                            controller: _cuilController,
                            decoration: const InputDecoration(
                              labelText: 'CUIL/CUIT',
                              prefixIcon: Icon(Icons.business),
                            ),
                            keyboardType: TextInputType.number,
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
                          if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
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
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _isLoading ? null : _saveCliente,
                child: _isLoading
                    ? const CircularProgressIndicator()
                    : Text(_isEditing ? 'Actualizar Cliente' : 'Crear Cliente'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _deleteCliente() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Eliminar Cliente'),
        content: const Text('¿Estás seguro de que quieres eliminar este cliente?'),
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
          await isar.clientes.delete(widget.cliente!.id);
        });
        
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Cliente eliminado'),
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
        setState(() => _isLoading = false);
      }
    }
  }
} 