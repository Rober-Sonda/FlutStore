// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ganancia_perdida.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetGananciaPerdidaCollection on Isar {
  IsarCollection<GananciaPerdida> get gananciaPerdidas => this.collection();
}

const GananciaPerdidaSchema = CollectionSchema(
  name: r'GananciaPerdida',
  id: 4446148558134693934,
  properties: {
    r'anulado': PropertySchema(
      id: 0,
      name: r'anulado',
      type: IsarType.bool,
    ),
    r'categoria': PropertySchema(
      id: 1,
      name: r'categoria',
      type: IsarType.string,
    ),
    r'categoriaFormateada': PropertySchema(
      id: 2,
      name: r'categoriaFormateada',
      type: IsarType.string,
    ),
    r'clienteId': PropertySchema(
      id: 3,
      name: r'clienteId',
      type: IsarType.long,
    ),
    r'colorCategoria': PropertySchema(
      id: 4,
      name: r'colorCategoria',
      type: IsarType.string,
    ),
    r'colorEstado': PropertySchema(
      id: 5,
      name: r'colorEstado',
      type: IsarType.string,
    ),
    r'colorTipo': PropertySchema(
      id: 6,
      name: r'colorTipo',
      type: IsarType.string,
    ),
    r'compraId': PropertySchema(
      id: 7,
      name: r'compraId',
      type: IsarType.long,
    ),
    r'concepto': PropertySchema(
      id: 8,
      name: r'concepto',
      type: IsarType.string,
    ),
    r'confirmado': PropertySchema(
      id: 9,
      name: r'confirmado',
      type: IsarType.bool,
    ),
    r'descripcion': PropertySchema(
      id: 10,
      name: r'descripcion',
      type: IsarType.string,
    ),
    r'esGanancia': PropertySchema(
      id: 11,
      name: r'esGanancia',
      type: IsarType.bool,
    ),
    r'esPerdida': PropertySchema(
      id: 12,
      name: r'esPerdida',
      type: IsarType.bool,
    ),
    r'esRecurrente': PropertySchema(
      id: 13,
      name: r'esRecurrente',
      type: IsarType.bool,
    ),
    r'estadoTransaccion': PropertySchema(
      id: 14,
      name: r'estadoTransaccion',
      type: IsarType.string,
    ),
    r'fecha': PropertySchema(
      id: 15,
      name: r'fecha',
      type: IsarType.dateTime,
    ),
    r'fechaActualizacion': PropertySchema(
      id: 16,
      name: r'fechaActualizacion',
      type: IsarType.dateTime,
    ),
    r'fechaCreacion': PropertySchema(
      id: 17,
      name: r'fechaCreacion',
      type: IsarType.dateTime,
    ),
    r'frecuenciaRecurrencia': PropertySchema(
      id: 18,
      name: r'frecuenciaRecurrencia',
      type: IsarType.string,
    ),
    r'iconoCategoria': PropertySchema(
      id: 19,
      name: r'iconoCategoria',
      type: IsarType.string,
    ),
    r'margenFormateado': PropertySchema(
      id: 20,
      name: r'margenFormateado',
      type: IsarType.string,
    ),
    r'monto': PropertySchema(
      id: 21,
      name: r'monto',
      type: IsarType.double,
    ),
    r'montoConSigno': PropertySchema(
      id: 22,
      name: r'montoConSigno',
      type: IsarType.double,
    ),
    r'montoFormateado': PropertySchema(
      id: 23,
      name: r'montoFormateado',
      type: IsarType.string,
    ),
    r'motivoAnulacion': PropertySchema(
      id: 24,
      name: r'motivoAnulacion',
      type: IsarType.string,
    ),
    r'numeroComprobante': PropertySchema(
      id: 25,
      name: r'numeroComprobante',
      type: IsarType.string,
    ),
    r'observaciones': PropertySchema(
      id: 26,
      name: r'observaciones',
      type: IsarType.string,
    ),
    r'ofertaId': PropertySchema(
      id: 27,
      name: r'ofertaId',
      type: IsarType.long,
    ),
    r'proveedorId': PropertySchema(
      id: 28,
      name: r'proveedorId',
      type: IsarType.long,
    ),
    r'tipo': PropertySchema(
      id: 29,
      name: r'tipo',
      type: IsarType.string,
    ),
    r'tipoFormateado': PropertySchema(
      id: 30,
      name: r'tipoFormateado',
      type: IsarType.string,
    ),
    r'usuarioId': PropertySchema(
      id: 31,
      name: r'usuarioId',
      type: IsarType.long,
    ),
    r'ventaId': PropertySchema(
      id: 32,
      name: r'ventaId',
      type: IsarType.long,
    )
  },
  estimateSize: _gananciaPerdidaEstimateSize,
  serialize: _gananciaPerdidaSerialize,
  deserialize: _gananciaPerdidaDeserialize,
  deserializeProp: _gananciaPerdidaDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _gananciaPerdidaGetId,
  getLinks: _gananciaPerdidaGetLinks,
  attach: _gananciaPerdidaAttach,
  version: '3.1.0+1',
);

