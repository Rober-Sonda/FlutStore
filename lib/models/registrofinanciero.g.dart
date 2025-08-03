// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registrofinanciero.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRegistroFinancieroCollection on Isar {
  IsarCollection<RegistroFinanciero> get registroFinancieros =>
      this.collection();
}

const RegistroFinancieroSchema = CollectionSchema(
  name: r'RegistroFinanciero',
  id: 882509460694069565,
  properties: {
    r'adjunto': PropertySchema(
      id: 0,
      name: r'adjunto',
      type: IsarType.string,
    ),
    r'banco': PropertySchema(
      id: 1,
      name: r'banco',
      type: IsarType.string,
    ),
    r'categoria': PropertySchema(
      id: 2,
      name: r'categoria',
      type: IsarType.string,
    ),
    r'categoriaId': PropertySchema(
      id: 3,
      name: r'categoriaId',
      type: IsarType.long,
    ),
    r'clienteId': PropertySchema(
      id: 4,
      name: r'clienteId',
      type: IsarType.long,
    ),
    r'colorCategoria': PropertySchema(
      id: 5,
      name: r'colorCategoria',
      type: IsarType.string,
    ),
    r'colorEstado': PropertySchema(
      id: 6,
      name: r'colorEstado',
      type: IsarType.string,
    ),
    r'colorTipo': PropertySchema(
      id: 7,
      name: r'colorTipo',
      type: IsarType.string,
    ),
    r'compraId': PropertySchema(
      id: 8,
      name: r'compraId',
      type: IsarType.long,
    ),
    r'concepto': PropertySchema(
      id: 9,
      name: r'concepto',
      type: IsarType.string,
    ),
    r'descripcion': PropertySchema(
      id: 10,
      name: r'descripcion',
      type: IsarType.string,
    ),
    r'esEgreso': PropertySchema(
      id: 11,
      name: r'esEgreso',
      type: IsarType.bool,
    ),
    r'esIngreso': PropertySchema(
      id: 12,
      name: r'esIngreso',
      type: IsarType.bool,
    ),
    r'esRecurrente': PropertySchema(
      id: 13,
      name: r'esRecurrente',
      type: IsarType.bool,
    ),
    r'estaVencido': PropertySchema(
      id: 14,
      name: r'estaVencido',
      type: IsarType.bool,
    ),
    r'estado': PropertySchema(
      id: 15,
      name: r'estado',
      type: IsarType.string,
    ),
    r'estadoFormateado': PropertySchema(
      id: 16,
      name: r'estadoFormateado',
      type: IsarType.string,
    ),
    r'etiquetas': PropertySchema(
      id: 17,
      name: r'etiquetas',
      type: IsarType.stringList,
    ),
    r'fecha': PropertySchema(
      id: 18,
      name: r'fecha',
      type: IsarType.dateTime,
    ),
    r'fechaActualizacion': PropertySchema(
      id: 19,
      name: r'fechaActualizacion',
      type: IsarType.dateTime,
    ),
    r'fechaAnulacion': PropertySchema(
      id: 20,
      name: r'fechaAnulacion',
      type: IsarType.dateTime,
    ),
    r'fechaConfirmacion': PropertySchema(
      id: 21,
      name: r'fechaConfirmacion',
      type: IsarType.dateTime,
    ),
    r'fechaCreacion': PropertySchema(
      id: 22,
      name: r'fechaCreacion',
      type: IsarType.dateTime,
    ),
    r'fechaVencimiento': PropertySchema(
      id: 23,
      name: r'fechaVencimiento',
      type: IsarType.dateTime,
    ),
    r'frecuenciaRecurrencia': PropertySchema(
      id: 24,
      name: r'frecuenciaRecurrencia',
      type: IsarType.string,
    ),
    r'iconoCategoria': PropertySchema(
      id: 25,
      name: r'iconoCategoria',
      type: IsarType.string,
    ),
    r'iconoMetodoPago': PropertySchema(
      id: 26,
      name: r'iconoMetodoPago',
      type: IsarType.string,
    ),
    r'metodoPago': PropertySchema(
      id: 27,
      name: r'metodoPago',
      type: IsarType.string,
    ),
    r'metodoPagoFormateado': PropertySchema(
      id: 28,
      name: r'metodoPagoFormateado',
      type: IsarType.string,
    ),
    r'monto': PropertySchema(
      id: 29,
      name: r'monto',
      type: IsarType.double,
    ),
    r'montoConSigno': PropertySchema(
      id: 30,
      name: r'montoConSigno',
      type: IsarType.double,
    ),
    r'montoFormateado': PropertySchema(
      id: 31,
      name: r'montoFormateado',
      type: IsarType.string,
    ),
    r'motivoAnulacion': PropertySchema(
      id: 32,
      name: r'motivoAnulacion',
      type: IsarType.string,
    ),
    r'numeroComprobante': PropertySchema(
      id: 33,
      name: r'numeroComprobante',
      type: IsarType.string,
    ),
    r'numeroCuenta': PropertySchema(
      id: 34,
      name: r'numeroCuenta',
      type: IsarType.string,
    ),
    r'observaciones': PropertySchema(
      id: 35,
      name: r'observaciones',
      type: IsarType.string,
    ),
    r'proveedorId': PropertySchema(
      id: 36,
      name: r'proveedorId',
      type: IsarType.long,
    ),
    r'proximoAVencer': PropertySchema(
      id: 37,
      name: r'proximoAVencer',
      type: IsarType.bool,
    ),
    r'tipo': PropertySchema(
      id: 38,
      name: r'tipo',
      type: IsarType.string,
    ),
    r'usuarioAnulacion': PropertySchema(
      id: 39,
      name: r'usuarioAnulacion',
      type: IsarType.long,
    ),
    r'usuarioId': PropertySchema(
      id: 40,
      name: r'usuarioId',
      type: IsarType.long,
    ),
    r'ventaId': PropertySchema(
      id: 41,
      name: r'ventaId',
      type: IsarType.long,
    )
  },
  estimateSize: _registroFinancieroEstimateSize,
  serialize: _registroFinancieroSerialize,
  deserialize: _registroFinancieroDeserialize,
  deserializeProp: _registroFinancieroDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _registroFinancieroGetId,
  getLinks: _registroFinancieroGetLinks,
  attach: _registroFinancieroAttach,
  version: '3.1.0+1',
);

