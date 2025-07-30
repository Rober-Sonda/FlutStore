// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sorteo.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSorteoCollection on Isar {
  IsarCollection<Sorteo> get sorteos => this.collection();
}

const SorteoSchema = CollectionSchema(
  name: r'Sorteo',
  id: -5523654683105411362,
  properties: {
    r'activo': PropertySchema(
      id: 0,
      name: r'activo',
      type: IsarType.bool,
    ),
    r'cantidadGanadores': PropertySchema(
      id: 1,
      name: r'cantidadGanadores',
      type: IsarType.long,
    ),
    r'colorEstado': PropertySchema(
      id: 2,
      name: r'colorEstado',
      type: IsarType.string,
    ),
    r'criteriosParticipacion': PropertySchema(
      id: 3,
      name: r'criteriosParticipacion',
      type: IsarType.stringList,
    ),
    r'cuentaInstagram': PropertySchema(
      id: 4,
      name: r'cuentaInstagram',
      type: IsarType.string,
    ),
    r'descripcion': PropertySchema(
      id: 5,
      name: r'descripcion',
      type: IsarType.string,
    ),
    r'diasRestantes': PropertySchema(
      id: 6,
      name: r'diasRestantes',
      type: IsarType.long,
    ),
    r'diasTranscurridos': PropertySchema(
      id: 7,
      name: r'diasTranscurridos',
      type: IsarType.long,
    ),
    r'duracionFormateada': PropertySchema(
      id: 8,
      name: r'duracionFormateada',
      type: IsarType.string,
    ),
    r'estaActivo': PropertySchema(
      id: 9,
      name: r'estaActivo',
      type: IsarType.bool,
    ),
    r'estaPorComenzar': PropertySchema(
      id: 10,
      name: r'estaPorComenzar',
      type: IsarType.bool,
    ),
    r'estadoSorteo': PropertySchema(
      id: 11,
      name: r'estadoSorteo',
      type: IsarType.string,
    ),
    r'fechaActualizacion': PropertySchema(
      id: 12,
      name: r'fechaActualizacion',
      type: IsarType.dateTime,
    ),
    r'fechaCreacion': PropertySchema(
      id: 13,
      name: r'fechaCreacion',
      type: IsarType.dateTime,
    ),
    r'fechaFin': PropertySchema(
      id: 14,
      name: r'fechaFin',
      type: IsarType.dateTime,
    ),
    r'fechaInicio': PropertySchema(
      id: 15,
      name: r'fechaInicio',
      type: IsarType.dateTime,
    ),
    r'finalizado': PropertySchema(
      id: 16,
      name: r'finalizado',
      type: IsarType.bool,
    ),
    r'ganadores': PropertySchema(
      id: 17,
      name: r'ganadores',
      type: IsarType.stringList,
    ),
    r'ganadoresSeleccionados': PropertySchema(
      id: 18,
      name: r'ganadoresSeleccionados',
      type: IsarType.bool,
    ),
    r'haExpirado': PropertySchema(
      id: 19,
      name: r'haExpirado',
      type: IsarType.bool,
    ),
    r'hashtagSorteo': PropertySchema(
      id: 20,
      name: r'hashtagSorteo',
      type: IsarType.string,
    ),
    r'haySuficientesParticipantes': PropertySchema(
      id: 21,
      name: r'haySuficientesParticipantes',
      type: IsarType.bool,
    ),
    r'imagenSorteo': PropertySchema(
      id: 22,
      name: r'imagenSorteo',
      type: IsarType.string,
    ),
    r'maximoParticipantes': PropertySchema(
      id: 23,
      name: r'maximoParticipantes',
      type: IsarType.long,
    ),
    r'minimoComentarios': PropertySchema(
      id: 24,
      name: r'minimoComentarios',
      type: IsarType.long,
    ),
    r'minimoCompartidas': PropertySchema(
      id: 25,
      name: r'minimoCompartidas',
      type: IsarType.long,
    ),
    r'minimoParticipantes': PropertySchema(
      id: 26,
      name: r'minimoParticipantes',
      type: IsarType.long,
    ),
    r'numeroParticipantes': PropertySchema(
      id: 27,
      name: r'numeroParticipantes',
      type: IsarType.long,
    ),
    r'participantes': PropertySchema(
      id: 28,
      name: r'participantes',
      type: IsarType.stringList,
    ),
    r'postInstagramId': PropertySchema(
      id: 29,
      name: r'postInstagramId',
      type: IsarType.string,
    ),
    r'premio': PropertySchema(
      id: 30,
      name: r'premio',
      type: IsarType.string,
    ),
    r'progresoSorteo': PropertySchema(
      id: 31,
      name: r'progresoSorteo',
      type: IsarType.double,
    ),
    r'puedeSeleccionarGanadores': PropertySchema(
      id: 32,
      name: r'puedeSeleccionarGanadores',
      type: IsarType.bool,
    ),
    r'requiereComentar': PropertySchema(
      id: 33,
      name: r'requiereComentar',
      type: IsarType.bool,
    ),
    r'requiereCompartir': PropertySchema(
      id: 34,
      name: r'requiereCompartir',
      type: IsarType.bool,
    ),
    r'requiereEtiquetar': PropertySchema(
      id: 35,
      name: r'requiereEtiquetar',
      type: IsarType.bool,
    ),
    r'requiereSeguir': PropertySchema(
      id: 36,
      name: r'requiereSeguir',
      type: IsarType.bool,
    ),
    r'seAlcanzoMaximoParticipantes': PropertySchema(
      id: 37,
      name: r'seAlcanzoMaximoParticipantes',
      type: IsarType.bool,
    ),
    r'titulo': PropertySchema(
      id: 38,
      name: r'titulo',
      type: IsarType.string,
    ),
    r'usuarioId': PropertySchema(
      id: 39,
      name: r'usuarioId',
      type: IsarType.long,
    ),
    r'valorPremio': PropertySchema(
      id: 40,
      name: r'valorPremio',
      type: IsarType.double,
    ),
    r'valorPremioFormateado': PropertySchema(
      id: 41,
      name: r'valorPremioFormateado',
      type: IsarType.string,
    )
  },
  estimateSize: _sorteoEstimateSize,
  serialize: _sorteoSerialize,
  deserialize: _sorteoDeserialize,
  deserializeProp: _sorteoDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _sorteoGetId,
  getLinks: _sorteoGetLinks,
  attach: _sorteoAttach,
  version: '3.1.0+1',
);

