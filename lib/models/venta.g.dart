// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'venta.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetVentaCollection on Isar {
  IsarCollection<Venta> get ventas => this.collection();
}

const VentaSchema = CollectionSchema(
  name: r'Venta',
  id: -2270150413385075991,
  properties: {
    r'clienteId': PropertySchema(
      id: 0,
      name: r'clienteId',
      type: IsarType.long,
    ),
    r'colorEstado': PropertySchema(
      id: 1,
      name: r'colorEstado',
      type: IsarType.string,
    ),
    r'colorPeriodo': PropertySchema(
      id: 2,
      name: r'colorPeriodo',
      type: IsarType.string,
    ),
    r'esDeLaSemana': PropertySchema(
      id: 3,
      name: r'esDeLaSemana',
      type: IsarType.bool,
    ),
    r'esDelDia': PropertySchema(
      id: 4,
      name: r'esDelDia',
      type: IsarType.bool,
    ),
    r'esDelMes': PropertySchema(
      id: 5,
      name: r'esDelMes',
      type: IsarType.bool,
    ),
    r'esReciente': PropertySchema(
      id: 6,
      name: r'esReciente',
      type: IsarType.bool,
    ),
    r'estado': PropertySchema(
      id: 7,
      name: r'estado',
      type: IsarType.string,
    ),
    r'estadoFormateado': PropertySchema(
      id: 8,
      name: r'estadoFormateado',
      type: IsarType.string,
    ),
    r'fecha': PropertySchema(
      id: 9,
      name: r'fecha',
      type: IsarType.dateTime,
    ),
    r'fechaActualizacion': PropertySchema(
      id: 10,
      name: r'fechaActualizacion',
      type: IsarType.dateTime,
    ),
    r'fechaCreacion': PropertySchema(
      id: 11,
      name: r'fechaCreacion',
      type: IsarType.dateTime,
    ),
    r'fechaFormateada': PropertySchema(
      id: 12,
      name: r'fechaFormateada',
      type: IsarType.string,
    ),
    r'fechaHoraFormateada': PropertySchema(
      id: 13,
      name: r'fechaHoraFormateada',
      type: IsarType.string,
    ),
    r'horaFormateada': PropertySchema(
      id: 14,
      name: r'horaFormateada',
      type: IsarType.string,
    ),
    r'iconoMetodoPago': PropertySchema(
      id: 15,
      name: r'iconoMetodoPago',
      type: IsarType.string,
    ),
    r'metodoPago': PropertySchema(
      id: 16,
      name: r'metodoPago',
      type: IsarType.string,
    ),
    r'metodoPagoFormateado': PropertySchema(
      id: 17,
      name: r'metodoPagoFormateado',
      type: IsarType.string,
    ),
    r'numeroFactura': PropertySchema(
      id: 18,
      name: r'numeroFactura',
      type: IsarType.string,
    ),
    r'numeroRecibo': PropertySchema(
      id: 19,
      name: r'numeroRecibo',
      type: IsarType.string,
    ),
    r'observaciones': PropertySchema(
      id: 20,
      name: r'observaciones',
      type: IsarType.string,
    ),
    r'periodoVenta': PropertySchema(
      id: 21,
      name: r'periodoVenta',
      type: IsarType.string,
    ),
    r'total': PropertySchema(
      id: 22,
      name: r'total',
      type: IsarType.double,
    ),
    r'totalFormateado': PropertySchema(
      id: 23,
      name: r'totalFormateado',
      type: IsarType.string,
    ),
    r'usuarioId': PropertySchema(
      id: 24,
      name: r'usuarioId',
      type: IsarType.long,
    ),
    r'vendedor': PropertySchema(
      id: 25,
      name: r'vendedor',
      type: IsarType.string,
    )
  },
  estimateSize: _ventaEstimateSize,
  serialize: _ventaSerialize,
  deserialize: _ventaDeserialize,
  deserializeProp: _ventaDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _ventaGetId,
  getLinks: _ventaGetLinks,
  attach: _ventaAttach,
  version: '3.1.0+1',
);

