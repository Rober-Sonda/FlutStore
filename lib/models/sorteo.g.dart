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
    r'colorEstado': PropertySchema(
      id: 0,
      name: r'colorEstado',
      type: IsarType.string,
    ),
    r'descripcion': PropertySchema(
      id: 1,
      name: r'descripcion',
      type: IsarType.string,
    ),
    r'esBorrador': PropertySchema(
      id: 2,
      name: r'esBorrador',
      type: IsarType.bool,
    ),
    r'estaActivo': PropertySchema(
      id: 3,
      name: r'estaActivo',
      type: IsarType.bool,
    ),
    r'estaCancelado': PropertySchema(
      id: 4,
      name: r'estaCancelado',
      type: IsarType.bool,
    ),
    r'estaFinalizado': PropertySchema(
      id: 5,
      name: r'estaFinalizado',
      type: IsarType.bool,
    ),
    r'estado': PropertySchema(
      id: 6,
      name: r'estado',
      type: IsarType.string,
    ),
    r'estadoFormateado': PropertySchema(
      id: 7,
      name: r'estadoFormateado',
      type: IsarType.string,
    ),
    r'fechaActualizacion': PropertySchema(
      id: 8,
      name: r'fechaActualizacion',
      type: IsarType.dateTime,
    ),
    r'fechaCreacion': PropertySchema(
      id: 9,
      name: r'fechaCreacion',
      type: IsarType.dateTime,
    ),
    r'fechaFin': PropertySchema(
      id: 10,
      name: r'fechaFin',
      type: IsarType.dateTime,
    ),
    r'fechaInicio': PropertySchema(
      id: 11,
      name: r'fechaInicio',
      type: IsarType.dateTime,
    ),
    r'ganadoresIds': PropertySchema(
      id: 12,
      name: r'ganadoresIds',
      type: IsarType.longList,
    ),
    r'maxParticipantes': PropertySchema(
      id: 13,
      name: r'maxParticipantes',
      type: IsarType.long,
    ),
    r'nombre': PropertySchema(
      id: 14,
      name: r'nombre',
      type: IsarType.string,
    ),
    r'numGanadores': PropertySchema(
      id: 15,
      name: r'numGanadores',
      type: IsarType.long,
    ),
    r'participantesIds': PropertySchema(
      id: 16,
      name: r'participantesIds',
      type: IsarType.longList,
    ),
    r'premios': PropertySchema(
      id: 17,
      name: r'premios',
      type: IsarType.objectList,
      target: r'PremioSorteo',
    ),
    r'puedeFinalizar': PropertySchema(
      id: 18,
      name: r'puedeFinalizar',
      type: IsarType.bool,
    ),
    r'puedeIniciar': PropertySchema(
      id: 19,
      name: r'puedeIniciar',
      type: IsarType.bool,
    ),
    r'tieneGanadores': PropertySchema(
      id: 20,
      name: r'tieneGanadores',
      type: IsarType.bool,
    ),
    r'tipoSorteo': PropertySchema(
      id: 21,
      name: r'tipoSorteo',
      type: IsarType.string,
    ),
    r'totalGanadores': PropertySchema(
      id: 22,
      name: r'totalGanadores',
      type: IsarType.long,
    ),
    r'totalParticipantes': PropertySchema(
      id: 23,
      name: r'totalParticipantes',
      type: IsarType.long,
    ),
    r'usuarioId': PropertySchema(
      id: 24,
      name: r'usuarioId',
      type: IsarType.long,
    )
  },
  estimateSize: _sorteoEstimateSize,
  serialize: _sorteoSerialize,
  deserialize: _sorteoDeserialize,
  deserializeProp: _sorteoDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {r'PremioSorteo': PremioSorteoSchema},
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
  {
    final value = object.descripcion;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.estado.length * 3;
  bytesCount += 3 + object.estadoFormateado.length * 3;
  bytesCount += 3 + object.ganadoresIds.length * 8;
  bytesCount += 3 + object.nombre.length * 3;
  bytesCount += 3 + object.participantesIds.length * 8;
  bytesCount += 3 + object.premios.length * 3;
  {
    final offsets = allOffsets[PremioSorteo]!;
    for (var i = 0; i < object.premios.length; i++) {
      final value = object.premios[i];
      bytesCount += PremioSorteoSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.tipoSorteo.length * 3;
  return bytesCount;
}

void _sorteoSerialize(
  Sorteo object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.colorEstado);
  writer.writeString(offsets[1], object.descripcion);
  writer.writeBool(offsets[2], object.esBorrador);
  writer.writeBool(offsets[3], object.estaActivo);
  writer.writeBool(offsets[4], object.estaCancelado);
  writer.writeBool(offsets[5], object.estaFinalizado);
  writer.writeString(offsets[6], object.estado);
  writer.writeString(offsets[7], object.estadoFormateado);
  writer.writeDateTime(offsets[8], object.fechaActualizacion);
  writer.writeDateTime(offsets[9], object.fechaCreacion);
  writer.writeDateTime(offsets[10], object.fechaFin);
  writer.writeDateTime(offsets[11], object.fechaInicio);
  writer.writeLongList(offsets[12], object.ganadoresIds);
  writer.writeLong(offsets[13], object.maxParticipantes);
  writer.writeString(offsets[14], object.nombre);
  writer.writeLong(offsets[15], object.numGanadores);
  writer.writeLongList(offsets[16], object.participantesIds);
  writer.writeObjectList<PremioSorteo>(
    offsets[17],
    allOffsets,
    PremioSorteoSchema.serialize,
    object.premios,
  );
  writer.writeBool(offsets[18], object.puedeFinalizar);
  writer.writeBool(offsets[19], object.puedeIniciar);
  writer.writeBool(offsets[20], object.tieneGanadores);
  writer.writeString(offsets[21], object.tipoSorteo);
  writer.writeLong(offsets[22], object.totalGanadores);
  writer.writeLong(offsets[23], object.totalParticipantes);
  writer.writeLong(offsets[24], object.usuarioId);
}

Sorteo _sorteoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Sorteo(
    descripcion: reader.readStringOrNull(offsets[1]),
    estado: reader.readStringOrNull(offsets[6]) ?? 'borrador',
    fechaFin: reader.readDateTimeOrNull(offsets[10]),
    fechaInicio: reader.readDateTimeOrNull(offsets[11]),
    maxParticipantes: reader.readLongOrNull(offsets[13]) ?? 0,
    nombre: reader.readString(offsets[14]),
    numGanadores: reader.readLongOrNull(offsets[15]) ?? 1,
    tipoSorteo: reader.readStringOrNull(offsets[21]) ?? 'aleatorio',
    usuarioId: reader.readLong(offsets[24]),
  );
  object.fechaActualizacion = reader.readDateTimeOrNull(offsets[8]);
  object.fechaCreacion = reader.readDateTime(offsets[9]);
  object.ganadoresIds = reader.readLongList(offsets[12]) ?? [];
  object.id = id;
  object.participantesIds = reader.readLongList(offsets[16]) ?? [];
  object.premios = reader.readObjectList<PremioSorteo>(
        offsets[17],
        PremioSorteoSchema.deserialize,
        allOffsets,
        PremioSorteo(),
      ) ??
      [];
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
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset) ?? 'borrador') as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 9:
      return (reader.readDateTime(offset)) as P;
    case 10:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 11:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 12:
      return (reader.readLongList(offset) ?? []) as P;
    case 13:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 14:
      return (reader.readString(offset)) as P;
    case 15:
      return (reader.readLongOrNull(offset) ?? 1) as P;
    case 16:
      return (reader.readLongList(offset) ?? []) as P;
    case 17:
      return (reader.readObjectList<PremioSorteo>(
            offset,
            PremioSorteoSchema.deserialize,
            allOffsets,
            PremioSorteo(),
          ) ??
          []) as P;
    case 18:
      return (reader.readBool(offset)) as P;
    case 19:
      return (reader.readBool(offset)) as P;
    case 20:
      return (reader.readBool(offset)) as P;
    case 21:
      return (reader.readStringOrNull(offset) ?? 'aleatorio') as P;
    case 22:
      return (reader.readLong(offset)) as P;
    case 23:
      return (reader.readLong(offset)) as P;
    case 24:
      return (reader.readLong(offset)) as P;
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

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> esBorradorEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'esBorrador',
        value: value,
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

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> estaCanceladoEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estaCancelado',
        value: value,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> estaFinalizadoEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estaFinalizado',
        value: value,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> estadoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> estadoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'estado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> estadoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'estado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> estadoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'estado',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> estadoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'estado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> estadoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'estado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> estadoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'estado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> estadoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'estado',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> estadoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estado',
        value: '',
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> estadoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'estado',
        value: '',
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> estadoFormateadoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estadoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      estadoFormateadoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'estadoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> estadoFormateadoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'estadoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> estadoFormateadoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'estadoFormateado',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      estadoFormateadoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'estadoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> estadoFormateadoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'estadoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> estadoFormateadoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'estadoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> estadoFormateadoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'estadoFormateado',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      estadoFormateadoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estadoFormateado',
        value: '',
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      estadoFormateadoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'estadoFormateado',
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

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> fechaFinIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fechaFin',
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> fechaFinIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fechaFin',
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> fechaFinEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaFin',
        value: value,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> fechaFinGreaterThan(
    DateTime? value, {
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
    DateTime? value, {
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
    DateTime? lower,
    DateTime? upper, {
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

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> fechaInicioIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fechaInicio',
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> fechaInicioIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fechaInicio',
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> fechaInicioEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaInicio',
        value: value,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> fechaInicioGreaterThan(
    DateTime? value, {
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
    DateTime? value, {
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
    DateTime? lower,
    DateTime? upper, {
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

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      ganadoresIdsElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ganadoresIds',
        value: value,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      ganadoresIdsElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ganadoresIds',
        value: value,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      ganadoresIdsElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ganadoresIds',
        value: value,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      ganadoresIdsElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ganadoresIds',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> ganadoresIdsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ganadoresIds',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> ganadoresIdsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ganadoresIds',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> ganadoresIdsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ganadoresIds',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      ganadoresIdsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ganadoresIds',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      ganadoresIdsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ganadoresIds',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> ganadoresIdsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ganadoresIds',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
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

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> maxParticipantesEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maxParticipantes',
        value: value,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      maxParticipantesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'maxParticipantes',
        value: value,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> maxParticipantesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'maxParticipantes',
        value: value,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> maxParticipantesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'maxParticipantes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> nombreEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> nombreGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> nombreLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> nombreBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nombre',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> nombreStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> nombreEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> nombreContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> nombreMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nombre',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> nombreIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nombre',
        value: '',
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> nombreIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nombre',
        value: '',
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> numGanadoresEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'numGanadores',
        value: value,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> numGanadoresGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'numGanadores',
        value: value,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> numGanadoresLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'numGanadores',
        value: value,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> numGanadoresBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'numGanadores',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      participantesIdsElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'participantesIds',
        value: value,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      participantesIdsElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'participantesIds',
        value: value,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      participantesIdsElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'participantesIds',
        value: value,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      participantesIdsElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'participantesIds',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      participantesIdsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'participantesIds',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      participantesIdsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'participantesIds',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      participantesIdsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'participantesIds',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      participantesIdsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'participantesIds',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      participantesIdsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'participantesIds',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      participantesIdsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'participantesIds',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> premiosLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'premios',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> premiosIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'premios',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> premiosIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'premios',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> premiosLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'premios',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> premiosLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'premios',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> premiosLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'premios',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> puedeFinalizarEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'puedeFinalizar',
        value: value,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> puedeIniciarEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'puedeIniciar',
        value: value,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> tieneGanadoresEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tieneGanadores',
        value: value,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> tipoSorteoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tipoSorteo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> tipoSorteoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tipoSorteo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> tipoSorteoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tipoSorteo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> tipoSorteoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tipoSorteo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> tipoSorteoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tipoSorteo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> tipoSorteoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tipoSorteo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> tipoSorteoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tipoSorteo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> tipoSorteoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tipoSorteo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> tipoSorteoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tipoSorteo',
        value: '',
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> tipoSorteoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tipoSorteo',
        value: '',
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> totalGanadoresEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalGanadores',
        value: value,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> totalGanadoresGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalGanadores',
        value: value,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> totalGanadoresLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalGanadores',
        value: value,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> totalGanadoresBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalGanadores',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> totalParticipantesEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalParticipantes',
        value: value,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      totalParticipantesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalParticipantes',
        value: value,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition>
      totalParticipantesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalParticipantes',
        value: value,
      ));
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> totalParticipantesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalParticipantes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
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
}

extension SorteoQueryObject on QueryBuilder<Sorteo, Sorteo, QFilterCondition> {
  QueryBuilder<Sorteo, Sorteo, QAfterFilterCondition> premiosElement(
      FilterQuery<PremioSorteo> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'premios');
    });
  }
}

extension SorteoQueryLinks on QueryBuilder<Sorteo, Sorteo, QFilterCondition> {}

extension SorteoQuerySortBy on QueryBuilder<Sorteo, Sorteo, QSortBy> {
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

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByEsBorrador() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esBorrador', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByEsBorradorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esBorrador', Sort.desc);
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

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByEstaCancelado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estaCancelado', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByEstaCanceladoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estaCancelado', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByEstaFinalizado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estaFinalizado', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByEstaFinalizadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estaFinalizado', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByEstado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByEstadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByEstadoFormateado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estadoFormateado', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByEstadoFormateadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estadoFormateado', Sort.desc);
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

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByMaxParticipantes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxParticipantes', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByMaxParticipantesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxParticipantes', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByNombre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByNombreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByNumGanadores() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numGanadores', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByNumGanadoresDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numGanadores', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByPuedeFinalizar() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'puedeFinalizar', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByPuedeFinalizarDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'puedeFinalizar', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByPuedeIniciar() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'puedeIniciar', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByPuedeIniciarDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'puedeIniciar', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByTieneGanadores() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tieneGanadores', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByTieneGanadoresDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tieneGanadores', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByTipoSorteo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipoSorteo', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByTipoSorteoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipoSorteo', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByTotalGanadores() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalGanadores', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByTotalGanadoresDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalGanadores', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByTotalParticipantes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalParticipantes', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> sortByTotalParticipantesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalParticipantes', Sort.desc);
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
}

