import 'package:isar/isar.dart';

part 'sorteo.g.dart';

@Collection()
class Sorteo {
  Id id = Isar.autoIncrement;

  late String titulo;
  String? descripcion;
  String? imagenSorteo;

  // Configuración del sorteo
  DateTime fechaInicio;
  DateTime fechaFin;
  int? maximoParticipantes;
  int? minimoParticipantes;

  // Premios
  String? premio;
  double? valorPremio;
  int cantidadGanadores = 1;

  // Criterios de participación
  bool requiereSeguir = true;
  bool requiereComentar = true;
  bool requiereCompartir = true;
  bool requiereEtiquetar = true;
  int? minimoComentarios;
  int? minimoCompartidas;

  // Estados
  bool activo = true;
  bool finalizado = false;
  bool ganadoresSeleccionados = false;

  // Información de Instagram
  String? postInstagramId;
  String? hashtagSorteo;
  String? cuentaInstagram;

  // Participantes
  List<String> participantes = [];
  List<String> ganadores = [];

  // Auditoría
  int usuarioId; // Usuario que creó el sorteo
  DateTime fechaCreacion = DateTime.now();
  DateTime? fechaActualizacion;

  Sorteo({
    required this.titulo,
    this.descripcion,
    this.imagenSorteo,
    required this.fechaInicio,
    required this.fechaFin,
    this.maximoParticipantes,
    this.minimoParticipantes,
    this.premio,
    this.valorPremio,
    this.cantidadGanadores = 1,
    this.requiereSeguir = true,
    this.requiereComentar = true,
    this.requiereCompartir = true,
    this.requiereEtiquetar = true,
    this.minimoComentarios,
    this.minimoCompartidas,
    this.activo = true,
    this.finalizado = false,
    this.ganadoresSeleccionados = false,
    this.postInstagramId,
    this.hashtagSorteo,
    this.cuentaInstagram,
    required this.usuarioId,
  });

  // Método para verificar si el sorteo está activo
  bool get estaActivo {
    final ahora = DateTime.now();
    return activo &&
        ahora.isAfter(fechaInicio) &&
        ahora.isBefore(fechaFin) &&
        !finalizado;
  }

  // Método para verificar si el sorteo ha expirado
  bool get haExpirado {
    return DateTime.now().isAfter(fechaFin);
  }

  // Método para verificar si el sorteo está por comenzar
  bool get estaPorComenzar {
    return DateTime.now().isBefore(fechaInicio);
  }

  // Método para obtener el estado del sorteo
  String get estadoSorteo {
    if (!activo) return 'Inactivo';
    if (finalizado) return 'Finalizado';
    if (haExpirado) return 'Expirado';
    if (estaPorComenzar) return 'Próximamente';
    return 'Activo';
  }

  // Método para obtener el color del estado
  String get colorEstado {
    switch (estadoSorteo) {
      case 'Activo':
        return 'green';
      case 'Próximamente':
        return 'blue';
      case 'Finalizado':
        return 'purple';
      case 'Expirado':
      case 'Inactivo':
        return 'red';
      default:
        return 'grey';
    }
  }

  // Método para obtener días restantes
  int get diasRestantes {
    final ahora = DateTime.now();
    if (ahora.isAfter(fechaFin)) return 0;
    return fechaFin.difference(ahora).inDays;
  }

  // Método para obtener días transcurridos
  int get diasTranscurridos {
    final ahora = DateTime.now();
    if (ahora.isBefore(fechaInicio)) return 0;
    return ahora.difference(fechaInicio).inDays;
  }

  // Método para obtener el progreso del sorteo (0.0 a 1.0)
  double get progresoSorteo {
    final totalDias = fechaFin.difference(fechaInicio).inDays;
    if (totalDias <= 0) return 0.0;

    final diasTranscurridos = this.diasTranscurridos;
    if (diasTranscurridos <= 0) return 0.0;
    if (diasTranscurridos >= totalDias) return 1.0;

    return diasTranscurridos / totalDias;
  }

  // Método para agregar participante
  void agregarParticipante(String participante) {
    if (!participantes.contains(participante)) {
      participantes.add(participante);
      fechaActualizacion = DateTime.now();
    }
  }

  // Método para remover participante
  void removerParticipante(String participante) {
    participantes.remove(participante);
    fechaActualizacion = DateTime.now();
  }

  // Método para obtener el número de participantes
  int get numeroParticipantes {
    return participantes.length;
  }

  // Método para verificar si hay suficientes participantes
  bool get haySuficientesParticipantes {
    if (minimoParticipantes == null) return true;
    return participantes.length >= minimoParticipantes!;
  }

  // Método para verificar si se alcanzó el máximo de participantes
  bool get seAlcanzoMaximoParticipantes {
    if (maximoParticipantes == null) return false;
    return participantes.length >= maximoParticipantes!;
  }

  // Método para finalizar el sorteo
  void finalizarSorteo() {
    finalizado = true;
    fechaActualizacion = DateTime.now();
  }

  // Método para seleccionar ganadores
  void seleccionarGanadores() {
    if (participantes.isNotEmpty && !ganadoresSeleccionados) {
      final participantesShuffled = List<String>.from(participantes);
      participantesShuffled.shuffle();

      ganadores = participantesShuffled.take(cantidadGanadores).toList();
      ganadoresSeleccionados = true;
      fechaActualizacion = DateTime.now();
    }
  }

  // Método para obtener los criterios de participación
  List<String> get criteriosParticipacion {
    List<String> criterios = [];

    if (requiereSeguir) criterios.add('Seguir la cuenta');
    if (requiereComentar) criterios.add('Comentar la publicación');
    if (requiereCompartir) criterios.add('Compartir en stories');
    if (requiereEtiquetar) criterios.add('Etiquetar amigos');

    if (minimoComentarios != null) {
      criterios.add('Mínimo $minimoComentarios comentarios');
    }

    if (minimoCompartidas != null) {
      criterios.add('Mínimo $minimoCompartidas compartidas');
    }

    return criterios;
  }

  // Método para obtener el valor del premio formateado
  String? get valorPremioFormateado {
    if (valorPremio == null) return null;
    return '\$${valorPremio!.toStringAsFixed(2)}';
  }

  // Método para obtener la duración del sorteo
  @ignore
  Duration get duracionSorteo {
    return fechaFin.difference(fechaInicio);
  }

  // Método para obtener la duración formateada
  String get duracionFormateada {
    final duracion = duracionSorteo;
    final dias = duracion.inDays;
    final horas = duracion.inHours % 24;

    if (dias > 0) {
      return '$dias días, $horas horas';
    } else {
      return '$horas horas';
    }
  }

  // Método para verificar si se puede seleccionar ganadores
  bool get puedeSeleccionarGanadores {
    return haExpirado && haySuficientesParticipantes && !ganadoresSeleccionados;
  }
}
