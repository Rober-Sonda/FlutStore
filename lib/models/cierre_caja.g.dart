// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cierre_caja.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCierreCajaCollection on Isar {
  IsarCollection<CierreCaja> get cierreCajas => this.collection();
}

const CierreCajaSchema = CollectionSchema(
  name: r'CierreCaja',
  id: 3498423212244027985,
  properties: {
    r'abierto': PropertySchema(
      id: 0,
      name: r'abierto',
      type: IsarType.bool,
    ),
    r'anulado': PropertySchema(
      id: 1,
      name: r'anulado',
      type: IsarType.bool,
    ),
    r'colorDiferencia': PropertySchema(
      id: 2,
      name: r'colorDiferencia',
      type: IsarType.string,
    ),
    r'colorEstado': PropertySchema(
      id: 3,
      name: r'colorEstado',
      type: IsarType.string,
    ),
    r'confirmado': PropertySchema(
      id: 4,
      name: r'confirmado',
      type: IsarType.bool,
    ),
    r'diferencia': PropertySchema(
      id: 5,
      name: r'diferencia',
      type: IsarType.double,
    ),
    r'diferenciaCalculada': PropertySchema(
      id: 6,
      name: r'diferenciaCalculada',
      type: IsarType.double,
    ),
    r'diferenciaFormateada': PropertySchema(
      id: 7,
      name: r'diferenciaFormateada',
      type: IsarType.string,
    ),
    r'duracionFormateada': PropertySchema(
      id: 8,
      name: r'duracionFormateada',
      type: IsarType.string,
    ),
    r'estadoCierre': PropertySchema(
      id: 9,
      name: r'estadoCierre',
      type: IsarType.string,
    ),
    r'fechaActualizacion': PropertySchema(
      id: 10,
      name: r'fechaActualizacion',
      type: IsarType.dateTime,
    ),
    r'fechaApertura': PropertySchema(
      id: 11,
      name: r'fechaApertura',
      type: IsarType.dateTime,
    ),
    r'fechaCierre': PropertySchema(
      id: 12,
      name: r'fechaCierre',
      type: IsarType.dateTime,
    ),
    r'fechaCreacion': PropertySchema(
      id: 13,
      name: r'fechaCreacion',
      type: IsarType.dateTime,
    ),
    r'hayDiferencia': PropertySchema(
      id: 14,
      name: r'hayDiferencia',
      type: IsarType.bool,
    ),
    r'mensajeDiferencia': PropertySchema(
      id: 15,
      name: r'mensajeDiferencia',
      type: IsarType.string,
    ),
    r'montoCheque': PropertySchema(
      id: 16,
      name: r'montoCheque',
      type: IsarType.double,
    ),
    r'montoEfectivo': PropertySchema(
      id: 17,
      name: r'montoEfectivo',
      type: IsarType.double,
    ),
    r'montoOtros': PropertySchema(
      id: 18,
      name: r'montoOtros',
      type: IsarType.double,
    ),
    r'montoPagoMovil': PropertySchema(
      id: 19,
      name: r'montoPagoMovil',
      type: IsarType.double,
    ),
    r'montoTarjeta': PropertySchema(
      id: 20,
      name: r'montoTarjeta',
      type: IsarType.double,
    ),
    r'montoTransferencia': PropertySchema(
      id: 21,
      name: r'montoTransferencia',
      type: IsarType.double,
    ),
    r'motivoAnulacion': PropertySchema(
      id: 22,
      name: r'motivoAnulacion',
      type: IsarType.string,
    ),
    r'numeroCierre': PropertySchema(
      id: 23,
      name: r'numeroCierre',
      type: IsarType.string,
    ),
    r'observaciones': PropertySchema(
      id: 24,
      name: r'observaciones',
      type: IsarType.string,
    ),
    r'saldoEsperado': PropertySchema(
      id: 25,
      name: r'saldoEsperado',
      type: IsarType.double,
    ),
    r'saldoFinal': PropertySchema(
      id: 26,
      name: r'saldoFinal',
      type: IsarType.double,
    ),
    r'saldoFinalCalculado': PropertySchema(
      id: 27,
      name: r'saldoFinalCalculado',
      type: IsarType.double,
    ),
    r'saldoFinalFormateado': PropertySchema(
      id: 28,
      name: r'saldoFinalFormateado',
      type: IsarType.string,
    ),
    r'totalEgresos': PropertySchema(
      id: 29,
      name: r'totalEgresos',
      type: IsarType.double,
    ),
    r'totalFormateado': PropertySchema(
      id: 30,
      name: r'totalFormateado',
      type: IsarType.string,
    ),
    r'totalIngresos': PropertySchema(
      id: 31,
      name: r'totalIngresos',
      type: IsarType.double,
    ),
    r'totalIngresosCalculado': PropertySchema(
      id: 32,
      name: r'totalIngresosCalculado',
      type: IsarType.double,
    ),
    r'usuarioId': PropertySchema(
      id: 33,
      name: r'usuarioId',
      type: IsarType.long,
    )
  },
  estimateSize: _cierreCajaEstimateSize,
  serialize: _cierreCajaSerialize,
  deserialize: _cierreCajaDeserialize,
  deserializeProp: _cierreCajaDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _cierreCajaGetId,
  getLinks: _cierreCajaGetLinks,
  attach: _cierreCajaAttach,
  version: '3.1.0+1',
);

