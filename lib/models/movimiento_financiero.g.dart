// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movimiento_financiero.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMovimientoFinancieroCollection on Isar {
  IsarCollection<MovimientoFinanciero> get movimientoFinancieros =>
      this.collection();
}

const MovimientoFinancieroSchema = CollectionSchema(
  name: r'MovimientoFinanciero',
  id: 8197636765994805303,
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
    r'esCompra': PropertySchema(
      id: 11,
      name: r'esCompra',
      type: IsarType.bool,
    ),
    r'esGasto': PropertySchema(
      id: 12,
      name: r'esGasto',
      type: IsarType.bool,
    ),
    r'esGastoFijo': PropertySchema(
      id: 13,
      name: r'esGastoFijo',
      type: IsarType.bool,
    ),
    r'esGastoSorteo': PropertySchema(
      id: 14,
      name: r'esGastoSorteo',
      type: IsarType.bool,
    ),
    r'esIngreso': PropertySchema(
      id: 15,
      name: r'esIngreso',
      type: IsarType.bool,
    ),
    r'esRecurrente': PropertySchema(
      id: 16,
      name: r'esRecurrente',
      type: IsarType.bool,
    ),
    r'esVenta': PropertySchema(
      id: 17,
      name: r'esVenta',
      type: IsarType.bool,
    ),
    r'estadoTransaccion': PropertySchema(
      id: 18,
      name: r'estadoTransaccion',
      type: IsarType.string,
    ),
    r'fecha': PropertySchema(
      id: 19,
      name: r'fecha',
      type: IsarType.dateTime,
    ),
    r'fechaActualizacion': PropertySchema(
      id: 20,
      name: r'fechaActualizacion',
      type: IsarType.dateTime,
    ),
    r'fechaCreacion': PropertySchema(
      id: 21,
      name: r'fechaCreacion',
      type: IsarType.dateTime,
    ),
    r'frecuenciaRecurrencia': PropertySchema(
      id: 22,
      name: r'frecuenciaRecurrencia',
      type: IsarType.string,
    ),
    r'gastoFijoId': PropertySchema(
      id: 23,
      name: r'gastoFijoId',
      type: IsarType.long,
    ),
    r'iconoCategoria': PropertySchema(
      id: 24,
      name: r'iconoCategoria',
      type: IsarType.string,
    ),
    r'iconoMetodoPago': PropertySchema(
      id: 25,
      name: r'iconoMetodoPago',
      type: IsarType.string,
    ),
    r'metodoPago': PropertySchema(
      id: 26,
      name: r'metodoPago',
      type: IsarType.string,
    ),
    r'metodoPagoFormateado': PropertySchema(
      id: 27,
      name: r'metodoPagoFormateado',
      type: IsarType.string,
    ),
    r'monto': PropertySchema(
      id: 28,
      name: r'monto',
      type: IsarType.double,
    ),
    r'montoConSigno': PropertySchema(
      id: 29,
      name: r'montoConSigno',
      type: IsarType.double,
    ),
    r'montoFormateado': PropertySchema(
      id: 30,
      name: r'montoFormateado',
      type: IsarType.string,
    ),
    r'motivoAnulacion': PropertySchema(
      id: 31,
      name: r'motivoAnulacion',
      type: IsarType.string,
    ),
    r'numeroComprobante': PropertySchema(
      id: 32,
      name: r'numeroComprobante',
      type: IsarType.string,
    ),
    r'observaciones': PropertySchema(
      id: 33,
      name: r'observaciones',
      type: IsarType.string,
    ),
    r'proveedorId': PropertySchema(
      id: 34,
      name: r'proveedorId',
      type: IsarType.long,
    ),
    r'sorteoId': PropertySchema(
      id: 35,
      name: r'sorteoId',
      type: IsarType.long,
    ),
    r'tipo': PropertySchema(
      id: 36,
      name: r'tipo',
      type: IsarType.string,
    ),
    r'tipoFormateado': PropertySchema(
      id: 37,
      name: r'tipoFormateado',
      type: IsarType.string,
    ),
    r'usuarioId': PropertySchema(
      id: 38,
      name: r'usuarioId',
      type: IsarType.long,
    ),
    r'ventaId': PropertySchema(
      id: 39,
      name: r'ventaId',
      type: IsarType.long,
    )
  },
  estimateSize: _movimientoFinancieroEstimateSize,
  serialize: _movimientoFinancieroSerialize,
  deserialize: _movimientoFinancieroDeserialize,
  deserializeProp: _movimientoFinancieroDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _movimientoFinancieroGetId,
  getLinks: _movimientoFinancieroGetLinks,
  attach: _movimientoFinancieroAttach,
  version: '3.1.0+1',
);

int _movimientoFinancieroEstimateSize(
  MovimientoFinanciero object,
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
  bytesCount += 3 + object.tipoFormateado.length * 3;
  return bytesCount;
}