extension SorteoQuerySortThenBy on QueryBuilder<Sorteo, Sorteo, QSortThenBy> {
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

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByEsBorrador() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esBorrador', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByEsBorradorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esBorrador', Sort.desc);
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

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByEstaCancelado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estaCancelado', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByEstaCanceladoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estaCancelado', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByEstaFinalizado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estaFinalizado', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByEstaFinalizadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estaFinalizado', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByEstado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByEstadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByEstadoFormateado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estadoFormateado', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByEstadoFormateadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estadoFormateado', Sort.desc);
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

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByMaxParticipantes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxParticipantes', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByMaxParticipantesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxParticipantes', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByNombre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByNombreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByNumGanadores() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numGanadores', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByNumGanadoresDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numGanadores', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByPuedeFinalizar() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'puedeFinalizar', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByPuedeFinalizarDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'puedeFinalizar', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByPuedeIniciar() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'puedeIniciar', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByPuedeIniciarDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'puedeIniciar', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByTieneGanadores() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tieneGanadores', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByTieneGanadoresDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tieneGanadores', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByTipoSorteo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipoSorteo', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByTipoSorteoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipoSorteo', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByTotalGanadores() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalGanadores', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByTotalGanadoresDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalGanadores', Sort.desc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByTotalParticipantes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalParticipantes', Sort.asc);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QAfterSortBy> thenByTotalParticipantesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalParticipantes', Sort.desc);
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
}