int _gananciaPerdidaEstimateSize(
  GananciaPerdida object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.categoria.length * 3;
  bytesCount += 3 + object.categoriaFormateada.length * 3;
  bytesCount += 3 + object.colorCategoria.length * 3;
  bytesCount += 3 + object.colorEstado.length * 3;
  bytesCount += 3 + object.colorTipo.length * 3;
  bytesCount += 3 + object.concepto.length * 3;
  {
    final value = object.descripcion;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.estadoTransaccion.length * 3;
  {
    final value = object.frecuenciaRecurrencia;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.iconoCategoria.length * 3;
  {
    final value = object.margenFormateado;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.montoFormateado.length * 3;
  {
    final value = object.motivoAnulacion;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.numeroComprobante;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.observaciones;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.tipo.length * 3;
  bytesCount += 3 + object.tipoFormateado.length * 3;
  return bytesCount;
}

void _gananciaPerdidaSerialize(
  GananciaPerdida object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.anulado);
  writer.writeString(offsets[1], object.categoria);
  writer.writeString(offsets[2], object.categoriaFormateada);
  writer.writeLong(offsets[3], object.clienteId);
  writer.writeString(offsets[4], object.colorCategoria);
  writer.writeString(offsets[5], object.colorEstado);
  writer.writeString(offsets[6], object.colorTipo);
  writer.writeLong(offsets[7], object.compraId);
  writer.writeString(offsets[8], object.concepto);
  writer.writeBool(offsets[9], object.confirmado);
  writer.writeString(offsets[10], object.descripcion);
  writer.writeBool(offsets[11], object.esGanancia);
  writer.writeBool(offsets[12], object.esPerdida);
  writer.writeBool(offsets[13], object.esRecurrente);
  writer.writeString(offsets[14], object.estadoTransaccion);
  writer.writeDateTime(offsets[15], object.fecha);
  writer.writeDateTime(offsets[16], object.fechaActualizacion);
  writer.writeDateTime(offsets[17], object.fechaCreacion);
  writer.writeString(offsets[18], object.frecuenciaRecurrencia);
  writer.writeString(offsets[19], object.iconoCategoria);
  writer.writeString(offsets[20], object.margenFormateado);
  writer.writeDouble(offsets[21], object.monto);
  writer.writeDouble(offsets[22], object.montoConSigno);
  writer.writeString(offsets[23], object.montoFormateado);
  writer.writeString(offsets[24], object.motivoAnulacion);
  writer.writeString(offsets[25], object.numeroComprobante);
  writer.writeString(offsets[26], object.observaciones);
  writer.writeLong(offsets[27], object.ofertaId);
  writer.writeLong(offsets[28], object.proveedorId);
  writer.writeString(offsets[29], object.tipo);
  writer.writeString(offsets[30], object.tipoFormateado);
  writer.writeLong(offsets[31], object.usuarioId);
  writer.writeLong(offsets[32], object.ventaId);
}

GananciaPerdida _gananciaPerdidaDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = GananciaPerdida(
    anulado: reader.readBoolOrNull(offsets[0]) ?? false,
    categoria: reader.readString(offsets[1]),
    clienteId: reader.readLongOrNull(offsets[3]),
    compraId: reader.readLongOrNull(offsets[7]),
    concepto: reader.readString(offsets[8]),
    confirmado: reader.readBoolOrNull(offsets[9]) ?? true,
    descripcion: reader.readStringOrNull(offsets[10]),
    esRecurrente: reader.readBoolOrNull(offsets[13]) ?? false,
    fecha: reader.readDateTime(offsets[15]),
    frecuenciaRecurrencia: reader.readStringOrNull(offsets[18]),
    monto: reader.readDouble(offsets[21]),
    motivoAnulacion: reader.readStringOrNull(offsets[24]),
    numeroComprobante: reader.readStringOrNull(offsets[25]),
    observaciones: reader.readStringOrNull(offsets[26]),
    ofertaId: reader.readLongOrNull(offsets[27]),
    proveedorId: reader.readLongOrNull(offsets[28]),
    tipo: reader.readString(offsets[29]),
    usuarioId: reader.readLong(offsets[31]),
    ventaId: reader.readLongOrNull(offsets[32]),
  );
  object.fechaActualizacion = reader.readDateTimeOrNull(offsets[16]);
  object.fechaCreacion = reader.readDateTime(offsets[17]);
  object.id = id;
  return object;
}

P _gananciaPerdidaDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readLongOrNull(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readBoolOrNull(offset) ?? true) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readBool(offset)) as P;
    case 12:
      return (reader.readBool(offset)) as P;
    case 13:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 14:
      return (reader.readString(offset)) as P;
    case 15:
      return (reader.readDateTime(offset)) as P;
    case 16:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 17:
      return (reader.readDateTime(offset)) as P;
    case 18:
      return (reader.readStringOrNull(offset)) as P;
    case 19:
      return (reader.readString(offset)) as P;
    case 20:
      return (reader.readStringOrNull(offset)) as P;
    case 21:
      return (reader.readDouble(offset)) as P;
    case 22:
      return (reader.readDouble(offset)) as P;
    case 23:
      return (reader.readString(offset)) as P;
    case 24:
      return (reader.readStringOrNull(offset)) as P;
    case 25:
      return (reader.readStringOrNull(offset)) as P;
    case 26:
      return (reader.readStringOrNull(offset)) as P;
    case 27:
      return (reader.readLongOrNull(offset)) as P;
    case 28:
      return (reader.readLongOrNull(offset)) as P;
    case 29:
      return (reader.readString(offset)) as P;
    case 30:
      return (reader.readString(offset)) as P;
    case 31:
      return (reader.readLong(offset)) as P;
    case 32:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _gananciaPerdidaGetId(GananciaPerdida object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _gananciaPerdidaGetLinks(GananciaPerdida object) {
  return [];
}

void _gananciaPerdidaAttach(
    IsarCollection<dynamic> col, Id id, GananciaPerdida object) {
  object.id = id;
}

extension GananciaPerdidaQueryWhereSort
    on QueryBuilder<GananciaPerdida, GananciaPerdida, QWhere> {
  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension GananciaPerdidaQueryWhere
    on QueryBuilder<GananciaPerdida, GananciaPerdida, QWhereClause> {
  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterWhereClause> idBetween(
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

extension GananciaPerdidaQueryFilter
    on QueryBuilder<GananciaPerdida, GananciaPerdida, QFilterCondition> {
  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      anuladoEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'anulado',
        value: value,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      categoriaEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'categoria',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      categoriaGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'categoria',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      categoriaLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'categoria',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      categoriaBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'categoria',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      categoriaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'categoria',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      categoriaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'categoria',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      categoriaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'categoria',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      categoriaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'categoria',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      categoriaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'categoria',
        value: '',
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      categoriaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'categoria',
        value: '',
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      categoriaFormateadaEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'categoriaFormateada',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      categoriaFormateadaGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'categoriaFormateada',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      categoriaFormateadaLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'categoriaFormateada',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      categoriaFormateadaBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'categoriaFormateada',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      categoriaFormateadaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'categoriaFormateada',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      categoriaFormateadaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'categoriaFormateada',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      categoriaFormateadaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'categoriaFormateada',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      categoriaFormateadaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'categoriaFormateada',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      categoriaFormateadaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'categoriaFormateada',
        value: '',
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      categoriaFormateadaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'categoriaFormateada',
        value: '',
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      clienteIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'clienteId',
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      clienteIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'clienteId',
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      clienteIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'clienteId',
        value: value,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      clienteIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'clienteId',
        value: value,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      clienteIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'clienteId',
        value: value,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      clienteIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'clienteId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      colorCategoriaEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'colorCategoria',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      colorCategoriaGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'colorCategoria',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      colorCategoriaLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'colorCategoria',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      colorCategoriaBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'colorCategoria',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      colorCategoriaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'colorCategoria',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      colorCategoriaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'colorCategoria',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      colorCategoriaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'colorCategoria',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      colorCategoriaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'colorCategoria',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      colorCategoriaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'colorCategoria',
        value: '',
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      colorCategoriaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'colorCategoria',
        value: '',
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      colorEstadoEqualTo(
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

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      colorEstadoGreaterThan(
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

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      colorEstadoLessThan(
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

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      colorEstadoBetween(
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

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      colorEstadoStartsWith(
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

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      colorEstadoEndsWith(
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

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      colorEstadoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'colorEstado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      colorEstadoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'colorEstado',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      colorEstadoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'colorEstado',
        value: '',
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      colorEstadoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'colorEstado',
        value: '',
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      colorTipoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'colorTipo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      colorTipoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'colorTipo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      colorTipoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'colorTipo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      colorTipoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'colorTipo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      colorTipoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'colorTipo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      colorTipoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'colorTipo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      colorTipoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'colorTipo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      colorTipoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'colorTipo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      colorTipoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'colorTipo',
        value: '',
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      colorTipoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'colorTipo',
        value: '',
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      compraIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'compraId',
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      compraIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'compraId',
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      compraIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'compraId',
        value: value,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      compraIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'compraId',
        value: value,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      compraIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'compraId',
        value: value,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      compraIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'compraId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      conceptoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'concepto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      conceptoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'concepto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      conceptoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'concepto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      conceptoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'concepto',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      conceptoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'concepto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      conceptoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'concepto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      conceptoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'concepto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      conceptoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'concepto',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      conceptoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'concepto',
        value: '',
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      conceptoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'concepto',
        value: '',
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      confirmadoEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'confirmado',
        value: value,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      descripcionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'descripcion',
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      descripcionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'descripcion',
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      descripcionEqualTo(
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

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      descripcionGreaterThan(
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

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      descripcionLessThan(
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

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      descripcionBetween(
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

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      descripcionStartsWith(
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

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      descripcionEndsWith(
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

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      descripcionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'descripcion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      descripcionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'descripcion',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      descripcionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'descripcion',
        value: '',
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      descripcionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'descripcion',
        value: '',
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      esGananciaEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'esGanancia',
        value: value,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      esPerdidaEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'esPerdida',
        value: value,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      esRecurrenteEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'esRecurrente',
        value: value,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      estadoTransaccionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estadoTransaccion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      estadoTransaccionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'estadoTransaccion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      estadoTransaccionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'estadoTransaccion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      estadoTransaccionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'estadoTransaccion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      estadoTransaccionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'estadoTransaccion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      estadoTransaccionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'estadoTransaccion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      estadoTransaccionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'estadoTransaccion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      estadoTransaccionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'estadoTransaccion',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      estadoTransaccionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estadoTransaccion',
        value: '',
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      estadoTransaccionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'estadoTransaccion',
        value: '',
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      fechaEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fecha',
        value: value,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      fechaGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fecha',
        value: value,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      fechaLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fecha',
        value: value,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      fechaBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fecha',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      fechaActualizacionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fechaActualizacion',
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      fechaActualizacionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fechaActualizacion',
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      fechaActualizacionEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaActualizacion',
        value: value,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
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

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
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

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      fechaActualizacionBetween(
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

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      fechaCreacionEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaCreacion',
        value: value,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      fechaCreacionGreaterThan(
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

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      fechaCreacionLessThan(
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

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      fechaCreacionBetween(
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

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      frecuenciaRecurrenciaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'frecuenciaRecurrencia',
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      frecuenciaRecurrenciaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'frecuenciaRecurrencia',
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      frecuenciaRecurrenciaEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frecuenciaRecurrencia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      frecuenciaRecurrenciaGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'frecuenciaRecurrencia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      frecuenciaRecurrenciaLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'frecuenciaRecurrencia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      frecuenciaRecurrenciaBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'frecuenciaRecurrencia',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      frecuenciaRecurrenciaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'frecuenciaRecurrencia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      frecuenciaRecurrenciaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'frecuenciaRecurrencia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      frecuenciaRecurrenciaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'frecuenciaRecurrencia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      frecuenciaRecurrenciaMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'frecuenciaRecurrencia',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      frecuenciaRecurrenciaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frecuenciaRecurrencia',
        value: '',
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      frecuenciaRecurrenciaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'frecuenciaRecurrencia',
        value: '',
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      iconoCategoriaEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'iconoCategoria',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      iconoCategoriaGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'iconoCategoria',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      iconoCategoriaLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'iconoCategoria',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      iconoCategoriaBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'iconoCategoria',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      iconoCategoriaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'iconoCategoria',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      iconoCategoriaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'iconoCategoria',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      iconoCategoriaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'iconoCategoria',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      iconoCategoriaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'iconoCategoria',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      iconoCategoriaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'iconoCategoria',
        value: '',
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      iconoCategoriaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'iconoCategoria',
        value: '',
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      margenFormateadoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'margenFormateado',
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      margenFormateadoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'margenFormateado',
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      margenFormateadoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'margenFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      margenFormateadoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'margenFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      margenFormateadoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'margenFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      margenFormateadoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'margenFormateado',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      margenFormateadoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'margenFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      margenFormateadoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'margenFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      margenFormateadoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'margenFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      margenFormateadoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'margenFormateado',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      margenFormateadoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'margenFormateado',
        value: '',
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      margenFormateadoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'margenFormateado',
        value: '',
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      montoEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'monto',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      montoGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'monto',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      montoLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'monto',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      montoBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'monto',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      montoConSignoEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'montoConSigno',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      montoConSignoGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'montoConSigno',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      montoConSignoLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'montoConSigno',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      montoConSignoBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'montoConSigno',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      montoFormateadoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'montoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      montoFormateadoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'montoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      montoFormateadoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'montoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      montoFormateadoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'montoFormateado',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      montoFormateadoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'montoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      montoFormateadoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'montoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      montoFormateadoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'montoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      montoFormateadoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'montoFormateado',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      montoFormateadoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'montoFormateado',
        value: '',
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      montoFormateadoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'montoFormateado',
        value: '',
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      motivoAnulacionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'motivoAnulacion',
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      motivoAnulacionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'motivoAnulacion',
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      motivoAnulacionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'motivoAnulacion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      motivoAnulacionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'motivoAnulacion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      motivoAnulacionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'motivoAnulacion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      motivoAnulacionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'motivoAnulacion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      motivoAnulacionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'motivoAnulacion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      motivoAnulacionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'motivoAnulacion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      motivoAnulacionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'motivoAnulacion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      motivoAnulacionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'motivoAnulacion',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      motivoAnulacionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'motivoAnulacion',
        value: '',
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      motivoAnulacionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'motivoAnulacion',
        value: '',
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      numeroComprobanteIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'numeroComprobante',
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      numeroComprobanteIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'numeroComprobante',
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      numeroComprobanteEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'numeroComprobante',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      numeroComprobanteGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'numeroComprobante',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      numeroComprobanteLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'numeroComprobante',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      numeroComprobanteBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'numeroComprobante',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      numeroComprobanteStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'numeroComprobante',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      numeroComprobanteEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'numeroComprobante',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      numeroComprobanteContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'numeroComprobante',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      numeroComprobanteMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'numeroComprobante',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      numeroComprobanteIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'numeroComprobante',
        value: '',
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      numeroComprobanteIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'numeroComprobante',
        value: '',
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      observacionesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'observaciones',
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      observacionesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'observaciones',
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      observacionesEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'observaciones',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      observacionesGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'observaciones',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      observacionesLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'observaciones',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      observacionesBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'observaciones',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      observacionesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'observaciones',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      observacionesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'observaciones',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      observacionesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'observaciones',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      observacionesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'observaciones',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      observacionesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'observaciones',
        value: '',
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      observacionesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'observaciones',
        value: '',
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      ofertaIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ofertaId',
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      ofertaIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ofertaId',
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      ofertaIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ofertaId',
        value: value,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      ofertaIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ofertaId',
        value: value,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      ofertaIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ofertaId',
        value: value,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      ofertaIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ofertaId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      proveedorIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'proveedorId',
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      proveedorIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'proveedorId',
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      proveedorIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'proveedorId',
        value: value,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      proveedorIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'proveedorId',
        value: value,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      proveedorIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'proveedorId',
        value: value,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      proveedorIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'proveedorId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      tipoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tipo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      tipoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tipo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      tipoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tipo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      tipoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tipo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      tipoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tipo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      tipoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tipo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      tipoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tipo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      tipoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tipo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      tipoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tipo',
        value: '',
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      tipoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tipo',
        value: '',
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      tipoFormateadoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tipoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      tipoFormateadoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tipoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      tipoFormateadoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tipoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      tipoFormateadoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tipoFormateado',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      tipoFormateadoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tipoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      tipoFormateadoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tipoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      tipoFormateadoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tipoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      tipoFormateadoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tipoFormateado',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      tipoFormateadoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tipoFormateado',
        value: '',
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      tipoFormateadoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tipoFormateado',
        value: '',
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      usuarioIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'usuarioId',
        value: value,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      usuarioIdGreaterThan(
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

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      usuarioIdLessThan(
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

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      usuarioIdBetween(
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

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      ventaIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ventaId',
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      ventaIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ventaId',
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      ventaIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ventaId',
        value: value,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      ventaIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ventaId',
        value: value,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      ventaIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ventaId',
        value: value,
      ));
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterFilterCondition>
      ventaIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ventaId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension GananciaPerdidaQueryObject
    on QueryBuilder<GananciaPerdida, GananciaPerdida, QFilterCondition> {}

extension GananciaPerdidaQueryLinks
    on QueryBuilder<GananciaPerdida, GananciaPerdida, QFilterCondition> {}

extension GananciaPerdidaQuerySortBy
    on QueryBuilder<GananciaPerdida, GananciaPerdida, QSortBy> {
  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy> sortByAnulado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'anulado', Sort.asc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      sortByAnuladoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'anulado', Sort.desc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      sortByCategoria() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoria', Sort.asc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      sortByCategoriaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoria', Sort.desc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      sortByCategoriaFormateada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoriaFormateada', Sort.asc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      sortByCategoriaFormateadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoriaFormateada', Sort.desc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      sortByClienteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clienteId', Sort.asc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      sortByClienteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clienteId', Sort.desc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      sortByColorCategoria() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorCategoria', Sort.asc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      sortByColorCategoriaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorCategoria', Sort.desc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      sortByColorEstado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorEstado', Sort.asc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      sortByColorEstadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorEstado', Sort.desc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      sortByColorTipo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorTipo', Sort.asc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      sortByColorTipoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorTipo', Sort.desc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      sortByCompraId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'compraId', Sort.asc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      sortByCompraIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'compraId', Sort.desc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      sortByConcepto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'concepto', Sort.asc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      sortByConceptoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'concepto', Sort.desc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      sortByConfirmado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'confirmado', Sort.asc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      sortByConfirmadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'confirmado', Sort.desc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      sortByDescripcion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descripcion', Sort.asc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      sortByDescripcionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descripcion', Sort.desc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      sortByEsGanancia() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esGanancia', Sort.asc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      sortByEsGananciaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esGanancia', Sort.desc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      sortByEsPerdida() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esPerdida', Sort.asc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      sortByEsPerdidaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esPerdida', Sort.desc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      sortByEsRecurrente() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esRecurrente', Sort.asc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      sortByEsRecurrenteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esRecurrente', Sort.desc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      sortByEstadoTransaccion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estadoTransaccion', Sort.asc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      sortByEstadoTransaccionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estadoTransaccion', Sort.desc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy> sortByFecha() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fecha', Sort.asc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      sortByFechaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fecha', Sort.desc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      sortByFechaActualizacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaActualizacion', Sort.asc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      sortByFechaActualizacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaActualizacion', Sort.desc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      sortByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.asc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      sortByFechaCreacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.desc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      sortByFrecuenciaRecurrencia() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frecuenciaRecurrencia', Sort.asc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      sortByFrecuenciaRecurrenciaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frecuenciaRecurrencia', Sort.desc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      sortByIconoCategoria() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconoCategoria', Sort.asc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      sortByIconoCategoriaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconoCategoria', Sort.desc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      sortByMargenFormateado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'margenFormateado', Sort.asc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      sortByMargenFormateadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'margenFormateado', Sort.desc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy> sortByMonto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monto', Sort.asc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      sortByMontoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monto', Sort.desc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      sortByMontoConSigno() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoConSigno', Sort.asc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      sortByMontoConSignoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoConSigno', Sort.desc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      sortByMontoFormateado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoFormateado', Sort.asc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      sortByMontoFormateadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoFormateado', Sort.desc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      sortByMotivoAnulacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'motivoAnulacion', Sort.asc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      sortByMotivoAnulacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'motivoAnulacion', Sort.desc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      sortByNumeroComprobante() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroComprobante', Sort.asc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      sortByNumeroComprobanteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroComprobante', Sort.desc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      sortByObservaciones() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observaciones', Sort.asc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      sortByObservacionesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observaciones', Sort.desc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      sortByOfertaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ofertaId', Sort.asc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      sortByOfertaIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ofertaId', Sort.desc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      sortByProveedorId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proveedorId', Sort.asc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      sortByProveedorIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proveedorId', Sort.desc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy> sortByTipo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo', Sort.asc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      sortByTipoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo', Sort.desc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      sortByTipoFormateado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipoFormateado', Sort.asc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      sortByTipoFormateadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipoFormateado', Sort.desc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      sortByUsuarioId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usuarioId', Sort.asc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      sortByUsuarioIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usuarioId', Sort.desc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy> sortByVentaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ventaId', Sort.asc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      sortByVentaIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ventaId', Sort.desc);
    });
  }
}

extension GananciaPerdidaQuerySortThenBy
    on QueryBuilder<GananciaPerdida, GananciaPerdida, QSortThenBy> {
  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy> thenByAnulado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'anulado', Sort.asc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      thenByAnuladoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'anulado', Sort.desc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      thenByCategoria() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoria', Sort.asc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      thenByCategoriaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoria', Sort.desc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      thenByCategoriaFormateada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoriaFormateada', Sort.asc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      thenByCategoriaFormateadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoriaFormateada', Sort.desc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      thenByClienteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clienteId', Sort.asc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      thenByClienteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clienteId', Sort.desc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      thenByColorCategoria() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorCategoria', Sort.asc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      thenByColorCategoriaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorCategoria', Sort.desc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      thenByColorEstado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorEstado', Sort.asc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      thenByColorEstadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorEstado', Sort.desc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      thenByColorTipo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorTipo', Sort.asc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      thenByColorTipoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorTipo', Sort.desc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      thenByCompraId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'compraId', Sort.asc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      thenByCompraIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'compraId', Sort.desc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      thenByConcepto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'concepto', Sort.asc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      thenByConceptoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'concepto', Sort.desc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      thenByConfirmado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'confirmado', Sort.asc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      thenByConfirmadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'confirmado', Sort.desc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      thenByDescripcion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descripcion', Sort.asc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      thenByDescripcionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descripcion', Sort.desc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      thenByEsGanancia() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esGanancia', Sort.asc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      thenByEsGananciaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esGanancia', Sort.desc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      thenByEsPerdida() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esPerdida', Sort.asc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      thenByEsPerdidaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esPerdida', Sort.desc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      thenByEsRecurrente() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esRecurrente', Sort.asc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      thenByEsRecurrenteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esRecurrente', Sort.desc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      thenByEstadoTransaccion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estadoTransaccion', Sort.asc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      thenByEstadoTransaccionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estadoTransaccion', Sort.desc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy> thenByFecha() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fecha', Sort.asc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      thenByFechaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fecha', Sort.desc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      thenByFechaActualizacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaActualizacion', Sort.asc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      thenByFechaActualizacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaActualizacion', Sort.desc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      thenByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.asc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      thenByFechaCreacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.desc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      thenByFrecuenciaRecurrencia() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frecuenciaRecurrencia', Sort.asc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      thenByFrecuenciaRecurrenciaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frecuenciaRecurrencia', Sort.desc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      thenByIconoCategoria() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconoCategoria', Sort.asc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      thenByIconoCategoriaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconoCategoria', Sort.desc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      thenByMargenFormateado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'margenFormateado', Sort.asc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      thenByMargenFormateadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'margenFormateado', Sort.desc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy> thenByMonto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monto', Sort.asc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      thenByMontoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monto', Sort.desc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      thenByMontoConSigno() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoConSigno', Sort.asc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      thenByMontoConSignoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoConSigno', Sort.desc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      thenByMontoFormateado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoFormateado', Sort.asc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      thenByMontoFormateadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoFormateado', Sort.desc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      thenByMotivoAnulacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'motivoAnulacion', Sort.asc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      thenByMotivoAnulacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'motivoAnulacion', Sort.desc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      thenByNumeroComprobante() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroComprobante', Sort.asc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      thenByNumeroComprobanteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroComprobante', Sort.desc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      thenByObservaciones() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observaciones', Sort.asc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      thenByObservacionesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observaciones', Sort.desc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      thenByOfertaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ofertaId', Sort.asc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      thenByOfertaIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ofertaId', Sort.desc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      thenByProveedorId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proveedorId', Sort.asc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      thenByProveedorIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proveedorId', Sort.desc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy> thenByTipo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo', Sort.asc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      thenByTipoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo', Sort.desc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      thenByTipoFormateado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipoFormateado', Sort.asc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      thenByTipoFormateadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipoFormateado', Sort.desc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      thenByUsuarioId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usuarioId', Sort.asc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      thenByUsuarioIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usuarioId', Sort.desc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy> thenByVentaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ventaId', Sort.asc);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QAfterSortBy>
      thenByVentaIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ventaId', Sort.desc);
    });
  }
}

extension GananciaPerdidaQueryWhereDistinct
    on QueryBuilder<GananciaPerdida, GananciaPerdida, QDistinct> {
  QueryBuilder<GananciaPerdida, GananciaPerdida, QDistinct>
      distinctByAnulado() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'anulado');
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QDistinct> distinctByCategoria(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'categoria', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QDistinct>
      distinctByCategoriaFormateada({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'categoriaFormateada',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QDistinct>
      distinctByClienteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'clienteId');
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QDistinct>
      distinctByColorCategoria({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'colorCategoria',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QDistinct>
      distinctByColorEstado({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'colorEstado', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QDistinct> distinctByColorTipo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'colorTipo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QDistinct>
      distinctByCompraId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'compraId');
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QDistinct> distinctByConcepto(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'concepto', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QDistinct>
      distinctByConfirmado() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'confirmado');
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QDistinct>
      distinctByDescripcion({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'descripcion', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QDistinct>
      distinctByEsGanancia() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'esGanancia');
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QDistinct>
      distinctByEsPerdida() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'esPerdida');
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QDistinct>
      distinctByEsRecurrente() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'esRecurrente');
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QDistinct>
      distinctByEstadoTransaccion({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estadoTransaccion',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QDistinct> distinctByFecha() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fecha');
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QDistinct>
      distinctByFechaActualizacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaActualizacion');
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QDistinct>
      distinctByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaCreacion');
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QDistinct>
      distinctByFrecuenciaRecurrencia({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'frecuenciaRecurrencia',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QDistinct>
      distinctByIconoCategoria({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'iconoCategoria',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QDistinct>
      distinctByMargenFormateado({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'margenFormateado',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QDistinct> distinctByMonto() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'monto');
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QDistinct>
      distinctByMontoConSigno() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'montoConSigno');
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QDistinct>
      distinctByMontoFormateado({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'montoFormateado',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QDistinct>
      distinctByMotivoAnulacion({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'motivoAnulacion',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QDistinct>
      distinctByNumeroComprobante({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'numeroComprobante',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QDistinct>
      distinctByObservaciones({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'observaciones',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QDistinct>
      distinctByOfertaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ofertaId');
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QDistinct>
      distinctByProveedorId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'proveedorId');
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QDistinct> distinctByTipo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tipo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QDistinct>
      distinctByTipoFormateado({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tipoFormateado',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QDistinct>
      distinctByUsuarioId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'usuarioId');
    });
  }

  QueryBuilder<GananciaPerdida, GananciaPerdida, QDistinct>
      distinctByVentaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ventaId');
    });
  }
}

extension GananciaPerdidaQueryProperty
    on QueryBuilder<GananciaPerdida, GananciaPerdida, QQueryProperty> {
  QueryBuilder<GananciaPerdida, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<GananciaPerdida, bool, QQueryOperations> anuladoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'anulado');
    });
  }

  QueryBuilder<GananciaPerdida, String, QQueryOperations> categoriaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'categoria');
    });
  }

  QueryBuilder<GananciaPerdida, String, QQueryOperations>
      categoriaFormateadaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'categoriaFormateada');
    });
  }

  QueryBuilder<GananciaPerdida, int?, QQueryOperations> clienteIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'clienteId');
    });
  }

  QueryBuilder<GananciaPerdida, String, QQueryOperations>
      colorCategoriaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'colorCategoria');
    });
  }

  QueryBuilder<GananciaPerdida, String, QQueryOperations>
      colorEstadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'colorEstado');
    });
  }

  QueryBuilder<GananciaPerdida, String, QQueryOperations> colorTipoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'colorTipo');
    });
  }

  QueryBuilder<GananciaPerdida, int?, QQueryOperations> compraIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'compraId');
    });
  }

  QueryBuilder<GananciaPerdida, String, QQueryOperations> conceptoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'concepto');
    });
  }

  QueryBuilder<GananciaPerdida, bool, QQueryOperations> confirmadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'confirmado');
    });
  }

  QueryBuilder<GananciaPerdida, String?, QQueryOperations>
      descripcionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'descripcion');
    });
  }

  QueryBuilder<GananciaPerdida, bool, QQueryOperations> esGananciaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'esGanancia');
    });
  }

  QueryBuilder<GananciaPerdida, bool, QQueryOperations> esPerdidaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'esPerdida');
    });
  }

  QueryBuilder<GananciaPerdida, bool, QQueryOperations> esRecurrenteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'esRecurrente');
    });
  }

  QueryBuilder<GananciaPerdida, String, QQueryOperations>
      estadoTransaccionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estadoTransaccion');
    });
  }

  QueryBuilder<GananciaPerdida, DateTime, QQueryOperations> fechaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fecha');
    });
  }

  QueryBuilder<GananciaPerdida, DateTime?, QQueryOperations>
      fechaActualizacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaActualizacion');
    });
  }

  QueryBuilder<GananciaPerdida, DateTime, QQueryOperations>
      fechaCreacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaCreacion');
    });
  }

  QueryBuilder<GananciaPerdida, String?, QQueryOperations>
      frecuenciaRecurrenciaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'frecuenciaRecurrencia');
    });
  }

  QueryBuilder<GananciaPerdida, String, QQueryOperations>
      iconoCategoriaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'iconoCategoria');
    });
  }

  QueryBuilder<GananciaPerdida, String?, QQueryOperations>
      margenFormateadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'margenFormateado');
    });
  }

  QueryBuilder<GananciaPerdida, double, QQueryOperations> montoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'monto');
    });
  }

  QueryBuilder<GananciaPerdida, double, QQueryOperations>
      montoConSignoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'montoConSigno');
    });
  }

  QueryBuilder<GananciaPerdida, String, QQueryOperations>
      montoFormateadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'montoFormateado');
    });
  }

  QueryBuilder<GananciaPerdida, String?, QQueryOperations>
      motivoAnulacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'motivoAnulacion');
    });
  }

  QueryBuilder<GananciaPerdida, String?, QQueryOperations>
      numeroComprobanteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'numeroComprobante');
    });
  }

  QueryBuilder<GananciaPerdida, String?, QQueryOperations>
      observacionesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'observaciones');
    });
  }

  QueryBuilder<GananciaPerdida, int?, QQueryOperations> ofertaIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ofertaId');
    });
  }

  QueryBuilder<GananciaPerdida, int?, QQueryOperations> proveedorIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'proveedorId');
    });
  }

  QueryBuilder<GananciaPerdida, String, QQueryOperations> tipoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tipo');
    });
  }

  QueryBuilder<GananciaPerdida, String, QQueryOperations>
      tipoFormateadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tipoFormateado');
    });
  }

  QueryBuilder<GananciaPerdida, int, QQueryOperations> usuarioIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'usuarioId');
    });
  }

  QueryBuilder<GananciaPerdida, int?, QQueryOperations> ventaIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ventaId');
    });
  }
}
