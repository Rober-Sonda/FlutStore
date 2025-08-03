// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cuenta_corriente.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCuentaCorrienteCollection on Isar {
  IsarCollection<CuentaCorriente> get cuentaCorrientes => this.collection();
}

const CuentaCorrienteSchema = CollectionSchema(
  name: r'CuentaCorriente',
  id: 1781182567422575385,
  properties: {
    r'activa': PropertySchema(
      id: 0,
      name: r'activa',
      type: IsarType.bool,
    ),
    r'clienteId': PropertySchema(
      id: 1,
      name: r'clienteId',
      type: IsarType.long,
    ),
    r'cuotasPagadas': PropertySchema(
      id: 2,
      name: r'cuotasPagadas',
      type: IsarType.long,
    ),
    r'cuotasRestantes': PropertySchema(
      id: 3,
      name: r'cuotasRestantes',
      type: IsarType.long,
    ),
    r'diasAtraso': PropertySchema(
      id: 4,
      name: r'diasAtraso',
      type: IsarType.long,
    ),
    r'estaPagada': PropertySchema(
      id: 5,
      name: r'estaPagada',
      type: IsarType.bool,
    ),
    r'estaVencida': PropertySchema(
      id: 6,
      name: r'estaVencida',
      type: IsarType.bool,
    ),
    r'fechaCreacion': PropertySchema(
      id: 7,
      name: r'fechaCreacion',
      type: IsarType.dateTime,
    ),
    r'fechaUltimoPago': PropertySchema(
      id: 8,
      name: r'fechaUltimoPago',
      type: IsarType.dateTime,
    ),
    r'fechaVencimiento': PropertySchema(
      id: 9,
      name: r'fechaVencimiento',
      type: IsarType.dateTime,
    ),
    r'metodoPago': PropertySchema(
      id: 10,
      name: r'metodoPago',
      type: IsarType.string,
    ),
    r'montoPagado': PropertySchema(
      id: 11,
      name: r'montoPagado',
      type: IsarType.double,
    ),
    r'montoPorCuota': PropertySchema(
      id: 12,
      name: r'montoPorCuota',
      type: IsarType.double,
    ),
    r'montoProximaCuota': PropertySchema(
      id: 13,
      name: r'montoProximaCuota',
      type: IsarType.double,
    ),
    r'montoTotal': PropertySchema(
      id: 14,
      name: r'montoTotal',
      type: IsarType.double,
    ),
    r'nombreCliente': PropertySchema(
      id: 15,
      name: r'nombreCliente',
      type: IsarType.string,
    ),
    r'observaciones': PropertySchema(
      id: 16,
      name: r'observaciones',
      type: IsarType.string,
    ),
    r'porcentajePagado': PropertySchema(
      id: 17,
      name: r'porcentajePagado',
      type: IsarType.double,
    ),
    r'referenciaPago': PropertySchema(
      id: 18,
      name: r'referenciaPago',
      type: IsarType.string,
    ),
    r'saldoPendiente': PropertySchema(
      id: 19,
      name: r'saldoPendiente',
      type: IsarType.double,
    ),
    r'totalCuotas': PropertySchema(
      id: 20,
      name: r'totalCuotas',
      type: IsarType.long,
    )
  },
  estimateSize: _cuentaCorrienteEstimateSize,
  serialize: _cuentaCorrienteSerialize,
  deserialize: _cuentaCorrienteDeserialize,
  deserializeProp: _cuentaCorrienteDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _cuentaCorrienteGetId,
  getLinks: _cuentaCorrienteGetLinks,
  attach: _cuentaCorrienteAttach,
  version: '3.1.0+1',
);