extension SorteoQueryWhereDistinct on QueryBuilder<Sorteo, Sorteo, QDistinct> {
  QueryBuilder<Sorteo, Sorteo, QDistinct> distinctByColorEstado(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'colorEstado', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QDistinct> distinctByDescripcion(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'descripcion', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QDistinct> distinctByEsBorrador() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'esBorrador');
    });
  }

  QueryBuilder<Sorteo, Sorteo, QDistinct> distinctByEstaActivo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estaActivo');
    });
  }

  QueryBuilder<Sorteo, Sorteo, QDistinct> distinctByEstaCancelado() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estaCancelado');
    });
  }

  QueryBuilder<Sorteo, Sorteo, QDistinct> distinctByEstaFinalizado() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estaFinalizado');
    });
  }

  QueryBuilder<Sorteo, Sorteo, QDistinct> distinctByEstado(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estado', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QDistinct> distinctByEstadoFormateado(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estadoFormateado',
          caseSensitive: caseSensitive);
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

  QueryBuilder<Sorteo, Sorteo, QDistinct> distinctByGanadoresIds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ganadoresIds');
    });
  }

  QueryBuilder<Sorteo, Sorteo, QDistinct> distinctByMaxParticipantes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'maxParticipantes');
    });
  }

  QueryBuilder<Sorteo, Sorteo, QDistinct> distinctByNombre(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nombre', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QDistinct> distinctByNumGanadores() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'numGanadores');
    });
  }

  QueryBuilder<Sorteo, Sorteo, QDistinct> distinctByParticipantesIds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'participantesIds');
    });
  }

  QueryBuilder<Sorteo, Sorteo, QDistinct> distinctByPuedeFinalizar() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'puedeFinalizar');
    });
  }

  QueryBuilder<Sorteo, Sorteo, QDistinct> distinctByPuedeIniciar() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'puedeIniciar');
    });
  }

  QueryBuilder<Sorteo, Sorteo, QDistinct> distinctByTieneGanadores() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tieneGanadores');
    });
  }

  QueryBuilder<Sorteo, Sorteo, QDistinct> distinctByTipoSorteo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tipoSorteo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Sorteo, Sorteo, QDistinct> distinctByTotalGanadores() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalGanadores');
    });
  }

  QueryBuilder<Sorteo, Sorteo, QDistinct> distinctByTotalParticipantes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalParticipantes');
    });
  }

  QueryBuilder<Sorteo, Sorteo, QDistinct> distinctByUsuarioId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'usuarioId');
    });
  }
}

