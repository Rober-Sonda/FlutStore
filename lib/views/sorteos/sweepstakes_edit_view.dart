import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../models/sorteo.dart';
import '../../models/premio_sorteo.dart';
import '../../services/isar_service.dart';

class SweepstakesEditView extends ConsumerStatefulWidget {
  final Sorteo? sorteo; // null para nuevo, no null para editar
  const SweepstakesEditView({super.key, this.sorteo});

  @override
  ConsumerState<SweepstakesEditView> createState() =>
      _SweepstakesEditViewState();
}

class _SweepstakesEditViewState extends ConsumerState<SweepstakesEditView> {
  // Campos del formulario
  final _formKey = GlobalKey<FormState>();
  String nombre = '';
  String descripcion = '';
  DateTime? fechaInicio;
  DateTime? fechaFin;
  String estado = 'borrador';
  int maxParticipantes = 0;
  int numGanadores = 1;
  int usuarioId = 1; // TODO: obtener el usuario real

  List<PremioSorteo> premios = [];
  List<String> participantes = [];

  // Variables para criterios y filtros de participantes
  String criterioParticipante = 'compras_monto';
  double montoMinimo = 0;
  String instagramPostUrl = '';
  bool incluirLikes = true;
  bool incluirComentarios = true;
  bool incluirCompartidos = false;