int _cuentaCorrienteEstimateSize(
  CuentaCorriente object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.metodoPago;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.nombreCliente.length * 3;
  {
    final value = object.observaciones;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.referenciaPago;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _cuentaCorrienteSerialize(
  CuentaCorriente object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.activa);
  writer.writeLong(offsets[1], object.clienteId);
  writer.writeLong(offsets[2], object.cuotasPagadas);
  writer.writeLong(offsets[3], object.cuotasRestantes);
  writer.writeLong(offsets[4], object.diasAtraso);
  writer.writeBool(offsets[5], object.estaPagada);
  writer.writeBool(offsets[6], object.estaVencida);
  writer.writeDateTime(offsets[7], object.fechaCreacion);
  writer.writeDateTime(offsets[8], object.fechaUltimoPago);
  writer.writeDateTime(offsets[9], object.fechaVencimiento);
  writer.writeString(offsets[10], object.metodoPago);
  writer.writeDouble(offsets[11], object.montoPagado);
  writer.writeDouble(offsets[12], object.montoPorCuota);
  writer.writeDouble(offsets[13], object.montoProximaCuota);
  writer.writeDouble(offsets[14], object.montoTotal);
  writer.writeString(offsets[15], object.nombreCliente);
  writer.writeString(offsets[16], object.observaciones);
  writer.writeDouble(offsets[17], object.porcentajePagado);
  writer.writeString(offsets[18], object.referenciaPago);
  writer.writeDouble(offsets[19], object.saldoPendiente);
  writer.writeLong(offsets[20], object.totalCuotas);
}

CuentaCorriente _cuentaCorrienteDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CuentaCorriente(
    clienteId: reader.readLong(offsets[1]),
    cuotasPagadas: reader.readLongOrNull(offsets[2]) ?? 0,
    fechaCreacion: reader.readDateTime(offsets[7]),
    fechaVencimiento: reader.readDateTime(offsets[9]),
    metodoPago: reader.readStringOrNull(offsets[10]),
    montoPagado: reader.readDoubleOrNull(offsets[11]) ?? 0.0,
    montoTotal: reader.readDouble(offsets[14]),
    nombreCliente: reader.readString(offsets[15]),
    observaciones: reader.readStringOrNull(offsets[16]),
    referenciaPago: reader.readStringOrNull(offsets[18]),
    totalCuotas: reader.readLongOrNull(offsets[20]) ?? 1,
  );
  object.activa = reader.readBool(offsets[0]);
  object.fechaUltimoPago = reader.readDateTimeOrNull(offsets[8]);
  object.id = id;
  object.montoPorCuota = reader.readDouble(offsets[12]);
  object.saldoPendiente = reader.readDouble(offsets[19]);
  return object;
}

