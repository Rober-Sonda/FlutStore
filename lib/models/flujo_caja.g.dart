// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flujo_caja.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetFlujoCajaCollection on Isar {
  IsarCollection<FlujoCaja> get flujoCajas => this.collection();
}

const FlujoCajaSchema = CollectionSchema(
  name: r'FlujoCaja',
  id: 1973122697548107331,
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
    r'clienteId': PropertySchema(
      id: 2,
      name: r'clienteId',
      type: IsarType.long,
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
    r'colorTipo': PropertySchema(
      id: 5,
      name: r'colorTipo',
      type: IsarType.string,
    ),
    r'compraId': PropertySchema(
      id: 6,
      name: r'compraId',
      type: IsarType.long,
    ),
    r'concepto': PropertySchema(
      id: 7,
      name: r'concepto',
      type: IsarType.string,
    ),
    r'confirmado': PropertySchema(
      id: 8,
      name: r'confirmado',
      type: IsarType.bool,
    ),
    r'descripcion': PropertySchema(
      id: 9,
      name: r'descripcion',
      type: IsarType.string,
    ),
    r'esEgreso': PropertySchema(
      id: 10,
      name: r'esEgreso',
      type: IsarType.bool,
    ),
    r'esIngreso': PropertySchema(
      id: 11,
      name: r'esIngreso',
      type: IsarType.bool,
    ),
    r'esRecurrente': PropertySchema(
      id: 12,
      name: r'esRecurrente',
      type: IsarType.bool,
    ),
    r'estadoTransaccion': PropertySchema(
      id: 13,
      name: r'estadoTransaccion',
      type: IsarType.string,
    ),
    r'fecha': PropertySchema(
      id: 14,
      name: r'fecha',
      type: IsarType.dateTime,
    ),
    r'fechaActualizacion': PropertySchema(
      id: 15,
      name: r'fechaActualizacion',
      type: IsarType.dateTime,
    ),
    r'fechaCreacion': PropertySchema(
      id: 16,
      name: r'fechaCreacion',
      type: IsarType.dateTime,
    ),
    r'frecuenciaRecurrencia': PropertySchema(
      id: 17,
      name: r'frecuenciaRecurrencia',
      type: IsarType.string,
    ),
    r'iconoCategoria': PropertySchema(
      id: 18,
      name: r'iconoCategoria',
      type: IsarType.string,
    ),
    r'iconoMetodoPago': PropertySchema(
      id: 19,
      name: r'iconoMetodoPago',
      type: IsarType.string,
    ),
    r'metodoPago': PropertySchema(
      id: 20,
      name: r'metodoPago',
      type: IsarType.string,
    ),
    r'metodoPagoFormateado': PropertySchema(
      id: 21,
      name: r'metodoPagoFormateado',
      type: IsarType.string,
    ),
    r'monto': PropertySchema(
      id: 22,
      name: r'monto',
      type: IsarType.double,
    ),
    r'montoConSigno': PropertySchema(
      id: 23,
      name: r'montoConSigno',
      type: IsarType.double,
    ),
    r'montoFormateado': PropertySchema(
      id: 24,
      name: r'montoFormateado',
      type: IsarType.string,
    ),
    r'motivoAnulacion': PropertySchema(
      id: 25,
      name: r'motivoAnulacion',
      type: IsarType.string,
    ),
    r'numeroComprobante': PropertySchema(
      id: 26,
      name: r'numeroComprobante',
      type: IsarType.string,
    ),
    r'observaciones': PropertySchema(
      id: 27,
      name: r'observaciones',
      type: IsarType.string,
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
    r'usuarioId': PropertySchema(
      id: 30,
      name: r'usuarioId',
      type: IsarType.long,
    ),
    r'ventaId': PropertySchema(
      id: 31,
      name: r'ventaId',
      type: IsarType.long,
    )
  },
  estimateSize: _flujoCajaEstimateSize,
  serialize: _flujoCajaSerialize,
  deserialize: _flujoCajaDeserialize,
  deserializeProp: _flujoCajaDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _flujoCajaGetId,
  getLinks: _flujoCajaGetLinks,
  attach: _flujoCajaAttach,
  version: '3.1.0+1',
);

int _flujoCajaEstimateSize(
  FlujoCaja object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.categoria.length * 3;
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
  bytesCount += 3 + object.iconoMetodoPago.length * 3;
  {
    final value = object.metodoPago;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.metodoPagoFormateado.length * 3;
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
  return bytesCount;
}

void _flujoCajaSerialize(
  FlujoCaja object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.anulado);
  writer.writeString(offsets[1], object.categoria);
  writer.writeLong(offsets[2], object.clienteId);
  writer.writeString(offsets[3], object.colorCategoria);
  writer.writeString(offsets[4], object.colorEstado);
  writer.writeString(offsets[5], object.colorTipo);
  writer.writeLong(offsets[6], object.compraId);
  writer.writeString(offsets[7], object.concepto);
  writer.writeBool(offsets[8], object.confirmado);
  writer.writeString(offsets[9], object.descripcion);
  writer.writeBool(offsets[10], object.esEgreso);
  writer.writeBool(offsets[11], object.esIngreso);
  writer.writeBool(offsets[12], object.esRecurrente);
  writer.writeString(offsets[13], object.estadoTransaccion);
  writer.writeDateTime(offsets[14], object.fecha);
  writer.writeDateTime(offsets[15], object.fechaActualizacion);
  writer.writeDateTime(offsets[16], object.fechaCreacion);
  writer.writeString(offsets[17], object.frecuenciaRecurrencia);
  writer.writeString(offsets[18], object.iconoCategoria);
  writer.writeString(offsets[19], object.iconoMetodoPago);
  writer.writeString(offsets[20], object.metodoPago);
  writer.writeString(offsets[21], object.metodoPagoFormateado);
  writer.writeDouble(offsets[22], object.monto);
  writer.writeDouble(offsets[23], object.montoConSigno);
  writer.writeString(offsets[24], object.montoFormateado);
  writer.writeString(offsets[25], object.motivoAnulacion);
  writer.writeString(offsets[26], object.numeroComprobante);
  writer.writeString(offsets[27], object.observaciones);
  writer.writeLong(offsets[28], object.proveedorId);
  writer.writeString(offsets[29], object.tipo);
  writer.writeLong(offsets[30], object.usuarioId);
  writer.writeLong(offsets[31], object.ventaId);
}

FlujoCaja _flujoCajaDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FlujoCaja(
    anulado: reader.readBoolOrNull(offsets[0]) ?? false,
    categoria: reader.readString(offsets[1]),
    clienteId: reader.readLongOrNull(offsets[2]),
    compraId: reader.readLongOrNull(offsets[6]),
    concepto: reader.readString(offsets[7]),
    confirmado: reader.readBoolOrNull(offsets[8]) ?? true,
    descripcion: reader.readStringOrNull(offsets[9]),
    esRecurrente: reader.readBoolOrNull(offsets[12]) ?? false,
    fecha: reader.readDateTime(offsets[14]),
    frecuenciaRecurrencia: reader.readStringOrNull(offsets[17]),
    metodoPago: reader.readStringOrNull(offsets[20]),
    monto: reader.readDouble(offsets[22]),
    motivoAnulacion: reader.readStringOrNull(offsets[25]),
    numeroComprobante: reader.readStringOrNull(offsets[26]),
    observaciones: reader.readStringOrNull(offsets[27]),
    proveedorId: reader.readLongOrNull(offsets[28]),
    tipo: reader.readString(offsets[29]),
    usuarioId: reader.readLong(offsets[30]),
    ventaId: reader.readLongOrNull(offsets[31]),
  );
  object.fechaActualizacion = reader.readDateTimeOrNull(offsets[15]);
  object.fechaCreacion = reader.readDateTime(offsets[16]);
  object.id = id;
  return object;
}