void _movimientoFinancieroSerialize(
  MovimientoFinanciero object,
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
  writer.writeBool(offsets[11], object.esCompra);
  writer.writeBool(offsets[12], object.esGasto);
  writer.writeBool(offsets[13], object.esGastoFijo);
  writer.writeBool(offsets[14], object.esGastoSorteo);
  writer.writeBool(offsets[15], object.esIngreso);
  writer.writeBool(offsets[16], object.esRecurrente);
  writer.writeBool(offsets[17], object.esVenta);
  writer.writeString(offsets[18], object.estadoTransaccion);
  writer.writeDateTime(offsets[19], object.fecha);
  writer.writeDateTime(offsets[20], object.fechaActualizacion);
  writer.writeDateTime(offsets[21], object.fechaCreacion);
  writer.writeString(offsets[22], object.frecuenciaRecurrencia);
  writer.writeLong(offsets[23], object.gastoFijoId);
  writer.writeString(offsets[24], object.iconoCategoria);
  writer.writeString(offsets[25], object.iconoMetodoPago);
  writer.writeString(offsets[26], object.metodoPago);
  writer.writeString(offsets[27], object.metodoPagoFormateado);
  writer.writeDouble(offsets[28], object.monto);
  writer.writeDouble(offsets[29], object.montoConSigno);
  writer.writeString(offsets[30], object.montoFormateado);
  writer.writeString(offsets[31], object.motivoAnulacion);
  writer.writeString(offsets[32], object.numeroComprobante);
  writer.writeString(offsets[33], object.observaciones);
  writer.writeLong(offsets[34], object.proveedorId);
  writer.writeLong(offsets[35], object.sorteoId);
  writer.writeString(offsets[36], object.tipo);
  writer.writeString(offsets[37], object.tipoFormateado);
  writer.writeLong(offsets[38], object.usuarioId);
  writer.writeLong(offsets[39], object.ventaId);
}

MovimientoFinanciero _movimientoFinancieroDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MovimientoFinanciero(
    anulado: reader.readBoolOrNull(offsets[0]) ?? false,
    categoria: reader.readString(offsets[1]),
    clienteId: reader.readLongOrNull(offsets[3]),
    compraId: reader.readLongOrNull(offsets[7]),
    concepto: reader.readString(offsets[8]),
    confirmado: reader.readBoolOrNull(offsets[9]) ?? true,
    descripcion: reader.readStringOrNull(offsets[10]),
    esRecurrente: reader.readBoolOrNull(offsets[16]) ?? false,
    fecha: reader.readDateTime(offsets[19]),
    frecuenciaRecurrencia: reader.readStringOrNull(offsets[22]),
    gastoFijoId: reader.readLongOrNull(offsets[23]),
    metodoPago: reader.readStringOrNull(offsets[26]),
    monto: reader.readDouble(offsets[28]),
    motivoAnulacion: reader.readStringOrNull(offsets[31]),
    numeroComprobante: reader.readStringOrNull(offsets[32]),
    observaciones: reader.readStringOrNull(offsets[33]),
    proveedorId: reader.readLongOrNull(offsets[34]),
    sorteoId: reader.readLongOrNull(offsets[35]),
    tipo: reader.readString(offsets[36]),
    usuarioId: reader.readLong(offsets[38]),
    ventaId: reader.readLongOrNull(offsets[39]),
  );
  object.fechaActualizacion = reader.readDateTimeOrNull(offsets[20]);
  object.fechaCreacion = reader.readDateTime(offsets[21]);
  object.id = id;
  return object;
}