P _cuentaCorrienteDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readDateTime(offset)) as P;
    case 8:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 9:
      return (reader.readDateTime(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readDoubleOrNull(offset) ?? 0.0) as P;
    case 12:
      return (reader.readDouble(offset)) as P;
    case 13:
      return (reader.readDouble(offset)) as P;
    case 14:
      return (reader.readDouble(offset)) as P;
    case 15:
      return (reader.readString(offset)) as P;
    case 16:
      return (reader.readStringOrNull(offset)) as P;
    case 17:
      return (reader.readDouble(offset)) as P;
    case 18:
      return (reader.readStringOrNull(offset)) as P;
    case 19:
      return (reader.readDouble(offset)) as P;
    case 20:
      return (reader.readLongOrNull(offset) ?? 1) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _cuentaCorrienteGetId(CuentaCorriente object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _cuentaCorrienteGetLinks(CuentaCorriente object) {
  return [];
}

void _cuentaCorrienteAttach(
    IsarCollection<dynamic> col, Id id, CuentaCorriente object) {
  object.id = id;
}

extension CuentaCorrienteQueryWhereSort
    on QueryBuilder<CuentaCorriente, CuentaCorriente, QWhere> {
  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CuentaCorrienteQueryWhere
    on QueryBuilder<CuentaCorriente, CuentaCorriente, QWhereClause> {
  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterWhereClause>
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

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterWhereClause> idBetween(
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

extension CuentaCorrienteQueryFilter
    on QueryBuilder<CuentaCorriente, CuentaCorriente, QFilterCondition> {
  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      activaEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'activa',
        value: value,
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      clienteIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'clienteId',
        value: value,
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      clienteIdGreaterThan(
    int value, {
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

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      clienteIdLessThan(
    int value, {
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

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      clienteIdBetween(
    int lower,
    int upper, {
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

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      cuotasPagadasEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cuotasPagadas',
        value: value,
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      cuotasPagadasGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cuotasPagadas',
        value: value,
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      cuotasPagadasLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cuotasPagadas',
        value: value,
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      cuotasPagadasBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cuotasPagadas',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      cuotasRestantesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cuotasRestantes',
        value: value,
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      cuotasRestantesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cuotasRestantes',
        value: value,
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      cuotasRestantesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cuotasRestantes',
        value: value,
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      cuotasRestantesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cuotasRestantes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      diasAtrasoEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'diasAtraso',
        value: value,
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      diasAtrasoGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'diasAtraso',
        value: value,
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      diasAtrasoLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'diasAtraso',
        value: value,
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      diasAtrasoBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'diasAtraso',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      estaPagadaEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estaPagada',
        value: value,
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      estaVencidaEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estaVencida',
        value: value,
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      fechaCreacionEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaCreacion',
        value: value,
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
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

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
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

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
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

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      fechaUltimoPagoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fechaUltimoPago',
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      fechaUltimoPagoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fechaUltimoPago',
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      fechaUltimoPagoEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaUltimoPago',
        value: value,
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      fechaUltimoPagoGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fechaUltimoPago',
        value: value,
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      fechaUltimoPagoLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fechaUltimoPago',
        value: value,
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      fechaUltimoPagoBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fechaUltimoPago',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      fechaVencimientoEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaVencimiento',
        value: value,
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      fechaVencimientoGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fechaVencimiento',
        value: value,
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      fechaVencimientoLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fechaVencimiento',
        value: value,
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      fechaVencimientoBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fechaVencimiento',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
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

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
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

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
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

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      metodoPagoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'metodoPago',
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      metodoPagoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'metodoPago',
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      metodoPagoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'metodoPago',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      metodoPagoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'metodoPago',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      metodoPagoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'metodoPago',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      metodoPagoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'metodoPago',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      metodoPagoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'metodoPago',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      metodoPagoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'metodoPago',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      metodoPagoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'metodoPago',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      metodoPagoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'metodoPago',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      metodoPagoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'metodoPago',
        value: '',
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      metodoPagoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'metodoPago',
        value: '',
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      montoPagadoEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'montoPagado',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      montoPagadoGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'montoPagado',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      montoPagadoLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'montoPagado',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      montoPagadoBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'montoPagado',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      montoPorCuotaEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'montoPorCuota',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      montoPorCuotaGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'montoPorCuota',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      montoPorCuotaLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'montoPorCuota',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      montoPorCuotaBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'montoPorCuota',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      montoProximaCuotaEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'montoProximaCuota',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      montoProximaCuotaGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'montoProximaCuota',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      montoProximaCuotaLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'montoProximaCuota',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      montoProximaCuotaBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'montoProximaCuota',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      montoTotalEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'montoTotal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      montoTotalGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'montoTotal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      montoTotalLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'montoTotal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      montoTotalBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'montoTotal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      nombreClienteEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nombreCliente',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      nombreClienteGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nombreCliente',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      nombreClienteLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nombreCliente',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      nombreClienteBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nombreCliente',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      nombreClienteStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nombreCliente',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      nombreClienteEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nombreCliente',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      nombreClienteContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nombreCliente',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      nombreClienteMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nombreCliente',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      nombreClienteIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nombreCliente',
        value: '',
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      nombreClienteIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nombreCliente',
        value: '',
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      observacionesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'observaciones',
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      observacionesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'observaciones',
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
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

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
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

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
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

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
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

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
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

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
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

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      observacionesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'observaciones',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      observacionesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'observaciones',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      observacionesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'observaciones',
        value: '',
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      observacionesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'observaciones',
        value: '',
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      porcentajePagadoEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'porcentajePagado',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      porcentajePagadoGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'porcentajePagado',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      porcentajePagadoLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'porcentajePagado',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      porcentajePagadoBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'porcentajePagado',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      referenciaPagoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'referenciaPago',
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      referenciaPagoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'referenciaPago',
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      referenciaPagoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'referenciaPago',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      referenciaPagoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'referenciaPago',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      referenciaPagoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'referenciaPago',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      referenciaPagoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'referenciaPago',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      referenciaPagoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'referenciaPago',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      referenciaPagoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'referenciaPago',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      referenciaPagoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'referenciaPago',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      referenciaPagoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'referenciaPago',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      referenciaPagoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'referenciaPago',
        value: '',
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      referenciaPagoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'referenciaPago',
        value: '',
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      saldoPendienteEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'saldoPendiente',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      saldoPendienteGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'saldoPendiente',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      saldoPendienteLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'saldoPendiente',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      saldoPendienteBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'saldoPendiente',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      totalCuotasEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalCuotas',
        value: value,
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      totalCuotasGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalCuotas',
        value: value,
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      totalCuotasLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalCuotas',
        value: value,
      ));
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterFilterCondition>
      totalCuotasBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalCuotas',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension CuentaCorrienteQueryObject
    on QueryBuilder<CuentaCorriente, CuentaCorriente, QFilterCondition> {}

extension CuentaCorrienteQueryLinks
    on QueryBuilder<CuentaCorriente, CuentaCorriente, QFilterCondition> {}

extension CuentaCorrienteQuerySortBy
    on QueryBuilder<CuentaCorriente, CuentaCorriente, QSortBy> {
  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterSortBy> sortByActiva() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activa', Sort.asc);
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterSortBy>
      sortByActivaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activa', Sort.desc);
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterSortBy>
      sortByClienteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clienteId', Sort.asc);
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterSortBy>
      sortByClienteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clienteId', Sort.desc);
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterSortBy>
      sortByCuotasPagadas() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cuotasPagadas', Sort.asc);
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterSortBy>
      sortByCuotasPagadasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cuotasPagadas', Sort.desc);
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterSortBy>
      sortByCuotasRestantes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cuotasRestantes', Sort.asc);
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterSortBy>
      sortByCuotasRestantesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cuotasRestantes', Sort.desc);
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterSortBy>
      sortByDiasAtraso() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diasAtraso', Sort.asc);
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterSortBy>
      sortByDiasAtrasoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diasAtraso', Sort.desc);
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterSortBy>
      sortByEstaPagada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estaPagada', Sort.asc);
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterSortBy>
      sortByEstaPagadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estaPagada', Sort.desc);
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterSortBy>
      sortByEstaVencida() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estaVencida', Sort.asc);
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterSortBy>
      sortByEstaVencidaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estaVencida', Sort.desc);
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterSortBy>
      sortByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.asc);
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterSortBy>
      sortByFechaCreacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.desc);
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterSortBy>
      sortByFechaUltimoPago() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaUltimoPago', Sort.asc);
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterSortBy>
      sortByFechaUltimoPagoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaUltimoPago', Sort.desc);
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterSortBy>
      sortByFechaVencimiento() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaVencimiento', Sort.asc);
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterSortBy>
      sortByFechaVencimientoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaVencimiento', Sort.desc);
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterSortBy>
      sortByMetodoPago() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'metodoPago', Sort.asc);
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterSortBy>
      sortByMetodoPagoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'metodoPago', Sort.desc);
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterSortBy>
      sortByMontoPagado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoPagado', Sort.asc);
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterSortBy>
      sortByMontoPagadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoPagado', Sort.desc);
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterSortBy>
      sortByMontoPorCuota() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoPorCuota', Sort.asc);
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterSortBy>
      sortByMontoPorCuotaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoPorCuota', Sort.desc);
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterSortBy>
      sortByMontoProximaCuota() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoProximaCuota', Sort.asc);
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterSortBy>
      sortByMontoProximaCuotaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoProximaCuota', Sort.desc);
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterSortBy>
      sortByMontoTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoTotal', Sort.asc);
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterSortBy>
      sortByMontoTotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoTotal', Sort.desc);
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterSortBy>
      sortByNombreCliente() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombreCliente', Sort.asc);
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterSortBy>
      sortByNombreClienteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombreCliente', Sort.desc);
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterSortBy>
      sortByObservaciones() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observaciones', Sort.asc);
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterSortBy>
      sortByObservacionesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observaciones', Sort.desc);
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterSortBy>
      sortByPorcentajePagado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'porcentajePagado', Sort.asc);
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterSortBy>
      sortByPorcentajePagadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'porcentajePagado', Sort.desc);
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterSortBy>
      sortByReferenciaPago() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'referenciaPago', Sort.asc);
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterSortBy>
      sortByReferenciaPagoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'referenciaPago', Sort.desc);
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterSortBy>
      sortBySaldoPendiente() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saldoPendiente', Sort.asc);
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterSortBy>
      sortBySaldoPendienteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saldoPendiente', Sort.desc);
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterSortBy>
      sortByTotalCuotas() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCuotas', Sort.asc);
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterSortBy>
      sortByTotalCuotasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCuotas', Sort.desc);
    });
  }
}