int _sorteoEstimateSize(
  Sorteo object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.colorEstado.length * 3;
  bytesCount += 3 + object.criteriosParticipacion.length * 3;
  {
    for (var i = 0; i < object.criteriosParticipacion.length; i++) {
      final value = object.criteriosParticipacion[i];
      bytesCount += value.length * 3;
    }
  }
  {
    final value = object.cuentaInstagram;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.descripcion;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.duracionFormateada.length * 3;
  bytesCount += 3 + object.estadoSorteo.length * 3;
  bytesCount += 3 + object.ganadores.length * 3;
  {
    for (var i = 0; i < object.ganadores.length; i++) {
      final value = object.ganadores[i];
      bytesCount += value.length * 3;
    }
  }
  {
    final value = object.hashtagSorteo;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.imagenSorteo;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.participantes.length * 3;
  {
    for (var i = 0; i < object.participantes.length; i++) {
      final value = object.participantes[i];
      bytesCount += value.length * 3;
    }
  }
  {
    final value = object.postInstagramId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.premio;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.titulo.length * 3;
  {
    final value = object.valorPremioFormateado;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _sorteoSerialize(
  Sorteo object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.activo);
  writer.writeLong(offsets[1], object.cantidadGanadores);
  writer.writeString(offsets[2], object.colorEstado);
  writer.writeStringList(offsets[3], object.criteriosParticipacion);
  writer.writeString(offsets[4], object.cuentaInstagram);
  writer.writeString(offsets[5], object.descripcion);
  writer.writeLong(offsets[6], object.diasRestantes);
  writer.writeLong(offsets[7], object.diasTranscurridos);
  writer.writeString(offsets[8], object.duracionFormateada);
  writer.writeBool(offsets[9], object.estaActivo);
  writer.writeBool(offsets[10], object.estaPorComenzar);
  writer.writeString(offsets[11], object.estadoSorteo);
  writer.writeDateTime(offsets[12], object.fechaActualizacion);
  writer.writeDateTime(offsets[13], object.fechaCreacion);
  writer.writeDateTime(offsets[14], object.fechaFin);
  writer.writeDateTime(offsets[15], object.fechaInicio);
  writer.writeBool(offsets[16], object.finalizado);
  writer.writeStringList(offsets[17], object.ganadores);
  writer.writeBool(offsets[18], object.ganadoresSeleccionados);
  writer.writeBool(offsets[19], object.haExpirado);
  writer.writeString(offsets[20], object.hashtagSorteo);
  writer.writeBool(offsets[21], object.haySuficientesParticipantes);
  writer.writeString(offsets[22], object.imagenSorteo);
  writer.writeLong(offsets[23], object.maximoParticipantes);
  writer.writeLong(offsets[24], object.minimoComentarios);
  writer.writeLong(offsets[25], object.minimoCompartidas);
  writer.writeLong(offsets[26], object.minimoParticipantes);
  writer.writeLong(offsets[27], object.numeroParticipantes);
  writer.writeStringList(offsets[28], object.participantes);
  writer.writeString(offsets[29], object.postInstagramId);
  writer.writeString(offsets[30], object.premio);
  writer.writeDouble(offsets[31], object.progresoSorteo);
  writer.writeBool(offsets[32], object.puedeSeleccionarGanadores);
  writer.writeBool(offsets[33], object.requiereComentar);
  writer.writeBool(offsets[34], object.requiereCompartir);
  writer.writeBool(offsets[35], object.requiereEtiquetar);
  writer.writeBool(offsets[36], object.requiereSeguir);
  writer.writeBool(offsets[37], object.seAlcanzoMaximoParticipantes);
  writer.writeString(offsets[38], object.titulo);
  writer.writeLong(offsets[39], object.usuarioId);
  writer.writeDouble(offsets[40], object.valorPremio);
  writer.writeString(offsets[41], object.valorPremioFormateado);
}

Sorteo _sorteoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Sorteo(
    activo: reader.readBoolOrNull(offsets[0]) ?? true,
    cantidadGanadores: reader.readLongOrNull(offsets[1]) ?? 1,
    cuentaInstagram: reader.readStringOrNull(offsets[4]),
    descripcion: reader.readStringOrNull(offsets[5]),
    fechaFin: reader.readDateTime(offsets[14]),
    fechaInicio: reader.readDateTime(offsets[15]),
    finalizado: reader.readBoolOrNull(offsets[16]) ?? false,
    ganadoresSeleccionados: reader.readBoolOrNull(offsets[18]) ?? false,
    hashtagSorteo: reader.readStringOrNull(offsets[20]),
    imagenSorteo: reader.readStringOrNull(offsets[22]),
    maximoParticipantes: reader.readLongOrNull(offsets[23]),
    minimoComentarios: reader.readLongOrNull(offsets[24]),
    minimoCompartidas: reader.readLongOrNull(offsets[25]),
    minimoParticipantes: reader.readLongOrNull(offsets[26]),
    postInstagramId: reader.readStringOrNull(offsets[29]),
    premio: reader.readStringOrNull(offsets[30]),
    requiereComentar: reader.readBoolOrNull(offsets[33]) ?? true,
    requiereCompartir: reader.readBoolOrNull(offsets[34]) ?? true,
    requiereEtiquetar: reader.readBoolOrNull(offsets[35]) ?? true,
    requiereSeguir: reader.readBoolOrNull(offsets[36]) ?? true,
    titulo: reader.readString(offsets[38]),
    usuarioId: reader.readLong(offsets[39]),
    valorPremio: reader.readDoubleOrNull(offsets[40]),
  );
  object.fechaActualizacion = reader.readDateTimeOrNull(offsets[12]);
  object.fechaCreacion = reader.readDateTime(offsets[13]);
  object.ganadores = reader.readStringList(offsets[17]) ?? [];
  object.id = id;
  object.participantes = reader.readStringList(offsets[28]) ?? [];
  return object;
}

P _sorteoDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBoolOrNull(offset) ?? true) as P;
    case 1:
      return (reader.readLongOrNull(offset) ?? 1) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readStringList(offset) ?? []) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readBool(offset)) as P;
    case 10:
      return (reader.readBool(offset)) as P;
    case 11:
      return (reader.readString(offset)) as P;
    case 12:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 13:
      return (reader.readDateTime(offset)) as P;
    case 14:
      return (reader.readDateTime(offset)) as P;
    case 15:
      return (reader.readDateTime(offset)) as P;
    case 16:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 17:
      return (reader.readStringList(offset) ?? []) as P;
    case 18:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 19:
      return (reader.readBool(offset)) as P;
    case 20:
      return (reader.readStringOrNull(offset)) as P;
    case 21:
      return (reader.readBool(offset)) as P;
    case 22:
      return (reader.readStringOrNull(offset)) as P;
    case 23:
      return (reader.readLongOrNull(offset)) as P;
    case 24:
      return (reader.readLongOrNull(offset)) as P;
    case 25:
      return (reader.readLongOrNull(offset)) as P;
    case 26:
      return (reader.readLongOrNull(offset)) as P;
    case 27:
      return (reader.readLong(offset)) as P;
    case 28:
      return (reader.readStringList(offset) ?? []) as P;
    case 29:
      return (reader.readStringOrNull(offset)) as P;
    case 30:
      return (reader.readStringOrNull(offset)) as P;
    case 31:
      return (reader.readDouble(offset)) as P;
    case 32:
      return (reader.readBool(offset)) as P;
    case 33:
      return (reader.readBoolOrNull(offset) ?? true) as P;
    case 34:
      return (reader.readBoolOrNull(offset) ?? true) as P;
    case 35:
      return (reader.readBoolOrNull(offset) ?? true) as P;
    case 36:
      return (reader.readBoolOrNull(offset) ?? true) as P;
    case 37:
      return (reader.readBool(offset)) as P;
    case 38:
      return (reader.readString(offset)) as P;
    case 39:
      return (reader.readLong(offset)) as P;
    case 40:
      return (reader.readDoubleOrNull(offset)) as P;
    case 41:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _sorteoGetId(Sorteo object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _sorteoGetLinks(Sorteo object) {
  return [];
}

void _sorteoAttach(IsarCollection<dynamic> col, Id id, Sorteo object) {
  object.id = id;
}

extension SorteoQueryWhereSort on QueryBuilder<Sorteo, Sorteo, QWhere> {
  QueryBuilder<Sorteo, Sorteo, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SorteoQueryWhere on QueryBuilder<Sorteo, Sorteo, QWhereClause> {
  QueryBuilder<Sorteo, Sorteo, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SorteoQueryFilter on QueryBuilder<Sorteo, Sorteo, QFilterCondition> {
  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> activoEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'activo',
        value: value,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> cantidadGanadoresEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cantidadGanadores',
        value: value,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      cantidadGanadoresGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cantidadGanadores',
        value: value,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> cantidadGanadoresLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cantidadGanadores',
        value: value,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> cantidadGanadoresBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cantidadGanadores',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> colorEstadoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'colorEstado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> colorEstadoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'colorEstado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> colorEstadoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'colorEstado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> colorEstadoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'colorEstado',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> colorEstadoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'colorEstado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> colorEstadoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'colorEstado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> colorEstadoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'colorEstado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> colorEstadoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'colorEstado',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> colorEstadoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'colorEstado',
        value: '',
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> colorEstadoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'colorEstado',
        value: '',
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      criteriosParticipacionElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'criteriosParticipacion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      criteriosParticipacionElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'criteriosParticipacion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      criteriosParticipacionElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'criteriosParticipacion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      criteriosParticipacionElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'criteriosParticipacion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      criteriosParticipacionElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'criteriosParticipacion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      criteriosParticipacionElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'criteriosParticipacion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      criteriosParticipacionElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'criteriosParticipacion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      criteriosParticipacionElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'criteriosParticipacion',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      criteriosParticipacionElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'criteriosParticipacion',
        value: '',
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      criteriosParticipacionElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'criteriosParticipacion',
        value: '',
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      criteriosParticipacionLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'criteriosParticipacion',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      criteriosParticipacionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'criteriosParticipacion',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      criteriosParticipacionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'criteriosParticipacion',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      criteriosParticipacionLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'criteriosParticipacion',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      criteriosParticipacionLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'criteriosParticipacion',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      criteriosParticipacionLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'criteriosParticipacion',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> cuentaInstagramIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cuentaInstagram',
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      cuentaInstagramIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cuentaInstagram',
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> cuentaInstagramEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cuentaInstagram',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      cuentaInstagramGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cuentaInstagram',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> cuentaInstagramLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cuentaInstagram',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> cuentaInstagramBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cuentaInstagram',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> cuentaInstagramStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'cuentaInstagram',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> cuentaInstagramEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'cuentaInstagram',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> cuentaInstagramContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'cuentaInstagram',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> cuentaInstagramMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'cuentaInstagram',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> cuentaInstagramIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cuentaInstagram',
        value: '',
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      cuentaInstagramIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'cuentaInstagram',
        value: '',
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> descripcionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'descripcion',
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> descripcionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'descripcion',
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> descripcionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'descripcion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> descripcionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'descripcion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> descripcionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'descripcion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> descripcionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'descripcion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> descripcionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'descripcion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> descripcionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'descripcion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> descripcionContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'descripcion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> descripcionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'descripcion',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> descripcionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'descripcion',
        value: '',
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> descripcionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'descripcion',
        value: '',
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> diasRestantesEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'diasRestantes',
        value: value,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> diasRestantesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'diasRestantes',
        value: value,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> diasRestantesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'diasRestantes',
        value: value,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> diasRestantesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'diasRestantes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> diasTranscurridosEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'diasTranscurridos',
        value: value,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      diasTranscurridosGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'diasTranscurridos',
        value: value,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> diasTranscurridosLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'diasTranscurridos',
        value: value,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> diasTranscurridosBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'diasTranscurridos',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> duracionFormateadaEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'duracionFormateada',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      duracionFormateadaGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'duracionFormateada',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      duracionFormateadaLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'duracionFormateada',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> duracionFormateadaBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'duracionFormateada',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      duracionFormateadaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'duracionFormateada',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      duracionFormateadaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'duracionFormateada',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      duracionFormateadaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'duracionFormateada',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> duracionFormateadaMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'duracionFormateada',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      duracionFormateadaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'duracionFormateada',
        value: '',
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      duracionFormateadaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'duracionFormateada',
        value: '',
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> estaActivoEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estaActivo',
        value: value,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> estaPorComenzarEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estaPorComenzar',
        value: value,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> estadoSorteoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estadoSorteo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> estadoSorteoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'estadoSorteo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> estadoSorteoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'estadoSorteo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> estadoSorteoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'estadoSorteo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> estadoSorteoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'estadoSorteo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> estadoSorteoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'estadoSorteo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> estadoSorteoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'estadoSorteo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> estadoSorteoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'estadoSorteo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> estadoSorteoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estadoSorteo',
        value: '',
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> estadoSorteoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'estadoSorteo',
        value: '',
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      fechaActualizacionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fechaActualizacion',
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      fechaActualizacionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fechaActualizacion',
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> fechaActualizacionEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaActualizacion',
        value: value,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      fechaActualizacionGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fechaActualizacion',
        value: value,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      fechaActualizacionLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fechaActualizacion',
        value: value,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> fechaActualizacionBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fechaActualizacion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> fechaCreacionEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaCreacion',
        value: value,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> fechaCreacionGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fechaCreacion',
        value: value,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> fechaCreacionLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fechaCreacion',
        value: value,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> fechaCreacionBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fechaCreacion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> fechaFinEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaFin',
        value: value,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> fechaFinGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fechaFin',
        value: value,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> fechaFinLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fechaFin',
        value: value,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> fechaFinBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fechaFin',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> fechaInicioEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaInicio',
        value: value,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> fechaInicioGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fechaInicio',
        value: value,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> fechaInicioLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fechaInicio',
        value: value,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> fechaInicioBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fechaInicio',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> finalizadoEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'finalizado',
        value: value,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> ganadoresElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ganadores',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      ganadoresElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ganadores',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> ganadoresElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ganadores',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> ganadoresElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ganadores',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      ganadoresElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ganadores',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> ganadoresElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ganadores',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> ganadoresElementContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ganadores',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> ganadoresElementMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ganadores',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      ganadoresElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ganadores',
        value: '',
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      ganadoresElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ganadores',
        value: '',
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> ganadoresLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ganadores',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> ganadoresIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ganadores',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> ganadoresIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ganadores',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> ganadoresLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ganadores',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      ganadoresLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ganadores',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> ganadoresLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ganadores',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      ganadoresSeleccionadosEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ganadoresSeleccionados',
        value: value,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> haExpiradoEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'haExpirado',
        value: value,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> hashtagSorteoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'hashtagSorteo',
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> hashtagSorteoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'hashtagSorteo',
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> hashtagSorteoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hashtagSorteo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> hashtagSorteoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hashtagSorteo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> hashtagSorteoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hashtagSorteo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> hashtagSorteoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hashtagSorteo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> hashtagSorteoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'hashtagSorteo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> hashtagSorteoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'hashtagSorteo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> hashtagSorteoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'hashtagSorteo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> hashtagSorteoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'hashtagSorteo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> hashtagSorteoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hashtagSorteo',
        value: '',
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      hashtagSorteoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'hashtagSorteo',
        value: '',
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      haySuficientesParticipantesEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'haySuficientesParticipantes',
        value: value,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> imagenSorteoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'imagenSorteo',
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> imagenSorteoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'imagenSorteo',
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> imagenSorteoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imagenSorteo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> imagenSorteoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'imagenSorteo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> imagenSorteoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'imagenSorteo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> imagenSorteoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'imagenSorteo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> imagenSorteoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'imagenSorteo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> imagenSorteoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'imagenSorteo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> imagenSorteoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'imagenSorteo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> imagenSorteoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'imagenSorteo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> imagenSorteoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imagenSorteo',
        value: '',
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> imagenSorteoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'imagenSorteo',
        value: '',
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      maximoParticipantesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'maximoParticipantes',
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      maximoParticipantesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'maximoParticipantes',
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      maximoParticipantesEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maximoParticipantes',
        value: value,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      maximoParticipantesGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'maximoParticipantes',
        value: value,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      maximoParticipantesLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'maximoParticipantes',
        value: value,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      maximoParticipantesBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'maximoParticipantes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      minimoComentariosIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'minimoComentarios',
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      minimoComentariosIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'minimoComentarios',
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> minimoComentariosEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'minimoComentarios',
        value: value,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      minimoComentariosGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'minimoComentarios',
        value: value,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> minimoComentariosLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'minimoComentarios',
        value: value,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> minimoComentariosBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'minimoComentarios',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      minimoCompartidasIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'minimoCompartidas',
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      minimoCompartidasIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'minimoCompartidas',
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> minimoCompartidasEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'minimoCompartidas',
        value: value,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      minimoCompartidasGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'minimoCompartidas',
        value: value,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> minimoCompartidasLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'minimoCompartidas',
        value: value,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> minimoCompartidasBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'minimoCompartidas',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      minimoParticipantesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'minimoParticipantes',
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      minimoParticipantesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'minimoParticipantes',
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      minimoParticipantesEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'minimoParticipantes',
        value: value,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      minimoParticipantesGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'minimoParticipantes',
        value: value,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      minimoParticipantesLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'minimoParticipantes',
        value: value,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      minimoParticipantesBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'minimoParticipantes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      numeroParticipantesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'numeroParticipantes',
        value: value,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      numeroParticipantesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'numeroParticipantes',
        value: value,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      numeroParticipantesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'numeroParticipantes',
        value: value,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      numeroParticipantesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'numeroParticipantes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      participantesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'participantes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      participantesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'participantes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      participantesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'participantes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      participantesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'participantes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      participantesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'participantes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      participantesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'participantes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      participantesElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'participantes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      participantesElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'participantes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      participantesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'participantes',
        value: '',
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      participantesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'participantes',
        value: '',
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      participantesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'participantes',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> participantesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'participantes',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      participantesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'participantes',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      participantesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'participantes',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      participantesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'participantes',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      participantesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'participantes',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> postInstagramIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'postInstagramId',
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      postInstagramIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'postInstagramId',
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> postInstagramIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'postInstagramId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      postInstagramIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'postInstagramId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> postInstagramIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'postInstagramId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> postInstagramIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'postInstagramId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> postInstagramIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'postInstagramId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> postInstagramIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'postInstagramId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> postInstagramIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'postInstagramId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> postInstagramIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'postInstagramId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> postInstagramIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'postInstagramId',
        value: '',
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      postInstagramIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'postInstagramId',
        value: '',
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> premioIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'premio',
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> premioIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'premio',
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> premioEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'premio',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> premioGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'premio',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> premioLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'premio',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> premioBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'premio',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> premioStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'premio',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> premioEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'premio',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> premioContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'premio',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> premioMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'premio',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> premioIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'premio',
        value: '',
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> premioIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'premio',
        value: '',
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> progresoSorteoEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'progresoSorteo',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> progresoSorteoGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'progresoSorteo',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> progresoSorteoLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'progresoSorteo',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> progresoSorteoBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'progresoSorteo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      puedeSeleccionarGanadoresEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'puedeSeleccionarGanadores',
        value: value,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> requiereComentarEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'requiereComentar',
        value: value,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> requiereCompartirEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'requiereCompartir',
        value: value,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> requiereEtiquetarEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'requiereEtiquetar',
        value: value,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> requiereSeguirEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'requiereSeguir',
        value: value,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      seAlcanzoMaximoParticipantesEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'seAlcanzoMaximoParticipantes',
        value: value,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> tituloEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'titulo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> tituloGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'titulo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> tituloLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'titulo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> tituloBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'titulo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> tituloStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'titulo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> tituloEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'titulo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> tituloContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'titulo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> tituloMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'titulo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> tituloIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'titulo',
        value: '',
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> tituloIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'titulo',
        value: '',
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> usuarioIdEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'usuarioId',
        value: value,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> usuarioIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'usuarioId',
        value: value,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> usuarioIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'usuarioId',
        value: value,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> usuarioIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'usuarioId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> valorPremioIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'valorPremio',
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> valorPremioIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'valorPremio',
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> valorPremioEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'valorPremio',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> valorPremioGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'valorPremio',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> valorPremioLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'valorPremio',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> valorPremioBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'valorPremio',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      valorPremioFormateadoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'valorPremioFormateado',
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      valorPremioFormateadoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'valorPremioFormateado',
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      valorPremioFormateadoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'valorPremioFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      valorPremioFormateadoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'valorPremioFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      valorPremioFormateadoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'valorPremioFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      valorPremioFormateadoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'valorPremioFormateado',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      valorPremioFormateadoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'valorPremioFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      valorPremioFormateadoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'valorPremioFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      valorPremioFormateadoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'valorPremioFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      valorPremioFormateadoMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'valorPremioFormateado',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      valorPremioFormateadoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'valorPremioFormateado',
        value: '',
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      valorPremioFormateadoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'valorPremioFormateado',
        value: '',
      ));
    });
  }
}