P _flujoCajaDeserializeProp<P>(
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
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readBoolOrNull(offset) ?? true) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readBool(offset)) as P;
    case 11:
      return (reader.readBool(offset)) as P;
    case 12:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 13:
      return (reader.readString(offset)) as P;
    case 14:
      return (reader.readDateTime(offset)) as P;
    case 15:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 16:
      return (reader.readDateTime(offset)) as P;
    case 17:
      return (reader.readStringOrNull(offset)) as P;
    case 18:
      return (reader.readString(offset)) as P;
    case 19:
      return (reader.readString(offset)) as P;
    case 20:
      return (reader.readStringOrNull(offset)) as P;
    case 21:
      return (reader.readString(offset)) as P;
    case 22:
      return (reader.readDouble(offset)) as P;
    case 23:
      return (reader.readDouble(offset)) as P;
    case 24:
      return (reader.readString(offset)) as P;
    case 25:
      return (reader.readStringOrNull(offset)) as P;
    case 26:
      return (reader.readStringOrNull(offset)) as P;
    case 27:
      return (reader.readStringOrNull(offset)) as P;
    case 28:
      return (reader.readLongOrNull(offset)) as P;
    case 29:
      return (reader.readString(offset)) as P;
    case 30:
      return (reader.readLong(offset)) as P;
    case 31:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _flujoCajaGetId(FlujoCaja object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _flujoCajaGetLinks(FlujoCaja object) {
  return [];
}

void _flujoCajaAttach(IsarCollection<dynamic> col, Id id, FlujoCaja object) {
  object.id = id;
}

extension FlujoCajaQueryWhereSort
    on QueryBuilder<FlujoCaja, FlujoCaja, QWhere> {
  QueryBuilder<FlujoCaja, FlujoCaja, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension FlujoCajaQueryWhere
    on QueryBuilder<FlujoCaja, FlujoCaja, QWhereClause> {
  QueryBuilder<FlujoCaja, FlujoCaja, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterWhereClause> idBetween(
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

extension FlujoCajaQueryFilter
    on QueryBuilder<FlujoCaja, FlujoCaja, QFilterCondition> {
  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> anuladoEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'anulado',
        value: value,
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> categoriaEqualTo(
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> categoriaLessThan(
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> categoriaBetween(
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> categoriaStartsWith(
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> categoriaEndsWith(
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> categoriaContains(
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> categoriaMatches(
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> categoriaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'categoria',
        value: '',
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
      categoriaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'categoria',
        value: '',
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> clienteIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'clienteId',
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
      clienteIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'clienteId',
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> clienteIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'clienteId',
        value: value,
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> clienteIdLessThan(
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> clienteIdBetween(
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
      colorCategoriaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'colorCategoria',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
      colorCategoriaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'colorCategoria',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
      colorCategoriaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'colorCategoria',
        value: '',
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
      colorCategoriaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'colorCategoria',
        value: '',
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> colorEstadoEqualTo(
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> colorEstadoLessThan(
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> colorEstadoBetween(
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> colorEstadoEndsWith(
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> colorEstadoContains(
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> colorEstadoMatches(
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
      colorEstadoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'colorEstado',
        value: '',
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
      colorEstadoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'colorEstado',
        value: '',
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> colorTipoEqualTo(
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> colorTipoLessThan(
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> colorTipoBetween(
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> colorTipoStartsWith(
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> colorTipoEndsWith(
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> colorTipoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'colorTipo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> colorTipoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'colorTipo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> colorTipoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'colorTipo',
        value: '',
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
      colorTipoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'colorTipo',
        value: '',
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> compraIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'compraId',
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
      compraIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'compraId',
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> compraIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'compraId',
        value: value,
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> compraIdGreaterThan(
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> compraIdLessThan(
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> compraIdBetween(
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> conceptoEqualTo(
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> conceptoGreaterThan(
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> conceptoLessThan(
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> conceptoBetween(
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> conceptoStartsWith(
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> conceptoEndsWith(
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> conceptoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'concepto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> conceptoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'concepto',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> conceptoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'concepto',
        value: '',
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
      conceptoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'concepto',
        value: '',
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> confirmadoEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'confirmado',
        value: value,
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
      descripcionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'descripcion',
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
      descripcionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'descripcion',
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> descripcionEqualTo(
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> descripcionLessThan(
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> descripcionBetween(
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> descripcionEndsWith(
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> descripcionContains(
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> descripcionMatches(
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
      descripcionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'descripcion',
        value: '',
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
      descripcionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'descripcion',
        value: '',
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> esEgresoEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'esEgreso',
        value: value,
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> esIngresoEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'esIngreso',
        value: value,
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> esRecurrenteEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'esRecurrente',
        value: value,
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
      estadoTransaccionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'estadoTransaccion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
      estadoTransaccionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'estadoTransaccion',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
      estadoTransaccionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estadoTransaccion',
        value: '',
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
      estadoTransaccionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'estadoTransaccion',
        value: '',
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> fechaEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fecha',
        value: value,
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> fechaGreaterThan(
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> fechaLessThan(
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> fechaBetween(
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
      fechaActualizacionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fechaActualizacion',
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
      fechaActualizacionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fechaActualizacion',
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
      fechaActualizacionEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaActualizacion',
        value: value,
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
      fechaCreacionEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaCreacion',
        value: value,
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
      frecuenciaRecurrenciaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'frecuenciaRecurrencia',
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
      frecuenciaRecurrenciaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'frecuenciaRecurrencia',
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
      frecuenciaRecurrenciaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'frecuenciaRecurrencia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
      frecuenciaRecurrenciaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frecuenciaRecurrencia',
        value: '',
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
      frecuenciaRecurrenciaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'frecuenciaRecurrencia',
        value: '',
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
      iconoCategoriaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'iconoCategoria',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
      iconoCategoriaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'iconoCategoria',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
      iconoCategoriaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'iconoCategoria',
        value: '',
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
      iconoCategoriaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'iconoCategoria',
        value: '',
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
      iconoMetodoPagoEqualTo(
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
      iconoMetodoPagoGreaterThan(
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
      iconoMetodoPagoLessThan(
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
      iconoMetodoPagoBetween(
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
      iconoMetodoPagoStartsWith(
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
      iconoMetodoPagoEndsWith(
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
      iconoMetodoPagoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'iconoMetodoPago',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
      iconoMetodoPagoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'iconoMetodoPago',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
      iconoMetodoPagoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'iconoMetodoPago',
        value: '',
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
      iconoMetodoPagoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'iconoMetodoPago',
        value: '',
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> idBetween(
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> metodoPagoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'metodoPago',
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
      metodoPagoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'metodoPago',
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> metodoPagoEqualTo(
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> metodoPagoLessThan(
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> metodoPagoBetween(
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> metodoPagoEndsWith(
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> metodoPagoContains(
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> metodoPagoMatches(
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
      metodoPagoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'metodoPago',
        value: '',
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
      metodoPagoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'metodoPago',
        value: '',
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
      metodoPagoFormateadoEqualTo(
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
      metodoPagoFormateadoBetween(
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
      metodoPagoFormateadoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'metodoPagoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
      metodoPagoFormateadoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'metodoPagoFormateado',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
      metodoPagoFormateadoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'metodoPagoFormateado',
        value: '',
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
      metodoPagoFormateadoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'metodoPagoFormateado',
        value: '',
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> montoEqualTo(
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> montoGreaterThan(
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> montoLessThan(
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> montoBetween(
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
      montoFormateadoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'montoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
      montoFormateadoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'montoFormateado',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
      montoFormateadoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'montoFormateado',
        value: '',
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
      montoFormateadoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'montoFormateado',
        value: '',
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
      motivoAnulacionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'motivoAnulacion',
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
      motivoAnulacionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'motivoAnulacion',
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
      motivoAnulacionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'motivoAnulacion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
      motivoAnulacionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'motivoAnulacion',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
      motivoAnulacionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'motivoAnulacion',
        value: '',
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
      motivoAnulacionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'motivoAnulacion',
        value: '',
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
      numeroComprobanteIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'numeroComprobante',
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
      numeroComprobanteIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'numeroComprobante',
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
      numeroComprobanteContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'numeroComprobante',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
      numeroComprobanteMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'numeroComprobante',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
      numeroComprobanteIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'numeroComprobante',
        value: '',
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
      numeroComprobanteIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'numeroComprobante',
        value: '',
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
      observacionesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'observaciones',
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
      observacionesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'observaciones',
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
      observacionesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'observaciones',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
      observacionesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'observaciones',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
      observacionesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'observaciones',
        value: '',
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
      observacionesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'observaciones',
        value: '',
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
      proveedorIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'proveedorId',
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
      proveedorIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'proveedorId',
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> proveedorIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'proveedorId',
        value: value,
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> proveedorIdLessThan(
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> proveedorIdBetween(
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> tipoEqualTo(
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> tipoGreaterThan(
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> tipoLessThan(
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> tipoBetween(
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> tipoStartsWith(
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> tipoEndsWith(
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> tipoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tipo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> tipoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tipo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> tipoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tipo',
        value: '',
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> tipoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tipo',
        value: '',
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> usuarioIdEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'usuarioId',
        value: value,
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition>
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> usuarioIdLessThan(
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> usuarioIdBetween(
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> ventaIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ventaId',
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> ventaIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ventaId',
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> ventaIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ventaId',
        value: value,
      ));
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> ventaIdGreaterThan(
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> ventaIdLessThan(
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

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterFilterCondition> ventaIdBetween(
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

extension FlujoCajaQueryObject
    on QueryBuilder<FlujoCaja, FlujoCaja, QFilterCondition> {}

extension FlujoCajaQueryLinks
    on QueryBuilder<FlujoCaja, FlujoCaja, QFilterCondition> {}

extension FlujoCajaQuerySortBy on QueryBuilder<FlujoCaja, FlujoCaja, QSortBy> {
  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> sortByAnulado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'anulado', Sort.asc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> sortByAnuladoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'anulado', Sort.desc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> sortByCategoria() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoria', Sort.asc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> sortByCategoriaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoria', Sort.desc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> sortByClienteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clienteId', Sort.asc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> sortByClienteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clienteId', Sort.desc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> sortByColorCategoria() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorCategoria', Sort.asc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> sortByColorCategoriaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorCategoria', Sort.desc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> sortByColorEstado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorEstado', Sort.asc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> sortByColorEstadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorEstado', Sort.desc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> sortByColorTipo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorTipo', Sort.asc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> sortByColorTipoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorTipo', Sort.desc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> sortByCompraId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'compraId', Sort.asc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> sortByCompraIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'compraId', Sort.desc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> sortByConcepto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'concepto', Sort.asc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> sortByConceptoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'concepto', Sort.desc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> sortByConfirmado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'confirmado', Sort.asc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> sortByConfirmadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'confirmado', Sort.desc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> sortByDescripcion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descripcion', Sort.asc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> sortByDescripcionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descripcion', Sort.desc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> sortByEsEgreso() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esEgreso', Sort.asc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> sortByEsEgresoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esEgreso', Sort.desc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> sortByEsIngreso() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esIngreso', Sort.asc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> sortByEsIngresoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esIngreso', Sort.desc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> sortByEsRecurrente() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esRecurrente', Sort.asc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> sortByEsRecurrenteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esRecurrente', Sort.desc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> sortByEstadoTransaccion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estadoTransaccion', Sort.asc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy>
      sortByEstadoTransaccionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estadoTransaccion', Sort.desc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> sortByFecha() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fecha', Sort.asc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> sortByFechaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fecha', Sort.desc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> sortByFechaActualizacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaActualizacion', Sort.asc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy>
      sortByFechaActualizacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaActualizacion', Sort.desc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> sortByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.asc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> sortByFechaCreacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.desc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy>
      sortByFrecuenciaRecurrencia() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frecuenciaRecurrencia', Sort.asc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy>
      sortByFrecuenciaRecurrenciaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frecuenciaRecurrencia', Sort.desc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> sortByIconoCategoria() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconoCategoria', Sort.asc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> sortByIconoCategoriaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconoCategoria', Sort.desc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> sortByIconoMetodoPago() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconoMetodoPago', Sort.asc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> sortByIconoMetodoPagoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconoMetodoPago', Sort.desc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> sortByMetodoPago() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'metodoPago', Sort.asc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> sortByMetodoPagoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'metodoPago', Sort.desc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy>
      sortByMetodoPagoFormateado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'metodoPagoFormateado', Sort.asc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy>
      sortByMetodoPagoFormateadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'metodoPagoFormateado', Sort.desc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> sortByMonto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monto', Sort.asc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> sortByMontoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monto', Sort.desc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> sortByMontoConSigno() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoConSigno', Sort.asc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> sortByMontoConSignoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoConSigno', Sort.desc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> sortByMontoFormateado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoFormateado', Sort.asc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> sortByMontoFormateadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoFormateado', Sort.desc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> sortByMotivoAnulacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'motivoAnulacion', Sort.asc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> sortByMotivoAnulacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'motivoAnulacion', Sort.desc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> sortByNumeroComprobante() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroComprobante', Sort.asc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy>
      sortByNumeroComprobanteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroComprobante', Sort.desc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> sortByObservaciones() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observaciones', Sort.asc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> sortByObservacionesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observaciones', Sort.desc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> sortByProveedorId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proveedorId', Sort.asc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> sortByProveedorIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proveedorId', Sort.desc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> sortByTipo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo', Sort.asc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> sortByTipoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo', Sort.desc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> sortByUsuarioId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usuarioId', Sort.asc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> sortByUsuarioIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usuarioId', Sort.desc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> sortByVentaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ventaId', Sort.asc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> sortByVentaIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ventaId', Sort.desc);
    });
  }
}

extension FlujoCajaQuerySortThenBy
    on QueryBuilder<FlujoCaja, FlujoCaja, QSortThenBy> {
  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> thenByAnulado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'anulado', Sort.asc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> thenByAnuladoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'anulado', Sort.desc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> thenByCategoria() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoria', Sort.asc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> thenByCategoriaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoria', Sort.desc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> thenByClienteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clienteId', Sort.asc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> thenByClienteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clienteId', Sort.desc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> thenByColorCategoria() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorCategoria', Sort.asc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> thenByColorCategoriaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorCategoria', Sort.desc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> thenByColorEstado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorEstado', Sort.asc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> thenByColorEstadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorEstado', Sort.desc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> thenByColorTipo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorTipo', Sort.asc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> thenByColorTipoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorTipo', Sort.desc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> thenByCompraId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'compraId', Sort.asc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> thenByCompraIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'compraId', Sort.desc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> thenByConcepto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'concepto', Sort.asc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> thenByConceptoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'concepto', Sort.desc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> thenByConfirmado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'confirmado', Sort.asc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> thenByConfirmadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'confirmado', Sort.desc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> thenByDescripcion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descripcion', Sort.asc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> thenByDescripcionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descripcion', Sort.desc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> thenByEsEgreso() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esEgreso', Sort.asc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> thenByEsEgresoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esEgreso', Sort.desc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> thenByEsIngreso() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esIngreso', Sort.asc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> thenByEsIngresoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esIngreso', Sort.desc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> thenByEsRecurrente() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esRecurrente', Sort.asc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> thenByEsRecurrenteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esRecurrente', Sort.desc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> thenByEstadoTransaccion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estadoTransaccion', Sort.asc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy>
      thenByEstadoTransaccionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estadoTransaccion', Sort.desc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> thenByFecha() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fecha', Sort.asc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> thenByFechaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fecha', Sort.desc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> thenByFechaActualizacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaActualizacion', Sort.asc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy>
      thenByFechaActualizacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaActualizacion', Sort.desc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> thenByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.asc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> thenByFechaCreacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.desc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy>
      thenByFrecuenciaRecurrencia() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frecuenciaRecurrencia', Sort.asc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy>
      thenByFrecuenciaRecurrenciaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frecuenciaRecurrencia', Sort.desc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> thenByIconoCategoria() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconoCategoria', Sort.asc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> thenByIconoCategoriaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconoCategoria', Sort.desc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> thenByIconoMetodoPago() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconoMetodoPago', Sort.asc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> thenByIconoMetodoPagoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconoMetodoPago', Sort.desc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> thenByMetodoPago() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'metodoPago', Sort.asc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> thenByMetodoPagoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'metodoPago', Sort.desc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy>
      thenByMetodoPagoFormateado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'metodoPagoFormateado', Sort.asc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy>
      thenByMetodoPagoFormateadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'metodoPagoFormateado', Sort.desc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> thenByMonto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monto', Sort.asc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> thenByMontoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monto', Sort.desc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> thenByMontoConSigno() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoConSigno', Sort.asc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> thenByMontoConSignoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoConSigno', Sort.desc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> thenByMontoFormateado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoFormateado', Sort.asc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> thenByMontoFormateadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoFormateado', Sort.desc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> thenByMotivoAnulacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'motivoAnulacion', Sort.asc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> thenByMotivoAnulacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'motivoAnulacion', Sort.desc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> thenByNumeroComprobante() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroComprobante', Sort.asc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy>
      thenByNumeroComprobanteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroComprobante', Sort.desc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> thenByObservaciones() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observaciones', Sort.asc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> thenByObservacionesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observaciones', Sort.desc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> thenByProveedorId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proveedorId', Sort.asc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> thenByProveedorIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proveedorId', Sort.desc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> thenByTipo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo', Sort.asc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> thenByTipoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo', Sort.desc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> thenByUsuarioId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usuarioId', Sort.asc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> thenByUsuarioIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usuarioId', Sort.desc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> thenByVentaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ventaId', Sort.asc);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QAfterSortBy> thenByVentaIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ventaId', Sort.desc);
    });
  }
}

extension FlujoCajaQueryWhereDistinct
    on QueryBuilder<FlujoCaja, FlujoCaja, QDistinct> {
  QueryBuilder<FlujoCaja, FlujoCaja, QDistinct> distinctByAnulado() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'anulado');
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QDistinct> distinctByCategoria(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'categoria', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QDistinct> distinctByClienteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'clienteId');
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QDistinct> distinctByColorCategoria(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'colorCategoria',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QDistinct> distinctByColorEstado(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'colorEstado', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QDistinct> distinctByColorTipo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'colorTipo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QDistinct> distinctByCompraId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'compraId');
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QDistinct> distinctByConcepto(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'concepto', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QDistinct> distinctByConfirmado() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'confirmado');
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QDistinct> distinctByDescripcion(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'descripcion', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QDistinct> distinctByEsEgreso() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'esEgreso');
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QDistinct> distinctByEsIngreso() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'esIngreso');
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QDistinct> distinctByEsRecurrente() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'esRecurrente');
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QDistinct> distinctByEstadoTransaccion(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estadoTransaccion',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QDistinct> distinctByFecha() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fecha');
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QDistinct> distinctByFechaActualizacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaActualizacion');
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QDistinct> distinctByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaCreacion');
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QDistinct> distinctByFrecuenciaRecurrencia(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'frecuenciaRecurrencia',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QDistinct> distinctByIconoCategoria(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'iconoCategoria',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QDistinct> distinctByIconoMetodoPago(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'iconoMetodoPago',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QDistinct> distinctByMetodoPago(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'metodoPago', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QDistinct> distinctByMetodoPagoFormateado(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'metodoPagoFormateado',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QDistinct> distinctByMonto() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'monto');
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QDistinct> distinctByMontoConSigno() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'montoConSigno');
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QDistinct> distinctByMontoFormateado(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'montoFormateado',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QDistinct> distinctByMotivoAnulacion(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'motivoAnulacion',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QDistinct> distinctByNumeroComprobante(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'numeroComprobante',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QDistinct> distinctByObservaciones(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'observaciones',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QDistinct> distinctByProveedorId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'proveedorId');
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QDistinct> distinctByTipo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tipo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QDistinct> distinctByUsuarioId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'usuarioId');
    });
  }

  QueryBuilder<FlujoCaja, FlujoCaja, QDistinct> distinctByVentaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ventaId');
    });
  }
}

extension FlujoCajaQueryProperty
    on QueryBuilder<FlujoCaja, FlujoCaja, QQueryProperty> {
  QueryBuilder<FlujoCaja, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<FlujoCaja, bool, QQueryOperations> anuladoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'anulado');
    });
  }

  QueryBuilder<FlujoCaja, String, QQueryOperations> categoriaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'categoria');
    });
  }

  QueryBuilder<FlujoCaja, int?, QQueryOperations> clienteIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'clienteId');
    });
  }

  QueryBuilder<FlujoCaja, String, QQueryOperations> colorCategoriaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'colorCategoria');
    });
  }

  QueryBuilder<FlujoCaja, String, QQueryOperations> colorEstadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'colorEstado');
    });
  }

  QueryBuilder<FlujoCaja, String, QQueryOperations> colorTipoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'colorTipo');
    });
  }

  QueryBuilder<FlujoCaja, int?, QQueryOperations> compraIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'compraId');
    });
  }

  QueryBuilder<FlujoCaja, String, QQueryOperations> conceptoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'concepto');
    });
  }

  QueryBuilder<FlujoCaja, bool, QQueryOperations> confirmadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'confirmado');
    });
  }

  QueryBuilder<FlujoCaja, String?, QQueryOperations> descripcionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'descripcion');
    });
  }

  QueryBuilder<FlujoCaja, bool, QQueryOperations> esEgresoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'esEgreso');
    });
  }

  QueryBuilder<FlujoCaja, bool, QQueryOperations> esIngresoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'esIngreso');
    });
  }

  QueryBuilder<FlujoCaja, bool, QQueryOperations> esRecurrenteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'esRecurrente');
    });
  }

  QueryBuilder<FlujoCaja, String, QQueryOperations>
      estadoTransaccionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estadoTransaccion');
    });
  }

  QueryBuilder<FlujoCaja, DateTime, QQueryOperations> fechaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fecha');
    });
  }

  QueryBuilder<FlujoCaja, DateTime?, QQueryOperations>
      fechaActualizacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaActualizacion');
    });
  }

  QueryBuilder<FlujoCaja, DateTime, QQueryOperations> fechaCreacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaCreacion');
    });
  }

  QueryBuilder<FlujoCaja, String?, QQueryOperations>
      frecuenciaRecurrenciaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'frecuenciaRecurrencia');
    });
  }

  QueryBuilder<FlujoCaja, String, QQueryOperations> iconoCategoriaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'iconoCategoria');
    });
  }

  QueryBuilder<FlujoCaja, String, QQueryOperations> iconoMetodoPagoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'iconoMetodoPago');
    });
  }

  QueryBuilder<FlujoCaja, String?, QQueryOperations> metodoPagoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'metodoPago');
    });
  }

  QueryBuilder<FlujoCaja, String, QQueryOperations>
      metodoPagoFormateadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'metodoPagoFormateado');
    });
  }

  QueryBuilder<FlujoCaja, double, QQueryOperations> montoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'monto');
    });
  }

  QueryBuilder<FlujoCaja, double, QQueryOperations> montoConSignoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'montoConSigno');
    });
  }

  QueryBuilder<FlujoCaja, String, QQueryOperations> montoFormateadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'montoFormateado');
    });
  }

  QueryBuilder<FlujoCaja, String?, QQueryOperations> motivoAnulacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'motivoAnulacion');
    });
  }

  QueryBuilder<FlujoCaja, String?, QQueryOperations>
      numeroComprobanteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'numeroComprobante');
    });
  }

  QueryBuilder<FlujoCaja, String?, QQueryOperations> observacionesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'observaciones');
    });
  }

  QueryBuilder<FlujoCaja, int?, QQueryOperations> proveedorIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'proveedorId');
    });
  }

  QueryBuilder<FlujoCaja, String, QQueryOperations> tipoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tipo');
    });
  }

  QueryBuilder<FlujoCaja, int, QQueryOperations> usuarioIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'usuarioId');
    });
  }

  QueryBuilder<FlujoCaja, int?, QQueryOperations> ventaIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ventaId');
    });
  }
}
