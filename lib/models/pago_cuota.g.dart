// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pago_cuota.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPagoCuotaCollection on Isar {
  IsarCollection<PagoCuota> get pagoCuotas => this.collection();
}

const PagoCuotaSchema = CollectionSchema(
  name: r'PagoCuota',
  id: 2139541047391545035,
  properties: {
    r'clienteId': PropertySchema(
      id: 0,
      name: r'clienteId',
      type: IsarType.long,
    ),
    r'cuentaCorrienteId': PropertySchema(
      id: 1,
      name: r'cuentaCorrienteId',
      type: IsarType.long,
    ),
    r'descripcion': PropertySchema(
      id: 2,
      name: r'descripcion',
      type: IsarType.string,
    ),
    r'fechaFormateada': PropertySchema(
      id: 3,
      name: r'fechaFormateada',
      type: IsarType.string,
    ),
    r'fechaPago': PropertySchema(
      id: 4,
      name: r'fechaPago',
      type: IsarType.dateTime,
    ),
    r'metodoPago': PropertySchema(
      id: 5,
      name: r'metodoPago',
      type: IsarType.string,
    ),
    r'monto': PropertySchema(
      id: 6,
      name: r'monto',
      type: IsarType.double,
    ),
    r'montoFormateado': PropertySchema(
      id: 7,
      name: r'montoFormateado',
      type: IsarType.string,
    ),
    r'nombreCliente': PropertySchema(
      id: 8,
      name: r'nombreCliente',
      type: IsarType.string,
    ),
    r'observaciones': PropertySchema(
      id: 9,
      name: r'observaciones',
      type: IsarType.string,
    ),
    r'referenciaPago': PropertySchema(
      id: 10,
      name: r'referenciaPago',
      type: IsarType.string,
    ),
    r'registradoEnGanancias': PropertySchema(
      id: 11,
      name: r'registradoEnGanancias',
      type: IsarType.bool,
    )
  },
  estimateSize: _pagoCuotaEstimateSize,
  serialize: _pagoCuotaSerialize,
  deserialize: _pagoCuotaDeserialize,
  deserializeProp: _pagoCuotaDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _pagoCuotaGetId,
  getLinks: _pagoCuotaGetLinks,
  attach: _pagoCuotaAttach,
  version: '3.1.0+1',
);

int _pagoCuotaEstimateSize(
  PagoCuota object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.descripcion.length * 3;
  bytesCount += 3 + object.fechaFormateada.length * 3;
  bytesCount += 3 + object.metodoPago.length * 3;
  bytesCount += 3 + object.montoFormateado.length * 3;
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

void _pagoCuotaSerialize(
  PagoCuota object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.clienteId);
  writer.writeLong(offsets[1], object.cuentaCorrienteId);
  writer.writeString(offsets[2], object.descripcion);
  writer.writeString(offsets[3], object.fechaFormateada);
  writer.writeDateTime(offsets[4], object.fechaPago);
  writer.writeString(offsets[5], object.metodoPago);
  writer.writeDouble(offsets[6], object.monto);
  writer.writeString(offsets[7], object.montoFormateado);
  writer.writeString(offsets[8], object.nombreCliente);
  writer.writeString(offsets[9], object.observaciones);
  writer.writeString(offsets[10], object.referenciaPago);
  writer.writeBool(offsets[11], object.registradoEnGanancias);
}

PagoCuota _pagoCuotaDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PagoCuota(
    clienteId: reader.readLong(offsets[0]),
    cuentaCorrienteId: reader.readLong(offsets[1]),
    fechaPago: reader.readDateTime(offsets[4]),
    metodoPago: reader.readString(offsets[5]),
    monto: reader.readDouble(offsets[6]),
    nombreCliente: reader.readString(offsets[8]),
    observaciones: reader.readStringOrNull(offsets[9]),
    referenciaPago: reader.readStringOrNull(offsets[10]),
  );
  object.id = id;
  object.registradoEnGanancias = reader.readBool(offsets[11]);
  return object;
}