extension SorteoQueryObject on QueryBuilder<Sorteo, Sorteo, QFilterCondition> {}

extension SorteoQueryLinks on QueryBuilder<Sorteo, Sorteo, QFilterCondition> {}

extension SorteoQuerySortBy on QueryBuilder<Sorteo, Sorteo, QSortBy> {
  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByActivo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activo', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByActivoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activo', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByCantidadGanadores() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cantidadGanadores', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByCantidadGanadoresDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cantidadGanadores', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByColorEstado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorEstado', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByColorEstadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorEstado', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByCuentaInstagram() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cuentaInstagram', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByCuentaInstagramDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cuentaInstagram', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByDescripcion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descripcion', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByDescripcionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descripcion', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByDiasRestantes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diasRestantes', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByDiasRestantesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diasRestantes', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByDiasTranscurridos() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diasTranscurridos', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByDiasTranscurridosDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diasTranscurridos', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByDuracionFormateada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'duracionFormateada', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByDuracionFormateadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'duracionFormateada', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByEstaActivo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estaActivo', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByEstaActivoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estaActivo', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByEstaPorComenzar() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estaPorComenzar', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByEstaPorComenzarDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estaPorComenzar', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByEstadoSorteo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estadoSorteo', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByEstadoSorteoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estadoSorteo', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByFechaActualizacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaActualizacion', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByFechaActualizacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaActualizacion', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByFechaCreacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByFechaFin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaFin', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByFechaFinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaFin', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByFechaInicio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaInicio', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByFechaInicioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaInicio', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByFinalizado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finalizado', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByFinalizadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finalizado', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByGanadoresSeleccionados() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ganadoresSeleccionados', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy>
      sortByGanadoresSeleccionadosDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ganadoresSeleccionados', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByHaExpirado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'haExpirado', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByHaExpiradoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'haExpirado', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByHashtagSorteo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashtagSorteo', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByHashtagSorteoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashtagSorteo', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy>
      sortByHaySuficientesParticipantes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'haySuficientesParticipantes', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy>
      sortByHaySuficientesParticipantesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'haySuficientesParticipantes', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByImagenSorteo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagenSorteo', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByImagenSorteoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagenSorteo', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByMaximoParticipantes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maximoParticipantes', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByMaximoParticipantesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maximoParticipantes', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByMinimoComentarios() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minimoComentarios', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByMinimoComentariosDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minimoComentarios', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByMinimoCompartidas() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minimoCompartidas', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByMinimoCompartidasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minimoCompartidas', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByMinimoParticipantes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minimoParticipantes', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByMinimoParticipantesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minimoParticipantes', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByNumeroParticipantes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroParticipantes', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByNumeroParticipantesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroParticipantes', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByPostInstagramId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'postInstagramId', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByPostInstagramIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'postInstagramId', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByPremio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'premio', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByPremioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'premio', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByProgresoSorteo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'progresoSorteo', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByProgresoSorteoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'progresoSorteo', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByPuedeSeleccionarGanadores() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'puedeSeleccionarGanadores', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy>
      sortByPuedeSeleccionarGanadoresDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'puedeSeleccionarGanadores', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByRequiereComentar() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requiereComentar', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByRequiereComentarDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requiereComentar', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByRequiereCompartir() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requiereCompartir', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByRequiereCompartirDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requiereCompartir', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByRequiereEtiquetar() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requiereEtiquetar', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByRequiereEtiquetarDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requiereEtiquetar', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByRequiereSeguir() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requiereSeguir', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByRequiereSeguirDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requiereSeguir', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy>
      sortBySeAlcanzoMaximoParticipantes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'seAlcanzoMaximoParticipantes', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy>
      sortBySeAlcanzoMaximoParticipantesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'seAlcanzoMaximoParticipantes', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByTitulo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titulo', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByTituloDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titulo', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByUsuarioId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usuarioId', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByUsuarioIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usuarioId', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByValorPremio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valorPremio', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByValorPremioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valorPremio', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByValorPremioFormateado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valorPremioFormateado', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByValorPremioFormateadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valorPremioFormateado', Sort.desc);
    });
  }
}

