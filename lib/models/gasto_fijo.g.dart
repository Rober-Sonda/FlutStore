// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gasto_fijo.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetGastoFijoCollection on Isar {
  IsarCollection<GastoFijo> get gastoFijos => this.collection();
}

const GastoFijoSchema = CollectionSchema(
  name: r'GastoFijo',
  id: 8407564706073024167,
  properties: {
    r'activo': PropertySchema(
      id: 0,
      name: r'activo',
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
    r'colorCategoria': PropertySchema(
      id: 3,
      name: r'colorCategoria',
      type: IsarType.string,
    ),
    r'colorEstado': PropertySchema(
      id: 4,
      name: r'colorEstado',
      type: IsarType.string,
    ),
    r'descripcion': PropertySchema(
      id: 5,
      name: r'descripcion',
      type: IsarType.string,
    ),
    r'diaVencimiento': PropertySchema(
      id: 6,
      name: r'diaVencimiento',
      type: IsarType.long,
    ),
    r'diasAnticipacionNotificacion': PropertySchema(
      id: 7,
      name: r'diasAnticipacionNotificacion',
      type: IsarType.long,
    ),
    r'diasHastaVencimiento': PropertySchema(
      id: 8,
      name: r'diasHastaVencimiento',
      type: IsarType.long,
    ),
    r'estaProximoAVencer': PropertySchema(
      id: 9,
      name: r'estaProximoAVencer',
      type: IsarType.bool,
    ),
    r'estaVencido': PropertySchema(
      id: 10,
      name: r'estaVencido',
      type: IsarType.bool,
    ),
    r'estadoGasto': PropertySchema(
      id: 11,
      name: r'estadoGasto',
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
    r'fechasPago': PropertySchema(
      id: 14,
      name: r'fechasPago',
      type: IsarType.dateTimeList,
    ),
    r'frecuencia': PropertySchema(
      id: 15,
      name: r'frecuencia',
      type: IsarType.string,
    ),
    r'frecuenciaFormateada': PropertySchema(
      id: 16,
      name: r'frecuenciaFormateada',
      type: IsarType.string,
    ),
    r'iconoCategoria': PropertySchema(
      id: 17,
      name: r'iconoCategoria',
      type: IsarType.string,
    ),
    r'monto': PropertySchema(
      id: 18,
      name: r'monto',
      type: IsarType.double,
    ),
    r'montoFormateado': PropertySchema(
      id: 19,
      name: r'montoFormateado',
      type: IsarType.string,
    ),
    r'montoUltimoPago': PropertySchema(
      id: 20,
      name: r'montoUltimoPago',
      type: IsarType.double,
    ),
    r'montosPagados': PropertySchema(
      id: 21,
      name: r'montosPagados',
      type: IsarType.doubleList,
    ),
    r'nombre': PropertySchema(
      id: 22,
      name: r'nombre',
      type: IsarType.string,
    ),
    r'notificarVencimiento': PropertySchema(
      id: 23,
      name: r'notificarVencimiento',
      type: IsarType.bool,
    ),
    r'numeroCuenta': PropertySchema(
      id: 24,
      name: r'numeroCuenta',
      type: IsarType.string,
    ),
    r'numeroFactura': PropertySchema(
      id: 25,
      name: r'numeroFactura',
      type: IsarType.string,
    ),
    r'observaciones': PropertySchema(
      id: 26,
      name: r'observaciones',
      type: IsarType.string,
    ),
    r'promedioMensual': PropertySchema(
      id: 27,
      name: r'promedioMensual',
      type: IsarType.double,
    ),
    r'promedioMensualFormateado': PropertySchema(
      id: 28,
      name: r'promedioMensualFormateado',
      type: IsarType.string,
    ),
    r'proveedor': PropertySchema(
      id: 29,
      name: r'proveedor',
      type: IsarType.string,
    ),
    r'proximoMontoEstimado': PropertySchema(
      id: 30,
      name: r'proximoMontoEstimado',
      type: IsarType.double,
    ),
    r'proximoMontoEstimadoFormateado': PropertySchema(
      id: 31,
      name: r'proximoMontoEstimadoFormateado',
      type: IsarType.string,
    ),
    r'proximoVencimiento': PropertySchema(
      id: 32,
      name: r'proximoVencimiento',
      type: IsarType.dateTime,
    ),
    r'totalPagadoUltimoAno': PropertySchema(
      id: 33,
      name: r'totalPagadoUltimoAno',
      type: IsarType.double,
    ),
    r'totalPagadoUltimoAnoFormateado': PropertySchema(
      id: 34,
      name: r'totalPagadoUltimoAnoFormateado',
      type: IsarType.string,
    ),
    r'ultimoPago': PropertySchema(
      id: 35,
      name: r'ultimoPago',
      type: IsarType.dateTime,
    ),
    r'usuarioId': PropertySchema(
      id: 36,
      name: r'usuarioId',
      type: IsarType.long,
    )
  },
  estimateSize: _gastoFijoEstimateSize,
  serialize: _gastoFijoSerialize,
  deserialize: _gastoFijoDeserialize,
  deserializeProp: _gastoFijoDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _gastoFijoGetId,
  getLinks: _gastoFijoGetLinks,
  attach: _gastoFijoAttach,
  version: '3.1.0+1',
);

int _gastoFijoEstimateSize(
  GastoFijo object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.categoria.length * 3;
  bytesCount += 3 + object.categoriaFormateada.length * 3;
  bytesCount += 3 + object.colorCategoria.length * 3;
  bytesCount += 3 + object.colorEstado.length * 3;
  {
    final value = object.descripcion;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.estadoGasto.length * 3;
  bytesCount += 3 + object.fechasPago.length * 8;
  bytesCount += 3 + object.frecuencia.length * 3;
  bytesCount += 3 + object.frecuenciaFormateada.length * 3;
  bytesCount += 3 + object.iconoCategoria.length * 3;
  bytesCount += 3 + object.montoFormateado.length * 3;
  bytesCount += 3 + object.montosPagados.length * 8;
  bytesCount += 3 + object.nombre.length * 3;
  {
    final value = object.numeroCuenta;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.numeroFactura;
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
  bytesCount += 3 + object.promedioMensualFormateado.length * 3;
  {
    final value = object.proveedor;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.proximoMontoEstimadoFormateado.length * 3;
  bytesCount += 3 + object.totalPagadoUltimoAnoFormateado.length * 3;
  return bytesCount;
}

void _gastoFijoSerialize(
  GastoFijo object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.activo);
  writer.writeString(offsets[1], object.categoria);
  writer.writeString(offsets[2], object.categoriaFormateada);
  writer.writeString(offsets[3], object.colorCategoria);
  writer.writeString(offsets[4], object.colorEstado);
  writer.writeString(offsets[5], object.descripcion);
  writer.writeLong(offsets[6], object.diaVencimiento);
  writer.writeLong(offsets[7], object.diasAnticipacionNotificacion);
  writer.writeLong(offsets[8], object.diasHastaVencimiento);
  writer.writeBool(offsets[9], object.estaProximoAVencer);
  writer.writeBool(offsets[10], object.estaVencido);
  writer.writeString(offsets[11], object.estadoGasto);
  writer.writeDateTime(offsets[12], object.fechaActualizacion);
  writer.writeDateTime(offsets[13], object.fechaCreacion);
  writer.writeDateTimeList(offsets[14], object.fechasPago);
  writer.writeString(offsets[15], object.frecuencia);
  writer.writeString(offsets[16], object.frecuenciaFormateada);
  writer.writeString(offsets[17], object.iconoCategoria);
  writer.writeDouble(offsets[18], object.monto);
  writer.writeString(offsets[19], object.montoFormateado);
  writer.writeDouble(offsets[20], object.montoUltimoPago);
  writer.writeDoubleList(offsets[21], object.montosPagados);
  writer.writeString(offsets[22], object.nombre);
  writer.writeBool(offsets[23], object.notificarVencimiento);
  writer.writeString(offsets[24], object.numeroCuenta);
  writer.writeString(offsets[25], object.numeroFactura);
  writer.writeString(offsets[26], object.observaciones);
  writer.writeDouble(offsets[27], object.promedioMensual);
  writer.writeString(offsets[28], object.promedioMensualFormateado);
  writer.writeString(offsets[29], object.proveedor);
  writer.writeDouble(offsets[30], object.proximoMontoEstimado);
  writer.writeString(offsets[31], object.proximoMontoEstimadoFormateado);
  writer.writeDateTime(offsets[32], object.proximoVencimiento);
  writer.writeDouble(offsets[33], object.totalPagadoUltimoAno);
  writer.writeString(offsets[34], object.totalPagadoUltimoAnoFormateado);
  writer.writeDateTime(offsets[35], object.ultimoPago);
  writer.writeLong(offsets[36], object.usuarioId);
}

GastoFijo _gastoFijoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = GastoFijo(
    activo: reader.readBoolOrNull(offsets[0]) ?? true,
    categoria: reader.readString(offsets[1]),
    descripcion: reader.readStringOrNull(offsets[5]),
    diaVencimiento: reader.readLong(offsets[6]),
    diasAnticipacionNotificacion: reader.readLongOrNull(offsets[7]) ?? 7,
    frecuencia: reader.readString(offsets[15]),
    monto: reader.readDouble(offsets[18]),
    nombre: reader.readString(offsets[22]),
    notificarVencimiento: reader.readBoolOrNull(offsets[23]) ?? true,
    numeroCuenta: reader.readStringOrNull(offsets[24]),
    numeroFactura: reader.readStringOrNull(offsets[25]),
    observaciones: reader.readStringOrNull(offsets[26]),
    proveedor: reader.readStringOrNull(offsets[29]),
    usuarioId: reader.readLong(offsets[36]),
  );
  object.fechaActualizacion = reader.readDateTimeOrNull(offsets[12]);
  object.fechaCreacion = reader.readDateTime(offsets[13]);
  object.fechasPago = reader.readDateTimeList(offsets[14]) ?? [];
  object.id = id;
  object.montosPagados = reader.readDoubleList(offsets[21]) ?? [];
  return object;
}

P _gastoFijoDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBoolOrNull(offset) ?? true) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readLongOrNull(offset) ?? 7) as P;
    case 8:
      return (reader.readLong(offset)) as P;
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
      return (reader.readDateTimeList(offset) ?? []) as P;
    case 15:
      return (reader.readString(offset)) as P;
    case 16:
      return (reader.readString(offset)) as P;
    case 17:
      return (reader.readString(offset)) as P;
    case 18:
      return (reader.readDouble(offset)) as P;
    case 19:
      return (reader.readString(offset)) as P;
    case 20:
      return (reader.readDoubleOrNull(offset)) as P;
    case 21:
      return (reader.readDoubleList(offset) ?? []) as P;
    case 22:
      return (reader.readString(offset)) as P;
    case 23:
      return (reader.readBoolOrNull(offset) ?? true) as P;
    case 24:
      return (reader.readStringOrNull(offset)) as P;
    case 25:
      return (reader.readStringOrNull(offset)) as P;
    case 26:
      return (reader.readStringOrNull(offset)) as P;
    case 27:
      return (reader.readDouble(offset)) as P;
    case 28:
      return (reader.readString(offset)) as P;
    case 29:
      return (reader.readStringOrNull(offset)) as P;
    case 30:
      return (reader.readDouble(offset)) as P;
    case 31:
      return (reader.readString(offset)) as P;
    case 32:
      return (reader.readDateTime(offset)) as P;
    case 33:
      return (reader.readDouble(offset)) as P;
    case 34:
      return (reader.readString(offset)) as P;
    case 35:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 36:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _gastoFijoGetId(GastoFijo object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _gastoFijoGetLinks(GastoFijo object) {
  return [];
}

void _gastoFijoAttach(IsarCollection<dynamic> col, Id id, GastoFijo object) {
  object.id = id;
}

extension GastoFijoQueryWhereSort
    on QueryBuilder<GastoFijo, GastoFijo, QWhere> {
  QueryBuilder<GastoFijo, GastoFijo, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension GastoFijoQueryWhere
    on QueryBuilder<GastoFijo, GastoFijo, QWhereClause> {
  QueryBuilder<GastoFijo, GastoFijo, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<GastoFijo, GastoFijo, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterWhereClause> idBetween(
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

extension GastoFijoQueryFilter
    on QueryBuilder<GastoFijo, GastoFijo, QFilterCondition> {
  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition> activoEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'activo',
        value: value,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition> categoriaEqualTo(
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

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
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

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition> categoriaLessThan(
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

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition> categoriaBetween(
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

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition> categoriaStartsWith(
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

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition> categoriaEndsWith(
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

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition> categoriaContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'categoria',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition> categoriaMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'categoria',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition> categoriaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'categoria',
        value: '',
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      categoriaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'categoria',
        value: '',
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
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

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
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

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
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

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
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

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
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

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
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

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      categoriaFormateadaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'categoriaFormateada',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      categoriaFormateadaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'categoriaFormateada',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      categoriaFormateadaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'categoriaFormateada',
        value: '',
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      categoriaFormateadaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'categoriaFormateada',
        value: '',
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
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

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
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

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
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

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
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

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
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

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
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

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      colorCategoriaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'colorCategoria',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      colorCategoriaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'colorCategoria',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      colorCategoriaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'colorCategoria',
        value: '',
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      colorCategoriaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'colorCategoria',
        value: '',
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition> colorEstadoEqualTo(
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

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
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

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition> colorEstadoLessThan(
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

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition> colorEstadoBetween(
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

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
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

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition> colorEstadoEndsWith(
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

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition> colorEstadoContains(
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

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition> colorEstadoMatches(
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

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      colorEstadoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'colorEstado',
        value: '',
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      colorEstadoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'colorEstado',
        value: '',
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      descripcionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'descripcion',
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      descripcionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'descripcion',
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition> descripcionEqualTo(
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

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
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

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition> descripcionLessThan(
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

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition> descripcionBetween(
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

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
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

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition> descripcionEndsWith(
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

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition> descripcionContains(
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

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition> descripcionMatches(
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

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      descripcionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'descripcion',
        value: '',
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      descripcionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'descripcion',
        value: '',
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      diaVencimientoEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'diaVencimiento',
        value: value,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      diaVencimientoGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'diaVencimiento',
        value: value,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      diaVencimientoLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'diaVencimiento',
        value: value,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      diaVencimientoBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'diaVencimiento',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      diasAnticipacionNotificacionEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'diasAnticipacionNotificacion',
        value: value,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      diasAnticipacionNotificacionGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'diasAnticipacionNotificacion',
        value: value,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      diasAnticipacionNotificacionLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'diasAnticipacionNotificacion',
        value: value,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      diasAnticipacionNotificacionBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'diasAnticipacionNotificacion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      diasHastaVencimientoEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'diasHastaVencimiento',
        value: value,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      diasHastaVencimientoGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'diasHastaVencimiento',
        value: value,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      diasHastaVencimientoLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'diasHastaVencimiento',
        value: value,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      diasHastaVencimientoBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'diasHastaVencimiento',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      estaProximoAVencerEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estaProximoAVencer',
        value: value,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition> estaVencidoEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estaVencido',
        value: value,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition> estadoGastoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estadoGasto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      estadoGastoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'estadoGasto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition> estadoGastoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'estadoGasto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition> estadoGastoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'estadoGasto',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      estadoGastoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'estadoGasto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition> estadoGastoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'estadoGasto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition> estadoGastoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'estadoGasto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition> estadoGastoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'estadoGasto',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      estadoGastoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estadoGasto',
        value: '',
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      estadoGastoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'estadoGasto',
        value: '',
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      fechaActualizacionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fechaActualizacion',
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      fechaActualizacionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fechaActualizacion',
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      fechaActualizacionEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaActualizacion',
        value: value,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
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

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
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

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
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

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      fechaCreacionEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaCreacion',
        value: value,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
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

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
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

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
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

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      fechasPagoElementEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechasPago',
        value: value,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      fechasPagoElementGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fechasPago',
        value: value,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      fechasPagoElementLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fechasPago',
        value: value,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      fechasPagoElementBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fechasPago',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      fechasPagoLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'fechasPago',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      fechasPagoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'fechasPago',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      fechasPagoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'fechasPago',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      fechasPagoLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'fechasPago',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      fechasPagoLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'fechasPago',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      fechasPagoLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'fechasPago',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition> frecuenciaEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frecuencia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      frecuenciaGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'frecuencia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition> frecuenciaLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'frecuencia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition> frecuenciaBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'frecuencia',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      frecuenciaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'frecuencia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition> frecuenciaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'frecuencia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition> frecuenciaContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'frecuencia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition> frecuenciaMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'frecuencia',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      frecuenciaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frecuencia',
        value: '',
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      frecuenciaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'frecuencia',
        value: '',
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      frecuenciaFormateadaEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frecuenciaFormateada',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      frecuenciaFormateadaGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'frecuenciaFormateada',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      frecuenciaFormateadaLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'frecuenciaFormateada',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      frecuenciaFormateadaBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'frecuenciaFormateada',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      frecuenciaFormateadaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'frecuenciaFormateada',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      frecuenciaFormateadaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'frecuenciaFormateada',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      frecuenciaFormateadaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'frecuenciaFormateada',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      frecuenciaFormateadaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'frecuenciaFormateada',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      frecuenciaFormateadaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frecuenciaFormateada',
        value: '',
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      frecuenciaFormateadaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'frecuenciaFormateada',
        value: '',
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
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

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
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

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
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

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
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

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
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

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
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

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      iconoCategoriaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'iconoCategoria',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      iconoCategoriaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'iconoCategoria',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      iconoCategoriaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'iconoCategoria',
        value: '',
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      iconoCategoriaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'iconoCategoria',
        value: '',
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition> idBetween(
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

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition> montoEqualTo(
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

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition> montoGreaterThan(
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

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition> montoLessThan(
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

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition> montoBetween(
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

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
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

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
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

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
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

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
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

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
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

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
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

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      montoFormateadoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'montoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      montoFormateadoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'montoFormateado',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      montoFormateadoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'montoFormateado',
        value: '',
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      montoFormateadoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'montoFormateado',
        value: '',
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      montoUltimoPagoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'montoUltimoPago',
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      montoUltimoPagoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'montoUltimoPago',
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      montoUltimoPagoEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'montoUltimoPago',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      montoUltimoPagoGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'montoUltimoPago',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      montoUltimoPagoLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'montoUltimoPago',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      montoUltimoPagoBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'montoUltimoPago',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      montosPagadosElementEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'montosPagados',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      montosPagadosElementGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'montosPagados',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      montosPagadosElementLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'montosPagados',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      montosPagadosElementBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'montosPagados',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      montosPagadosLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'montosPagados',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      montosPagadosIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'montosPagados',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      montosPagadosIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'montosPagados',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      montosPagadosLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'montosPagados',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      montosPagadosLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'montosPagados',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      montosPagadosLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'montosPagados',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition> nombreEqualTo(
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

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition> nombreGreaterThan(
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

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition> nombreLessThan(
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

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition> nombreBetween(
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

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition> nombreStartsWith(
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

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition> nombreEndsWith(
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

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition> nombreContains(
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

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition> nombreMatches(
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

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition> nombreIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nombre',
        value: '',
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition> nombreIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nombre',
        value: '',
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      notificarVencimientoEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notificarVencimiento',
        value: value,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      numeroCuentaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'numeroCuenta',
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      numeroCuentaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'numeroCuenta',
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition> numeroCuentaEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'numeroCuenta',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      numeroCuentaGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'numeroCuenta',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      numeroCuentaLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'numeroCuenta',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition> numeroCuentaBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'numeroCuenta',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      numeroCuentaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'numeroCuenta',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      numeroCuentaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'numeroCuenta',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      numeroCuentaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'numeroCuenta',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition> numeroCuentaMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'numeroCuenta',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      numeroCuentaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'numeroCuenta',
        value: '',
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      numeroCuentaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'numeroCuenta',
        value: '',
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      numeroFacturaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'numeroFactura',
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      numeroFacturaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'numeroFactura',
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      numeroFacturaEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'numeroFactura',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      numeroFacturaGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'numeroFactura',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      numeroFacturaLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'numeroFactura',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      numeroFacturaBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'numeroFactura',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      numeroFacturaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'numeroFactura',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      numeroFacturaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'numeroFactura',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      numeroFacturaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'numeroFactura',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      numeroFacturaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'numeroFactura',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      numeroFacturaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'numeroFactura',
        value: '',
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      numeroFacturaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'numeroFactura',
        value: '',
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      observacionesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'observaciones',
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      observacionesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'observaciones',
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
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

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
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

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
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

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
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

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
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

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
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

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      observacionesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'observaciones',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      observacionesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'observaciones',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      observacionesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'observaciones',
        value: '',
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      observacionesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'observaciones',
        value: '',
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      promedioMensualEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'promedioMensual',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      promedioMensualGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'promedioMensual',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      promedioMensualLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'promedioMensual',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      promedioMensualBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'promedioMensual',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      promedioMensualFormateadoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'promedioMensualFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      promedioMensualFormateadoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'promedioMensualFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      promedioMensualFormateadoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'promedioMensualFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      promedioMensualFormateadoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'promedioMensualFormateado',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      promedioMensualFormateadoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'promedioMensualFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      promedioMensualFormateadoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'promedioMensualFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      promedioMensualFormateadoContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'promedioMensualFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      promedioMensualFormateadoMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'promedioMensualFormateado',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      promedioMensualFormateadoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'promedioMensualFormateado',
        value: '',
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      promedioMensualFormateadoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'promedioMensualFormateado',
        value: '',
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition> proveedorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'proveedor',
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      proveedorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'proveedor',
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition> proveedorEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'proveedor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      proveedorGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'proveedor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition> proveedorLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'proveedor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition> proveedorBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'proveedor',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition> proveedorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'proveedor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition> proveedorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'proveedor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition> proveedorContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'proveedor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition> proveedorMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'proveedor',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition> proveedorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'proveedor',
        value: '',
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      proveedorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'proveedor',
        value: '',
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      proximoMontoEstimadoEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'proximoMontoEstimado',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      proximoMontoEstimadoGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'proximoMontoEstimado',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      proximoMontoEstimadoLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'proximoMontoEstimado',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      proximoMontoEstimadoBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'proximoMontoEstimado',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      proximoMontoEstimadoFormateadoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'proximoMontoEstimadoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      proximoMontoEstimadoFormateadoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'proximoMontoEstimadoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      proximoMontoEstimadoFormateadoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'proximoMontoEstimadoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      proximoMontoEstimadoFormateadoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'proximoMontoEstimadoFormateado',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      proximoMontoEstimadoFormateadoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'proximoMontoEstimadoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      proximoMontoEstimadoFormateadoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'proximoMontoEstimadoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      proximoMontoEstimadoFormateadoContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'proximoMontoEstimadoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      proximoMontoEstimadoFormateadoMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'proximoMontoEstimadoFormateado',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      proximoMontoEstimadoFormateadoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'proximoMontoEstimadoFormateado',
        value: '',
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      proximoMontoEstimadoFormateadoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'proximoMontoEstimadoFormateado',
        value: '',
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      proximoVencimientoEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'proximoVencimiento',
        value: value,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      proximoVencimientoGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'proximoVencimiento',
        value: value,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      proximoVencimientoLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'proximoVencimiento',
        value: value,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      proximoVencimientoBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'proximoVencimiento',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      totalPagadoUltimoAnoEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalPagadoUltimoAno',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      totalPagadoUltimoAnoGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalPagadoUltimoAno',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      totalPagadoUltimoAnoLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalPagadoUltimoAno',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      totalPagadoUltimoAnoBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalPagadoUltimoAno',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      totalPagadoUltimoAnoFormateadoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalPagadoUltimoAnoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      totalPagadoUltimoAnoFormateadoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalPagadoUltimoAnoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      totalPagadoUltimoAnoFormateadoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalPagadoUltimoAnoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      totalPagadoUltimoAnoFormateadoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalPagadoUltimoAnoFormateado',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      totalPagadoUltimoAnoFormateadoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'totalPagadoUltimoAnoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      totalPagadoUltimoAnoFormateadoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'totalPagadoUltimoAnoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      totalPagadoUltimoAnoFormateadoContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'totalPagadoUltimoAnoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      totalPagadoUltimoAnoFormateadoMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'totalPagadoUltimoAnoFormateado',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      totalPagadoUltimoAnoFormateadoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalPagadoUltimoAnoFormateado',
        value: '',
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      totalPagadoUltimoAnoFormateadoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'totalPagadoUltimoAnoFormateado',
        value: '',
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition> ultimoPagoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ultimoPago',
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      ultimoPagoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ultimoPago',
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition> ultimoPagoEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ultimoPago',
        value: value,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
      ultimoPagoGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ultimoPago',
        value: value,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition> ultimoPagoLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ultimoPago',
        value: value,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition> ultimoPagoBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ultimoPago',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition> usuarioIdEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'usuarioId',
        value: value,
      ));
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition>
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

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition> usuarioIdLessThan(
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

  QueryBuilder<GastoFijo, GastoFijo, QAfterFilterCondition> usuarioIdBetween(
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

extension GastoFijoQueryObject
    on QueryBuilder<GastoFijo, GastoFijo, QFilterCondition> {}

extension GastoFijoQueryLinks
    on QueryBuilder<GastoFijo, GastoFijo, QFilterCondition> {}

extension GastoFijoQuerySortBy on QueryBuilder<GastoFijo, GastoFijo, QSortBy> {
  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> sortByActivo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activo', Sort.asc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> sortByActivoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activo', Sort.desc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> sortByCategoria() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoria', Sort.asc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> sortByCategoriaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoria', Sort.desc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> sortByCategoriaFormateada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoriaFormateada', Sort.asc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy>
      sortByCategoriaFormateadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoriaFormateada', Sort.desc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> sortByColorCategoria() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorCategoria', Sort.asc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> sortByColorCategoriaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorCategoria', Sort.desc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> sortByColorEstado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorEstado', Sort.asc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> sortByColorEstadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorEstado', Sort.desc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> sortByDescripcion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descripcion', Sort.asc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> sortByDescripcionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descripcion', Sort.desc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> sortByDiaVencimiento() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diaVencimiento', Sort.asc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> sortByDiaVencimientoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diaVencimiento', Sort.desc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy>
      sortByDiasAnticipacionNotificacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diasAnticipacionNotificacion', Sort.asc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy>
      sortByDiasAnticipacionNotificacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diasAnticipacionNotificacion', Sort.desc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy>
      sortByDiasHastaVencimiento() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diasHastaVencimiento', Sort.asc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy>
      sortByDiasHastaVencimientoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diasHastaVencimiento', Sort.desc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> sortByEstaProximoAVencer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estaProximoAVencer', Sort.asc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy>
      sortByEstaProximoAVencerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estaProximoAVencer', Sort.desc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> sortByEstaVencido() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estaVencido', Sort.asc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> sortByEstaVencidoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estaVencido', Sort.desc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> sortByEstadoGasto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estadoGasto', Sort.asc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> sortByEstadoGastoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estadoGasto', Sort.desc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> sortByFechaActualizacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaActualizacion', Sort.asc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy>
      sortByFechaActualizacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaActualizacion', Sort.desc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> sortByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.asc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> sortByFechaCreacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.desc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> sortByFrecuencia() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frecuencia', Sort.asc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> sortByFrecuenciaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frecuencia', Sort.desc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy>
      sortByFrecuenciaFormateada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frecuenciaFormateada', Sort.asc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy>
      sortByFrecuenciaFormateadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frecuenciaFormateada', Sort.desc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> sortByIconoCategoria() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconoCategoria', Sort.asc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> sortByIconoCategoriaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconoCategoria', Sort.desc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> sortByMonto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monto', Sort.asc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> sortByMontoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monto', Sort.desc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> sortByMontoFormateado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoFormateado', Sort.asc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> sortByMontoFormateadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoFormateado', Sort.desc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> sortByMontoUltimoPago() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoUltimoPago', Sort.asc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> sortByMontoUltimoPagoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoUltimoPago', Sort.desc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> sortByNombre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.asc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> sortByNombreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.desc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy>
      sortByNotificarVencimiento() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificarVencimiento', Sort.asc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy>
      sortByNotificarVencimientoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificarVencimiento', Sort.desc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> sortByNumeroCuenta() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroCuenta', Sort.asc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> sortByNumeroCuentaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroCuenta', Sort.desc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> sortByNumeroFactura() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroFactura', Sort.asc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> sortByNumeroFacturaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroFactura', Sort.desc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> sortByObservaciones() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observaciones', Sort.asc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> sortByObservacionesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observaciones', Sort.desc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> sortByPromedioMensual() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promedioMensual', Sort.asc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> sortByPromedioMensualDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promedioMensual', Sort.desc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy>
      sortByPromedioMensualFormateado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promedioMensualFormateado', Sort.asc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy>
      sortByPromedioMensualFormateadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promedioMensualFormateado', Sort.desc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> sortByProveedor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proveedor', Sort.asc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> sortByProveedorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proveedor', Sort.desc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy>
      sortByProximoMontoEstimado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proximoMontoEstimado', Sort.asc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy>
      sortByProximoMontoEstimadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proximoMontoEstimado', Sort.desc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy>
      sortByProximoMontoEstimadoFormateado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proximoMontoEstimadoFormateado', Sort.asc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy>
      sortByProximoMontoEstimadoFormateadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proximoMontoEstimadoFormateado', Sort.desc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> sortByProximoVencimiento() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proximoVencimiento', Sort.asc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy>
      sortByProximoVencimientoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proximoVencimiento', Sort.desc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy>
      sortByTotalPagadoUltimoAno() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPagadoUltimoAno', Sort.asc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy>
      sortByTotalPagadoUltimoAnoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPagadoUltimoAno', Sort.desc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy>
      sortByTotalPagadoUltimoAnoFormateado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPagadoUltimoAnoFormateado', Sort.asc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy>
      sortByTotalPagadoUltimoAnoFormateadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPagadoUltimoAnoFormateado', Sort.desc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> sortByUltimoPago() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ultimoPago', Sort.asc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> sortByUltimoPagoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ultimoPago', Sort.desc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> sortByUsuarioId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usuarioId', Sort.asc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> sortByUsuarioIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usuarioId', Sort.desc);
    });
  }
}

extension GastoFijoQuerySortThenBy
    on QueryBuilder<GastoFijo, GastoFijo, QSortThenBy> {
  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> thenByActivo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activo', Sort.asc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> thenByActivoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activo', Sort.desc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> thenByCategoria() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoria', Sort.asc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> thenByCategoriaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoria', Sort.desc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> thenByCategoriaFormateada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoriaFormateada', Sort.asc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy>
      thenByCategoriaFormateadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoriaFormateada', Sort.desc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> thenByColorCategoria() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorCategoria', Sort.asc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> thenByColorCategoriaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorCategoria', Sort.desc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> thenByColorEstado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorEstado', Sort.asc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> thenByColorEstadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorEstado', Sort.desc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> thenByDescripcion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descripcion', Sort.asc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> thenByDescripcionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descripcion', Sort.desc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> thenByDiaVencimiento() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diaVencimiento', Sort.asc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> thenByDiaVencimientoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diaVencimiento', Sort.desc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy>
      thenByDiasAnticipacionNotificacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diasAnticipacionNotificacion', Sort.asc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy>
      thenByDiasAnticipacionNotificacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diasAnticipacionNotificacion', Sort.desc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy>
      thenByDiasHastaVencimiento() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diasHastaVencimiento', Sort.asc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy>
      thenByDiasHastaVencimientoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diasHastaVencimiento', Sort.desc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> thenByEstaProximoAVencer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estaProximoAVencer', Sort.asc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy>
      thenByEstaProximoAVencerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estaProximoAVencer', Sort.desc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> thenByEstaVencido() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estaVencido', Sort.asc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> thenByEstaVencidoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estaVencido', Sort.desc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> thenByEstadoGasto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estadoGasto', Sort.asc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> thenByEstadoGastoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estadoGasto', Sort.desc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> thenByFechaActualizacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaActualizacion', Sort.asc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy>
      thenByFechaActualizacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaActualizacion', Sort.desc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> thenByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.asc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> thenByFechaCreacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.desc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> thenByFrecuencia() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frecuencia', Sort.asc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> thenByFrecuenciaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frecuencia', Sort.desc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy>
      thenByFrecuenciaFormateada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frecuenciaFormateada', Sort.asc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy>
      thenByFrecuenciaFormateadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frecuenciaFormateada', Sort.desc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> thenByIconoCategoria() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconoCategoria', Sort.asc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> thenByIconoCategoriaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconoCategoria', Sort.desc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> thenByMonto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monto', Sort.asc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> thenByMontoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monto', Sort.desc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> thenByMontoFormateado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoFormateado', Sort.asc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> thenByMontoFormateadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoFormateado', Sort.desc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> thenByMontoUltimoPago() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoUltimoPago', Sort.asc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> thenByMontoUltimoPagoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoUltimoPago', Sort.desc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> thenByNombre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.asc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> thenByNombreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.desc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy>
      thenByNotificarVencimiento() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificarVencimiento', Sort.asc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy>
      thenByNotificarVencimientoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificarVencimiento', Sort.desc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> thenByNumeroCuenta() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroCuenta', Sort.asc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> thenByNumeroCuentaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroCuenta', Sort.desc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> thenByNumeroFactura() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroFactura', Sort.asc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> thenByNumeroFacturaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroFactura', Sort.desc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> thenByObservaciones() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observaciones', Sort.asc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> thenByObservacionesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observaciones', Sort.desc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> thenByPromedioMensual() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promedioMensual', Sort.asc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> thenByPromedioMensualDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promedioMensual', Sort.desc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy>
      thenByPromedioMensualFormateado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promedioMensualFormateado', Sort.asc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy>
      thenByPromedioMensualFormateadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promedioMensualFormateado', Sort.desc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> thenByProveedor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proveedor', Sort.asc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> thenByProveedorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proveedor', Sort.desc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy>
      thenByProximoMontoEstimado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proximoMontoEstimado', Sort.asc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy>
      thenByProximoMontoEstimadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proximoMontoEstimado', Sort.desc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy>
      thenByProximoMontoEstimadoFormateado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proximoMontoEstimadoFormateado', Sort.asc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy>
      thenByProximoMontoEstimadoFormateadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proximoMontoEstimadoFormateado', Sort.desc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> thenByProximoVencimiento() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proximoVencimiento', Sort.asc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy>
      thenByProximoVencimientoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proximoVencimiento', Sort.desc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy>
      thenByTotalPagadoUltimoAno() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPagadoUltimoAno', Sort.asc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy>
      thenByTotalPagadoUltimoAnoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPagadoUltimoAno', Sort.desc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy>
      thenByTotalPagadoUltimoAnoFormateado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPagadoUltimoAnoFormateado', Sort.asc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy>
      thenByTotalPagadoUltimoAnoFormateadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPagadoUltimoAnoFormateado', Sort.desc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> thenByUltimoPago() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ultimoPago', Sort.asc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> thenByUltimoPagoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ultimoPago', Sort.desc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> thenByUsuarioId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usuarioId', Sort.asc);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QAfterSortBy> thenByUsuarioIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usuarioId', Sort.desc);
    });
  }
}

extension GastoFijoQueryWhereDistinct
    on QueryBuilder<GastoFijo, GastoFijo, QDistinct> {
  QueryBuilder<GastoFijo, GastoFijo, QDistinct> distinctByActivo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'activo');
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QDistinct> distinctByCategoria(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'categoria', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QDistinct> distinctByCategoriaFormateada(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'categoriaFormateada',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QDistinct> distinctByColorCategoria(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'colorCategoria',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QDistinct> distinctByColorEstado(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'colorEstado', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QDistinct> distinctByDescripcion(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'descripcion', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QDistinct> distinctByDiaVencimiento() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'diaVencimiento');
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QDistinct>
      distinctByDiasAnticipacionNotificacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'diasAnticipacionNotificacion');
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QDistinct>
      distinctByDiasHastaVencimiento() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'diasHastaVencimiento');
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QDistinct> distinctByEstaProximoAVencer() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estaProximoAVencer');
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QDistinct> distinctByEstaVencido() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estaVencido');
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QDistinct> distinctByEstadoGasto(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estadoGasto', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QDistinct> distinctByFechaActualizacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaActualizacion');
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QDistinct> distinctByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaCreacion');
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QDistinct> distinctByFechasPago() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechasPago');
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QDistinct> distinctByFrecuencia(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'frecuencia', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QDistinct> distinctByFrecuenciaFormateada(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'frecuenciaFormateada',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QDistinct> distinctByIconoCategoria(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'iconoCategoria',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QDistinct> distinctByMonto() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'monto');
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QDistinct> distinctByMontoFormateado(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'montoFormateado',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QDistinct> distinctByMontoUltimoPago() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'montoUltimoPago');
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QDistinct> distinctByMontosPagados() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'montosPagados');
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QDistinct> distinctByNombre(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nombre', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QDistinct>
      distinctByNotificarVencimiento() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notificarVencimiento');
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QDistinct> distinctByNumeroCuenta(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'numeroCuenta', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QDistinct> distinctByNumeroFactura(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'numeroFactura',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QDistinct> distinctByObservaciones(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'observaciones',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QDistinct> distinctByPromedioMensual() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'promedioMensual');
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QDistinct>
      distinctByPromedioMensualFormateado({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'promedioMensualFormateado',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QDistinct> distinctByProveedor(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'proveedor', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QDistinct>
      distinctByProximoMontoEstimado() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'proximoMontoEstimado');
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QDistinct>
      distinctByProximoMontoEstimadoFormateado({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'proximoMontoEstimadoFormateado',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QDistinct> distinctByProximoVencimiento() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'proximoVencimiento');
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QDistinct>
      distinctByTotalPagadoUltimoAno() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalPagadoUltimoAno');
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QDistinct>
      distinctByTotalPagadoUltimoAnoFormateado({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalPagadoUltimoAnoFormateado',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QDistinct> distinctByUltimoPago() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ultimoPago');
    });
  }

  QueryBuilder<GastoFijo, GastoFijo, QDistinct> distinctByUsuarioId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'usuarioId');
    });
  }
}

extension GastoFijoQueryProperty
    on QueryBuilder<GastoFijo, GastoFijo, QQueryProperty> {
  QueryBuilder<GastoFijo, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<GastoFijo, bool, QQueryOperations> activoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'activo');
    });
  }

  QueryBuilder<GastoFijo, String, QQueryOperations> categoriaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'categoria');
    });
  }

  QueryBuilder<GastoFijo, String, QQueryOperations>
      categoriaFormateadaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'categoriaFormateada');
    });
  }

  QueryBuilder<GastoFijo, String, QQueryOperations> colorCategoriaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'colorCategoria');
    });
  }

  QueryBuilder<GastoFijo, String, QQueryOperations> colorEstadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'colorEstado');
    });
  }

  QueryBuilder<GastoFijo, String?, QQueryOperations> descripcionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'descripcion');
    });
  }

  QueryBuilder<GastoFijo, int, QQueryOperations> diaVencimientoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'diaVencimiento');
    });
  }

  QueryBuilder<GastoFijo, int, QQueryOperations>
      diasAnticipacionNotificacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'diasAnticipacionNotificacion');
    });
  }

  QueryBuilder<GastoFijo, int, QQueryOperations>
      diasHastaVencimientoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'diasHastaVencimiento');
    });
  }

  QueryBuilder<GastoFijo, bool, QQueryOperations> estaProximoAVencerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estaProximoAVencer');
    });
  }

  QueryBuilder<GastoFijo, bool, QQueryOperations> estaVencidoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estaVencido');
    });
  }

  QueryBuilder<GastoFijo, String, QQueryOperations> estadoGastoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estadoGasto');
    });
  }

  QueryBuilder<GastoFijo, DateTime?, QQueryOperations>
      fechaActualizacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaActualizacion');
    });
  }

  QueryBuilder<GastoFijo, DateTime, QQueryOperations> fechaCreacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaCreacion');
    });
  }

  QueryBuilder<GastoFijo, List<DateTime>, QQueryOperations>
      fechasPagoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechasPago');
    });
  }

  QueryBuilder<GastoFijo, String, QQueryOperations> frecuenciaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'frecuencia');
    });
  }

  QueryBuilder<GastoFijo, String, QQueryOperations>
      frecuenciaFormateadaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'frecuenciaFormateada');
    });
  }

  QueryBuilder<GastoFijo, String, QQueryOperations> iconoCategoriaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'iconoCategoria');
    });
  }

  QueryBuilder<GastoFijo, double, QQueryOperations> montoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'monto');
    });
  }

  QueryBuilder<GastoFijo, String, QQueryOperations> montoFormateadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'montoFormateado');
    });
  }

  QueryBuilder<GastoFijo, double?, QQueryOperations> montoUltimoPagoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'montoUltimoPago');
    });
  }

  QueryBuilder<GastoFijo, List<double>, QQueryOperations>
      montosPagadosProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'montosPagados');
    });
  }

  QueryBuilder<GastoFijo, String, QQueryOperations> nombreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nombre');
    });
  }

  QueryBuilder<GastoFijo, bool, QQueryOperations>
      notificarVencimientoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notificarVencimiento');
    });
  }

  QueryBuilder<GastoFijo, String?, QQueryOperations> numeroCuentaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'numeroCuenta');
    });
  }

  QueryBuilder<GastoFijo, String?, QQueryOperations> numeroFacturaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'numeroFactura');
    });
  }

  QueryBuilder<GastoFijo, String?, QQueryOperations> observacionesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'observaciones');
    });
  }

  QueryBuilder<GastoFijo, double, QQueryOperations> promedioMensualProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'promedioMensual');
    });
  }

  QueryBuilder<GastoFijo, String, QQueryOperations>
      promedioMensualFormateadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'promedioMensualFormateado');
    });
  }

  QueryBuilder<GastoFijo, String?, QQueryOperations> proveedorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'proveedor');
    });
  }

  QueryBuilder<GastoFijo, double, QQueryOperations>
      proximoMontoEstimadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'proximoMontoEstimado');
    });
  }

  QueryBuilder<GastoFijo, String, QQueryOperations>
      proximoMontoEstimadoFormateadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'proximoMontoEstimadoFormateado');
    });
  }

  QueryBuilder<GastoFijo, DateTime, QQueryOperations>
      proximoVencimientoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'proximoVencimiento');
    });
  }

  QueryBuilder<GastoFijo, double, QQueryOperations>
      totalPagadoUltimoAnoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalPagadoUltimoAno');
    });
  }

  QueryBuilder<GastoFijo, String, QQueryOperations>
      totalPagadoUltimoAnoFormateadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalPagadoUltimoAnoFormateado');
    });
  }

  QueryBuilder<GastoFijo, DateTime?, QQueryOperations> ultimoPagoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ultimoPago');
    });
  }

  QueryBuilder<GastoFijo, int, QQueryOperations> usuarioIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'usuarioId');
    });
  }
}