extension CuentaCorrienteQuerySortThenBy
    on QueryBuilder<CuentaCorriente, CuentaCorriente, QSortThenBy> {
  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterSortBy> thenByActiva() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activa', Sort.asc);
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterSortBy>
      thenByActivaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activa', Sort.desc);
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterSortBy>
      thenByClienteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clienteId', Sort.asc);
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterSortBy>
      thenByClienteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clienteId', Sort.desc);
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterSortBy>
      thenByCuotasPagadas() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cuotasPagadas', Sort.asc);
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterSortBy>
      thenByCuotasPagadasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cuotasPagadas', Sort.desc);
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterSortBy>
      thenByCuotasRestantes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cuotasRestantes', Sort.asc);
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterSortBy>
      thenByCuotasRestantesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cuotasRestantes', Sort.desc);
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterSortBy>
      thenByDiasAtraso() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diasAtraso', Sort.asc);
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterSortBy>
      thenByDiasAtrasoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diasAtraso', Sort.desc);
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterSortBy>
      thenByEstaPagada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estaPagada', Sort.asc);
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterSortBy>
      thenByEstaPagadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estaPagada', Sort.desc);
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterSortBy>
      thenByEstaVencida() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estaVencida', Sort.asc);
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterSortBy>
      thenByEstaVencidaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estaVencida', Sort.desc);
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterSortBy>
      thenByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.asc);
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterSortBy>
      thenByFechaCreacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.desc);
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterSortBy>
      thenByFechaUltimoPago() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaUltimoPago', Sort.asc);
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterSortBy>
      thenByFechaUltimoPagoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaUltimoPago', Sort.desc);
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterSortBy>
      thenByFechaVencimiento() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaVencimiento', Sort.asc);
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterSortBy>
      thenByFechaVencimientoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaVencimiento', Sort.desc);
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterSortBy>
      thenByMetodoPago() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'metodoPago', Sort.asc);
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterSortBy>
      thenByMetodoPagoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'metodoPago', Sort.desc);
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterSortBy>
      thenByMontoPagado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoPagado', Sort.asc);
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterSortBy>
      thenByMontoPagadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoPagado', Sort.desc);
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterSortBy>
      thenByMontoPorCuota() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoPorCuota', Sort.asc);
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterSortBy>
      thenByMontoPorCuotaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoPorCuota', Sort.desc);
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterSortBy>
      thenByMontoProximaCuota() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoProximaCuota', Sort.asc);
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterSortBy>
      thenByMontoProximaCuotaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoProximaCuota', Sort.desc);
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterSortBy>
      thenByMontoTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoTotal', Sort.asc);
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterSortBy>
      thenByMontoTotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoTotal', Sort.desc);
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterSortBy>
      thenByNombreCliente() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombreCliente', Sort.asc);
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterSortBy>
      thenByNombreClienteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombreCliente', Sort.desc);
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterSortBy>
      thenByObservaciones() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observaciones', Sort.asc);
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterSortBy>
      thenByObservacionesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observaciones', Sort.desc);
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterSortBy>
      thenByPorcentajePagado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'porcentajePagado', Sort.asc);
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterSortBy>
      thenByPorcentajePagadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'porcentajePagado', Sort.desc);
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterSortBy>
      thenByReferenciaPago() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'referenciaPago', Sort.asc);
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterSortBy>
      thenByReferenciaPagoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'referenciaPago', Sort.desc);
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterSortBy>
      thenBySaldoPendiente() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saldoPendiente', Sort.asc);
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterSortBy>
      thenBySaldoPendienteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saldoPendiente', Sort.desc);
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterSortBy>
      thenByTotalCuotas() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCuotas', Sort.asc);
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QAfterSortBy>
      thenByTotalCuotasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCuotas', Sort.desc);
    });
  }
}