extension SorteoQuerySortThenBy on QueryBuilder<Sorteo, Sorteo, QSortThenBy> {
  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByActivo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activo', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByActivoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activo', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByCantidadGanadores() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cantidadGanadores', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByCantidadGanadoresDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cantidadGanadores', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByColorEstado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorEstado', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByColorEstadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorEstado', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByCuentaInstagram() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cuentaInstagram', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByCuentaInstagramDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cuentaInstagram', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByDescripcion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descripcion', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByDescripcionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descripcion', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByDiasRestantes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diasRestantes', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByDiasRestantesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diasRestantes', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByDiasTranscurridos() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diasTranscurridos', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByDiasTranscurridosDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diasTranscurridos', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByDuracionFormateada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'duracionFormateada', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByDuracionFormateadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'duracionFormateada', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByEstaActivo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estaActivo', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByEstaActivoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estaActivo', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByEstaPorComenzar() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estaPorComenzar', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByEstaPorComenzarDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estaPorComenzar', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByEstadoSorteo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estadoSorteo', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByEstadoSorteoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estadoSorteo', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByFechaActualizacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaActualizacion', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByFechaActualizacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaActualizacion', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByFechaCreacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByFechaFin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaFin', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByFechaFinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaFin', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByFechaInicio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaInicio', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByFechaInicioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaInicio', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByFinalizado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finalizado', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByFinalizadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finalizado', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByGanadoresSeleccionados() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ganadoresSeleccionados', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy>
      thenByGanadoresSeleccionadosDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ganadoresSeleccionados', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByHaExpirado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'haExpirado', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByHaExpiradoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'haExpirado', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByHashtagSorteo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashtagSorteo', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByHashtagSorteoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashtagSorteo', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy>
      thenByHaySuficientesParticipantes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'haySuficientesParticipantes', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy>
      thenByHaySuficientesParticipantesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'haySuficientesParticipantes', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByImagenSorteo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagenSorteo', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByImagenSorteoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagenSorteo', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByMaximoParticipantes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maximoParticipantes', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByMaximoParticipantesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maximoParticipantes', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByMinimoComentarios() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minimoComentarios', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByMinimoComentariosDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minimoComentarios', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByMinimoCompartidas() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minimoCompartidas', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByMinimoCompartidasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minimoCompartidas', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByMinimoParticipantes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minimoParticipantes', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByMinimoParticipantesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minimoParticipantes', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByNumeroParticipantes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroParticipantes', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByNumeroParticipantesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroParticipantes', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByPostInstagramId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'postInstagramId', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByPostInstagramIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'postInstagramId', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByPremio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'premio', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByPremioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'premio', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByProgresoSorteo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'progresoSorteo', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByProgresoSorteoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'progresoSorteo', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByPuedeSeleccionarGanadores() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'puedeSeleccionarGanadores', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy>
      thenByPuedeSeleccionarGanadoresDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'puedeSeleccionarGanadores', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByRequiereComentar() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requiereComentar', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByRequiereComentarDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requiereComentar', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByRequiereCompartir() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requiereCompartir', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByRequiereCompartirDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requiereCompartir', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByRequiereEtiquetar() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requiereEtiquetar', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByRequiereEtiquetarDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requiereEtiquetar', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByRequiereSeguir() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requiereSeguir', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByRequiereSeguirDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requiereSeguir', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy>
      thenBySeAlcanzoMaximoParticipantes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'seAlcanzoMaximoParticipantes', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy>
      thenBySeAlcanzoMaximoParticipantesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'seAlcanzoMaximoParticipantes', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByTitulo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titulo', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByTituloDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titulo', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByUsuarioId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usuarioId', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByUsuarioIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usuarioId', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByValorPremio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valorPremio', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByValorPremioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valorPremio', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByValorPremioFormateado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valorPremioFormateado', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByValorPremioFormateadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valorPremioFormateado', Sort.desc);
    });
  }
}