P _pagoCuotaDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readDateTime(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readDouble(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readBool(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _pagoCuotaGetId(PagoCuota object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _pagoCuotaGetLinks(PagoCuota object) {
  return [];
}

void _pagoCuotaAttach(IsarCollection<dynamic> col, Id id, PagoCuota object) {
  object.id = id;
}

extension PagoCuotaQueryWhereSort
    on QueryBuilder<PagoCuota, PagoCuota, QWhere> {
  QueryBuilder<PagoCuota, PagoCuota, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PagoCuotaQueryWhere
    on QueryBuilder<PagoCuota, PagoCuota, QWhereClause> {
  QueryBuilder<PagoCuota, PagoCuota, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<PagoCuota, PagoCuota, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterWhereClause> idBetween(
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

extension PagoCuotaQueryFilter
    on QueryBuilder<PagoCuota, PagoCuota, QFilterCondition> {
  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition> clienteIdEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'clienteId',
        value: value,
      ));
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition>
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

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition> clienteIdLessThan(
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

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition> clienteIdBetween(
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

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition>
      cuentaCorrienteIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cuentaCorrienteId',
        value: value,
      ));
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition>
      cuentaCorrienteIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cuentaCorrienteId',
        value: value,
      ));
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition>
      cuentaCorrienteIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cuentaCorrienteId',
        value: value,
      ));
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition>
      cuentaCorrienteIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cuentaCorrienteId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition> descripcionEqualTo(
    String value, {
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

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition>
      descripcionGreaterThan(
    String value, {
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

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition> descripcionLessThan(
    String value, {
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

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition> descripcionBetween(
    String lower,
    String upper, {
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

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition>
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

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition> descripcionEndsWith(
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

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition> descripcionContains(
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

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition> descripcionMatches(
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

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition>
      descripcionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'descripcion',
        value: '',
      ));
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition>
      descripcionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'descripcion',
        value: '',
      ));
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition>
      fechaFormateadaEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaFormateada',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition>
      fechaFormateadaGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fechaFormateada',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition>
      fechaFormateadaLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fechaFormateada',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition>
      fechaFormateadaBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fechaFormateada',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition>
      fechaFormateadaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fechaFormateada',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition>
      fechaFormateadaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fechaFormateada',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition>
      fechaFormateadaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fechaFormateada',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition>
      fechaFormateadaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fechaFormateada',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition>
      fechaFormateadaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaFormateada',
        value: '',
      ));
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition>
      fechaFormateadaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fechaFormateada',
        value: '',
      ));
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition> fechaPagoEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaPago',
        value: value,
      ));
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition>
      fechaPagoGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fechaPago',
        value: value,
      ));
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition> fechaPagoLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fechaPago',
        value: value,
      ));
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition> fechaPagoBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fechaPago',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition> idBetween(
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

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition> metodoPagoEqualTo(
    String value, {
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

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition>
      metodoPagoGreaterThan(
    String value, {
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

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition> metodoPagoLessThan(
    String value, {
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

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition> metodoPagoBetween(
    String lower,
    String upper, {
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

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition>
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

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition> metodoPagoEndsWith(
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

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition> metodoPagoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'metodoPago',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition> metodoPagoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'metodoPago',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition>
      metodoPagoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'metodoPago',
        value: '',
      ));
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition>
      metodoPagoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'metodoPago',
        value: '',
      ));
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition> montoEqualTo(
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

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition> montoGreaterThan(
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

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition> montoLessThan(
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

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition> montoBetween(
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

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition>
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

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition>
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

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition>
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

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition>
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

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition>
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

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition>
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

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition>
      montoFormateadoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'montoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition>
      montoFormateadoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'montoFormateado',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition>
      montoFormateadoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'montoFormateado',
        value: '',
      ));
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition>
      montoFormateadoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'montoFormateado',
        value: '',
      ));
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition>
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

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition>
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

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition>
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

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition>
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

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition>
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

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition>
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

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition>
      nombreClienteContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nombreCliente',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition>
      nombreClienteMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nombreCliente',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition>
      nombreClienteIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nombreCliente',
        value: '',
      ));
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition>
      nombreClienteIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nombreCliente',
        value: '',
      ));
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition>
      observacionesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'observaciones',
      ));
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition>
      observacionesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'observaciones',
      ));
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition>
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

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition>
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

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition>
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

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition>
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

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition>
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

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition>
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

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition>
      observacionesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'observaciones',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition>
      observacionesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'observaciones',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition>
      observacionesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'observaciones',
        value: '',
      ));
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition>
      observacionesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'observaciones',
        value: '',
      ));
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition>
      referenciaPagoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'referenciaPago',
      ));
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition>
      referenciaPagoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'referenciaPago',
      ));
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition>
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

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition>
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

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition>
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

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition>
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

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition>
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

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition>
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

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition>
      referenciaPagoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'referenciaPago',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition>
      referenciaPagoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'referenciaPago',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition>
      referenciaPagoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'referenciaPago',
        value: '',
      ));
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition>
      referenciaPagoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'referenciaPago',
        value: '',
      ));
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterFilterCondition>
      registradoEnGananciasEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'registradoEnGanancias',
        value: value,
      ));
    });
  }
}