extension CuentaCorrienteQueryWhereDistinct
    on QueryBuilder<CuentaCorriente, CuentaCorriente, QDistinct> {
  QueryBuilder<CuentaCorriente, CuentaCorriente, QDistinct> distinctByActiva() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'activa');
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QDistinct>
      distinctByClienteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'clienteId');
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QDistinct>
      distinctByCuotasPagadas() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cuotasPagadas');
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QDistinct>
      distinctByCuotasRestantes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cuotasRestantes');
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QDistinct>
      distinctByDiasAtraso() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'diasAtraso');
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QDistinct>
      distinctByEstaPagada() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estaPagada');
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QDistinct>
      distinctByEstaVencida() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estaVencida');
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QDistinct>
      distinctByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaCreacion');
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QDistinct>
      distinctByFechaUltimoPago() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaUltimoPago');
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QDistinct>
      distinctByFechaVencimiento() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaVencimiento');
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QDistinct>
      distinctByMetodoPago({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'metodoPago', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QDistinct>
      distinctByMontoPagado() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'montoPagado');
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QDistinct>
      distinctByMontoPorCuota() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'montoPorCuota');
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QDistinct>
      distinctByMontoProximaCuota() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'montoProximaCuota');
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QDistinct>
      distinctByMontoTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'montoTotal');
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QDistinct>
      distinctByNombreCliente({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nombreCliente',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QDistinct>
      distinctByObservaciones({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'observaciones',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QDistinct>
      distinctByPorcentajePagado() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'porcentajePagado');
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QDistinct>
      distinctByReferenciaPago({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'referenciaPago',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QDistinct>
      distinctBySaldoPendiente() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'saldoPendiente');
    });
  }

  QueryBuilder<CuentaCorriente, CuentaCorriente, QDistinct>
      distinctByTotalCuotas() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalCuotas');
    });
  }
}