extension SorteoQueryWhereDistinct on QueryBuilder<Sorteo, Sorteo, QDistinct> {
  QueryBuilder<Sorteo, Sorteo, QDistinct> distinctByActivo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'activo');
    });
  }

  QueryBuilder<Sorteo, Sorteo, QDistinct> distinctByCantidadGanadores() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cantidadGanadores');
    });
  }

  QueryBuilder<Sorteo, Sorteo, QDistinct> distinctByColorEstado(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'colorEstado', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QDistinct> distinctByCriteriosParticipacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'criteriosParticipacion');
    });
  }

  QueryBuilder<Sorteo, Sorteo, QDistinct> distinctByCuentaInstagram(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cuentaInstagram',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QDistinct> distinctByDescripcion(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'descripcion', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QDistinct> distinctByDiasRestantes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'diasRestantes');
    });
  }

  QueryBuilder<Sorteo, Sorteo, QDistinct> distinctByDiasTranscurridos() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'diasTranscurridos');
    });
  }

  QueryBuilder<Sorteo, Sorteo, QDistinct> distinctByDuracionFormateada(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'duracionFormateada',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QDistinct> distinctByEstaActivo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estaActivo');
    });
  }

  QueryBuilder<Sorteo, Sorteo, QDistinct> distinctByEstaPorComenzar() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estaPorComenzar');
    });
  }

  QueryBuilder<Sorteo, Sorteo, QDistinct> distinctByEstadoSorteo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estadoSorteo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QDistinct> distinctByFechaActualizacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaActualizacion');
    });
  }

  QueryBuilder<Sorteo, Sorteo, QDistinct> distinctByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaCreacion');
    });
  }

  QueryBuilder<Sorteo, Sorteo, QDistinct> distinctByFechaFin() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaFin');
    });
  }

  QueryBuilder<Sorteo, Sorteo, QDistinct> distinctByFechaInicio() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaInicio');
    });
  }

  QueryBuilder<Sorteo, Sorteo, QDistinct> distinctByFinalizado() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'finalizado');
    });
  }

  QueryBuilder<Sorteo, Sorteo, QDistinct> distinctByGanadores() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ganadores');
    });
  }

  QueryBuilder<Sorteo, Sorteo, QDistinct> distinctByGanadoresSeleccionados() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ganadoresSeleccionados');
    });
  }

  QueryBuilder<Sorteo, Sorteo, QDistinct> distinctByHaExpirado() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'haExpirado');
    });
  }

  QueryBuilder<Sorteo, Sorteo, QDistinct> distinctByHashtagSorteo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hashtagSorteo',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QDistinct>
      distinctByHaySuficientesParticipantes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'haySuficientesParticipantes');
    });
  }

  QueryBuilder<Sorteo, Sorteo, QDistinct> distinctByImagenSorteo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'imagenSorteo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QDistinct> distinctByMaximoParticipantes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'maximoParticipantes');
    });
  }

  QueryBuilder<Sorteo, Sorteo, QDistinct> distinctByMinimoComentarios() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'minimoComentarios');
    });
  }

  QueryBuilder<Sorteo, Sorteo, QDistinct> distinctByMinimoCompartidas() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'minimoCompartidas');
    });
  }

  QueryBuilder<Sorteo, Sorteo, QDistinct> distinctByMinimoParticipantes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'minimoParticipantes');
    });
  }

  QueryBuilder<Sorteo, Sorteo, QDistinct> distinctByNumeroParticipantes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'numeroParticipantes');
    });
  }

  QueryBuilder<Sorteo, Sorteo, QDistinct> distinctByParticipantes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'participantes');
    });
  }

  QueryBuilder<Sorteo, Sorteo, QDistinct> distinctByPostInstagramId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'postInstagramId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QDistinct> distinctByPremio(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'premio', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QDistinct> distinctByProgresoSorteo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'progresoSorteo');
    });
  }

  QueryBuilder<Sorteo, Sorteo, QDistinct>
      distinctByPuedeSeleccionarGanadores() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'puedeSeleccionarGanadores');
    });
  }

  QueryBuilder<Sorteo, Sorteo, QDistinct> distinctByRequiereComentar() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'requiereComentar');
    });
  }

  QueryBuilder<Sorteo, Sorteo, QDistinct> distinctByRequiereCompartir() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'requiereCompartir');
    });
  }

  QueryBuilder<Sorteo, Sorteo, QDistinct> distinctByRequiereEtiquetar() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'requiereEtiquetar');
    });
  }

  QueryBuilder<Sorteo, Sorteo, QDistinct> distinctByRequiereSeguir() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'requiereSeguir');
    });
  }

  QueryBuilder<Sorteo, Sorteo, QDistinct>
      distinctBySeAlcanzoMaximoParticipantes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'seAlcanzoMaximoParticipantes');
    });
  }

  QueryBuilder<Sorteo, Sorteo, QDistinct> distinctByTitulo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'titulo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QDistinct> distinctByUsuarioId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'usuarioId');
    });
  }

  QueryBuilder<Sorteo, Sorteo, QDistinct> distinctByValorPremio() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'valorPremio');
    });
  }

  QueryBuilder<Sorteo, Sorteo, QDistinct> distinctByValorPremioFormateado(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'valorPremioFormateado',
          caseSensitive: caseSensitive);
    });
  }
}

