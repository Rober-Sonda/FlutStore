import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tienda_app/src/app_routes.dart';

class OrderAddView extends ConsumerStatefulWidget {
  const OrderAddView({super.key});

  @override
  ConsumerState<OrderAddView> createState() => _OrderAddViewState();
}

class _OrderAddViewState extends ConsumerState<OrderAddView> {
  final _formKey = GlobalKey<FormState>();
  final _numeroPedidoController = TextEditingController();
  final _observacionesController = TextEditingController();
  
  bool _isLoading = false;
  String _estadoSeleccionado = 'pendiente';
  DateTime _fechaPedido = DateTime.now();
  double _total = 0.0;
  double _descuento = 0.0;

  @override
  void initState() {
    super.initState();
    _numeroPedidoController.text = _generarNumeroPedido();
  }

  String _generarNumeroPedido() {
    final fecha = DateTime.now();
    final timestamp = fecha.millisecondsSinceEpoch;
    return 'PED-${timestamp.toString().substring(timestamp.toString().length - 6)}';
  }

  @override
  void dispose() {
    _numeroPedidoController.dispose();
    _observacionesController.dispose();
    super.dispose();
  }

  Future<void> _guardarPedido() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      // Aquí iría la lógica para guardar el pedido en la base de datos
      await Future.delayed(const Duration(seconds: 1)); // Simulación

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Pedido "${_numeroPedidoController.text}" creado exitosamente'),
            backgroundColor: Colors.green,
          ),
        );
        context.pop();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error al crear pedido: $e'),
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
        title: const Text('Nuevo Pedido'),
        backgroundColor: Colors.orange[700],
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              context.push(AppRoutes.carritoCompra);
            },
            icon: const Icon(Icons.shopping_cart),
            tooltip: 'Ver Carrito',
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Información del Pedido
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.receipt_long, color: Colors.orange[700], size: 24),
                          const SizedBox(width: 12),
                          Text(
                            'Información del Pedido',
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.orange[700],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      
                      // Número de Pedido
                      TextFormField(
                        controller: _numeroPedidoController,
                        decoration: InputDecoration(
                          labelText: 'Número de Pedido *',
                          prefixIcon: const Icon(Icons.numbers),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          filled: true,
                          fillColor: Colors.grey[50],
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'El número de pedido es requerido';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      
                      // Fecha del Pedido
                      InkWell(
                        onTap: () async {
                          final fecha = await showDatePicker(
                            context: context,
                            initialDate: _fechaPedido,
                            firstDate: DateTime(2020),
                            lastDate: DateTime(2030),
                          );
                          if (fecha != null) {
                            setState(() {
                              _fechaPedido = fecha;
                            });
                          }
                        },
                        child: InputDecorator(
                          decoration: InputDecoration(
                            labelText: 'Fecha del Pedido *',
                            prefixIcon: const Icon(Icons.calendar_today),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            filled: true,
                            fillColor: Colors.grey[50],
                          ),
                          child: Text(
                            '${_fechaPedido.day}/${_fechaPedido.month}/${_fechaPedido.year}',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      
                      // Estado del Pedido
                      DropdownButtonFormField<String>(
                        value: _estadoSeleccionado,
                        decoration: InputDecoration(
                          labelText: 'Estado del Pedido *',
                          prefixIcon: const Icon(Icons.flag),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          filled: true,
                          fillColor: Colors.grey[50],
                        ),
                        items: [
                          DropdownMenuItem(value: 'pendiente', child: Text('Pendiente')),
                          DropdownMenuItem(value: 'aprobado', child: Text('Aprobado')),
                          DropdownMenuItem(value: 'en_proceso', child: Text('En Proceso')),
                          DropdownMenuItem(value: 'completado', child: Text('Completado')),
                          DropdownMenuItem(value: 'cancelado', child: Text('Cancelado')),
                        ],
                        onChanged: (value) {
                          setState(() {
                            _estadoSeleccionado = value!;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              
              // Información Financiera
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.attach_money, color: Colors.green[700], size: 24),
                          const SizedBox(width: 12),
                          Text(
                            'Información Financiera',
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.green[700],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Total',
                                prefixIcon: const Icon(Icons.attach_money),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                filled: true,
                                fillColor: Colors.grey[50],
                              ),
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                setState(() {
                                  _total = double.tryParse(value) ?? 0.0;
                                });
                              },
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Descuento',
                                prefixIcon: const Icon(Icons.discount),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                filled: true,
                                fillColor: Colors.grey[50],
                              ),
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                setState(() {
                                  _descuento = double.tryParse(value) ?? 0.0;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      
                      // Total Final
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.green[50],
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.green[200]!),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total Final:',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.green[700],
                              ),
                            ),
                            Text(
                              '\$${(_total - _descuento).toStringAsFixed(2)}',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.green[700],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              
              // Observaciones
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.note, color: Colors.blue[700], size: 24),
                          const SizedBox(width: 12),
                          Text(
                            'Observaciones',
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[700],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      
                      TextFormField(
                        controller: _observacionesController,
                        decoration: InputDecoration(
                          labelText: 'Observaciones',
                          prefixIcon: const Icon(Icons.note),
                          hintText: 'Agregar notas o comentarios sobre el pedido...',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          filled: true,
                          fillColor: Colors.grey[50],
                        ),
                        maxLines: 4,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),
              
              // Botones de Acción
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        context.push(AppRoutes.carritoCompra);
                      },
                      icon: const Icon(Icons.shopping_cart),
                      label: const Text('Agregar Productos'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[700],
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: _isLoading ? null : _guardarPedido,
                      icon: _isLoading 
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                              ),
                            )
                          : const Icon(Icons.save),
                      label: Text(_isLoading ? 'Guardando...' : 'Guardar Pedido'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange[700],
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
} 