int _cierreCajaEstimateSize(
  CierreCaja object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.colorDiferencia.length * 3;
  bytesCount += 3 + object.colorEstado.length * 3;
  bytesCount += 3 + object.diferenciaFormateada.length * 3;
  bytesCount += 3 + object.duracionFormateada.length * 3;
  bytesCount += 3 + object.estadoCierre.length * 3;
  bytesCount += 3 + object.mensajeDiferencia.length * 3;
  {
    final value = object.motivoAnulacion;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.numeroCierre.length * 3;
  {
    final value = object.observaciones;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.saldoFinalFormateado.length * 3;
  bytesCount += 3 + object.totalFormateado.length * 3;
  return bytesCount;
}

void _cierreCajaSerialize(
  CierreCaja object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.abierto);
  writer.writeBool(offsets[1], object.anulado);
  writer.writeString(offsets[2], object.colorDiferencia);
  writer.writeString(offsets[3], object.colorEstado);
  writer.writeBool(offsets[4], object.confirmado);
  writer.writeDouble(offsets[5], object.diferencia);
  writer.writeDouble(offsets[6], object.diferenciaCalculada);
  writer.writeString(offsets[7], object.diferenciaFormateada);
  writer.writeString(offsets[8], object.duracionFormateada);
  writer.writeString(offsets[9], object.estadoCierre);
  writer.writeDateTime(offsets[10], object.fechaActualizacion);
  writer.writeDateTime(offsets[11], object.fechaApertura);
  writer.writeDateTime(offsets[12], object.fechaCierre);
  writer.writeDateTime(offsets[13], object.fechaCreacion);
  writer.writeBool(offsets[14], object.hayDiferencia);
  writer.writeString(offsets[15], object.mensajeDiferencia);
  writer.writeDouble(offsets[16], object.montoCheque);
  writer.writeDouble(offsets[17], object.montoEfectivo);
  writer.writeDouble(offsets[18], object.montoOtros);
  writer.writeDouble(offsets[19], object.montoPagoMovil);
  writer.writeDouble(offsets[20], object.montoTarjeta);
  writer.writeDouble(offsets[21], object.montoTransferencia);
  writer.writeString(offsets[22], object.motivoAnulacion);
  writer.writeString(offsets[23], object.numeroCierre);
  writer.writeString(offsets[24], object.observaciones);
  writer.writeDouble(offsets[25], object.saldoEsperado);
  writer.writeDouble(offsets[26], object.saldoFinal);
  writer.writeDouble(offsets[27], object.saldoFinalCalculado);
  writer.writeString(offsets[28], object.saldoFinalFormateado);
  writer.writeDouble(offsets[29], object.totalEgresos);
  writer.writeString(offsets[30], object.totalFormateado);
  writer.writeDouble(offsets[31], object.totalIngresos);
  writer.writeDouble(offsets[32], object.totalIngresosCalculado);
  writer.writeLong(offsets[33], object.usuarioId);
}

CierreCaja _cierreCajaDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CierreCaja(
    abierto: reader.readBoolOrNull(offsets[0]) ?? true,
    anulado: reader.readBoolOrNull(offsets[1]) ?? false,
    confirmado: reader.readBoolOrNull(offsets[4]) ?? false,
    diferencia: reader.readDoubleOrNull(offsets[5]) ?? 0.0,
    fechaApertura: reader.readDateTime(offsets[11]),
    fechaCierre: reader.readDateTimeOrNull(offsets[12]),
    montoCheque: reader.readDoubleOrNull(offsets[16]) ?? 0.0,
    montoEfectivo: reader.readDoubleOrNull(offsets[17]) ?? 0.0,
    montoOtros: reader.readDoubleOrNull(offsets[18]) ?? 0.0,
    montoPagoMovil: reader.readDoubleOrNull(offsets[19]) ?? 0.0,
    montoTarjeta: reader.readDoubleOrNull(offsets[20]) ?? 0.0,
    montoTransferencia: reader.readDoubleOrNull(offsets[21]) ?? 0.0,
    motivoAnulacion: reader.readStringOrNull(offsets[22]),
    numeroCierre: reader.readString(offsets[23]),
    observaciones: reader.readStringOrNull(offsets[24]),
    saldoEsperado: reader.readDoubleOrNull(offsets[25]) ?? 0.0,
    saldoFinal: reader.readDoubleOrNull(offsets[26]) ?? 0.0,
    totalEgresos: reader.readDoubleOrNull(offsets[29]) ?? 0.0,
    totalIngresos: reader.readDoubleOrNull(offsets[31]) ?? 0.0,
    usuarioId: reader.readLong(offsets[33]),
  );
  object.fechaActualizacion = reader.readDateTimeOrNull(offsets[10]);
  object.fechaCreacion = reader.readDateTime(offsets[13]);
  object.id = id;
  return object;
}