extension CuentaCorrienteQueryProperty
    on QueryBuilder<CuentaCorriente, CuentaCorriente, QQueryProperty> {
  QueryBuilder<CuentaCorriente, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CuentaCorriente, bool, QQueryOperations> activaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'activa');
    });
  }

  QueryBuilder<CuentaCorriente, int, QQueryOperations> clienteIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'clienteId');
    });
  }

  QueryBuilder<CuentaCorriente, int, QQueryOperations> cuotasPagadasProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cuotasPagadas');
    });
  }

  QueryBuilder<CuentaCorriente, int, QQueryOperations>
      cuotasRestantesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cuotasRestantes');
    });
  }

  QueryBuilder<CuentaCorriente, int, QQueryOperations> diasAtrasoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'diasAtraso');
    });
  }

  QueryBuilder<CuentaCorriente, bool, QQueryOperations> estaPagadaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estaPagada');
    });
  }

  QueryBuilder<CuentaCorriente, bool, QQueryOperations> estaVencidaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estaVencida');
    });
  }

  QueryBuilder<CuentaCorriente, DateTime, QQueryOperations>
      fechaCreacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaCreacion');
    });
  }

  QueryBuilder<CuentaCorriente, DateTime?, QQueryOperations>
      fechaUltimoPagoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaUltimoPago');
    });
  }

  QueryBuilder<CuentaCorriente, DateTime, QQueryOperations>
      fechaVencimientoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaVencimiento');
    });
  }

  QueryBuilder<CuentaCorriente, String?, QQueryOperations>
      metodoPagoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'metodoPago');
    });
  }

  QueryBuilder<CuentaCorriente, double, QQueryOperations>
      montoPagadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'montoPagado');
    });
  }

  QueryBuilder<CuentaCorriente, double, QQueryOperations>
      montoPorCuotaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'montoPorCuota');
    });
  }

  QueryBuilder<CuentaCorriente, double, QQueryOperations>
      montoProximaCuotaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'montoProximaCuota');
    });
  }

  QueryBuilder<CuentaCorriente, double, QQueryOperations> montoTotalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'montoTotal');
    });
  }

  QueryBuilder<CuentaCorriente, String, QQueryOperations>
      nombreClienteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nombreCliente');
    });
  }

  QueryBuilder<CuentaCorriente, String?, QQueryOperations>
      observacionesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'observaciones');
    });
  }

  QueryBuilder<CuentaCorriente, double, QQueryOperations>
      porcentajePagadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'porcentajePagado');
    });
  }

  QueryBuilder<CuentaCorriente, String?, QQueryOperations>
      referenciaPagoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'referenciaPago');
    });
  }

  QueryBuilder<CuentaCorriente, double, QQueryOperations>
      saldoPendienteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'saldoPendiente');
    });
  }

  QueryBuilder<CuentaCorriente, int, QQueryOperations> totalCuotasProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalCuotas');
    });
  }
}
