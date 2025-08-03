import 'package:isar/isar.dart';

part 'sorteo.g.dart';

@Collection()
class Sorteo {
  Id id = Isar.autoIncrement;

  late String nombre;
  String? descripcion;
  DateTime fechaCreacion = DateTime.now();
  DateTime? fechaInicio;
  DateTime? fechaFin;
  String estado = 'borrador'; // 'borrador', 'activo', 'finalizado', 'cancelado'
  
  // Configuración del sorteo
  int maxParticipantes = 0; // 0 = sin límite
  int numGanadores = 1;
  String tipoSorteo = 'aleatorio'; // 'aleatorio', 'manual'
  
  // Premios
  List<String> premios = [];
  List<double> valoresPremios = [];
  
  // Participantes
  List<int> participantesIds = []; // IDs de clientes participantes
  List<int> ganadoresIds = []; // IDs de ganadores seleccionados
  
  // Auditoría
  int usuarioId; // Usuario que creó el sorteo
  DateTime? fechaActualizacion;

  Sorteo({
    required this.nombre,
    this.descripcion,
    this.fechaInicio,
    this.fechaFin,
    this.estado = 'borrador',
    this.maxParticipantes = 0,
    this.numGanadores = 1,
    this.tipoSorteo = 'aleatorio',
    required this.usuarioId,
  });

  // Métodos para el estado del sorteo
  bool get estaActivo => estado == 'activo';
  bool get estaFinalizado => estado == 'finalizado';
  bool get estaCancelado => estado == 'cancelado';
  bool get esBorrador => estado == 'borrador';

  // Método para verificar si puede iniciar
  bool get puedeIniciar {
    if (estaFinalizado || estaCancelado) return false;
    if (fechaInicio != null && fechaInicio!.isAfter(DateTime.now())) return false;
    return true;
  }

  // Método para verificar si puede finalizar
  bool get puedeFinalizar {
    if (!estaActivo) return false;
    if (fechaFin != null && fechaFin!.isBefore(DateTime.now())) return true;
    return participantesIds.length >= numGanadores;
  }

  // Método para agregar participante
  bool agregarParticipante(int clienteId) {
    if (!estaActivo) return false;
    if (maxParticipantes > 0 && participantesIds.length >= maxParticipantes) return false;
    if (participantesIds.contains(clienteId)) return false;
    
    participantesIds.add(clienteId);
    return true;
  }

  // Método para remover participante
  bool removerParticipante(int clienteId) {
    if (!estaActivo) return false;
    if (!participantesIds.contains(clienteId)) return false;
    
    participantesIds.remove(clienteId);
    return true;
  }

  // Método para iniciar sorteo
  void iniciarSorteo() {
    if (!puedeIniciar) return;
    estado = 'activo';
    fechaActualizacion = DateTime.now();
  }

  // Método para finalizar sorteo
  void finalizarSorteo() {
    if (!puedeFinalizar) return;
    estado = 'finalizado';
    fechaActualizacion = DateTime.now();
  }

  // Método para cancelar sorteo
  void cancelarSorteo() {
    if (estaFinalizado) return;
    estado = 'cancelado';
    fechaActualizacion = DateTime.now();
  }

  // Método para seleccionar ganadores automáticamente
  List<int> seleccionarGanadoresAutomaticos() {
    if (participantesIds.isEmpty) return [];
    
    final participantes = List<int>.from(participantesIds);
    participantes.shuffle();
    
    final numGanadoresReal = numGanadores > participantes.length 
        ? participantes.length 
        : numGanadores;
    
    ganadoresIds = participantes.take(numGanadoresReal).toList();
    return ganadoresIds;
  }

  // Método para agregar ganador manualmente
  bool agregarGanador(int clienteId) {
    if (!participantesIds.contains(clienteId)) return false;
    if (ganadoresIds.contains(clienteId)) return false;
    if (ganadoresIds.length >= numGanadores) return false;
    
    ganadoresIds.add(clienteId);
    return true;
  }

  // Método para remover ganador
  bool removerGanador(int clienteId) {
    if (!ganadoresIds.contains(clienteId)) return false;
    
    ganadoresIds.remove(clienteId);
    return true;
  }

  // Método para obtener estadísticas
  int get totalParticipantes => participantesIds.length;
  int get totalGanadores => ganadoresIds.length;
  bool get tieneGanadores => ganadoresIds.isNotEmpty;

  // Método para obtener el estado formateado
  String get estadoFormateado {
    switch (estado) {
      case 'borrador':
        return 'Borrador';
      case 'activo':
        return 'Activo';
      case 'finalizado':
        return 'Finalizado';
      case 'cancelado':
        return 'Cancelado';
      default:
        return 'Desconocido';
    }
  }

  // Método para obtener el color del estado
  String get colorEstado {
    switch (estado) {
      case 'borrador':
        return 'grey';
      case 'activo':
        return 'green';
      case 'finalizado':
        return 'blue';
      case 'cancelado':
        return 'red';
      default:
        return 'grey';
    }
  }
}