P _cierreCajaDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBoolOrNull(offset) ?? true) as P;
    case 1:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 5:
      return (reader.readDoubleOrNull(offset) ?? 0.0) as P;
    case 6:
      return (reader.readDouble(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 11:
      return (reader.readDateTime(offset)) as P;
    case 12:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 13:
      return (reader.readDateTime(offset)) as P;
    case 14:
      return (reader.readBool(offset)) as P;
    case 15:
      return (reader.readString(offset)) as P;
    case 16:
      return (reader.readDoubleOrNull(offset) ?? 0.0) as P;
    case 17:
      return (reader.readDoubleOrNull(offset) ?? 0.0) as P;
    case 18:
      return (reader.readDoubleOrNull(offset) ?? 0.0) as P;
    case 19:
      return (reader.readDoubleOrNull(offset) ?? 0.0) as P;
    case 20:
      return (reader.readDoubleOrNull(offset) ?? 0.0) as P;
    case 21:
      return (reader.readDoubleOrNull(offset) ?? 0.0) as P;
    case 22:
      return (reader.readStringOrNull(offset)) as P;
    case 23:
      return (reader.readString(offset)) as P;
    case 24:
      return (reader.readStringOrNull(offset)) as P;
    case 25:
      return (reader.readDoubleOrNull(offset) ?? 0.0) as P;
    case 26:
      return (reader.readDoubleOrNull(offset) ?? 0.0) as P;
    case 27:
      return (reader.readDouble(offset)) as P;
    case 28:
      return (reader.readString(offset)) as P;
    case 29:
      return (reader.readDoubleOrNull(offset) ?? 0.0) as P;
    case 30:
      return (reader.readString(offset)) as P;
    case 31:
      return (reader.readDoubleOrNull(offset) ?? 0.0) as P;
    case 32:
      return (reader.readDouble(offset)) as P;
    case 33:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _cierreCajaGetId(CierreCaja object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _cierreCajaGetLinks(CierreCaja object) {
  return [];
}

void _cierreCajaAttach(IsarCollection<dynamic> col, Id id, CierreCaja object) {
  object.id = id;
}

extension CierreCajaQueryWhereSort
    on QueryBuilder<CierreCaja, CierreCaja, QWhere> {
  QueryBuilder<CierreCaja, CierreCaja, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CierreCajaQueryWhere
    on QueryBuilder<CierreCaja, CierreCaja, QWhereClause> {
  QueryBuilder<CierreCaja, CierreCaja, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<CierreCaja, CierreCaja, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterWhereClause> idBetween(
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

extension CierreCajaQueryFilter
    on QueryBuilder<CierreCaja, CierreCaja, QFilterCondition> {
  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition> abiertoEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'abierto',
        value: value,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition> anuladoEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'anulado',
        value: value,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      colorDiferenciaEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'colorDiferencia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      colorDiferenciaGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'colorDiferencia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      colorDiferenciaLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'colorDiferencia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      colorDiferenciaBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'colorDiferencia',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      colorDiferenciaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'colorDiferencia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      colorDiferenciaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'colorDiferencia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      colorDiferenciaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'colorDiferencia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      colorDiferenciaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'colorDiferencia',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      colorDiferenciaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'colorDiferencia',
        value: '',
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      colorDiferenciaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'colorDiferencia',
        value: '',
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
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

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
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

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
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

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
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

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
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

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
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

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      colorEstadoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'colorEstado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      colorEstadoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'colorEstado',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      colorEstadoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'colorEstado',
        value: '',
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      colorEstadoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'colorEstado',
        value: '',
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition> confirmadoEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'confirmado',
        value: value,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition> diferenciaEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'diferencia',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      diferenciaGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'diferencia',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      diferenciaLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'diferencia',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition> diferenciaBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'diferencia',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      diferenciaCalculadaEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'diferenciaCalculada',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      diferenciaCalculadaGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'diferenciaCalculada',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      diferenciaCalculadaLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'diferenciaCalculada',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      diferenciaCalculadaBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'diferenciaCalculada',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      diferenciaFormateadaEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'diferenciaFormateada',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      diferenciaFormateadaGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'diferenciaFormateada',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      diferenciaFormateadaLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'diferenciaFormateada',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      diferenciaFormateadaBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'diferenciaFormateada',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      diferenciaFormateadaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'diferenciaFormateada',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      diferenciaFormateadaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'diferenciaFormateada',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      diferenciaFormateadaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'diferenciaFormateada',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      diferenciaFormateadaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'diferenciaFormateada',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      diferenciaFormateadaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'diferenciaFormateada',
        value: '',
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      diferenciaFormateadaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'diferenciaFormateada',
        value: '',
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      duracionFormateadaEqualTo(
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

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
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

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
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

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      duracionFormateadaBetween(
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

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
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

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
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

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      duracionFormateadaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'duracionFormateada',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      duracionFormateadaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'duracionFormateada',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      duracionFormateadaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'duracionFormateada',
        value: '',
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      duracionFormateadaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'duracionFormateada',
        value: '',
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      estadoCierreEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estadoCierre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      estadoCierreGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'estadoCierre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      estadoCierreLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'estadoCierre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      estadoCierreBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'estadoCierre',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      estadoCierreStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'estadoCierre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      estadoCierreEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'estadoCierre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      estadoCierreContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'estadoCierre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      estadoCierreMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'estadoCierre',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      estadoCierreIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estadoCierre',
        value: '',
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      estadoCierreIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'estadoCierre',
        value: '',
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      fechaActualizacionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fechaActualizacion',
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      fechaActualizacionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fechaActualizacion',
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      fechaActualizacionEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaActualizacion',
        value: value,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
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

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
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

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
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

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      fechaAperturaEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaApertura',
        value: value,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      fechaAperturaGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fechaApertura',
        value: value,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      fechaAperturaLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fechaApertura',
        value: value,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      fechaAperturaBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fechaApertura',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      fechaCierreIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fechaCierre',
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      fechaCierreIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fechaCierre',
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      fechaCierreEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaCierre',
        value: value,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      fechaCierreGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fechaCierre',
        value: value,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      fechaCierreLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fechaCierre',
        value: value,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      fechaCierreBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fechaCierre',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      fechaCreacionEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaCreacion',
        value: value,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
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

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
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

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
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

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      hayDiferenciaEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hayDiferencia',
        value: value,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition> idBetween(
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

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      mensajeDiferenciaEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mensajeDiferencia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      mensajeDiferenciaGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mensajeDiferencia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      mensajeDiferenciaLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mensajeDiferencia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      mensajeDiferenciaBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mensajeDiferencia',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      mensajeDiferenciaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'mensajeDiferencia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      mensajeDiferenciaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'mensajeDiferencia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      mensajeDiferenciaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'mensajeDiferencia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      mensajeDiferenciaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'mensajeDiferencia',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      mensajeDiferenciaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mensajeDiferencia',
        value: '',
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      mensajeDiferenciaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'mensajeDiferencia',
        value: '',
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      montoChequeEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'montoCheque',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      montoChequeGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'montoCheque',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      montoChequeLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'montoCheque',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      montoChequeBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'montoCheque',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      montoEfectivoEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'montoEfectivo',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      montoEfectivoGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'montoEfectivo',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      montoEfectivoLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'montoEfectivo',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      montoEfectivoBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'montoEfectivo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition> montoOtrosEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'montoOtros',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      montoOtrosGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'montoOtros',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      montoOtrosLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'montoOtros',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition> montoOtrosBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'montoOtros',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      montoPagoMovilEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'montoPagoMovil',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      montoPagoMovilGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'montoPagoMovil',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      montoPagoMovilLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'montoPagoMovil',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      montoPagoMovilBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'montoPagoMovil',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      montoTarjetaEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'montoTarjeta',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      montoTarjetaGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'montoTarjeta',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      montoTarjetaLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'montoTarjeta',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      montoTarjetaBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'montoTarjeta',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      montoTransferenciaEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'montoTransferencia',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      montoTransferenciaGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'montoTransferencia',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      montoTransferenciaLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'montoTransferencia',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      montoTransferenciaBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'montoTransferencia',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      motivoAnulacionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'motivoAnulacion',
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      motivoAnulacionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'motivoAnulacion',
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
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

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
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

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
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

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
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

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
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

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
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

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      motivoAnulacionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'motivoAnulacion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      motivoAnulacionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'motivoAnulacion',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      motivoAnulacionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'motivoAnulacion',
        value: '',
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      motivoAnulacionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'motivoAnulacion',
        value: '',
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      numeroCierreEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'numeroCierre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      numeroCierreGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'numeroCierre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      numeroCierreLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'numeroCierre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      numeroCierreBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'numeroCierre',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      numeroCierreStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'numeroCierre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      numeroCierreEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'numeroCierre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      numeroCierreContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'numeroCierre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      numeroCierreMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'numeroCierre',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      numeroCierreIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'numeroCierre',
        value: '',
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      numeroCierreIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'numeroCierre',
        value: '',
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      observacionesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'observaciones',
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      observacionesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'observaciones',
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
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

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
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

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
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

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
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

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
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

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
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

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      observacionesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'observaciones',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      observacionesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'observaciones',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      observacionesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'observaciones',
        value: '',
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      observacionesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'observaciones',
        value: '',
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      saldoEsperadoEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'saldoEsperado',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      saldoEsperadoGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'saldoEsperado',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      saldoEsperadoLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'saldoEsperado',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      saldoEsperadoBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'saldoEsperado',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition> saldoFinalEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'saldoFinal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      saldoFinalGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'saldoFinal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      saldoFinalLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'saldoFinal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition> saldoFinalBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'saldoFinal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      saldoFinalCalculadoEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'saldoFinalCalculado',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      saldoFinalCalculadoGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'saldoFinalCalculado',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      saldoFinalCalculadoLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'saldoFinalCalculado',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      saldoFinalCalculadoBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'saldoFinalCalculado',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      saldoFinalFormateadoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'saldoFinalFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      saldoFinalFormateadoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'saldoFinalFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      saldoFinalFormateadoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'saldoFinalFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      saldoFinalFormateadoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'saldoFinalFormateado',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      saldoFinalFormateadoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'saldoFinalFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      saldoFinalFormateadoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'saldoFinalFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      saldoFinalFormateadoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'saldoFinalFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      saldoFinalFormateadoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'saldoFinalFormateado',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      saldoFinalFormateadoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'saldoFinalFormateado',
        value: '',
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      saldoFinalFormateadoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'saldoFinalFormateado',
        value: '',
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      totalEgresosEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalEgresos',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      totalEgresosGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalEgresos',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      totalEgresosLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalEgresos',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      totalEgresosBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalEgresos',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      totalFormateadoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      totalFormateadoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      totalFormateadoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      totalFormateadoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalFormateado',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      totalFormateadoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'totalFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      totalFormateadoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'totalFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      totalFormateadoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'totalFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      totalFormateadoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'totalFormateado',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      totalFormateadoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalFormateado',
        value: '',
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      totalFormateadoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'totalFormateado',
        value: '',
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      totalIngresosEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalIngresos',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      totalIngresosGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalIngresos',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      totalIngresosLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalIngresos',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      totalIngresosBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalIngresos',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      totalIngresosCalculadoEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalIngresosCalculado',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      totalIngresosCalculadoGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalIngresosCalculado',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      totalIngresosCalculadoLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalIngresosCalculado',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
      totalIngresosCalculadoBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalIngresosCalculado',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition> usuarioIdEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'usuarioId',
        value: value,
      ));
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition>
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

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition> usuarioIdLessThan(
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

  QueryBuilder<CierreCaja, CierreCaja, QAfterFilterCondition> usuarioIdBetween(
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

extension CierreCajaQueryObject
    on QueryBuilder<CierreCaja, CierreCaja, QFilterCondition> {}

extension CierreCajaQueryLinks
    on QueryBuilder<CierreCaja, CierreCaja, QFilterCondition> {}

extension CierreCajaQuerySortBy
    on QueryBuilder<CierreCaja, CierreCaja, QSortBy> {
  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> sortByAbierto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'abierto', Sort.asc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> sortByAbiertoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'abierto', Sort.desc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> sortByAnulado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'anulado', Sort.asc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> sortByAnuladoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'anulado', Sort.desc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> sortByColorDiferencia() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorDiferencia', Sort.asc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy>
      sortByColorDiferenciaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorDiferencia', Sort.desc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> sortByColorEstado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorEstado', Sort.asc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> sortByColorEstadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorEstado', Sort.desc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> sortByConfirmado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'confirmado', Sort.asc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> sortByConfirmadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'confirmado', Sort.desc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> sortByDiferencia() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diferencia', Sort.asc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> sortByDiferenciaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diferencia', Sort.desc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy>
      sortByDiferenciaCalculada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diferenciaCalculada', Sort.asc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy>
      sortByDiferenciaCalculadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diferenciaCalculada', Sort.desc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy>
      sortByDiferenciaFormateada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diferenciaFormateada', Sort.asc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy>
      sortByDiferenciaFormateadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diferenciaFormateada', Sort.desc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy>
      sortByDuracionFormateada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'duracionFormateada', Sort.asc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy>
      sortByDuracionFormateadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'duracionFormateada', Sort.desc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> sortByEstadoCierre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estadoCierre', Sort.asc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> sortByEstadoCierreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estadoCierre', Sort.desc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy>
      sortByFechaActualizacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaActualizacion', Sort.asc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy>
      sortByFechaActualizacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaActualizacion', Sort.desc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> sortByFechaApertura() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaApertura', Sort.asc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> sortByFechaAperturaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaApertura', Sort.desc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> sortByFechaCierre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCierre', Sort.asc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> sortByFechaCierreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCierre', Sort.desc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> sortByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.asc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> sortByFechaCreacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.desc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> sortByHayDiferencia() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hayDiferencia', Sort.asc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> sortByHayDiferenciaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hayDiferencia', Sort.desc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> sortByMensajeDiferencia() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mensajeDiferencia', Sort.asc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy>
      sortByMensajeDiferenciaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mensajeDiferencia', Sort.desc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> sortByMontoCheque() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoCheque', Sort.asc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> sortByMontoChequeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoCheque', Sort.desc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> sortByMontoEfectivo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoEfectivo', Sort.asc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> sortByMontoEfectivoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoEfectivo', Sort.desc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> sortByMontoOtros() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoOtros', Sort.asc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> sortByMontoOtrosDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoOtros', Sort.desc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> sortByMontoPagoMovil() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoPagoMovil', Sort.asc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy>
      sortByMontoPagoMovilDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoPagoMovil', Sort.desc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> sortByMontoTarjeta() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoTarjeta', Sort.asc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> sortByMontoTarjetaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoTarjeta', Sort.desc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy>
      sortByMontoTransferencia() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoTransferencia', Sort.asc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy>
      sortByMontoTransferenciaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoTransferencia', Sort.desc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> sortByMotivoAnulacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'motivoAnulacion', Sort.asc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy>
      sortByMotivoAnulacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'motivoAnulacion', Sort.desc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> sortByNumeroCierre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroCierre', Sort.asc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> sortByNumeroCierreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroCierre', Sort.desc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> sortByObservaciones() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observaciones', Sort.asc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> sortByObservacionesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observaciones', Sort.desc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> sortBySaldoEsperado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saldoEsperado', Sort.asc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> sortBySaldoEsperadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saldoEsperado', Sort.desc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> sortBySaldoFinal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saldoFinal', Sort.asc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> sortBySaldoFinalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saldoFinal', Sort.desc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy>
      sortBySaldoFinalCalculado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saldoFinalCalculado', Sort.asc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy>
      sortBySaldoFinalCalculadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saldoFinalCalculado', Sort.desc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy>
      sortBySaldoFinalFormateado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saldoFinalFormateado', Sort.asc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy>
      sortBySaldoFinalFormateadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saldoFinalFormateado', Sort.desc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> sortByTotalEgresos() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalEgresos', Sort.asc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> sortByTotalEgresosDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalEgresos', Sort.desc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> sortByTotalFormateado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalFormateado', Sort.asc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy>
      sortByTotalFormateadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalFormateado', Sort.desc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> sortByTotalIngresos() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalIngresos', Sort.asc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> sortByTotalIngresosDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalIngresos', Sort.desc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy>
      sortByTotalIngresosCalculado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalIngresosCalculado', Sort.asc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy>
      sortByTotalIngresosCalculadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalIngresosCalculado', Sort.desc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> sortByUsuarioId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usuarioId', Sort.asc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> sortByUsuarioIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usuarioId', Sort.desc);
    });
  }
}

extension CierreCajaQuerySortThenBy
    on QueryBuilder<CierreCaja, CierreCaja, QSortThenBy> {
  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> thenByAbierto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'abierto', Sort.asc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> thenByAbiertoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'abierto', Sort.desc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> thenByAnulado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'anulado', Sort.asc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> thenByAnuladoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'anulado', Sort.desc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> thenByColorDiferencia() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorDiferencia', Sort.asc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy>
      thenByColorDiferenciaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorDiferencia', Sort.desc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> thenByColorEstado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorEstado', Sort.asc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> thenByColorEstadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorEstado', Sort.desc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> thenByConfirmado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'confirmado', Sort.asc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> thenByConfirmadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'confirmado', Sort.desc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> thenByDiferencia() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diferencia', Sort.asc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> thenByDiferenciaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diferencia', Sort.desc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy>
      thenByDiferenciaCalculada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diferenciaCalculada', Sort.asc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy>
      thenByDiferenciaCalculadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diferenciaCalculada', Sort.desc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy>
      thenByDiferenciaFormateada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diferenciaFormateada', Sort.asc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy>
      thenByDiferenciaFormateadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diferenciaFormateada', Sort.desc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy>
      thenByDuracionFormateada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'duracionFormateada', Sort.asc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy>
      thenByDuracionFormateadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'duracionFormateada', Sort.desc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> thenByEstadoCierre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estadoCierre', Sort.asc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> thenByEstadoCierreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estadoCierre', Sort.desc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy>
      thenByFechaActualizacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaActualizacion', Sort.asc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy>
      thenByFechaActualizacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaActualizacion', Sort.desc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> thenByFechaApertura() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaApertura', Sort.asc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> thenByFechaAperturaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaApertura', Sort.desc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> thenByFechaCierre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCierre', Sort.asc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> thenByFechaCierreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCierre', Sort.desc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> thenByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.asc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> thenByFechaCreacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.desc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> thenByHayDiferencia() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hayDiferencia', Sort.asc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> thenByHayDiferenciaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hayDiferencia', Sort.desc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> thenByMensajeDiferencia() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mensajeDiferencia', Sort.asc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy>
      thenByMensajeDiferenciaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mensajeDiferencia', Sort.desc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> thenByMontoCheque() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoCheque', Sort.asc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> thenByMontoChequeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoCheque', Sort.desc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> thenByMontoEfectivo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoEfectivo', Sort.asc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> thenByMontoEfectivoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoEfectivo', Sort.desc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> thenByMontoOtros() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoOtros', Sort.asc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> thenByMontoOtrosDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoOtros', Sort.desc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> thenByMontoPagoMovil() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoPagoMovil', Sort.asc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy>
      thenByMontoPagoMovilDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoPagoMovil', Sort.desc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> thenByMontoTarjeta() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoTarjeta', Sort.asc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> thenByMontoTarjetaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoTarjeta', Sort.desc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy>
      thenByMontoTransferencia() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoTransferencia', Sort.asc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy>
      thenByMontoTransferenciaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoTransferencia', Sort.desc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> thenByMotivoAnulacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'motivoAnulacion', Sort.asc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy>
      thenByMotivoAnulacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'motivoAnulacion', Sort.desc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> thenByNumeroCierre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroCierre', Sort.asc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> thenByNumeroCierreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroCierre', Sort.desc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> thenByObservaciones() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observaciones', Sort.asc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> thenByObservacionesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observaciones', Sort.desc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> thenBySaldoEsperado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saldoEsperado', Sort.asc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> thenBySaldoEsperadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saldoEsperado', Sort.desc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> thenBySaldoFinal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saldoFinal', Sort.asc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> thenBySaldoFinalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saldoFinal', Sort.desc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy>
      thenBySaldoFinalCalculado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saldoFinalCalculado', Sort.asc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy>
      thenBySaldoFinalCalculadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saldoFinalCalculado', Sort.desc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy>
      thenBySaldoFinalFormateado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saldoFinalFormateado', Sort.asc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy>
      thenBySaldoFinalFormateadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saldoFinalFormateado', Sort.desc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> thenByTotalEgresos() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalEgresos', Sort.asc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> thenByTotalEgresosDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalEgresos', Sort.desc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> thenByTotalFormateado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalFormateado', Sort.asc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy>
      thenByTotalFormateadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalFormateado', Sort.desc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> thenByTotalIngresos() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalIngresos', Sort.asc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> thenByTotalIngresosDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalIngresos', Sort.desc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy>
      thenByTotalIngresosCalculado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalIngresosCalculado', Sort.asc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy>
      thenByTotalIngresosCalculadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalIngresosCalculado', Sort.desc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> thenByUsuarioId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usuarioId', Sort.asc);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QAfterSortBy> thenByUsuarioIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usuarioId', Sort.desc);
    });
  }
}

extension CierreCajaQueryWhereDistinct
    on QueryBuilder<CierreCaja, CierreCaja, QDistinct> {
  QueryBuilder<CierreCaja, CierreCaja, QDistinct> distinctByAbierto() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'abierto');
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QDistinct> distinctByAnulado() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'anulado');
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QDistinct> distinctByColorDiferencia(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'colorDiferencia',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QDistinct> distinctByColorEstado(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'colorEstado', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QDistinct> distinctByConfirmado() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'confirmado');
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QDistinct> distinctByDiferencia() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'diferencia');
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QDistinct>
      distinctByDiferenciaCalculada() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'diferenciaCalculada');
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QDistinct>
      distinctByDiferenciaFormateada({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'diferenciaFormateada',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QDistinct> distinctByDuracionFormateada(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'duracionFormateada',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QDistinct> distinctByEstadoCierre(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estadoCierre', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QDistinct>
      distinctByFechaActualizacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaActualizacion');
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QDistinct> distinctByFechaApertura() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaApertura');
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QDistinct> distinctByFechaCierre() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaCierre');
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QDistinct> distinctByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaCreacion');
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QDistinct> distinctByHayDiferencia() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hayDiferencia');
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QDistinct> distinctByMensajeDiferencia(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mensajeDiferencia',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QDistinct> distinctByMontoCheque() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'montoCheque');
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QDistinct> distinctByMontoEfectivo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'montoEfectivo');
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QDistinct> distinctByMontoOtros() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'montoOtros');
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QDistinct> distinctByMontoPagoMovil() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'montoPagoMovil');
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QDistinct> distinctByMontoTarjeta() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'montoTarjeta');
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QDistinct>
      distinctByMontoTransferencia() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'montoTransferencia');
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QDistinct> distinctByMotivoAnulacion(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'motivoAnulacion',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QDistinct> distinctByNumeroCierre(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'numeroCierre', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QDistinct> distinctByObservaciones(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'observaciones',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QDistinct> distinctBySaldoEsperado() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'saldoEsperado');
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QDistinct> distinctBySaldoFinal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'saldoFinal');
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QDistinct>
      distinctBySaldoFinalCalculado() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'saldoFinalCalculado');
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QDistinct>
      distinctBySaldoFinalFormateado({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'saldoFinalFormateado',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QDistinct> distinctByTotalEgresos() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalEgresos');
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QDistinct> distinctByTotalFormateado(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalFormateado',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QDistinct> distinctByTotalIngresos() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalIngresos');
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QDistinct>
      distinctByTotalIngresosCalculado() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalIngresosCalculado');
    });
  }

  QueryBuilder<CierreCaja, CierreCaja, QDistinct> distinctByUsuarioId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'usuarioId');
    });
  }
}