extension SorteoQueryProperty on QueryBuilder<Sorteo, Sorteo, QQueryProperty> {
  QueryBuilder<Sorteo, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Sorteo, String, QQueryOperations> colorEstadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'colorEstado');
    });
  }

  QueryBuilder<Sorteo, String?, QQueryOperations> descripcionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'descripcion');
    });
  }

  QueryBuilder<Sorteo, bool, QQueryOperations> esBorradorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'esBorrador');
    });
  }

  QueryBuilder<Sorteo, bool, QQueryOperations> estaActivoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estaActivo');
    });
  }

  QueryBuilder<Sorteo, bool, QQueryOperations> estaCanceladoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estaCancelado');
    });
  }

  QueryBuilder<Sorteo, bool, QQueryOperations> estaFinalizadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estaFinalizado');
    });
  }

  QueryBuilder<Sorteo, String, QQueryOperations> estadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estado');
    });
  }

  QueryBuilder<Sorteo, String, QQueryOperations> estadoFormateadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estadoFormateado');
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

  QueryBuilder<Sorteo, DateTime?, QQueryOperations> fechaFinProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaFin');
    });
  }

  QueryBuilder<Sorteo, DateTime?, QQueryOperations> fechaInicioProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaInicio');
    });
  }

  QueryBuilder<Sorteo, List<int>, QQueryOperations> ganadoresIdsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ganadoresIds');
    });
  }

  QueryBuilder<Sorteo, int, QQueryOperations> maxParticipantesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'maxParticipantes');
    });
  }

  QueryBuilder<Sorteo, String, QQueryOperations> nombreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nombre');
    });
  }

  QueryBuilder<Sorteo, int, QQueryOperations> numGanadoresProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'numGanadores');
    });
  }

  QueryBuilder<Sorteo, List<int>, QQueryOperations> participantesIdsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'participantesIds');
    });
  }

  QueryBuilder<Sorteo, List<PremioSorteo>, QQueryOperations> premiosProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'premios');
    });
  }

  QueryBuilder<Sorteo, bool, QQueryOperations> puedeFinalizarProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'puedeFinalizar');
    });
  }

  QueryBuilder<Sorteo, bool, QQueryOperations> puedeIniciarProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'puedeIniciar');
    });
  }

  QueryBuilder<Sorteo, bool, QQueryOperations> tieneGanadoresProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tieneGanadores');
    });
  }

  QueryBuilder<Sorteo, String, QQueryOperations> tipoSorteoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tipoSorteo');
    });
  }

  QueryBuilder<Sorteo, int, QQueryOperations> totalGanadoresProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalGanadores');
    });
  }

  QueryBuilder<Sorteo, int, QQueryOperations> totalParticipantesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalParticipantes');
    });
  }

  QueryBuilder<Sorteo, int, QQueryOperations> usuarioIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'usuarioId');
    });
  }
}