P _movimientoFinancieroDeserializeProp<P>(
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
      return (reader.readBool(offset)) as P;
    case 14:
      return (reader.readBool(offset)) as P;
    case 15:
      return (reader.readBool(offset)) as P;
    case 16:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 17:
      return (reader.readBool(offset)) as P;
    case 18:
      return (reader.readString(offset)) as P;
    case 19:
      return (reader.readDateTime(offset)) as P;
    case 20:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 21:
      return (reader.readDateTime(offset)) as P;
    case 22:
      return (reader.readStringOrNull(offset)) as P;
    case 23:
      return (reader.readLongOrNull(offset)) as P;
    case 24:
      return (reader.readString(offset)) as P;
    case 25:
      return (reader.readString(offset)) as P;
    case 26:
      return (reader.readStringOrNull(offset)) as P;
    case 27:
      return (reader.readString(offset)) as P;
    case 28:
      return (reader.readDouble(offset)) as P;
    case 29:
      return (reader.readDouble(offset)) as P;
    case 30:
      return (reader.readString(offset)) as P;
    case 31:
      return (reader.readStringOrNull(offset)) as P;
    case 32:
      return (reader.readStringOrNull(offset)) as P;
    case 33:
      return (reader.readStringOrNull(offset)) as P;
    case 34:
      return (reader.readLongOrNull(offset)) as P;
    case 35:
      return (reader.readLongOrNull(offset)) as P;
    case 36:
      return (reader.readString(offset)) as P;
    case 37:
      return (reader.readString(offset)) as P;
    case 38:
      return (reader.readLong(offset)) as P;
    case 39:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _movimientoFinancieroGetId(MovimientoFinanciero object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _movimientoFinancieroGetLinks(
    MovimientoFinanciero object) {
  return [];
}

void _movimientoFinancieroAttach(
    IsarCollection<dynamic> col, Id id, MovimientoFinanciero object) {
  object.id = id;
}

extension MovimientoFinancieroQueryWhereSort
    on QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QWhere> {
  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MovimientoFinancieroQueryWhere
    on QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QWhereClause> {
  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterWhereClause>
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterWhereClause>
      idBetween(
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

extension MovimientoFinancieroQueryFilter on QueryBuilder<MovimientoFinanciero,
    MovimientoFinanciero, QFilterCondition> {
  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> anuladoEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'anulado',
        value: value,
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> categoriaEqualTo(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> categoriaGreaterThan(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> categoriaLessThan(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> categoriaBetween(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> categoriaStartsWith(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> categoriaEndsWith(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
          QAfterFilterCondition>
      categoriaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'categoria',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
          QAfterFilterCondition>
      categoriaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'categoria',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> categoriaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'categoria',
        value: '',
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> categoriaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'categoria',
        value: '',
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> categoriaFormateadaEqualTo(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> categoriaFormateadaGreaterThan(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> categoriaFormateadaLessThan(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> categoriaFormateadaBetween(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> categoriaFormateadaStartsWith(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> categoriaFormateadaEndsWith(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
          QAfterFilterCondition>
      categoriaFormateadaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'categoriaFormateada',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
          QAfterFilterCondition>
      categoriaFormateadaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'categoriaFormateada',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> categoriaFormateadaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'categoriaFormateada',
        value: '',
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> categoriaFormateadaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'categoriaFormateada',
        value: '',
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> clienteIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'clienteId',
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> clienteIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'clienteId',
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> clienteIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'clienteId',
        value: value,
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> clienteIdGreaterThan(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> clienteIdLessThan(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> clienteIdBetween(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> colorCategoriaEqualTo(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> colorCategoriaGreaterThan(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> colorCategoriaLessThan(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> colorCategoriaBetween(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> colorCategoriaStartsWith(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> colorCategoriaEndsWith(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
          QAfterFilterCondition>
      colorCategoriaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'colorCategoria',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
          QAfterFilterCondition>
      colorCategoriaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'colorCategoria',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> colorCategoriaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'colorCategoria',
        value: '',
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> colorCategoriaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'colorCategoria',
        value: '',
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> colorEstadoEqualTo(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> colorEstadoGreaterThan(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> colorEstadoLessThan(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> colorEstadoBetween(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> colorEstadoStartsWith(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> colorEstadoEndsWith(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
          QAfterFilterCondition>
      colorEstadoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'colorEstado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
          QAfterFilterCondition>
      colorEstadoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'colorEstado',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> colorEstadoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'colorEstado',
        value: '',
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> colorEstadoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'colorEstado',
        value: '',
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> colorTipoEqualTo(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> colorTipoGreaterThan(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> colorTipoLessThan(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> colorTipoBetween(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> colorTipoStartsWith(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> colorTipoEndsWith(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
          QAfterFilterCondition>
      colorTipoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'colorTipo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
          QAfterFilterCondition>
      colorTipoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'colorTipo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> colorTipoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'colorTipo',
        value: '',
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> colorTipoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'colorTipo',
        value: '',
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> compraIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'compraId',
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> compraIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'compraId',
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> compraIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'compraId',
        value: value,
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> compraIdGreaterThan(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> compraIdLessThan(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> compraIdBetween(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> conceptoEqualTo(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> conceptoGreaterThan(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> conceptoLessThan(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> conceptoBetween(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> conceptoStartsWith(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> conceptoEndsWith(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
          QAfterFilterCondition>
      conceptoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'concepto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
          QAfterFilterCondition>
      conceptoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'concepto',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> conceptoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'concepto',
        value: '',
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> conceptoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'concepto',
        value: '',
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> confirmadoEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'confirmado',
        value: value,
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> descripcionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'descripcion',
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> descripcionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'descripcion',
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> descripcionEqualTo(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> descripcionGreaterThan(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> descripcionLessThan(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> descripcionBetween(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> descripcionStartsWith(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> descripcionEndsWith(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
          QAfterFilterCondition>
      descripcionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'descripcion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
          QAfterFilterCondition>
      descripcionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'descripcion',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> descripcionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'descripcion',
        value: '',
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> descripcionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'descripcion',
        value: '',
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> esCompraEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'esCompra',
        value: value,
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> esGastoEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'esGasto',
        value: value,
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> esGastoFijoEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'esGastoFijo',
        value: value,
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> esGastoSorteoEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'esGastoSorteo',
        value: value,
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> esIngresoEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'esIngreso',
        value: value,
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> esRecurrenteEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'esRecurrente',
        value: value,
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> esVentaEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'esVenta',
        value: value,
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> estadoTransaccionEqualTo(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> estadoTransaccionGreaterThan(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> estadoTransaccionLessThan(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> estadoTransaccionBetween(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> estadoTransaccionStartsWith(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> estadoTransaccionEndsWith(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
          QAfterFilterCondition>
      estadoTransaccionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'estadoTransaccion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
          QAfterFilterCondition>
      estadoTransaccionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'estadoTransaccion',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> estadoTransaccionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estadoTransaccion',
        value: '',
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> estadoTransaccionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'estadoTransaccion',
        value: '',
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> fechaEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fecha',
        value: value,
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> fechaGreaterThan(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> fechaLessThan(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> fechaBetween(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> fechaActualizacionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fechaActualizacion',
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> fechaActualizacionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fechaActualizacion',
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> fechaActualizacionEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaActualizacion',
        value: value,
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> fechaActualizacionGreaterThan(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> fechaActualizacionLessThan(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> fechaActualizacionBetween(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> fechaCreacionEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaCreacion',
        value: value,
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> fechaCreacionGreaterThan(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> fechaCreacionLessThan(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> fechaCreacionBetween(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> frecuenciaRecurrenciaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'frecuenciaRecurrencia',
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> frecuenciaRecurrenciaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'frecuenciaRecurrencia',
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> frecuenciaRecurrenciaEqualTo(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> frecuenciaRecurrenciaGreaterThan(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> frecuenciaRecurrenciaLessThan(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> frecuenciaRecurrenciaBetween(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> frecuenciaRecurrenciaStartsWith(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> frecuenciaRecurrenciaEndsWith(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
          QAfterFilterCondition>
      frecuenciaRecurrenciaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'frecuenciaRecurrencia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
          QAfterFilterCondition>
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> frecuenciaRecurrenciaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frecuenciaRecurrencia',
        value: '',
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> frecuenciaRecurrenciaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'frecuenciaRecurrencia',
        value: '',
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> gastoFijoIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'gastoFijoId',
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> gastoFijoIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'gastoFijoId',
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> gastoFijoIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gastoFijoId',
        value: value,
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> gastoFijoIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'gastoFijoId',
        value: value,
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> gastoFijoIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'gastoFijoId',
        value: value,
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> gastoFijoIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'gastoFijoId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> iconoCategoriaEqualTo(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> iconoCategoriaGreaterThan(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> iconoCategoriaLessThan(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> iconoCategoriaBetween(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> iconoCategoriaStartsWith(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> iconoCategoriaEndsWith(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
          QAfterFilterCondition>
      iconoCategoriaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'iconoCategoria',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
          QAfterFilterCondition>
      iconoCategoriaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'iconoCategoria',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> iconoCategoriaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'iconoCategoria',
        value: '',
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> iconoCategoriaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'iconoCategoria',
        value: '',
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> iconoMetodoPagoEqualTo(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> iconoMetodoPagoGreaterThan(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> iconoMetodoPagoLessThan(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> iconoMetodoPagoBetween(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> iconoMetodoPagoStartsWith(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> iconoMetodoPagoEndsWith(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
          QAfterFilterCondition>
      iconoMetodoPagoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'iconoMetodoPago',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
          QAfterFilterCondition>
      iconoMetodoPagoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'iconoMetodoPago',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> iconoMetodoPagoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'iconoMetodoPago',
        value: '',
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> iconoMetodoPagoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'iconoMetodoPago',
        value: '',
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> idLessThan(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> idBetween(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> metodoPagoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'metodoPago',
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> metodoPagoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'metodoPago',
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> metodoPagoEqualTo(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> metodoPagoGreaterThan(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> metodoPagoLessThan(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> metodoPagoBetween(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> metodoPagoStartsWith(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> metodoPagoEndsWith(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
          QAfterFilterCondition>
      metodoPagoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'metodoPago',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
          QAfterFilterCondition>
      metodoPagoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'metodoPago',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> metodoPagoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'metodoPago',
        value: '',
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> metodoPagoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'metodoPago',
        value: '',
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> metodoPagoFormateadoEqualTo(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> metodoPagoFormateadoGreaterThan(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> metodoPagoFormateadoLessThan(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> metodoPagoFormateadoBetween(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> metodoPagoFormateadoStartsWith(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> metodoPagoFormateadoEndsWith(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
          QAfterFilterCondition>
      metodoPagoFormateadoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'metodoPagoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
          QAfterFilterCondition>
      metodoPagoFormateadoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'metodoPagoFormateado',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> metodoPagoFormateadoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'metodoPagoFormateado',
        value: '',
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> metodoPagoFormateadoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'metodoPagoFormateado',
        value: '',
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> montoEqualTo(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> montoGreaterThan(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> montoLessThan(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> montoBetween(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> montoConSignoEqualTo(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> montoConSignoGreaterThan(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> montoConSignoLessThan(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> montoConSignoBetween(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> montoFormateadoEqualTo(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> montoFormateadoGreaterThan(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> montoFormateadoLessThan(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> montoFormateadoBetween(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> montoFormateadoStartsWith(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> montoFormateadoEndsWith(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
          QAfterFilterCondition>
      montoFormateadoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'montoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
          QAfterFilterCondition>
      montoFormateadoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'montoFormateado',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> montoFormateadoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'montoFormateado',
        value: '',
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> montoFormateadoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'montoFormateado',
        value: '',
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> motivoAnulacionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'motivoAnulacion',
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> motivoAnulacionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'motivoAnulacion',
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> motivoAnulacionEqualTo(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> motivoAnulacionGreaterThan(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> motivoAnulacionLessThan(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> motivoAnulacionBetween(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> motivoAnulacionStartsWith(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> motivoAnulacionEndsWith(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
          QAfterFilterCondition>
      motivoAnulacionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'motivoAnulacion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
          QAfterFilterCondition>
      motivoAnulacionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'motivoAnulacion',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> motivoAnulacionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'motivoAnulacion',
        value: '',
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> motivoAnulacionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'motivoAnulacion',
        value: '',
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> numeroComprobanteIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'numeroComprobante',
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> numeroComprobanteIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'numeroComprobante',
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> numeroComprobanteEqualTo(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> numeroComprobanteGreaterThan(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> numeroComprobanteLessThan(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> numeroComprobanteBetween(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> numeroComprobanteStartsWith(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> numeroComprobanteEndsWith(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
          QAfterFilterCondition>
      numeroComprobanteContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'numeroComprobante',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
          QAfterFilterCondition>
      numeroComprobanteMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'numeroComprobante',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> numeroComprobanteIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'numeroComprobante',
        value: '',
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> numeroComprobanteIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'numeroComprobante',
        value: '',
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> observacionesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'observaciones',
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> observacionesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'observaciones',
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> observacionesEqualTo(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> observacionesGreaterThan(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> observacionesLessThan(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> observacionesBetween(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> observacionesStartsWith(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> observacionesEndsWith(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
          QAfterFilterCondition>
      observacionesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'observaciones',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
          QAfterFilterCondition>
      observacionesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'observaciones',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> observacionesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'observaciones',
        value: '',
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> observacionesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'observaciones',
        value: '',
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> proveedorIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'proveedorId',
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> proveedorIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'proveedorId',
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> proveedorIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'proveedorId',
        value: value,
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> proveedorIdGreaterThan(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> proveedorIdLessThan(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> proveedorIdBetween(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> sorteoIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sorteoId',
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> sorteoIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sorteoId',
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> sorteoIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sorteoId',
        value: value,
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> sorteoIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sorteoId',
        value: value,
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> sorteoIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sorteoId',
        value: value,
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> sorteoIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sorteoId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> tipoEqualTo(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> tipoGreaterThan(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> tipoLessThan(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> tipoBetween(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> tipoStartsWith(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> tipoEndsWith(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
          QAfterFilterCondition>
      tipoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tipo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
          QAfterFilterCondition>
      tipoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tipo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> tipoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tipo',
        value: '',
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> tipoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tipo',
        value: '',
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> tipoFormateadoEqualTo(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> tipoFormateadoGreaterThan(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> tipoFormateadoLessThan(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> tipoFormateadoBetween(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> tipoFormateadoStartsWith(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> tipoFormateadoEndsWith(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
          QAfterFilterCondition>
      tipoFormateadoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tipoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
          QAfterFilterCondition>
      tipoFormateadoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tipoFormateado',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> tipoFormateadoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tipoFormateado',
        value: '',
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> tipoFormateadoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tipoFormateado',
        value: '',
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> usuarioIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'usuarioId',
        value: value,
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> usuarioIdGreaterThan(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> usuarioIdLessThan(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> usuarioIdBetween(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> ventaIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ventaId',
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> ventaIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ventaId',
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> ventaIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ventaId',
        value: value,
      ));
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> ventaIdGreaterThan(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> ventaIdLessThan(
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

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero,
      QAfterFilterCondition> ventaIdBetween(
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

extension MovimientoFinancieroQueryObject on QueryBuilder<MovimientoFinanciero,
    MovimientoFinanciero, QFilterCondition> {}

extension MovimientoFinancieroQueryLinks on QueryBuilder<MovimientoFinanciero,
    MovimientoFinanciero, QFilterCondition> {}

extension MovimientoFinancieroQuerySortBy
    on QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QSortBy> {
  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      sortByAnulado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'anulado', Sort.asc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      sortByAnuladoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'anulado', Sort.desc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      sortByCategoria() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoria', Sort.asc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      sortByCategoriaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoria', Sort.desc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      sortByCategoriaFormateada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoriaFormateada', Sort.asc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      sortByCategoriaFormateadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoriaFormateada', Sort.desc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      sortByClienteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clienteId', Sort.asc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      sortByClienteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clienteId', Sort.desc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      sortByColorCategoria() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorCategoria', Sort.asc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      sortByColorCategoriaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorCategoria', Sort.desc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      sortByColorEstado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorEstado', Sort.asc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      sortByColorEstadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorEstado', Sort.desc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      sortByColorTipo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorTipo', Sort.asc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      sortByColorTipoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorTipo', Sort.desc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      sortByCompraId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'compraId', Sort.asc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      sortByCompraIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'compraId', Sort.desc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      sortByConcepto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'concepto', Sort.asc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      sortByConceptoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'concepto', Sort.desc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      sortByConfirmado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'confirmado', Sort.asc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      sortByConfirmadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'confirmado', Sort.desc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      sortByDescripcion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descripcion', Sort.asc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      sortByDescripcionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descripcion', Sort.desc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      sortByEsCompra() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esCompra', Sort.asc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      sortByEsCompraDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esCompra', Sort.desc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      sortByEsGasto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esGasto', Sort.asc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      sortByEsGastoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esGasto', Sort.desc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      sortByEsGastoFijo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esGastoFijo', Sort.asc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      sortByEsGastoFijoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esGastoFijo', Sort.desc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      sortByEsGastoSorteo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esGastoSorteo', Sort.asc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      sortByEsGastoSorteoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esGastoSorteo', Sort.desc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      sortByEsIngreso() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esIngreso', Sort.asc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      sortByEsIngresoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esIngreso', Sort.desc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      sortByEsRecurrente() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esRecurrente', Sort.asc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      sortByEsRecurrenteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esRecurrente', Sort.desc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      sortByEsVenta() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esVenta', Sort.asc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      sortByEsVentaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esVenta', Sort.desc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      sortByEstadoTransaccion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estadoTransaccion', Sort.asc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      sortByEstadoTransaccionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estadoTransaccion', Sort.desc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      sortByFecha() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fecha', Sort.asc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      sortByFechaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fecha', Sort.desc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      sortByFechaActualizacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaActualizacion', Sort.asc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      sortByFechaActualizacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaActualizacion', Sort.desc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      sortByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.asc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      sortByFechaCreacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.desc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      sortByFrecuenciaRecurrencia() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frecuenciaRecurrencia', Sort.asc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      sortByFrecuenciaRecurrenciaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frecuenciaRecurrencia', Sort.desc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      sortByGastoFijoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gastoFijoId', Sort.asc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      sortByGastoFijoIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gastoFijoId', Sort.desc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      sortByIconoCategoria() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconoCategoria', Sort.asc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      sortByIconoCategoriaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconoCategoria', Sort.desc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      sortByIconoMetodoPago() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconoMetodoPago', Sort.asc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      sortByIconoMetodoPagoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconoMetodoPago', Sort.desc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      sortByMetodoPago() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'metodoPago', Sort.asc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      sortByMetodoPagoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'metodoPago', Sort.desc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      sortByMetodoPagoFormateado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'metodoPagoFormateado', Sort.asc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      sortByMetodoPagoFormateadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'metodoPagoFormateado', Sort.desc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      sortByMonto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monto', Sort.asc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      sortByMontoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monto', Sort.desc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      sortByMontoConSigno() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoConSigno', Sort.asc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      sortByMontoConSignoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoConSigno', Sort.desc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      sortByMontoFormateado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoFormateado', Sort.asc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      sortByMontoFormateadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoFormateado', Sort.desc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      sortByMotivoAnulacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'motivoAnulacion', Sort.asc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      sortByMotivoAnulacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'motivoAnulacion', Sort.desc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      sortByNumeroComprobante() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroComprobante', Sort.asc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      sortByNumeroComprobanteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroComprobante', Sort.desc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      sortByObservaciones() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observaciones', Sort.asc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      sortByObservacionesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observaciones', Sort.desc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      sortByProveedorId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proveedorId', Sort.asc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      sortByProveedorIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proveedorId', Sort.desc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      sortBySorteoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sorteoId', Sort.asc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      sortBySorteoIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sorteoId', Sort.desc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      sortByTipo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo', Sort.asc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      sortByTipoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo', Sort.desc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      sortByTipoFormateado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipoFormateado', Sort.asc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      sortByTipoFormateadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipoFormateado', Sort.desc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      sortByUsuarioId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usuarioId', Sort.asc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      sortByUsuarioIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usuarioId', Sort.desc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      sortByVentaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ventaId', Sort.asc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      sortByVentaIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ventaId', Sort.desc);
    });
  }
}

extension MovimientoFinancieroQuerySortThenBy
    on QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QSortThenBy> {
  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      thenByAnulado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'anulado', Sort.asc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      thenByAnuladoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'anulado', Sort.desc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      thenByCategoria() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoria', Sort.asc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      thenByCategoriaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoria', Sort.desc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      thenByCategoriaFormateada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoriaFormateada', Sort.asc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      thenByCategoriaFormateadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoriaFormateada', Sort.desc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      thenByClienteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clienteId', Sort.asc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      thenByClienteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clienteId', Sort.desc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      thenByColorCategoria() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorCategoria', Sort.asc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      thenByColorCategoriaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorCategoria', Sort.desc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      thenByColorEstado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorEstado', Sort.asc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      thenByColorEstadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorEstado', Sort.desc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      thenByColorTipo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorTipo', Sort.asc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      thenByColorTipoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorTipo', Sort.desc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      thenByCompraId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'compraId', Sort.asc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      thenByCompraIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'compraId', Sort.desc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      thenByConcepto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'concepto', Sort.asc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      thenByConceptoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'concepto', Sort.desc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      thenByConfirmado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'confirmado', Sort.asc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      thenByConfirmadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'confirmado', Sort.desc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      thenByDescripcion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descripcion', Sort.asc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      thenByDescripcionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descripcion', Sort.desc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      thenByEsCompra() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esCompra', Sort.asc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      thenByEsCompraDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esCompra', Sort.desc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      thenByEsGasto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esGasto', Sort.asc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      thenByEsGastoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esGasto', Sort.desc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      thenByEsGastoFijo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esGastoFijo', Sort.asc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      thenByEsGastoFijoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esGastoFijo', Sort.desc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      thenByEsGastoSorteo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esGastoSorteo', Sort.asc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      thenByEsGastoSorteoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esGastoSorteo', Sort.desc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      thenByEsIngreso() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esIngreso', Sort.asc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      thenByEsIngresoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esIngreso', Sort.desc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      thenByEsRecurrente() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esRecurrente', Sort.asc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      thenByEsRecurrenteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esRecurrente', Sort.desc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      thenByEsVenta() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esVenta', Sort.asc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      thenByEsVentaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esVenta', Sort.desc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      thenByEstadoTransaccion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estadoTransaccion', Sort.asc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      thenByEstadoTransaccionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estadoTransaccion', Sort.desc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      thenByFecha() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fecha', Sort.asc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      thenByFechaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fecha', Sort.desc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      thenByFechaActualizacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaActualizacion', Sort.asc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      thenByFechaActualizacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaActualizacion', Sort.desc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      thenByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.asc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      thenByFechaCreacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.desc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      thenByFrecuenciaRecurrencia() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frecuenciaRecurrencia', Sort.asc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      thenByFrecuenciaRecurrenciaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frecuenciaRecurrencia', Sort.desc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      thenByGastoFijoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gastoFijoId', Sort.asc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      thenByGastoFijoIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gastoFijoId', Sort.desc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      thenByIconoCategoria() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconoCategoria', Sort.asc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      thenByIconoCategoriaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconoCategoria', Sort.desc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      thenByIconoMetodoPago() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconoMetodoPago', Sort.asc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      thenByIconoMetodoPagoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconoMetodoPago', Sort.desc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      thenByMetodoPago() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'metodoPago', Sort.asc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      thenByMetodoPagoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'metodoPago', Sort.desc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      thenByMetodoPagoFormateado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'metodoPagoFormateado', Sort.asc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      thenByMetodoPagoFormateadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'metodoPagoFormateado', Sort.desc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      thenByMonto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monto', Sort.asc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      thenByMontoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monto', Sort.desc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      thenByMontoConSigno() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoConSigno', Sort.asc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      thenByMontoConSignoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoConSigno', Sort.desc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      thenByMontoFormateado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoFormateado', Sort.asc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      thenByMontoFormateadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoFormateado', Sort.desc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      thenByMotivoAnulacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'motivoAnulacion', Sort.asc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      thenByMotivoAnulacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'motivoAnulacion', Sort.desc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      thenByNumeroComprobante() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroComprobante', Sort.asc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      thenByNumeroComprobanteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroComprobante', Sort.desc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      thenByObservaciones() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observaciones', Sort.asc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      thenByObservacionesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observaciones', Sort.desc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      thenByProveedorId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proveedorId', Sort.asc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      thenByProveedorIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proveedorId', Sort.desc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      thenBySorteoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sorteoId', Sort.asc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      thenBySorteoIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sorteoId', Sort.desc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      thenByTipo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo', Sort.asc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      thenByTipoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo', Sort.desc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      thenByTipoFormateado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipoFormateado', Sort.asc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      thenByTipoFormateadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipoFormateado', Sort.desc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      thenByUsuarioId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usuarioId', Sort.asc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      thenByUsuarioIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usuarioId', Sort.desc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      thenByVentaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ventaId', Sort.asc);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QAfterSortBy>
      thenByVentaIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ventaId', Sort.desc);
    });
  }
}

extension MovimientoFinancieroQueryWhereDistinct
    on QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QDistinct> {
  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QDistinct>
      distinctByAnulado() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'anulado');
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QDistinct>
      distinctByCategoria({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'categoria', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QDistinct>
      distinctByCategoriaFormateada({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'categoriaFormateada',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QDistinct>
      distinctByClienteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'clienteId');
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QDistinct>
      distinctByColorCategoria({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'colorCategoria',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QDistinct>
      distinctByColorEstado({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'colorEstado', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QDistinct>
      distinctByColorTipo({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'colorTipo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QDistinct>
      distinctByCompraId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'compraId');
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QDistinct>
      distinctByConcepto({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'concepto', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QDistinct>
      distinctByConfirmado() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'confirmado');
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QDistinct>
      distinctByDescripcion({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'descripcion', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QDistinct>
      distinctByEsCompra() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'esCompra');
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QDistinct>
      distinctByEsGasto() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'esGasto');
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QDistinct>
      distinctByEsGastoFijo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'esGastoFijo');
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QDistinct>
      distinctByEsGastoSorteo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'esGastoSorteo');
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QDistinct>
      distinctByEsIngreso() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'esIngreso');
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QDistinct>
      distinctByEsRecurrente() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'esRecurrente');
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QDistinct>
      distinctByEsVenta() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'esVenta');
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QDistinct>
      distinctByEstadoTransaccion({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estadoTransaccion',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QDistinct>
      distinctByFecha() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fecha');
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QDistinct>
      distinctByFechaActualizacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaActualizacion');
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QDistinct>
      distinctByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaCreacion');
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QDistinct>
      distinctByFrecuenciaRecurrencia({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'frecuenciaRecurrencia',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QDistinct>
      distinctByGastoFijoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'gastoFijoId');
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QDistinct>
      distinctByIconoCategoria({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'iconoCategoria',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QDistinct>
      distinctByIconoMetodoPago({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'iconoMetodoPago',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QDistinct>
      distinctByMetodoPago({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'metodoPago', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QDistinct>
      distinctByMetodoPagoFormateado({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'metodoPagoFormateado',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QDistinct>
      distinctByMonto() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'monto');
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QDistinct>
      distinctByMontoConSigno() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'montoConSigno');
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QDistinct>
      distinctByMontoFormateado({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'montoFormateado',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QDistinct>
      distinctByMotivoAnulacion({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'motivoAnulacion',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QDistinct>
      distinctByNumeroComprobante({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'numeroComprobante',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QDistinct>
      distinctByObservaciones({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'observaciones',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QDistinct>
      distinctByProveedorId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'proveedorId');
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QDistinct>
      distinctBySorteoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sorteoId');
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QDistinct>
      distinctByTipo({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tipo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QDistinct>
      distinctByTipoFormateado({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tipoFormateado',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QDistinct>
      distinctByUsuarioId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'usuarioId');
    });
  }

  QueryBuilder<MovimientoFinanciero, MovimientoFinanciero, QDistinct>
      distinctByVentaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ventaId');
    });
  }
}

extension MovimientoFinancieroQueryProperty on QueryBuilder<
    MovimientoFinanciero, MovimientoFinanciero, QQueryProperty> {
  QueryBuilder<MovimientoFinanciero, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<MovimientoFinanciero, bool, QQueryOperations> anuladoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'anulado');
    });
  }

  QueryBuilder<MovimientoFinanciero, String, QQueryOperations>
      categoriaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'categoria');
    });
  }

  QueryBuilder<MovimientoFinanciero, String, QQueryOperations>
      categoriaFormateadaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'categoriaFormateada');
    });
  }

  QueryBuilder<MovimientoFinanciero, int?, QQueryOperations>
      clienteIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'clienteId');
    });
  }

  QueryBuilder<MovimientoFinanciero, String, QQueryOperations>
      colorCategoriaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'colorCategoria');
    });
  }

  QueryBuilder<MovimientoFinanciero, String, QQueryOperations>
      colorEstadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'colorEstado');
    });
  }

  QueryBuilder<MovimientoFinanciero, String, QQueryOperations>
      colorTipoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'colorTipo');
    });
  }

  QueryBuilder<MovimientoFinanciero, int?, QQueryOperations>
      compraIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'compraId');
    });
  }

  QueryBuilder<MovimientoFinanciero, String, QQueryOperations>
      conceptoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'concepto');
    });
  }

  QueryBuilder<MovimientoFinanciero, bool, QQueryOperations>
      confirmadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'confirmado');
    });
  }

  QueryBuilder<MovimientoFinanciero, String?, QQueryOperations>
      descripcionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'descripcion');
    });
  }

  QueryBuilder<MovimientoFinanciero, bool, QQueryOperations>
      esCompraProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'esCompra');
    });
  }

  QueryBuilder<MovimientoFinanciero, bool, QQueryOperations> esGastoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'esGasto');
    });
  }

  QueryBuilder<MovimientoFinanciero, bool, QQueryOperations>
      esGastoFijoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'esGastoFijo');
    });
  }

  QueryBuilder<MovimientoFinanciero, bool, QQueryOperations>
      esGastoSorteoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'esGastoSorteo');
    });
  }

  QueryBuilder<MovimientoFinanciero, bool, QQueryOperations>
      esIngresoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'esIngreso');
    });
  }

  QueryBuilder<MovimientoFinanciero, bool, QQueryOperations>
      esRecurrenteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'esRecurrente');
    });
  }

  QueryBuilder<MovimientoFinanciero, bool, QQueryOperations> esVentaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'esVenta');
    });
  }

  QueryBuilder<MovimientoFinanciero, String, QQueryOperations>
      estadoTransaccionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estadoTransaccion');
    });
  }

  QueryBuilder<MovimientoFinanciero, DateTime, QQueryOperations>
      fechaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fecha');
    });
  }

  QueryBuilder<MovimientoFinanciero, DateTime?, QQueryOperations>
      fechaActualizacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaActualizacion');
    });
  }

  QueryBuilder<MovimientoFinanciero, DateTime, QQueryOperations>
      fechaCreacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaCreacion');
    });
  }

  QueryBuilder<MovimientoFinanciero, String?, QQueryOperations>
      frecuenciaRecurrenciaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'frecuenciaRecurrencia');
    });
  }

  QueryBuilder<MovimientoFinanciero, int?, QQueryOperations>
      gastoFijoIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'gastoFijoId');
    });
  }

  QueryBuilder<MovimientoFinanciero, String, QQueryOperations>
      iconoCategoriaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'iconoCategoria');
    });
  }

  QueryBuilder<MovimientoFinanciero, String, QQueryOperations>
      iconoMetodoPagoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'iconoMetodoPago');
    });
  }

  QueryBuilder<MovimientoFinanciero, String?, QQueryOperations>
      metodoPagoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'metodoPago');
    });
  }

  QueryBuilder<MovimientoFinanciero, String, QQueryOperations>
      metodoPagoFormateadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'metodoPagoFormateado');
    });
  }

  QueryBuilder<MovimientoFinanciero, double, QQueryOperations> montoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'monto');
    });
  }

  QueryBuilder<MovimientoFinanciero, double, QQueryOperations>
      montoConSignoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'montoConSigno');
    });
  }

  QueryBuilder<MovimientoFinanciero, String, QQueryOperations>
      montoFormateadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'montoFormateado');
    });
  }

  QueryBuilder<MovimientoFinanciero, String?, QQueryOperations>
      motivoAnulacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'motivoAnulacion');
    });
  }

  QueryBuilder<MovimientoFinanciero, String?, QQueryOperations>
      numeroComprobanteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'numeroComprobante');
    });
  }

  QueryBuilder<MovimientoFinanciero, String?, QQueryOperations>
      observacionesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'observaciones');
    });
  }

  QueryBuilder<MovimientoFinanciero, int?, QQueryOperations>
      proveedorIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'proveedorId');
    });
  }

  QueryBuilder<MovimientoFinanciero, int?, QQueryOperations>
      sorteoIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sorteoId');
    });
  }

  QueryBuilder<MovimientoFinanciero, String, QQueryOperations> tipoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tipo');
    });
  }

  QueryBuilder<MovimientoFinanciero, String, QQueryOperations>
      tipoFormateadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tipoFormateado');
    });
  }

  QueryBuilder<MovimientoFinanciero, int, QQueryOperations>
      usuarioIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'usuarioId');
    });
  }

  QueryBuilder<MovimientoFinanciero, int?, QQueryOperations> ventaIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ventaId');
    });
  }
}