int _registroFinancieroEstimateSize(
  RegistroFinanciero object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.adjunto;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.banco;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
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
  bytesCount += 3 + object.estado.length * 3;
  bytesCount += 3 + object.estadoFormateado.length * 3;
  bytesCount += 3 + object.etiquetas.length * 3;
  {
    for (var i = 0; i < object.etiquetas.length; i++) {
      final value = object.etiquetas[i];
      bytesCount += value.length * 3;
    }
  }
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
    final value = object.numeroCuenta;
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

void _registroFinancieroSerialize(
  RegistroFinanciero object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.adjunto);
  writer.writeString(offsets[1], object.banco);
  writer.writeString(offsets[2], object.categoria);
  writer.writeLong(offsets[3], object.categoriaId);
  writer.writeLong(offsets[4], object.clienteId);
  writer.writeString(offsets[5], object.colorCategoria);
  writer.writeString(offsets[6], object.colorEstado);
  writer.writeString(offsets[7], object.colorTipo);
  writer.writeLong(offsets[8], object.compraId);
  writer.writeString(offsets[9], object.concepto);
  writer.writeString(offsets[10], object.descripcion);
  writer.writeBool(offsets[11], object.esEgreso);
  writer.writeBool(offsets[12], object.esIngreso);
  writer.writeBool(offsets[13], object.esRecurrente);
  writer.writeBool(offsets[14], object.estaVencido);
  writer.writeString(offsets[15], object.estado);
  writer.writeString(offsets[16], object.estadoFormateado);
  writer.writeStringList(offsets[17], object.etiquetas);
  writer.writeDateTime(offsets[18], object.fecha);
  writer.writeDateTime(offsets[19], object.fechaActualizacion);
  writer.writeDateTime(offsets[20], object.fechaAnulacion);
  writer.writeDateTime(offsets[21], object.fechaConfirmacion);
  writer.writeDateTime(offsets[22], object.fechaCreacion);
  writer.writeDateTime(offsets[23], object.fechaVencimiento);
  writer.writeString(offsets[24], object.frecuenciaRecurrencia);
  writer.writeString(offsets[25], object.iconoCategoria);
  writer.writeString(offsets[26], object.iconoMetodoPago);
  writer.writeString(offsets[27], object.metodoPago);
  writer.writeString(offsets[28], object.metodoPagoFormateado);
  writer.writeDouble(offsets[29], object.monto);
  writer.writeDouble(offsets[30], object.montoConSigno);
  writer.writeString(offsets[31], object.montoFormateado);
  writer.writeString(offsets[32], object.motivoAnulacion);
  writer.writeString(offsets[33], object.numeroComprobante);
  writer.writeString(offsets[34], object.numeroCuenta);
  writer.writeString(offsets[35], object.observaciones);
  writer.writeLong(offsets[36], object.proveedorId);
  writer.writeBool(offsets[37], object.proximoAVencer);
  writer.writeString(offsets[38], object.tipo);
  writer.writeLong(offsets[39], object.usuarioAnulacion);
  writer.writeLong(offsets[40], object.usuarioId);
  writer.writeLong(offsets[41], object.ventaId);
}

RegistroFinanciero _registroFinancieroDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RegistroFinanciero(
    adjunto: reader.readStringOrNull(offsets[0]),
    banco: reader.readStringOrNull(offsets[1]),
    categoria: reader.readString(offsets[2]),
    categoriaId: reader.readLongOrNull(offsets[3]),
    clienteId: reader.readLongOrNull(offsets[4]),
    compraId: reader.readLongOrNull(offsets[8]),
    concepto: reader.readString(offsets[9]),
    descripcion: reader.readStringOrNull(offsets[10]),
    esRecurrente: reader.readBoolOrNull(offsets[13]) ?? false,
    estado: reader.readStringOrNull(offsets[15]) ?? 'pendiente',
    etiquetas: reader.readStringList(offsets[17]) ?? const [],
    fecha: reader.readDateTime(offsets[18]),
    fechaVencimiento: reader.readDateTimeOrNull(offsets[23]),
    frecuenciaRecurrencia: reader.readStringOrNull(offsets[24]),
    metodoPago: reader.readStringOrNull(offsets[27]),
    monto: reader.readDouble(offsets[29]),
    numeroComprobante: reader.readStringOrNull(offsets[33]),
    numeroCuenta: reader.readStringOrNull(offsets[34]),
    observaciones: reader.readStringOrNull(offsets[35]),
    proveedorId: reader.readLongOrNull(offsets[36]),
    tipo: reader.readString(offsets[38]),
    usuarioId: reader.readLongOrNull(offsets[40]) ?? 1,
    ventaId: reader.readLongOrNull(offsets[41]),
  );
  object.fechaActualizacion = reader.readDateTimeOrNull(offsets[19]);
  object.fechaAnulacion = reader.readDateTimeOrNull(offsets[20]);
  object.fechaConfirmacion = reader.readDateTimeOrNull(offsets[21]);
  object.fechaCreacion = reader.readDateTime(offsets[22]);
  object.id = id;
  object.motivoAnulacion = reader.readStringOrNull(offsets[32]);
  object.usuarioAnulacion = reader.readLongOrNull(offsets[39]);
  return object;
}