extension PagoCuotaQueryObject
    on QueryBuilder<PagoCuota, PagoCuota, QFilterCondition> {}

extension PagoCuotaQueryLinks
    on QueryBuilder<PagoCuota, PagoCuota, QFilterCondition> {}

extension PagoCuotaQuerySortBy on QueryBuilder<PagoCuota, PagoCuota, QSortBy> {
  QueryBuilder<PagoCuota, PagoCuota, QAfterSortBy> sortByClienteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clienteId', Sort.asc);
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterSortBy> sortByClienteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clienteId', Sort.desc);
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterSortBy> sortByCuentaCorrienteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cuentaCorrienteId', Sort.asc);
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterSortBy>
      sortByCuentaCorrienteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cuentaCorrienteId', Sort.desc);
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterSortBy> sortByDescripcion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descripcion', Sort.asc);
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterSortBy> sortByDescripcionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descripcion', Sort.desc);
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterSortBy> sortByFechaFormateada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaFormateada', Sort.asc);
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterSortBy> sortByFechaFormateadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaFormateada', Sort.desc);
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterSortBy> sortByFechaPago() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaPago', Sort.asc);
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterSortBy> sortByFechaPagoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaPago', Sort.desc);
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterSortBy> sortByMetodoPago() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'metodoPago', Sort.asc);
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterSortBy> sortByMetodoPagoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'metodoPago', Sort.desc);
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterSortBy> sortByMonto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monto', Sort.asc);
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterSortBy> sortByMontoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monto', Sort.desc);
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterSortBy> sortByMontoFormateado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoFormateado', Sort.asc);
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterSortBy> sortByMontoFormateadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoFormateado', Sort.desc);
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterSortBy> sortByNombreCliente() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombreCliente', Sort.asc);
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterSortBy> sortByNombreClienteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombreCliente', Sort.desc);
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterSortBy> sortByObservaciones() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observaciones', Sort.asc);
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterSortBy> sortByObservacionesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observaciones', Sort.desc);
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterSortBy> sortByReferenciaPago() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'referenciaPago', Sort.asc);
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterSortBy> sortByReferenciaPagoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'referenciaPago', Sort.desc);
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterSortBy>
      sortByRegistradoEnGanancias() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'registradoEnGanancias', Sort.asc);
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterSortBy>
      sortByRegistradoEnGananciasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'registradoEnGanancias', Sort.desc);
    });
  }
}