extension CierreCajaQueryProperty
    on QueryBuilder<CierreCaja, CierreCaja, QQueryProperty> {
  QueryBuilder<CierreCaja, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CierreCaja, bool, QQueryOperations> abiertoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'abierto');
    });
  }

  QueryBuilder<CierreCaja, bool, QQueryOperations> anuladoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'anulado');
    });
  }

  QueryBuilder<CierreCaja, String, QQueryOperations> colorDiferenciaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'colorDiferencia');
    });
  }

  QueryBuilder<CierreCaja, String, QQueryOperations> colorEstadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'colorEstado');
    });
  }

  QueryBuilder<CierreCaja, bool, QQueryOperations> confirmadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'confirmado');
    });
  }

  QueryBuilder<CierreCaja, double, QQueryOperations> diferenciaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'diferencia');
    });
  }

  QueryBuilder<CierreCaja, double, QQueryOperations>
      diferenciaCalculadaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'diferenciaCalculada');
    });
  }

  QueryBuilder<CierreCaja, String, QQueryOperations>
      diferenciaFormateadaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'diferenciaFormateada');
    });
  }

  QueryBuilder<CierreCaja, String, QQueryOperations>
      duracionFormateadaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'duracionFormateada');
    });
  }

  QueryBuilder<CierreCaja, String, QQueryOperations> estadoCierreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estadoCierre');
    });
  }

  QueryBuilder<CierreCaja, DateTime?, QQueryOperations>
      fechaActualizacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaActualizacion');
    });
  }

  QueryBuilder<CierreCaja, DateTime, QQueryOperations> fechaAperturaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaApertura');
    });
  }

  QueryBuilder<CierreCaja, DateTime?, QQueryOperations> fechaCierreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaCierre');
    });
  }

  QueryBuilder<CierreCaja, DateTime, QQueryOperations> fechaCreacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaCreacion');
    });
  }

  QueryBuilder<CierreCaja, bool, QQueryOperations> hayDiferenciaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hayDiferencia');
    });
  }

  QueryBuilder<CierreCaja, String, QQueryOperations>
      mensajeDiferenciaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mensajeDiferencia');
    });
  }

  QueryBuilder<CierreCaja, double, QQueryOperations> montoChequeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'montoCheque');
    });
  }

  QueryBuilder<CierreCaja, double, QQueryOperations> montoEfectivoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'montoEfectivo');
    });
  }

  QueryBuilder<CierreCaja, double, QQueryOperations> montoOtrosProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'montoOtros');
    });
  }

  QueryBuilder<CierreCaja, double, QQueryOperations> montoPagoMovilProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'montoPagoMovil');
    });
  }

  QueryBuilder<CierreCaja, double, QQueryOperations> montoTarjetaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'montoTarjeta');
    });
  }

  QueryBuilder<CierreCaja, double, QQueryOperations>
      montoTransferenciaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'montoTransferencia');
    });
  }

  QueryBuilder<CierreCaja, String?, QQueryOperations>
      motivoAnulacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'motivoAnulacion');
    });
  }

  QueryBuilder<CierreCaja, String, QQueryOperations> numeroCierreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'numeroCierre');
    });
  }

  QueryBuilder<CierreCaja, String?, QQueryOperations> observacionesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'observaciones');
    });
  }

  QueryBuilder<CierreCaja, double, QQueryOperations> saldoEsperadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'saldoEsperado');
    });
  }

  QueryBuilder<CierreCaja, double, QQueryOperations> saldoFinalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'saldoFinal');
    });
  }

  QueryBuilder<CierreCaja, double, QQueryOperations>
      saldoFinalCalculadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'saldoFinalCalculado');
    });
  }

  QueryBuilder<CierreCaja, String, QQueryOperations>
      saldoFinalFormateadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'saldoFinalFormateado');
    });
  }

  QueryBuilder<CierreCaja, double, QQueryOperations> totalEgresosProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalEgresos');
    });
  }

  QueryBuilder<CierreCaja, String, QQueryOperations> totalFormateadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalFormateado');
    });
  }

  QueryBuilder<CierreCaja, double, QQueryOperations> totalIngresosProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalIngresos');
    });
  }

  QueryBuilder<CierreCaja, double, QQueryOperations>
      totalIngresosCalculadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalIngresosCalculado');
    });
  }

  QueryBuilder<CierreCaja, int, QQueryOperations> usuarioIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'usuarioId');
    });
  }
}