extension SorteoQueryProperty on QueryBuilder<Sorteo, Sorteo, QQueryProperty> {
  QueryBuilder<Sorteo, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Sorteo, bool, QQueryOperations> activoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'activo');
    });
  }

  QueryBuilder<Sorteo, int, QQueryOperations> cantidadGanadoresProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cantidadGanadores');
    });
  }

  QueryBuilder<Sorteo, String, QQueryOperations> colorEstadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'colorEstado');
    });
  }

  QueryBuilder<Sorteo, List<String>, QQueryOperations>
      criteriosParticipacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'criteriosParticipacion');
    });
  }

  QueryBuilder<Sorteo, String?, QQueryOperations> cuentaInstagramProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cuentaInstagram');
    });
  }

  QueryBuilder<Sorteo, String?, QQueryOperations> descripcionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'descripcion');
    });
  }

  QueryBuilder<Sorteo, int, QQueryOperations> diasRestantesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'diasRestantes');
    });
  }

  QueryBuilder<Sorteo, int, QQueryOperations> diasTranscurridosProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'diasTranscurridos');
    });
  }

  QueryBuilder<Sorteo, String, QQueryOperations> duracionFormateadaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'duracionFormateada');
    });
  }

  QueryBuilder<Sorteo, bool, QQueryOperations> estaActivoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estaActivo');
    });
  }

  QueryBuilder<Sorteo, bool, QQueryOperations> estaPorComenzarProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estaPorComenzar');
    });
  }

  QueryBuilder<Sorteo, String, QQueryOperations> estadoSorteoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estadoSorteo');
    });
  }

  QueryBuilder<Sorteo, DateTime?, QQueryOperations>
      fechaActualizacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaActualizacion');
    });
  }

  QueryBuilder<Sorteo, DateTime, QQueryOperations> fechaCreacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaCreacion');
    });
  }

  QueryBuilder<Sorteo, DateTime, QQueryOperations> fechaFinProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaFin');
    });
  }

  QueryBuilder<Sorteo, DateTime, QQueryOperations> fechaInicioProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaInicio');
    });
  }

  QueryBuilder<Sorteo, bool, QQueryOperations> finalizadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'finalizado');
    });
  }

  QueryBuilder<Sorteo, List<String>, QQueryOperations> ganadoresProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ganadores');
    });
  }

  QueryBuilder<Sorteo, bool, QQueryOperations>
      ganadoresSeleccionadosProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ganadoresSeleccionados');
    });
  }

  QueryBuilder<Sorteo, bool, QQueryOperations> haExpiradoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'haExpirado');
    });
  }

  QueryBuilder<Sorteo, String?, QQueryOperations> hashtagSorteoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hashtagSorteo');
    });
  }

  QueryBuilder<Sorteo, bool, QQueryOperations>
      haySuficientesParticipantesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'haySuficientesParticipantes');
    });
  }

  QueryBuilder<Sorteo, String?, QQueryOperations> imagenSorteoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'imagenSorteo');
    });
  }

  QueryBuilder<Sorteo, int?, QQueryOperations> maximoParticipantesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'maximoParticipantes');
    });
  }

  QueryBuilder<Sorteo, int?, QQueryOperations> minimoComentariosProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'minimoComentarios');
    });
  }

  QueryBuilder<Sorteo, int?, QQueryOperations> minimoCompartidasProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'minimoCompartidas');
    });
  }

  QueryBuilder<Sorteo, int?, QQueryOperations> minimoParticipantesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'minimoParticipantes');
    });
  }

  QueryBuilder<Sorteo, int, QQueryOperations> numeroParticipantesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'numeroParticipantes');
    });
  }

  QueryBuilder<Sorteo, List<String>, QQueryOperations> participantesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'participantes');
    });
  }

  QueryBuilder<Sorteo, String?, QQueryOperations> postInstagramIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'postInstagramId');
    });
  }

  QueryBuilder<Sorteo, String?, QQueryOperations> premioProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'premio');
    });
  }

  QueryBuilder<Sorteo, double, QQueryOperations> progresoSorteoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'progresoSorteo');
    });
  }

  QueryBuilder<Sorteo, bool, QQueryOperations>
      puedeSeleccionarGanadoresProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'puedeSeleccionarGanadores');
    });
  }

  QueryBuilder<Sorteo, bool, QQueryOperations> requiereComentarProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'requiereComentar');
    });
  }

  QueryBuilder<Sorteo, bool, QQueryOperations> requiereCompartirProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'requiereCompartir');
    });
  }

  QueryBuilder<Sorteo, bool, QQueryOperations> requiereEtiquetarProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'requiereEtiquetar');
    });
  }

  QueryBuilder<Sorteo, bool, QQueryOperations> requiereSeguirProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'requiereSeguir');
    });
  }

  QueryBuilder<Sorteo, bool, QQueryOperations>
      seAlcanzoMaximoParticipantesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'seAlcanzoMaximoParticipantes');
    });
  }

  QueryBuilder<Sorteo, String, QQueryOperations> tituloProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'titulo');
    });
  }

  QueryBuilder<Sorteo, int, QQueryOperations> usuarioIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'usuarioId');
    });
  }

  QueryBuilder<Sorteo, double?, QQueryOperations> valorPremioProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'valorPremio');
    });
  }

  QueryBuilder<Sorteo, String?, QQueryOperations>
      valorPremioFormateadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'valorPremioFormateado');
    });
  }
}