extension PagoCuotaQuerySortThenBy
    on QueryBuilder<PagoCuota, PagoCuota, QSortThenBy> {
  QueryBuilder<PagoCuota, PagoCuota, QAfterSortBy> thenByClienteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clienteId', Sort.asc);
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterSortBy> thenByClienteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clienteId', Sort.desc);
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterSortBy> thenByCuentaCorrienteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cuentaCorrienteId', Sort.asc);
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterSortBy>
      thenByCuentaCorrienteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cuentaCorrienteId', Sort.desc);
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterSortBy> thenByDescripcion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descripcion', Sort.asc);
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterSortBy> thenByDescripcionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descripcion', Sort.desc);
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterSortBy> thenByFechaFormateada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaFormateada', Sort.asc);
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterSortBy> thenByFechaFormateadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaFormateada', Sort.desc);
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterSortBy> thenByFechaPago() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaPago', Sort.asc);
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterSortBy> thenByFechaPagoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaPago', Sort.desc);
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterSortBy> thenByMetodoPago() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'metodoPago', Sort.asc);
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterSortBy> thenByMetodoPagoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'metodoPago', Sort.desc);
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterSortBy> thenByMonto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monto', Sort.asc);
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterSortBy> thenByMontoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monto', Sort.desc);
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterSortBy> thenByMontoFormateado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoFormateado', Sort.asc);
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterSortBy> thenByMontoFormateadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoFormateado', Sort.desc);
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterSortBy> thenByNombreCliente() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombreCliente', Sort.asc);
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterSortBy> thenByNombreClienteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombreCliente', Sort.desc);
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterSortBy> thenByObservaciones() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observaciones', Sort.asc);
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterSortBy> thenByObservacionesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observaciones', Sort.desc);
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterSortBy> thenByReferenciaPago() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'referenciaPago', Sort.asc);
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterSortBy> thenByReferenciaPagoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'referenciaPago', Sort.desc);
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterSortBy>
      thenByRegistradoEnGanancias() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'registradoEnGanancias', Sort.asc);
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QAfterSortBy>
      thenByRegistradoEnGananciasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'registradoEnGanancias', Sort.desc);
    });
  }
}

extension PagoCuotaQueryWhereDistinct
    on QueryBuilder<PagoCuota, PagoCuota, QDistinct> {
  QueryBuilder<PagoCuota, PagoCuota, QDistinct> distinctByClienteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'clienteId');
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QDistinct> distinctByCuentaCorrienteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cuentaCorrienteId');
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QDistinct> distinctByDescripcion(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'descripcion', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QDistinct> distinctByFechaFormateada(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaFormateada',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QDistinct> distinctByFechaPago() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaPago');
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QDistinct> distinctByMetodoPago(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'metodoPago', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QDistinct> distinctByMonto() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'monto');
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QDistinct> distinctByMontoFormateado(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'montoFormateado',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QDistinct> distinctByNombreCliente(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nombreCliente',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QDistinct> distinctByObservaciones(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'observaciones',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QDistinct> distinctByReferenciaPago(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'referenciaPago',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PagoCuota, PagoCuota, QDistinct>
      distinctByRegistradoEnGanancias() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'registradoEnGanancias');
    });
  }
}

extension PagoCuotaQueryProperty
    on QueryBuilder<PagoCuota, PagoCuota, QQueryProperty> {
  QueryBuilder<PagoCuota, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<PagoCuota, int, QQueryOperations> clienteIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'clienteId');
    });
  }

  QueryBuilder<PagoCuota, int, QQueryOperations> cuentaCorrienteIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cuentaCorrienteId');
    });
  }

  QueryBuilder<PagoCuota, String, QQueryOperations> descripcionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'descripcion');
    });
  }

  QueryBuilder<PagoCuota, String, QQueryOperations> fechaFormateadaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaFormateada');
    });
  }

  QueryBuilder<PagoCuota, DateTime, QQueryOperations> fechaPagoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaPago');
    });
  }

  QueryBuilder<PagoCuota, String, QQueryOperations> metodoPagoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'metodoPago');
    });
  }

  QueryBuilder<PagoCuota, double, QQueryOperations> montoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'monto');
    });
  }

  QueryBuilder<PagoCuota, String, QQueryOperations> montoFormateadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'montoFormateado');
    });
  }

  QueryBuilder<PagoCuota, String, QQueryOperations> nombreClienteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nombreCliente');
    });
  }

  QueryBuilder<PagoCuota, String?, QQueryOperations> observacionesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'observaciones');
    });
  }

  QueryBuilder<PagoCuota, String?, QQueryOperations> referenciaPagoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'referenciaPago');
    });
  }

  QueryBuilder<PagoCuota, bool, QQueryOperations>
      registradoEnGananciasProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'registradoEnGanancias');
    });
  }
}