P _registroFinancieroDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readLongOrNull(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readBool(offset)) as P;
    case 12:
      return (reader.readBool(offset)) as P;
    case 13:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 14:
      return (reader.readBool(offset)) as P;
    case 15:
      return (reader.readStringOrNull(offset) ?? 'pendiente') as P;
    case 16:
      return (reader.readString(offset)) as P;
    case 17:
      return (reader.readStringList(offset) ?? const []) as P;
    case 18:
      return (reader.readDateTime(offset)) as P;
    case 19:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 20:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 21:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 22:
      return (reader.readDateTime(offset)) as P;
    case 23:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 24:
      return (reader.readStringOrNull(offset)) as P;
    case 25:
      return (reader.readString(offset)) as P;
    case 26:
      return (reader.readString(offset)) as P;
    case 27:
      return (reader.readStringOrNull(offset)) as P;
    case 28:
      return (reader.readString(offset)) as P;
    case 29:
      return (reader.readDouble(offset)) as P;
    case 30:
      return (reader.readDouble(offset)) as P;
    case 31:
      return (reader.readString(offset)) as P;
    case 32:
      return (reader.readStringOrNull(offset)) as P;
    case 33:
      return (reader.readStringOrNull(offset)) as P;
    case 34:
      return (reader.readStringOrNull(offset)) as P;
    case 35:
      return (reader.readStringOrNull(offset)) as P;
    case 36:
      return (reader.readLongOrNull(offset)) as P;
    case 37:
      return (reader.readBool(offset)) as P;
    case 38:
      return (reader.readString(offset)) as P;
    case 39:
      return (reader.readLongOrNull(offset)) as P;
    case 40:
      return (reader.readLongOrNull(offset) ?? 1) as P;
    case 41:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _registroFinancieroGetId(RegistroFinanciero object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _registroFinancieroGetLinks(
    RegistroFinanciero object) {
  return [];
}

void _registroFinancieroAttach(
    IsarCollection<dynamic> col, Id id, RegistroFinanciero object) {
  object.id = id;
}

extension RegistroFinancieroQueryWhereSort
    on QueryBuilder<RegistroFinanciero, RegistroFinanciero, QWhere> {
  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension RegistroFinancieroQueryWhere
    on QueryBuilder<RegistroFinanciero, RegistroFinanciero, QWhereClause> {
  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterWhereClause>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterWhereClause>
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

extension RegistroFinancieroQueryFilter
    on QueryBuilder<RegistroFinanciero, RegistroFinanciero, QFilterCondition> {
  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      adjuntoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'adjunto',
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      adjuntoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'adjunto',
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      adjuntoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'adjunto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      adjuntoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'adjunto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      adjuntoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'adjunto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      adjuntoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'adjunto',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      adjuntoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'adjunto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      adjuntoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'adjunto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      adjuntoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'adjunto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      adjuntoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'adjunto',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      adjuntoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'adjunto',
        value: '',
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      adjuntoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'adjunto',
        value: '',
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      bancoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'banco',
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      bancoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'banco',
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      bancoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'banco',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      bancoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'banco',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      bancoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'banco',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      bancoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'banco',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      bancoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'banco',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      bancoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'banco',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      bancoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'banco',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      bancoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'banco',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      bancoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'banco',
        value: '',
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      bancoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'banco',
        value: '',
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      categoriaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'categoria',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      categoriaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'categoria',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      categoriaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'categoria',
        value: '',
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      categoriaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'categoria',
        value: '',
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      categoriaIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'categoriaId',
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      categoriaIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'categoriaId',
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      categoriaIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'categoriaId',
        value: value,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      categoriaIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'categoriaId',
        value: value,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      categoriaIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'categoriaId',
        value: value,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      categoriaIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'categoriaId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      clienteIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'clienteId',
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      clienteIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'clienteId',
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      clienteIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'clienteId',
        value: value,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      colorCategoriaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'colorCategoria',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      colorCategoriaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'colorCategoria',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      colorCategoriaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'colorCategoria',
        value: '',
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      colorCategoriaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'colorCategoria',
        value: '',
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      colorEstadoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'colorEstado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      colorEstadoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'colorEstado',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      colorEstadoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'colorEstado',
        value: '',
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      colorEstadoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'colorEstado',
        value: '',
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      colorTipoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'colorTipo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      colorTipoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'colorTipo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      colorTipoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'colorTipo',
        value: '',
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      colorTipoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'colorTipo',
        value: '',
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      compraIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'compraId',
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      compraIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'compraId',
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      compraIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'compraId',
        value: value,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      conceptoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'concepto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      conceptoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'concepto',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      conceptoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'concepto',
        value: '',
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      conceptoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'concepto',
        value: '',
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      descripcionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'descripcion',
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      descripcionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'descripcion',
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      descripcionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'descripcion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      descripcionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'descripcion',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      descripcionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'descripcion',
        value: '',
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      descripcionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'descripcion',
        value: '',
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      esEgresoEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'esEgreso',
        value: value,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      esIngresoEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'esIngreso',
        value: value,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      esRecurrenteEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'esRecurrente',
        value: value,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      estaVencidoEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estaVencido',
        value: value,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      estadoEqualTo(
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      estadoGreaterThan(
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      estadoLessThan(
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      estadoBetween(
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      estadoStartsWith(
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      estadoEndsWith(
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      estadoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'estado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      estadoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'estado',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      estadoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estado',
        value: '',
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      estadoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'estado',
        value: '',
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      estadoFormateadoEqualTo(
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      estadoFormateadoLessThan(
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      estadoFormateadoBetween(
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      estadoFormateadoEndsWith(
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      estadoFormateadoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'estadoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      estadoFormateadoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'estadoFormateado',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      estadoFormateadoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estadoFormateado',
        value: '',
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      estadoFormateadoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'estadoFormateado',
        value: '',
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      etiquetasElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'etiquetas',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      etiquetasElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'etiquetas',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      etiquetasElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'etiquetas',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      etiquetasElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'etiquetas',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      etiquetasElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'etiquetas',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      etiquetasElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'etiquetas',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      etiquetasElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'etiquetas',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      etiquetasElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'etiquetas',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      etiquetasElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'etiquetas',
        value: '',
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      etiquetasElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'etiquetas',
        value: '',
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      etiquetasLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'etiquetas',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      etiquetasIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'etiquetas',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      etiquetasIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'etiquetas',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      etiquetasLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'etiquetas',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      etiquetasLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'etiquetas',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      etiquetasLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'etiquetas',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      fechaEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fecha',
        value: value,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      fechaActualizacionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fechaActualizacion',
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      fechaActualizacionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fechaActualizacion',
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      fechaActualizacionEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaActualizacion',
        value: value,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      fechaAnulacionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fechaAnulacion',
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      fechaAnulacionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fechaAnulacion',
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      fechaAnulacionEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaAnulacion',
        value: value,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      fechaAnulacionGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fechaAnulacion',
        value: value,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      fechaAnulacionLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fechaAnulacion',
        value: value,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      fechaAnulacionBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fechaAnulacion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      fechaConfirmacionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fechaConfirmacion',
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      fechaConfirmacionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fechaConfirmacion',
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      fechaConfirmacionEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaConfirmacion',
        value: value,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      fechaConfirmacionGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fechaConfirmacion',
        value: value,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      fechaConfirmacionLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fechaConfirmacion',
        value: value,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      fechaConfirmacionBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fechaConfirmacion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      fechaCreacionEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaCreacion',
        value: value,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      fechaVencimientoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fechaVencimiento',
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      fechaVencimientoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fechaVencimiento',
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      fechaVencimientoEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaVencimiento',
        value: value,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      fechaVencimientoGreaterThan(
    DateTime? value, {
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      fechaVencimientoLessThan(
    DateTime? value, {
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      fechaVencimientoBetween(
    DateTime? lower,
    DateTime? upper, {
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      frecuenciaRecurrenciaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'frecuenciaRecurrencia',
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      frecuenciaRecurrenciaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'frecuenciaRecurrencia',
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      frecuenciaRecurrenciaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'frecuenciaRecurrencia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      frecuenciaRecurrenciaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frecuenciaRecurrencia',
        value: '',
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      frecuenciaRecurrenciaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'frecuenciaRecurrencia',
        value: '',
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      iconoCategoriaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'iconoCategoria',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      iconoCategoriaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'iconoCategoria',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      iconoCategoriaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'iconoCategoria',
        value: '',
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      iconoCategoriaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'iconoCategoria',
        value: '',
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      iconoMetodoPagoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'iconoMetodoPago',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      iconoMetodoPagoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'iconoMetodoPago',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      iconoMetodoPagoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'iconoMetodoPago',
        value: '',
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      iconoMetodoPagoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'iconoMetodoPago',
        value: '',
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      metodoPagoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'metodoPago',
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      metodoPagoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'metodoPago',
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      metodoPagoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'metodoPago',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      metodoPagoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'metodoPago',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      metodoPagoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'metodoPago',
        value: '',
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      metodoPagoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'metodoPago',
        value: '',
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      metodoPagoFormateadoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'metodoPagoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      metodoPagoFormateadoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'metodoPagoFormateado',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      metodoPagoFormateadoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'metodoPagoFormateado',
        value: '',
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      metodoPagoFormateadoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'metodoPagoFormateado',
        value: '',
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      montoFormateadoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'montoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      montoFormateadoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'montoFormateado',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      montoFormateadoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'montoFormateado',
        value: '',
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      montoFormateadoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'montoFormateado',
        value: '',
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      motivoAnulacionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'motivoAnulacion',
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      motivoAnulacionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'motivoAnulacion',
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      motivoAnulacionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'motivoAnulacion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      motivoAnulacionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'motivoAnulacion',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      motivoAnulacionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'motivoAnulacion',
        value: '',
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      motivoAnulacionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'motivoAnulacion',
        value: '',
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      numeroComprobanteIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'numeroComprobante',
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      numeroComprobanteIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'numeroComprobante',
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      numeroComprobanteContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'numeroComprobante',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      numeroComprobanteMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'numeroComprobante',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      numeroComprobanteIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'numeroComprobante',
        value: '',
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      numeroComprobanteIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'numeroComprobante',
        value: '',
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      numeroCuentaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'numeroCuenta',
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      numeroCuentaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'numeroCuenta',
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      numeroCuentaEqualTo(
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      numeroCuentaBetween(
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      numeroCuentaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'numeroCuenta',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      numeroCuentaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'numeroCuenta',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      numeroCuentaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'numeroCuenta',
        value: '',
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      numeroCuentaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'numeroCuenta',
        value: '',
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      observacionesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'observaciones',
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      observacionesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'observaciones',
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      observacionesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'observaciones',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      observacionesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'observaciones',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      observacionesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'observaciones',
        value: '',
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      observacionesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'observaciones',
        value: '',
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      proveedorIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'proveedorId',
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      proveedorIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'proveedorId',
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      proveedorIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'proveedorId',
        value: value,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      proximoAVencerEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'proximoAVencer',
        value: value,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      tipoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tipo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      tipoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tipo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      tipoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tipo',
        value: '',
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      tipoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tipo',
        value: '',
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      usuarioAnulacionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'usuarioAnulacion',
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      usuarioAnulacionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'usuarioAnulacion',
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      usuarioAnulacionEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'usuarioAnulacion',
        value: value,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      usuarioAnulacionGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'usuarioAnulacion',
        value: value,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      usuarioAnulacionLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'usuarioAnulacion',
        value: value,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      usuarioAnulacionBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'usuarioAnulacion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      usuarioIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'usuarioId',
        value: value,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      ventaIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ventaId',
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      ventaIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ventaId',
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      ventaIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ventaId',
        value: value,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
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

extension RegistroFinancieroQueryObject
    on QueryBuilder<RegistroFinanciero, RegistroFinanciero, QFilterCondition> {}

extension RegistroFinancieroQueryLinks
    on QueryBuilder<RegistroFinanciero, RegistroFinanciero, QFilterCondition> {}

extension RegistroFinancieroQuerySortBy
    on QueryBuilder<RegistroFinanciero, RegistroFinanciero, QSortBy> {
  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      sortByAdjunto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adjunto', Sort.asc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      sortByAdjuntoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adjunto', Sort.desc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      sortByBanco() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'banco', Sort.asc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      sortByBancoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'banco', Sort.desc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      sortByCategoria() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoria', Sort.asc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      sortByCategoriaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoria', Sort.desc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      sortByCategoriaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoriaId', Sort.asc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      sortByCategoriaIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoriaId', Sort.desc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      sortByClienteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clienteId', Sort.asc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      sortByClienteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clienteId', Sort.desc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      sortByColorCategoria() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorCategoria', Sort.asc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      sortByColorCategoriaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorCategoria', Sort.desc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      sortByColorEstado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorEstado', Sort.asc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      sortByColorEstadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorEstado', Sort.desc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      sortByColorTipo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorTipo', Sort.asc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      sortByColorTipoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorTipo', Sort.desc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      sortByCompraId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'compraId', Sort.asc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      sortByCompraIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'compraId', Sort.desc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      sortByConcepto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'concepto', Sort.asc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      sortByConceptoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'concepto', Sort.desc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      sortByDescripcion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descripcion', Sort.asc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      sortByDescripcionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descripcion', Sort.desc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      sortByEsEgreso() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esEgreso', Sort.asc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      sortByEsEgresoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esEgreso', Sort.desc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      sortByEsIngreso() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esIngreso', Sort.asc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      sortByEsIngresoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esIngreso', Sort.desc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      sortByEsRecurrente() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esRecurrente', Sort.asc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      sortByEsRecurrenteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esRecurrente', Sort.desc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      sortByEstaVencido() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estaVencido', Sort.asc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      sortByEstaVencidoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estaVencido', Sort.desc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      sortByEstado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.asc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      sortByEstadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.desc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      sortByEstadoFormateado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estadoFormateado', Sort.asc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      sortByEstadoFormateadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estadoFormateado', Sort.desc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      sortByFecha() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fecha', Sort.asc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      sortByFechaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fecha', Sort.desc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      sortByFechaActualizacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaActualizacion', Sort.asc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      sortByFechaActualizacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaActualizacion', Sort.desc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      sortByFechaAnulacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaAnulacion', Sort.asc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      sortByFechaAnulacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaAnulacion', Sort.desc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      sortByFechaConfirmacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaConfirmacion', Sort.asc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      sortByFechaConfirmacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaConfirmacion', Sort.desc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      sortByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.asc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      sortByFechaCreacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.desc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      sortByFechaVencimiento() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaVencimiento', Sort.asc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      sortByFechaVencimientoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaVencimiento', Sort.desc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      sortByFrecuenciaRecurrencia() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frecuenciaRecurrencia', Sort.asc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      sortByFrecuenciaRecurrenciaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frecuenciaRecurrencia', Sort.desc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      sortByIconoCategoria() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconoCategoria', Sort.asc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      sortByIconoCategoriaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconoCategoria', Sort.desc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      sortByIconoMetodoPago() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconoMetodoPago', Sort.asc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      sortByIconoMetodoPagoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconoMetodoPago', Sort.desc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      sortByMetodoPago() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'metodoPago', Sort.asc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      sortByMetodoPagoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'metodoPago', Sort.desc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      sortByMetodoPagoFormateado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'metodoPagoFormateado', Sort.asc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      sortByMetodoPagoFormateadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'metodoPagoFormateado', Sort.desc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      sortByMonto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monto', Sort.asc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      sortByMontoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monto', Sort.desc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      sortByMontoConSigno() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoConSigno', Sort.asc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      sortByMontoConSignoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoConSigno', Sort.desc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      sortByMontoFormateado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoFormateado', Sort.asc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      sortByMontoFormateadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoFormateado', Sort.desc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      sortByMotivoAnulacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'motivoAnulacion', Sort.asc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      sortByMotivoAnulacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'motivoAnulacion', Sort.desc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      sortByNumeroComprobante() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroComprobante', Sort.asc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      sortByNumeroComprobanteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroComprobante', Sort.desc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      sortByNumeroCuenta() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroCuenta', Sort.asc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      sortByNumeroCuentaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroCuenta', Sort.desc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      sortByObservaciones() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observaciones', Sort.asc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      sortByObservacionesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observaciones', Sort.desc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      sortByProveedorId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proveedorId', Sort.asc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      sortByProveedorIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proveedorId', Sort.desc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      sortByProximoAVencer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proximoAVencer', Sort.asc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      sortByProximoAVencerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proximoAVencer', Sort.desc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      sortByTipo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo', Sort.asc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      sortByTipoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo', Sort.desc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      sortByUsuarioAnulacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usuarioAnulacion', Sort.asc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      sortByUsuarioAnulacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usuarioAnulacion', Sort.desc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      sortByUsuarioId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usuarioId', Sort.asc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      sortByUsuarioIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usuarioId', Sort.desc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      sortByVentaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ventaId', Sort.asc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      sortByVentaIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ventaId', Sort.desc);
    });
  }
}

extension RegistroFinancieroQuerySortThenBy
    on QueryBuilder<RegistroFinanciero, RegistroFinanciero, QSortThenBy> {
  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      thenByAdjunto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adjunto', Sort.asc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      thenByAdjuntoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adjunto', Sort.desc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      thenByBanco() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'banco', Sort.asc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      thenByBancoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'banco', Sort.desc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      thenByCategoria() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoria', Sort.asc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      thenByCategoriaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoria', Sort.desc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      thenByCategoriaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoriaId', Sort.asc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      thenByCategoriaIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoriaId', Sort.desc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      thenByClienteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clienteId', Sort.asc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      thenByClienteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clienteId', Sort.desc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      thenByColorCategoria() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorCategoria', Sort.asc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      thenByColorCategoriaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorCategoria', Sort.desc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      thenByColorEstado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorEstado', Sort.asc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      thenByColorEstadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorEstado', Sort.desc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      thenByColorTipo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorTipo', Sort.asc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      thenByColorTipoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorTipo', Sort.desc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      thenByCompraId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'compraId', Sort.asc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      thenByCompraIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'compraId', Sort.desc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      thenByConcepto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'concepto', Sort.asc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      thenByConceptoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'concepto', Sort.desc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      thenByDescripcion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descripcion', Sort.asc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      thenByDescripcionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descripcion', Sort.desc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      thenByEsEgreso() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esEgreso', Sort.asc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      thenByEsEgresoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esEgreso', Sort.desc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      thenByEsIngreso() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esIngreso', Sort.asc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      thenByEsIngresoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esIngreso', Sort.desc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      thenByEsRecurrente() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esRecurrente', Sort.asc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      thenByEsRecurrenteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esRecurrente', Sort.desc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      thenByEstaVencido() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estaVencido', Sort.asc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      thenByEstaVencidoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estaVencido', Sort.desc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      thenByEstado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.asc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      thenByEstadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.desc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      thenByEstadoFormateado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estadoFormateado', Sort.asc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      thenByEstadoFormateadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estadoFormateado', Sort.desc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      thenByFecha() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fecha', Sort.asc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      thenByFechaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fecha', Sort.desc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      thenByFechaActualizacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaActualizacion', Sort.asc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      thenByFechaActualizacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaActualizacion', Sort.desc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      thenByFechaAnulacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaAnulacion', Sort.asc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      thenByFechaAnulacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaAnulacion', Sort.desc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      thenByFechaConfirmacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaConfirmacion', Sort.asc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      thenByFechaConfirmacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaConfirmacion', Sort.desc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      thenByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.asc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      thenByFechaCreacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.desc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      thenByFechaVencimiento() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaVencimiento', Sort.asc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      thenByFechaVencimientoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaVencimiento', Sort.desc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      thenByFrecuenciaRecurrencia() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frecuenciaRecurrencia', Sort.asc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      thenByFrecuenciaRecurrenciaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frecuenciaRecurrencia', Sort.desc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      thenByIconoCategoria() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconoCategoria', Sort.asc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      thenByIconoCategoriaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconoCategoria', Sort.desc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      thenByIconoMetodoPago() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconoMetodoPago', Sort.asc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      thenByIconoMetodoPagoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconoMetodoPago', Sort.desc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      thenByMetodoPago() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'metodoPago', Sort.asc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      thenByMetodoPagoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'metodoPago', Sort.desc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      thenByMetodoPagoFormateado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'metodoPagoFormateado', Sort.asc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      thenByMetodoPagoFormateadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'metodoPagoFormateado', Sort.desc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      thenByMonto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monto', Sort.asc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      thenByMontoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monto', Sort.desc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      thenByMontoConSigno() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoConSigno', Sort.asc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      thenByMontoConSignoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoConSigno', Sort.desc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      thenByMontoFormateado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoFormateado', Sort.asc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      thenByMontoFormateadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoFormateado', Sort.desc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      thenByMotivoAnulacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'motivoAnulacion', Sort.asc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      thenByMotivoAnulacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'motivoAnulacion', Sort.desc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      thenByNumeroComprobante() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroComprobante', Sort.asc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      thenByNumeroComprobanteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroComprobante', Sort.desc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      thenByNumeroCuenta() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroCuenta', Sort.asc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      thenByNumeroCuentaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroCuenta', Sort.desc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      thenByObservaciones() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observaciones', Sort.asc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      thenByObservacionesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observaciones', Sort.desc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      thenByProveedorId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proveedorId', Sort.asc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      thenByProveedorIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proveedorId', Sort.desc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      thenByProximoAVencer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proximoAVencer', Sort.asc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      thenByProximoAVencerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proximoAVencer', Sort.desc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      thenByTipo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo', Sort.asc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      thenByTipoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo', Sort.desc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      thenByUsuarioAnulacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usuarioAnulacion', Sort.asc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      thenByUsuarioAnulacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usuarioAnulacion', Sort.desc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      thenByUsuarioId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usuarioId', Sort.asc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      thenByUsuarioIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usuarioId', Sort.desc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      thenByVentaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ventaId', Sort.asc);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterSortBy>
      thenByVentaIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ventaId', Sort.desc);
    });
  }
}

extension RegistroFinancieroQueryWhereDistinct
    on QueryBuilder<RegistroFinanciero, RegistroFinanciero, QDistinct> {
  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QDistinct>
      distinctByAdjunto({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'adjunto', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QDistinct>
      distinctByBanco({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'banco', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QDistinct>
      distinctByCategoria({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'categoria', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QDistinct>
      distinctByCategoriaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'categoriaId');
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QDistinct>
      distinctByClienteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'clienteId');
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QDistinct>
      distinctByColorCategoria({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'colorCategoria',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QDistinct>
      distinctByColorEstado({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'colorEstado', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QDistinct>
      distinctByColorTipo({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'colorTipo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QDistinct>
      distinctByCompraId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'compraId');
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QDistinct>
      distinctByConcepto({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'concepto', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QDistinct>
      distinctByDescripcion({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'descripcion', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QDistinct>
      distinctByEsEgreso() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'esEgreso');
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QDistinct>
      distinctByEsIngreso() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'esIngreso');
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QDistinct>
      distinctByEsRecurrente() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'esRecurrente');
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QDistinct>
      distinctByEstaVencido() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estaVencido');
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QDistinct>
      distinctByEstado({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estado', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QDistinct>
      distinctByEstadoFormateado({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estadoFormateado',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QDistinct>
      distinctByEtiquetas() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'etiquetas');
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QDistinct>
      distinctByFecha() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fecha');
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QDistinct>
      distinctByFechaActualizacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaActualizacion');
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QDistinct>
      distinctByFechaAnulacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaAnulacion');
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QDistinct>
      distinctByFechaConfirmacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaConfirmacion');
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QDistinct>
      distinctByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaCreacion');
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QDistinct>
      distinctByFechaVencimiento() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaVencimiento');
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QDistinct>
      distinctByFrecuenciaRecurrencia({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'frecuenciaRecurrencia',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QDistinct>
      distinctByIconoCategoria({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'iconoCategoria',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QDistinct>
      distinctByIconoMetodoPago({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'iconoMetodoPago',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QDistinct>
      distinctByMetodoPago({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'metodoPago', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QDistinct>
      distinctByMetodoPagoFormateado({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'metodoPagoFormateado',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QDistinct>
      distinctByMonto() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'monto');
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QDistinct>
      distinctByMontoConSigno() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'montoConSigno');
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QDistinct>
      distinctByMontoFormateado({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'montoFormateado',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QDistinct>
      distinctByMotivoAnulacion({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'motivoAnulacion',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QDistinct>
      distinctByNumeroComprobante({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'numeroComprobante',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QDistinct>
      distinctByNumeroCuenta({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'numeroCuenta', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QDistinct>
      distinctByObservaciones({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'observaciones',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QDistinct>
      distinctByProveedorId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'proveedorId');
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QDistinct>
      distinctByProximoAVencer() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'proximoAVencer');
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QDistinct>
      distinctByTipo({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tipo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QDistinct>
      distinctByUsuarioAnulacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'usuarioAnulacion');
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QDistinct>
      distinctByUsuarioId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'usuarioId');
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QDistinct>
      distinctByVentaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ventaId');
    });
  }
}

extension RegistroFinancieroQueryProperty
    on QueryBuilder<RegistroFinanciero, RegistroFinanciero, QQueryProperty> {
  QueryBuilder<RegistroFinanciero, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<RegistroFinanciero, String?, QQueryOperations>
      adjuntoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'adjunto');
    });
  }

  QueryBuilder<RegistroFinanciero, String?, QQueryOperations> bancoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'banco');
    });
  }

  QueryBuilder<RegistroFinanciero, String, QQueryOperations>
      categoriaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'categoria');
    });
  }

  QueryBuilder<RegistroFinanciero, int?, QQueryOperations>
      categoriaIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'categoriaId');
    });
  }

  QueryBuilder<RegistroFinanciero, int?, QQueryOperations> clienteIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'clienteId');
    });
  }

  QueryBuilder<RegistroFinanciero, String, QQueryOperations>
      colorCategoriaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'colorCategoria');
    });
  }

  QueryBuilder<RegistroFinanciero, String, QQueryOperations>
      colorEstadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'colorEstado');
    });
  }

  QueryBuilder<RegistroFinanciero, String, QQueryOperations>
      colorTipoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'colorTipo');
    });
  }

  QueryBuilder<RegistroFinanciero, int?, QQueryOperations> compraIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'compraId');
    });
  }

  QueryBuilder<RegistroFinanciero, String, QQueryOperations>
      conceptoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'concepto');
    });
  }

  QueryBuilder<RegistroFinanciero, String?, QQueryOperations>
      descripcionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'descripcion');
    });
  }

  QueryBuilder<RegistroFinanciero, bool, QQueryOperations> esEgresoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'esEgreso');
    });
  }

  QueryBuilder<RegistroFinanciero, bool, QQueryOperations> esIngresoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'esIngreso');
    });
  }

  QueryBuilder<RegistroFinanciero, bool, QQueryOperations>
      esRecurrenteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'esRecurrente');
    });
  }

  QueryBuilder<RegistroFinanciero, bool, QQueryOperations>
      estaVencidoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estaVencido');
    });
  }

  QueryBuilder<RegistroFinanciero, String, QQueryOperations> estadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estado');
    });
  }

  QueryBuilder<RegistroFinanciero, String, QQueryOperations>
      estadoFormateadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estadoFormateado');
    });
  }

  QueryBuilder<RegistroFinanciero, List<String>, QQueryOperations>
      etiquetasProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'etiquetas');
    });
  }

  QueryBuilder<RegistroFinanciero, DateTime, QQueryOperations> fechaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fecha');
    });
  }

  QueryBuilder<RegistroFinanciero, DateTime?, QQueryOperations>
      fechaActualizacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaActualizacion');
    });
  }

  QueryBuilder<RegistroFinanciero, DateTime?, QQueryOperations>
      fechaAnulacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaAnulacion');
    });
  }

  QueryBuilder<RegistroFinanciero, DateTime?, QQueryOperations>
      fechaConfirmacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaConfirmacion');
    });
  }

  QueryBuilder<RegistroFinanciero, DateTime, QQueryOperations>
      fechaCreacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaCreacion');
    });
  }

  QueryBuilder<RegistroFinanciero, DateTime?, QQueryOperations>
      fechaVencimientoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaVencimiento');
    });
  }

  QueryBuilder<RegistroFinanciero, String?, QQueryOperations>
      frecuenciaRecurrenciaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'frecuenciaRecurrencia');
    });
  }

  QueryBuilder<RegistroFinanciero, String, QQueryOperations>
      iconoCategoriaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'iconoCategoria');
    });
  }

  QueryBuilder<RegistroFinanciero, String, QQueryOperations>
      iconoMetodoPagoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'iconoMetodoPago');
    });
  }

  QueryBuilder<RegistroFinanciero, String?, QQueryOperations>
      metodoPagoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'metodoPago');
    });
  }

  QueryBuilder<RegistroFinanciero, String, QQueryOperations>
      metodoPagoFormateadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'metodoPagoFormateado');
    });
  }

  QueryBuilder<RegistroFinanciero, double, QQueryOperations> montoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'monto');
    });
  }

  QueryBuilder<RegistroFinanciero, double, QQueryOperations>
      montoConSignoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'montoConSigno');
    });
  }

  QueryBuilder<RegistroFinanciero, String, QQueryOperations>
      montoFormateadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'montoFormateado');
    });
  }

  QueryBuilder<RegistroFinanciero, String?, QQueryOperations>
      motivoAnulacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'motivoAnulacion');
    });
  }

  QueryBuilder<RegistroFinanciero, String?, QQueryOperations>
      numeroComprobanteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'numeroComprobante');
    });
  }

  QueryBuilder<RegistroFinanciero, String?, QQueryOperations>
      numeroCuentaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'numeroCuenta');
    });
  }

  QueryBuilder<RegistroFinanciero, String?, QQueryOperations>
      observacionesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'observaciones');
    });
  }

  QueryBuilder<RegistroFinanciero, int?, QQueryOperations>
      proveedorIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'proveedorId');
    });
  }

  QueryBuilder<RegistroFinanciero, bool, QQueryOperations>
      proximoAVencerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'proximoAVencer');
    });
  }

  QueryBuilder<RegistroFinanciero, String, QQueryOperations> tipoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tipo');
    });
  }

  QueryBuilder<RegistroFinanciero, int?, QQueryOperations>
      usuarioAnulacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'usuarioAnulacion');
    });
  }

  QueryBuilder<RegistroFinanciero, int, QQueryOperations> usuarioIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'usuarioId');
    });
  }

  QueryBuilder<RegistroFinanciero, int?, QQueryOperations> ventaIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ventaId');
    });
  }
}