int _ventaEstimateSize(
  Venta object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.colorEstado.length * 3;
  bytesCount += 3 + object.colorPeriodo.length * 3;
  bytesCount += 3 + object.estado.length * 3;
  bytesCount += 3 + object.estadoFormateado.length * 3;
  bytesCount += 3 + object.fechaFormateada.length * 3;
  bytesCount += 3 + object.fechaHoraFormateada.length * 3;
  bytesCount += 3 + object.horaFormateada.length * 3;
  bytesCount += 3 + object.iconoMetodoPago.length * 3;
  bytesCount += 3 + object.metodoPago.length * 3;
  bytesCount += 3 + object.metodoPagoFormateado.length * 3;
  {
    final value = object.numeroFactura;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.numeroRecibo;
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
  bytesCount += 3 + object.periodoVenta.length * 3;
  bytesCount += 3 + object.totalFormateado.length * 3;
  {
    final value = object.vendedor;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _ventaSerialize(
  Venta object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.clienteId);
  writer.writeString(offsets[1], object.colorEstado);
  writer.writeString(offsets[2], object.colorPeriodo);
  writer.writeBool(offsets[3], object.esDeLaSemana);
  writer.writeBool(offsets[4], object.esDelDia);
  writer.writeBool(offsets[5], object.esDelMes);
  writer.writeBool(offsets[6], object.esReciente);
  writer.writeString(offsets[7], object.estado);
  writer.writeString(offsets[8], object.estadoFormateado);
  writer.writeDateTime(offsets[9], object.fecha);
  writer.writeDateTime(offsets[10], object.fechaActualizacion);
  writer.writeDateTime(offsets[11], object.fechaCreacion);
  writer.writeString(offsets[12], object.fechaFormateada);
  writer.writeString(offsets[13], object.fechaHoraFormateada);
  writer.writeString(offsets[14], object.horaFormateada);
  writer.writeString(offsets[15], object.iconoMetodoPago);
  writer.writeString(offsets[16], object.metodoPago);
  writer.writeString(offsets[17], object.metodoPagoFormateado);
  writer.writeString(offsets[18], object.numeroFactura);
  writer.writeString(offsets[19], object.numeroRecibo);
  writer.writeString(offsets[20], object.observaciones);
  writer.writeString(offsets[21], object.periodoVenta);
  writer.writeDouble(offsets[22], object.total);
  writer.writeString(offsets[23], object.totalFormateado);
  writer.writeLong(offsets[24], object.usuarioId);
  writer.writeString(offsets[25], object.vendedor);
}

Venta _ventaDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Venta(
    clienteId: reader.readLong(offsets[0]),
    estado: reader.readString(offsets[7]),
    fecha: reader.readDateTime(offsets[9]),
    metodoPago: reader.readString(offsets[16]),
    numeroFactura: reader.readStringOrNull(offsets[18]),
    numeroRecibo: reader.readStringOrNull(offsets[19]),
    observaciones: reader.readStringOrNull(offsets[20]),
    total: reader.readDouble(offsets[22]),
    usuarioId: reader.readLong(offsets[24]),
    vendedor: reader.readStringOrNull(offsets[25]),
  );
  object.fechaActualizacion = reader.readDateTimeOrNull(offsets[10]);
  object.fechaCreacion = reader.readDateTime(offsets[11]);
  object.id = id;
  return object;
}

P _ventaDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readDateTime(offset)) as P;
    case 10:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 11:
      return (reader.readDateTime(offset)) as P;
    case 12:
      return (reader.readString(offset)) as P;
    case 13:
      return (reader.readString(offset)) as P;
    case 14:
      return (reader.readString(offset)) as P;
    case 15:
      return (reader.readString(offset)) as P;
    case 16:
      return (reader.readString(offset)) as P;
    case 17:
      return (reader.readString(offset)) as P;
    case 18:
      return (reader.readStringOrNull(offset)) as P;
    case 19:
      return (reader.readStringOrNull(offset)) as P;
    case 20:
      return (reader.readStringOrNull(offset)) as P;
    case 21:
      return (reader.readString(offset)) as P;
    case 22:
      return (reader.readDouble(offset)) as P;
    case 23:
      return (reader.readString(offset)) as P;
    case 24:
      return (reader.readLong(offset)) as P;
    case 25:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _ventaGetId(Venta object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _ventaGetLinks(Venta object) {
  return [];
}

void _ventaAttach(IsarCollection<dynamic> col, Id id, Venta object) {
  object.id = id;
}

extension VentaQueryWhereSort on QueryBuilder<Venta, Venta, QWhere> {
  QueryBuilder<Venta, Venta, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension VentaQueryWhere on QueryBuilder<Venta, Venta, QWhereClause> {
  QueryBuilder<Venta, Venta, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Venta, Venta, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Venta, Venta, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Venta, Venta, QAfterWhereClause> idBetween(
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

extension VentaQueryFilter on QueryBuilder<Venta, Venta, QFilterCondition> {
  QueryBuilder<Venta, Venta, QAfterFilterCondition> clienteIdEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'clienteId',
        value: value,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> clienteIdGreaterThan(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> clienteIdLessThan(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> clienteIdBetween(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> colorEstadoEqualTo(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> colorEstadoGreaterThan(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> colorEstadoLessThan(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> colorEstadoBetween(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> colorEstadoStartsWith(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> colorEstadoEndsWith(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> colorEstadoContains(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> colorEstadoMatches(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> colorEstadoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'colorEstado',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> colorEstadoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'colorEstado',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> colorPeriodoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'colorPeriodo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> colorPeriodoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'colorPeriodo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> colorPeriodoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'colorPeriodo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> colorPeriodoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'colorPeriodo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> colorPeriodoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'colorPeriodo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> colorPeriodoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'colorPeriodo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> colorPeriodoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'colorPeriodo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> colorPeriodoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'colorPeriodo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> colorPeriodoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'colorPeriodo',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> colorPeriodoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'colorPeriodo',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> esDeLaSemanaEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'esDeLaSemana',
        value: value,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> esDelDiaEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'esDelDia',
        value: value,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> esDelMesEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'esDelMes',
        value: value,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> esRecienteEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'esReciente',
        value: value,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> estadoEqualTo(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> estadoGreaterThan(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> estadoLessThan(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> estadoBetween(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> estadoStartsWith(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> estadoEndsWith(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> estadoContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'estado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> estadoMatches(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> estadoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estado',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> estadoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'estado',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> estadoFormateadoEqualTo(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> estadoFormateadoGreaterThan(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> estadoFormateadoLessThan(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> estadoFormateadoBetween(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> estadoFormateadoStartsWith(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> estadoFormateadoEndsWith(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> estadoFormateadoContains(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> estadoFormateadoMatches(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> estadoFormateadoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estadoFormateado',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition>
      estadoFormateadoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'estadoFormateado',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> fechaEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fecha',
        value: value,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> fechaGreaterThan(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> fechaLessThan(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> fechaBetween(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> fechaActualizacionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fechaActualizacion',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition>
      fechaActualizacionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fechaActualizacion',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> fechaActualizacionEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaActualizacion',
        value: value,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition>
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> fechaActualizacionLessThan(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> fechaActualizacionBetween(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> fechaCreacionEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaCreacion',
        value: value,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> fechaCreacionGreaterThan(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> fechaCreacionLessThan(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> fechaCreacionBetween(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> fechaFormateadaEqualTo(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> fechaFormateadaGreaterThan(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> fechaFormateadaLessThan(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> fechaFormateadaBetween(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> fechaFormateadaStartsWith(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> fechaFormateadaEndsWith(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> fechaFormateadaContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fechaFormateada',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> fechaFormateadaMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fechaFormateada',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> fechaFormateadaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaFormateada',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition>
      fechaFormateadaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fechaFormateada',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> fechaHoraFormateadaEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaHoraFormateada',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition>
      fechaHoraFormateadaGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fechaHoraFormateada',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> fechaHoraFormateadaLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fechaHoraFormateada',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> fechaHoraFormateadaBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fechaHoraFormateada',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition>
      fechaHoraFormateadaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fechaHoraFormateada',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> fechaHoraFormateadaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fechaHoraFormateada',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> fechaHoraFormateadaContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fechaHoraFormateada',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> fechaHoraFormateadaMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fechaHoraFormateada',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition>
      fechaHoraFormateadaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaHoraFormateada',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition>
      fechaHoraFormateadaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fechaHoraFormateada',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> horaFormateadaEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'horaFormateada',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> horaFormateadaGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'horaFormateada',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> horaFormateadaLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'horaFormateada',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> horaFormateadaBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'horaFormateada',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> horaFormateadaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'horaFormateada',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> horaFormateadaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'horaFormateada',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> horaFormateadaContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'horaFormateada',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> horaFormateadaMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'horaFormateada',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> horaFormateadaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'horaFormateada',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> horaFormateadaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'horaFormateada',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> iconoMetodoPagoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'iconoMetodoPago',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> iconoMetodoPagoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'iconoMetodoPago',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> iconoMetodoPagoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'iconoMetodoPago',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> iconoMetodoPagoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'iconoMetodoPago',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> iconoMetodoPagoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'iconoMetodoPago',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> iconoMetodoPagoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'iconoMetodoPago',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> iconoMetodoPagoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'iconoMetodoPago',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> iconoMetodoPagoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'iconoMetodoPago',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> iconoMetodoPagoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'iconoMetodoPago',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition>
      iconoMetodoPagoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'iconoMetodoPago',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> metodoPagoEqualTo(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> metodoPagoGreaterThan(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> metodoPagoLessThan(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> metodoPagoBetween(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> metodoPagoStartsWith(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> metodoPagoEndsWith(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> metodoPagoContains(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> metodoPagoMatches(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> metodoPagoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'metodoPago',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> metodoPagoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'metodoPago',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> metodoPagoFormateadoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'metodoPagoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition>
      metodoPagoFormateadoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'metodoPagoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition>
      metodoPagoFormateadoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'metodoPagoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> metodoPagoFormateadoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'metodoPagoFormateado',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition>
      metodoPagoFormateadoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'metodoPagoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition>
      metodoPagoFormateadoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'metodoPagoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition>
      metodoPagoFormateadoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'metodoPagoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> metodoPagoFormateadoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'metodoPagoFormateado',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition>
      metodoPagoFormateadoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'metodoPagoFormateado',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition>
      metodoPagoFormateadoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'metodoPagoFormateado',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroFacturaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'numeroFactura',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroFacturaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'numeroFactura',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroFacturaEqualTo(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroFacturaGreaterThan(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroFacturaLessThan(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroFacturaBetween(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroFacturaStartsWith(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroFacturaEndsWith(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroFacturaContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'numeroFactura',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroFacturaMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'numeroFactura',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroFacturaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'numeroFactura',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroFacturaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'numeroFactura',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroReciboIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'numeroRecibo',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroReciboIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'numeroRecibo',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroReciboEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'numeroRecibo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroReciboGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'numeroRecibo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroReciboLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'numeroRecibo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroReciboBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'numeroRecibo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroReciboStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'numeroRecibo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroReciboEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'numeroRecibo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroReciboContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'numeroRecibo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroReciboMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'numeroRecibo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroReciboIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'numeroRecibo',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroReciboIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'numeroRecibo',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> observacionesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'observaciones',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> observacionesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'observaciones',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> observacionesEqualTo(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> observacionesGreaterThan(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> observacionesLessThan(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> observacionesBetween(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> observacionesStartsWith(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> observacionesEndsWith(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> observacionesContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'observaciones',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> observacionesMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'observaciones',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> observacionesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'observaciones',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> observacionesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'observaciones',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> periodoVentaEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'periodoVenta',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> periodoVentaGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'periodoVenta',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> periodoVentaLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'periodoVenta',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> periodoVentaBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'periodoVenta',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> periodoVentaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'periodoVenta',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> periodoVentaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'periodoVenta',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> periodoVentaContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'periodoVenta',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> periodoVentaMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'periodoVenta',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> periodoVentaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'periodoVenta',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> periodoVentaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'periodoVenta',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> totalEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'total',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> totalGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'total',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> totalLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'total',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> totalBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'total',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> totalFormateadoEqualTo(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> totalFormateadoGreaterThan(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> totalFormateadoLessThan(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> totalFormateadoBetween(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> totalFormateadoStartsWith(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> totalFormateadoEndsWith(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> totalFormateadoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'totalFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> totalFormateadoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'totalFormateado',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> totalFormateadoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalFormateado',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition>
      totalFormateadoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'totalFormateado',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> usuarioIdEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'usuarioId',
        value: value,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> usuarioIdGreaterThan(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> usuarioIdLessThan(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> usuarioIdBetween(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> vendedorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'vendedor',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> vendedorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'vendedor',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> vendedorEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vendedor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> vendedorGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'vendedor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> vendedorLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'vendedor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> vendedorBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'vendedor',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> vendedorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'vendedor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> vendedorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'vendedor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> vendedorContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'vendedor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> vendedorMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'vendedor',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> vendedorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vendedor',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> vendedorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'vendedor',
        value: '',
      ));
    });
  }
}

extension VentaQueryObject on QueryBuilder<Venta, Venta, QFilterCondition> {}

extension VentaQueryLinks on QueryBuilder<Venta, Venta, QFilterCondition> {}

extension VentaQuerySortBy on QueryBuilder<Venta, Venta, QSortBy> {
  QueryBuilder<Venta, Venta, QAfterSortBy> sortByClienteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clienteId', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByClienteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clienteId', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByColorEstado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorEstado', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByColorEstadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorEstado', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByColorPeriodo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorPeriodo', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByColorPeriodoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorPeriodo', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByEsDeLaSemana() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esDeLaSemana', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByEsDeLaSemanaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esDeLaSemana', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByEsDelDia() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esDelDia', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByEsDelDiaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esDelDia', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByEsDelMes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esDelMes', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByEsDelMesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esDelMes', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByEsReciente() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esReciente', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByEsRecienteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esReciente', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByEstado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByEstadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByEstadoFormateado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estadoFormateado', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByEstadoFormateadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estadoFormateado', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByFecha() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fecha', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByFechaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fecha', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByFechaActualizacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaActualizacion', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByFechaActualizacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaActualizacion', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByFechaCreacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByFechaFormateada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaFormateada', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByFechaFormateadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaFormateada', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByFechaHoraFormateada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaHoraFormateada', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByFechaHoraFormateadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaHoraFormateada', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByHoraFormateada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'horaFormateada', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByHoraFormateadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'horaFormateada', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByIconoMetodoPago() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconoMetodoPago', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByIconoMetodoPagoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconoMetodoPago', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByMetodoPago() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'metodoPago', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByMetodoPagoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'metodoPago', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByMetodoPagoFormateado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'metodoPagoFormateado', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByMetodoPagoFormateadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'metodoPagoFormateado', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByNumeroFactura() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroFactura', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByNumeroFacturaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroFactura', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByNumeroRecibo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroRecibo', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByNumeroReciboDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroRecibo', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByObservaciones() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observaciones', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByObservacionesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observaciones', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByPeriodoVenta() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'periodoVenta', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByPeriodoVentaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'periodoVenta', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByTotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByTotalFormateado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalFormateado', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByTotalFormateadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalFormateado', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByUsuarioId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usuarioId', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByUsuarioIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usuarioId', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByVendedor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vendedor', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByVendedorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vendedor', Sort.desc);
    });
  }
}

extension VentaQuerySortThenBy on QueryBuilder<Venta, Venta, QSortThenBy> {
  QueryBuilder<Venta, Venta, QAfterSortBy> thenByClienteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clienteId', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByClienteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clienteId', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByColorEstado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorEstado', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByColorEstadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorEstado', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByColorPeriodo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorPeriodo', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByColorPeriodoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorPeriodo', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByEsDeLaSemana() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esDeLaSemana', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByEsDeLaSemanaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esDeLaSemana', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByEsDelDia() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esDelDia', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByEsDelDiaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esDelDia', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByEsDelMes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esDelMes', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByEsDelMesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esDelMes', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByEsReciente() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esReciente', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByEsRecienteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esReciente', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByEstado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByEstadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByEstadoFormateado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estadoFormateado', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByEstadoFormateadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estadoFormateado', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByFecha() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fecha', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByFechaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fecha', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByFechaActualizacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaActualizacion', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByFechaActualizacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaActualizacion', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByFechaCreacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByFechaFormateada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaFormateada', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByFechaFormateadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaFormateada', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByFechaHoraFormateada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaHoraFormateada', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByFechaHoraFormateadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaHoraFormateada', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByHoraFormateada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'horaFormateada', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByHoraFormateadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'horaFormateada', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByIconoMetodoPago() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconoMetodoPago', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByIconoMetodoPagoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconoMetodoPago', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByMetodoPago() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'metodoPago', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByMetodoPagoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'metodoPago', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByMetodoPagoFormateado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'metodoPagoFormateado', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByMetodoPagoFormateadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'metodoPagoFormateado', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByNumeroFactura() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroFactura', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByNumeroFacturaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroFactura', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByNumeroRecibo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroRecibo', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByNumeroReciboDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroRecibo', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByObservaciones() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observaciones', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByObservacionesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observaciones', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByPeriodoVenta() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'periodoVenta', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByPeriodoVentaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'periodoVenta', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByTotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByTotalFormateado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalFormateado', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByTotalFormateadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalFormateado', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByUsuarioId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usuarioId', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByUsuarioIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usuarioId', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByVendedor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vendedor', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByVendedorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vendedor', Sort.desc);
    });
  }
}

extension VentaQueryWhereDistinct on QueryBuilder<Venta, Venta, QDistinct> {
  QueryBuilder<Venta, Venta, QDistinct> distinctByClienteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'clienteId');
    });
  }

  QueryBuilder<Venta, Venta, QDistinct> distinctByColorEstado(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'colorEstado', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Venta, Venta, QDistinct> distinctByColorPeriodo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'colorPeriodo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Venta, Venta, QDistinct> distinctByEsDeLaSemana() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'esDeLaSemana');
    });
  }

  QueryBuilder<Venta, Venta, QDistinct> distinctByEsDelDia() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'esDelDia');
    });
  }

  QueryBuilder<Venta, Venta, QDistinct> distinctByEsDelMes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'esDelMes');
    });
  }

  QueryBuilder<Venta, Venta, QDistinct> distinctByEsReciente() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'esReciente');
    });
  }

  QueryBuilder<Venta, Venta, QDistinct> distinctByEstado(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estado', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Venta, Venta, QDistinct> distinctByEstadoFormateado(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estadoFormateado',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Venta, Venta, QDistinct> distinctByFecha() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fecha');
    });
  }

  QueryBuilder<Venta, Venta, QDistinct> distinctByFechaActualizacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaActualizacion');
    });
  }

  QueryBuilder<Venta, Venta, QDistinct> distinctByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaCreacion');
    });
  }

  QueryBuilder<Venta, Venta, QDistinct> distinctByFechaFormateada(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaFormateada',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Venta, Venta, QDistinct> distinctByFechaHoraFormateada(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaHoraFormateada',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Venta, Venta, QDistinct> distinctByHoraFormateada(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'horaFormateada',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Venta, Venta, QDistinct> distinctByIconoMetodoPago(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'iconoMetodoPago',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Venta, Venta, QDistinct> distinctByMetodoPago(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'metodoPago', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Venta, Venta, QDistinct> distinctByMetodoPagoFormateado(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'metodoPagoFormateado',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Venta, Venta, QDistinct> distinctByNumeroFactura(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'numeroFactura',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Venta, Venta, QDistinct> distinctByNumeroRecibo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'numeroRecibo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Venta, Venta, QDistinct> distinctByObservaciones(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'observaciones',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Venta, Venta, QDistinct> distinctByPeriodoVenta(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'periodoVenta', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Venta, Venta, QDistinct> distinctByTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'total');
    });
  }

  QueryBuilder<Venta, Venta, QDistinct> distinctByTotalFormateado(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalFormateado',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Venta, Venta, QDistinct> distinctByUsuarioId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'usuarioId');
    });
  }

  QueryBuilder<Venta, Venta, QDistinct> distinctByVendedor(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vendedor', caseSensitive: caseSensitive);
    });
  }
}

extension VentaQueryProperty on QueryBuilder<Venta, Venta, QQueryProperty> {
  QueryBuilder<Venta, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Venta, int, QQueryOperations> clienteIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'clienteId');
    });
  }

  QueryBuilder<Venta, String, QQueryOperations> colorEstadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'colorEstado');
    });
  }

  QueryBuilder<Venta, String, QQueryOperations> colorPeriodoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'colorPeriodo');
    });
  }

  QueryBuilder<Venta, bool, QQueryOperations> esDeLaSemanaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'esDeLaSemana');
    });
  }

  QueryBuilder<Venta, bool, QQueryOperations> esDelDiaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'esDelDia');
    });
  }

  QueryBuilder<Venta, bool, QQueryOperations> esDelMesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'esDelMes');
    });
  }

  QueryBuilder<Venta, bool, QQueryOperations> esRecienteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'esReciente');
    });
  }

  QueryBuilder<Venta, String, QQueryOperations> estadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estado');
    });
  }

  QueryBuilder<Venta, String, QQueryOperations> estadoFormateadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estadoFormateado');
    });
  }

  QueryBuilder<Venta, DateTime, QQueryOperations> fechaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fecha');
    });
  }

  QueryBuilder<Venta, DateTime?, QQueryOperations>
      fechaActualizacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaActualizacion');
    });
  }

  QueryBuilder<Venta, DateTime, QQueryOperations> fechaCreacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaCreacion');
    });
  }

  QueryBuilder<Venta, String, QQueryOperations> fechaFormateadaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaFormateada');
    });
  }

  QueryBuilder<Venta, String, QQueryOperations> fechaHoraFormateadaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaHoraFormateada');
    });
  }

  QueryBuilder<Venta, String, QQueryOperations> horaFormateadaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'horaFormateada');
    });
  }

  QueryBuilder<Venta, String, QQueryOperations> iconoMetodoPagoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'iconoMetodoPago');
    });
  }

  QueryBuilder<Venta, String, QQueryOperations> metodoPagoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'metodoPago');
    });
  }

  QueryBuilder<Venta, String, QQueryOperations> metodoPagoFormateadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'metodoPagoFormateado');
    });
  }

  QueryBuilder<Venta, String?, QQueryOperations> numeroFacturaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'numeroFactura');
    });
  }

  QueryBuilder<Venta, String?, QQueryOperations> numeroReciboProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'numeroRecibo');
    });
  }

  QueryBuilder<Venta, String?, QQueryOperations> observacionesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'observaciones');
    });
  }

  QueryBuilder<Venta, String, QQueryOperations> periodoVentaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'periodoVenta');
    });
  }

  QueryBuilder<Venta, double, QQueryOperations> totalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'total');
    });
  }

  QueryBuilder<Venta, String, QQueryOperations> totalFormateadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalFormateado');
    });
  }

  QueryBuilder<Venta, int, QQueryOperations> usuarioIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'usuarioId');
    });
  }

  QueryBuilder<Venta, String?, QQueryOperations> vendedorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vendedor');
    });
  }
}