  // NUEVO: Método para importar participantes desde Instagram
  Future<void> _importarParticipantesInstagram() async {
    final confirm = await showDialog<bool>(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Importar participantes de Instagram'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'URL de la publicación de Instagram',
                  ),
                  onChanged: (v) => instagramPostUrl = v,
                ),
                CheckboxListTile(
                  value: incluirLikes,
                  onChanged: (v) => setState(() => incluirLikes = v ?? true),
                  title: const Text('Incluir usuarios que dieron Like'),
                ),
                CheckboxListTile(
                  value: incluirComentarios,
                  onChanged:
                      (v) => setState(() => incluirComentarios = v ?? true),
                  title: const Text('Incluir usuarios que comentaron'),
                ),
                CheckboxListTile(
                  value: incluirCompartidos,
                  onChanged:
                      (v) => setState(() => incluirCompartidos = v ?? false),
                  title: const Text('Incluir usuarios que compartieron'),
                ),
              ],
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
      // Simulación de importación de participantes de Instagram
      setState(() {
        if (incluirLikes) participantes.add('usuario_like');
        if (incluirComentarios) participantes.add('usuario_comentario');
        if (incluirCompartidos) participantes.add('usuario_compartido');
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Participantes importados desde Instagram'),
            backgroundColor: Colors.purple,
          ),
        );
      }
      // TODO: Implementa la integración real con Instagram y agrega los usuarios a la lista de participantes
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.sorteo != null) {
      nombre = widget.sorteo!.nombre;
      descripcion = widget.sorteo!.descripcion ?? '';
      fechaInicio = widget.sorteo!.fechaInicio;
      fechaFin = widget.sorteo!.fechaFin;
      estado = widget.sorteo!.estado;
      maxParticipantes = widget.sorteo!.maxParticipantes;
      numGanadores = widget.sorteo!.numGanadores;
      usuarioId = widget.sorteo!.usuarioId;
      // Si tienes premios y participantes en el modelo, inicialízalos aquí
      // premios = List<PremioSorteo>.from(widget.sorteo!.premios);
      // participantes = List<String>.from(widget.sorteo!.participantes);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(widget.sorteo == null ? 'Nuevo Sorteo' : 'Editar Sorteo'),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 520),
          child: Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              children: [
                // Título
                Text(
                  widget.sorteo == null ? 'Nuevo Sorteo' : 'Editar Sorteo',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                // Nombre
                TextFormField(
                  initialValue: nombre,
                  decoration: InputDecoration(
                    labelText: 'Nombre del sorteo',
                    filled: true,
                    fillColor: Colors.grey[900],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                  onChanged: (v) => nombre = v,
                  validator:
                      (v) => v == null || v.isEmpty ? 'Campo requerido' : null,
                ),
                const SizedBox(height: 16),
                // Descripción
                TextFormField(
                  initialValue: descripcion,
                  decoration: InputDecoration(
                    labelText: 'Descripción',
                    filled: true,
                    fillColor: Colors.grey[900],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                  onChanged: (v) => descripcion = v,
                ),
                const SizedBox(height: 16),
                // Estado
                DropdownButtonFormField<String>(
                  value: estado,
                  items: [
                    DropdownMenuItem(
                      value: 'borrador',
                      child: Text('Borrador'),
                    ),
                    DropdownMenuItem(value: 'activo', child: Text('Activo')),
                    DropdownMenuItem(
                      value: 'finalizado',
                      child: Text('Finalizado'),
                    ),
                    DropdownMenuItem(
                      value: 'cancelado',
                      child: Text('Cancelado'),
                    ),
                  ],
                  onChanged: (v) => setState(() => estado = v ?? 'borrador'),
                  decoration: InputDecoration(
                    labelText: 'Estado',
                    filled: true,
                    fillColor: Colors.grey[900],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  dropdownColor: Colors.grey[900],
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 16),
                // Fechas
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        borderRadius: BorderRadius.circular(8),
                        onTap: () async {
                          final picked = await showDatePicker(
                            context: context,
                            initialDate: fechaInicio ?? DateTime.now(),
                            firstDate: DateTime(2020),
                            lastDate: DateTime(2100),
                          );
                          if (picked != null)
                            setState(() => fechaInicio = picked);
                        },
                        child: InputDecorator(
                          decoration: InputDecoration(
                            labelText: 'Fecha de inicio',
                            filled: true,
                            fillColor: Colors.grey[900],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.calendar_today,
                                color: Colors.purple,
                                size: 20,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                fechaInicio != null
                                    ? fechaInicio!.toLocal().toString().split(
                                      ' ',
                                    )[0]
                                    : 'Sin definir',
                                style: const TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: InkWell(
                        borderRadius: BorderRadius.circular(8),
                        onTap: () async {
                          final picked = await showDatePicker(
                            context: context,
                            initialDate: fechaFin ?? DateTime.now(),
                            firstDate: DateTime(2020),
                            lastDate: DateTime(2100),
                          );
                          if (picked != null) setState(() => fechaFin = picked);
                        },
                        child: InputDecorator(
                          decoration: InputDecoration(
                            labelText: 'Fecha de fin',
                            filled: true,
                            fillColor: Colors.grey[900],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.calendar_today,
                                color: Colors.purple,
                                size: 20,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                fechaFin != null
                                    ? fechaFin!.toLocal().toString().split(
                                      ' ',
                                    )[0]
                                    : 'Sin definir',
                                style: const TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // Máx. participantes y ganadores
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Máx. participantes',
                          filled: true,
                          fillColor: Colors.grey[900],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        initialValue:
                            maxParticipantes != 0
                                ? maxParticipantes.toString()
                                : '',
                        style: const TextStyle(color: Colors.white),
                        onChanged:
                            (v) => maxParticipantes = int.tryParse(v) ?? 0,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'N° de ganadores',
                          filled: true,
                          fillColor: Colors.grey[900],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        initialValue:
                            numGanadores != 1 ? numGanadores.toString() : '',
                        style: const TextStyle(color: Colors.white),
                        onChanged: (v) => numGanadores = int.tryParse(v) ?? 1,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Divider(color: Colors.purple[200]),
                // Premios
                const Text(
                  'Premios',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                ),
                // ...widget para agregar premios...
                const SizedBox(height: 16),
                Divider(color: Colors.purple[200]),
                // Criterios de participantes
                const Text(
                  'Criterios de Participantes',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
                DropdownButtonFormField<String>(
                  value: criterioParticipante,
                  items: [
                    DropdownMenuItem(
                      value: 'compras_monto',
                      child: Text(
                        'Clientes con compras mayores a \$${montoMinimo.toInt()}',
                      ),
                    ),
                    DropdownMenuItem(
                      value: 'todos_clientes',
                      child: Text('Todos los clientes'),
                    ),
                    DropdownMenuItem(value: 'manual', child: Text('Manual')),
                  ],
                  onChanged:
                      (v) => setState(
                        () => criterioParticipante = v ?? 'compras_monto',
                      ),
                  decoration: InputDecoration(
                    labelText: 'Tipo de criterio',
                    filled: true,
                    fillColor: Colors.grey[900],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  dropdownColor: Colors.grey[900],
                  style: const TextStyle(color: Colors.white),
                ),
                if (criterioParticipante == 'compras_monto') ...[
                  const SizedBox(height: 8),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Monto mínimo de compra (\$)',
                      filled: true,
                      fillColor: Colors.grey[900],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    style: const TextStyle(color: Colors.white),
                    onChanged: (v) => montoMinimo = double.tryParse(v) ?? 0,
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton.icon(
                    onPressed: () async {
                      setState(() {
                        participantes.add(
                          'cliente_compra_mayor_${montoMinimo.toInt()}',
                        );
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Participantes agregados por compras mayores a \$${montoMinimo.toInt()}',
                          ),
                          backgroundColor: Colors.blue,
                        ),
                      );
                    },
                    icon: const Icon(Icons.person_search),
                    label: const Text('Buscar y agregar clientes'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ],
                const SizedBox(height: 16),
                Divider(color: Colors.purple[200]),
                // Participantes
                const Text(
                  'Participantes',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                ),
                ...participantes.map(
                  (p) => Container(
                    margin: const EdgeInsets.symmetric(vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ListTile(
                      title: Text(
                        p.toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.redAccent),
                        onPressed: () {
                          setState(() => participantes.remove(p));
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          setState(() {
                            participantes.add('nuevo_participante');
                          });
                        },
                        icon: const Icon(Icons.person_add),
                        label: const Text('Agregar participante'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          foregroundColor: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: _importarParticipantesInstagram,
                        icon: const Icon(Icons.import_contacts),
                        label: const Text('Importar desde Instagram'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                          foregroundColor: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final isar = await ref.read(isarServiceProvider).db;
                        final nuevoSorteo = Sorteo(
                          nombre: nombre,
                          descripcion: descripcion,
                          fechaInicio: fechaInicio,
                          fechaFin: fechaFin,
                          estado: estado,
                          maxParticipantes: maxParticipantes,
                          numGanadores: numGanadores,
                          usuarioId: usuarioId,
                          // ...otros campos si tu modelo lo requiere...
                        );
                        // ...agrega premios y participantes si tu modelo lo permite...
                        await isar.writeTxn(() async {
                          await isar.sorteos.put(nuevoSorteo);
                        });
                        if (mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Sorteo guardado exitosamente'),
                              backgroundColor: Colors.green,
                            ),
                          );
                          context.pop();
                        }
                      }
                    },
                    icon: const Icon(Icons.save),
                    label: const Text('Guardar'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
