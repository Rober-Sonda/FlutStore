// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'compra.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCompraCollection on Isar {
  IsarCollection<Compra> get compras => this.collection();
}

const CompraSchema = CollectionSchema(
  name: r'Compra',
  id: 5991186631391069315,
  properties: {
    r'colorEstado': PropertySchema(
      id: 0,
      name: r'colorEstado',
      type: IsarType.string,
    ),
    r'compraOriginalId': PropertySchema(
      id: 1,
      name: r'compraOriginalId',
      type: IsarType.long,
    ),
    r'condicionesPago': PropertySchema(
      id: 2,
      name: r'condicionesPago',
      type: IsarType.string,
    ),
    r'contactoProveedor': PropertySchema(
      id: 3,
      name: r'contactoProveedor',
      type: IsarType.string,
    ),
    r'direccionEntrega': PropertySchema(
      id: 4,
      name: r'direccionEntrega',
      type: IsarType.string,
    ),
    r'emailProveedor': PropertySchema(
      id: 5,
      name: r'emailProveedor',
      type: IsarType.string,
    ),
    r'esDevolucion': PropertySchema(
      id: 6,
      name: r'esDevolucion',
      type: IsarType.bool,
    ),
    r'esDevolucionValida': PropertySchema(
      id: 7,
      name: r'esDevolucionValida',
      type: IsarType.bool,
    ),
    r'esUrgente': PropertySchema(
      id: 8,
      name: r'esUrgente',
      type: IsarType.bool,
    ),
    r'estaPagada': PropertySchema(
      id: 9,
      name: r'estaPagada',
      type: IsarType.bool,
    ),
    r'estaRecibida': PropertySchema(
      id: 10,
      name: r'estaRecibida',
      type: IsarType.bool,
    ),
    r'estado': PropertySchema(
      id: 11,
      name: r'estado',
      type: IsarType.string,
    ),
    r'estadoFormateado': PropertySchema(
      id: 12,
      name: r'estadoFormateado',
      type: IsarType.string,
    ),
    r'estadoFormateadoCompleto': PropertySchema(
      id: 13,
      name: r'estadoFormateadoCompleto',
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
    r'fechaDevolucion': PropertySchema(
      id: 17,
      name: r'fechaDevolucion',
      type: IsarType.dateTime,
    ),
    r'fechaRecepcion': PropertySchema(
      id: 18,
      name: r'fechaRecepcion',
      type: IsarType.dateTime,
    ),
    r'metodoPago': PropertySchema(
      id: 19,
      name: r'metodoPago',
      type: IsarType.string,
    ),
    r'metodoPagoFormateado': PropertySchema(
      id: 20,
      name: r'metodoPagoFormateado',
      type: IsarType.string,
    ),
    r'montoPagado': PropertySchema(
      id: 21,
      name: r'montoPagado',
      type: IsarType.double,
    ),
    r'motivoDevolucion': PropertySchema(
      id: 22,
      name: r'motivoDevolucion',
      type: IsarType.string,
    ),
    r'numeroDocumento': PropertySchema(
      id: 23,
      name: r'numeroDocumento',
      type: IsarType.string,
    ),
    r'numeroFactura': PropertySchema(
      id: 24,
      name: r'numeroFactura',
      type: IsarType.string,
    ),
    r'numeroGuia': PropertySchema(
      id: 25,
      name: r'numeroGuia',
      type: IsarType.string,
    ),
    r'numeroOrden': PropertySchema(
      id: 26,
      name: r'numeroOrden',
      type: IsarType.string,
    ),
    r'numeroRemito': PropertySchema(
      id: 27,
      name: r'numeroRemito',
      type: IsarType.string,
    ),
    r'observaciones': PropertySchema(
      id: 28,
      name: r'observaciones',
      type: IsarType.string,
    ),
    r'plazoEntrega': PropertySchema(
      id: 29,
      name: r'plazoEntrega',
      type: IsarType.string,
    ),
    r'prioridad': PropertySchema(
      id: 30,
      name: r'prioridad',
      type: IsarType.string,
    ),
    r'productos': PropertySchema(
      id: 31,
      name: r'productos',
      type: IsarType.objectList,
      target: r'CompraProducto',
    ),
    r'proveedorId': PropertySchema(
      id: 32,
      name: r'proveedorId',
      type: IsarType.long,
    ),
    r'puedeDevolver': PropertySchema(
      id: 33,
      name: r'puedeDevolver',
      type: IsarType.bool,
    ),
    r'referenciaProveedor': PropertySchema(
      id: 34,
      name: r'referenciaProveedor',
      type: IsarType.string,
    ),
    r'saldoPendiente': PropertySchema(
      id: 35,
      name: r'saldoPendiente',
      type: IsarType.double,
    ),
    r'telefonoProveedor': PropertySchema(
      id: 36,
      name: r'telefonoProveedor',
      type: IsarType.string,
    ),
    r'tipoDocumento': PropertySchema(
      id: 37,
      name: r'tipoDocumento',
      type: IsarType.string,
    ),
    r'total': PropertySchema(
      id: 38,
      name: r'total',
      type: IsarType.double,
    ),
    r'totalConSigno': PropertySchema(
      id: 39,
      name: r'totalConSigno',
      type: IsarType.string,
    ),
    r'usuarioDevolucion': PropertySchema(
      id: 40,
      name: r'usuarioDevolucion',
      type: IsarType.long,
    ),
    r'usuarioId': PropertySchema(
      id: 41,
      name: r'usuarioId',
      type: IsarType.long,
    )
  },
  estimateSize: _compraEstimateSize,
  serialize: _compraSerialize,
  deserialize: _compraDeserialize,
  deserializeProp: _compraDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {r'CompraProducto': CompraProductoSchema},
  getId: _compraGetId,
  getLinks: _compraGetLinks,
  attach: _compraAttach,
  version: '3.1.0+1',
);

int _compraEstimateSize(
  Compra object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.colorEstado.length * 3;
  {
    final value = object.condicionesPago;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.contactoProveedor;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.direccionEntrega;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.emailProveedor;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.estado.length * 3;
  bytesCount += 3 + object.estadoFormateado.length * 3;
  bytesCount += 3 + object.estadoFormateadoCompleto.length * 3;
  bytesCount += 3 + object.metodoPago.length * 3;
  bytesCount += 3 + object.metodoPagoFormateado.length * 3;
  {
    final value = object.motivoDevolucion;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.numeroDocumento.length * 3;
  bytesCount += 3 + object.numeroFactura.length * 3;
  {
    final value = object.numeroGuia;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.numeroOrden;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.numeroRemito;
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
  {
    final value = object.plazoEntrega;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.prioridad;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.productos.length * 3;
  {
    final offsets = allOffsets[CompraProducto]!;
    for (var i = 0; i < object.productos.length; i++) {
      final value = object.productos[i];
      bytesCount +=
          CompraProductoSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  {
    final value = object.referenciaProveedor;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.telefonoProveedor;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.tipoDocumento.length * 3;
  bytesCount += 3 + object.totalConSigno.length * 3;
  return bytesCount;
}

void _compraSerialize(
  Compra object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.colorEstado);
  writer.writeLong(offsets[1], object.compraOriginalId);
  writer.writeString(offsets[2], object.condicionesPago);
  writer.writeString(offsets[3], object.contactoProveedor);
  writer.writeString(offsets[4], object.direccionEntrega);
  writer.writeString(offsets[5], object.emailProveedor);
  writer.writeBool(offsets[6], object.esDevolucion);
  writer.writeBool(offsets[7], object.esDevolucionValida);
  writer.writeBool(offsets[8], object.esUrgente);
  writer.writeBool(offsets[9], object.estaPagada);
  writer.writeBool(offsets[10], object.estaRecibida);
  writer.writeString(offsets[11], object.estado);
  writer.writeString(offsets[12], object.estadoFormateado);
  writer.writeString(offsets[13], object.estadoFormateadoCompleto);
  writer.writeDateTime(offsets[14], object.fecha);
  writer.writeDateTime(offsets[15], object.fechaActualizacion);
  writer.writeDateTime(offsets[16], object.fechaCreacion);
  writer.writeDateTime(offsets[17], object.fechaDevolucion);
  writer.writeDateTime(offsets[18], object.fechaRecepcion);
  writer.writeString(offsets[19], object.metodoPago);
  writer.writeString(offsets[20], object.metodoPagoFormateado);
  writer.writeDouble(offsets[21], object.montoPagado);
  writer.writeString(offsets[22], object.motivoDevolucion);
  writer.writeString(offsets[23], object.numeroDocumento);
  writer.writeString(offsets[24], object.numeroFactura);
  writer.writeString(offsets[25], object.numeroGuia);
  writer.writeString(offsets[26], object.numeroOrden);
  writer.writeString(offsets[27], object.numeroRemito);
  writer.writeString(offsets[28], object.observaciones);
  writer.writeString(offsets[29], object.plazoEntrega);
  writer.writeString(offsets[30], object.prioridad);
  writer.writeObjectList<CompraProducto>(
    offsets[31],
    allOffsets,
    CompraProductoSchema.serialize,
    object.productos,
  );
  writer.writeLong(offsets[32], object.proveedorId);
  writer.writeBool(offsets[33], object.puedeDevolver);
  writer.writeString(offsets[34], object.referenciaProveedor);
  writer.writeDouble(offsets[35], object.saldoPendiente);
  writer.writeString(offsets[36], object.telefonoProveedor);
  writer.writeString(offsets[37], object.tipoDocumento);
  writer.writeDouble(offsets[38], object.total);
  writer.writeString(offsets[39], object.totalConSigno);
  writer.writeLong(offsets[40], object.usuarioDevolucion);
  writer.writeLong(offsets[41], object.usuarioId);
}

Compra _compraDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Compra(
    compraOriginalId: reader.readLongOrNull(offsets[1]),
    condicionesPago: reader.readStringOrNull(offsets[2]),
    contactoProveedor: reader.readStringOrNull(offsets[3]),
    direccionEntrega: reader.readStringOrNull(offsets[4]),
    emailProveedor: reader.readStringOrNull(offsets[5]),
    esDevolucion: reader.readBoolOrNull(offsets[6]) ?? false,
    esUrgente: reader.readBoolOrNull(offsets[8]) ?? false,
    estado: reader.readStringOrNull(offsets[11]) ?? 'pendiente',
    fecha: reader.readDateTime(offsets[14]),
    fechaDevolucion: reader.readDateTimeOrNull(offsets[17]),
    metodoPago: reader.readStringOrNull(offsets[19]) ?? 'efectivo',
    montoPagado: reader.readDoubleOrNull(offsets[21]) ?? 0.0,
    motivoDevolucion: reader.readStringOrNull(offsets[22]),
    numeroFactura: reader.readString(offsets[24]),
    numeroGuia: reader.readStringOrNull(offsets[25]),
    numeroOrden: reader.readStringOrNull(offsets[26]),
    numeroRemito: reader.readStringOrNull(offsets[27]),
    observaciones: reader.readStringOrNull(offsets[28]),
    plazoEntrega: reader.readStringOrNull(offsets[29]),
    prioridad: reader.readStringOrNull(offsets[30]),
    proveedorId: reader.readLongOrNull(offsets[32]),
    referenciaProveedor: reader.readStringOrNull(offsets[34]),
    saldoPendiente: reader.readDoubleOrNull(offsets[35]) ?? 0.0,
    telefonoProveedor: reader.readStringOrNull(offsets[36]),
    total: reader.readDouble(offsets[38]),
    usuarioDevolucion: reader.readLongOrNull(offsets[40]),
    usuarioId: reader.readLongOrNull(offsets[41]) ?? 1,
  );
  object.fechaActualizacion = reader.readDateTimeOrNull(offsets[15]);
  object.fechaCreacion = reader.readDateTime(offsets[16]);
  object.fechaRecepcion = reader.readDateTimeOrNull(offsets[18]);
  object.id = id;
  object.productos = reader.readObjectList<CompraProducto>(
        offsets[31],
        CompraProductoSchema.deserialize,
        allOffsets,
        CompraProducto(),
      ) ??
      [];
  return object;
}

P _compraDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 7:
      return (reader.readBool(offset)) as P;
    case 8:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 9:
      return (reader.readBool(offset)) as P;
    case 10:
      return (reader.readBool(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset) ?? 'pendiente') as P;
    case 12:
      return (reader.readString(offset)) as P;
    case 13:
      return (reader.readString(offset)) as P;
    case 14:
      return (reader.readDateTime(offset)) as P;
    case 15:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 16:
      return (reader.readDateTime(offset)) as P;
    case 17:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 18:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 19:
      return (reader.readStringOrNull(offset) ?? 'efectivo') as P;
    case 20:
      return (reader.readString(offset)) as P;
    case 21:
      return (reader.readDoubleOrNull(offset) ?? 0.0) as P;
    case 22:
      return (reader.readStringOrNull(offset)) as P;
    case 23:
      return (reader.readString(offset)) as P;
    case 24:
      return (reader.readString(offset)) as P;
    case 25:
      return (reader.readStringOrNull(offset)) as P;
    case 26:
      return (reader.readStringOrNull(offset)) as P;
    case 27:
      return (reader.readStringOrNull(offset)) as P;
    case 28:
      return (reader.readStringOrNull(offset)) as P;
    case 29:
      return (reader.readStringOrNull(offset)) as P;
    case 30:
      return (reader.readStringOrNull(offset)) as P;
    case 31:
      return (reader.readObjectList<CompraProducto>(
            offset,
            CompraProductoSchema.deserialize,
            allOffsets,
            CompraProducto(),
          ) ??
          []) as P;
    case 32:
      return (reader.readLongOrNull(offset)) as P;
    case 33:
      return (reader.readBool(offset)) as P;
    case 34:
      return (reader.readStringOrNull(offset)) as P;
    case 35:
      return (reader.readDoubleOrNull(offset) ?? 0.0) as P;
    case 36:
      return (reader.readStringOrNull(offset)) as P;
    case 37:
      return (reader.readString(offset)) as P;
    case 38:
      return (reader.readDouble(offset)) as P;
    case 39:
      return (reader.readString(offset)) as P;
    case 40:
      return (reader.readLongOrNull(offset)) as P;
    case 41:
      return (reader.readLongOrNull(offset) ?? 1) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _compraGetId(Compra object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _compraGetLinks(Compra object) {
  return [];
}

void _compraAttach(IsarCollection<dynamic> col, Id id, Compra object) {
  object.id = id;
}

extension CompraQueryWhereSort on QueryBuilder<Compra, Compra, QWhere> {
  QueryBuilder<Compra, Compra, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CompraQueryWhere on QueryBuilder<Compra, Compra, QWhereClause> {
  QueryBuilder<Compra, Compra, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Compra, Compra, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Compra, Compra, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Compra, Compra, QAfterWhereClause> idBetween(
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

extension CompraQueryFilter on QueryBuilder<Compra, Compra, QFilterCondition> {
  QueryBuilder<Compra, Compra, QAfterFilterCondition> colorEstadoEqualTo(
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

  QueryBuilder<Compra, Compra, QAfterFilterCondition> colorEstadoGreaterThan(
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

  QueryBuilder<Compra, Compra, QAfterFilterCondition> colorEstadoLessThan(
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

  QueryBuilder<Compra, Compra, QAfterFilterCondition> colorEstadoBetween(
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

  QueryBuilder<Compra, Compra, QAfterFilterCondition> colorEstadoStartsWith(
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

  QueryBuilder<Compra, Compra, QAfterFilterCondition> colorEstadoEndsWith(
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

  QueryBuilder<Compra, Compra, QAfterFilterCondition> colorEstadoContains(
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

  QueryBuilder<Compra, Compra, QAfterFilterCondition> colorEstadoMatches(
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

  QueryBuilder<Compra, Compra, QAfterFilterCondition> colorEstadoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'colorEstado',
        value: '',
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> colorEstadoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'colorEstado',
        value: '',
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> compraOriginalIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'compraOriginalId',
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition>
      compraOriginalIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'compraOriginalId',
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> compraOriginalIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'compraOriginalId',
        value: value,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition>
      compraOriginalIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'compraOriginalId',
        value: value,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> compraOriginalIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'compraOriginalId',
        value: value,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> compraOriginalIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'compraOriginalId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> condicionesPagoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'condicionesPago',
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition>
      condicionesPagoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'condicionesPago',
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> condicionesPagoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'condicionesPago',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition>
      condicionesPagoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'condicionesPago',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> condicionesPagoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'condicionesPago',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> condicionesPagoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'condicionesPago',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> condicionesPagoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'condicionesPago',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> condicionesPagoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'condicionesPago',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> condicionesPagoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'condicionesPago',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> condicionesPagoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'condicionesPago',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> condicionesPagoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'condicionesPago',
        value: '',
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition>
      condicionesPagoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'condicionesPago',
        value: '',
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition>
      contactoProveedorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'contactoProveedor',
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition>
      contactoProveedorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'contactoProveedor',
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> contactoProveedorEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'contactoProveedor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition>
      contactoProveedorGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'contactoProveedor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> contactoProveedorLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'contactoProveedor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> contactoProveedorBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'contactoProveedor',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition>
      contactoProveedorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'contactoProveedor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> contactoProveedorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'contactoProveedor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> contactoProveedorContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'contactoProveedor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> contactoProveedorMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'contactoProveedor',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition>
      contactoProveedorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'contactoProveedor',
        value: '',
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition>
      contactoProveedorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'contactoProveedor',
        value: '',
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> direccionEntregaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'direccionEntrega',
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition>
      direccionEntregaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'direccionEntrega',
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> direccionEntregaEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'direccionEntrega',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition>
      direccionEntregaGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'direccionEntrega',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> direccionEntregaLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'direccionEntrega',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> direccionEntregaBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'direccionEntrega',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition>
      direccionEntregaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'direccionEntrega',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> direccionEntregaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'direccionEntrega',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> direccionEntregaContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'direccionEntrega',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> direccionEntregaMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'direccionEntrega',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition>
      direccionEntregaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'direccionEntrega',
        value: '',
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition>
      direccionEntregaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'direccionEntrega',
        value: '',
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> emailProveedorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'emailProveedor',
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition>
      emailProveedorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'emailProveedor',
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> emailProveedorEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'emailProveedor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> emailProveedorGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'emailProveedor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> emailProveedorLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'emailProveedor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> emailProveedorBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'emailProveedor',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> emailProveedorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'emailProveedor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> emailProveedorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'emailProveedor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> emailProveedorContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'emailProveedor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> emailProveedorMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'emailProveedor',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> emailProveedorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'emailProveedor',
        value: '',
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition>
      emailProveedorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'emailProveedor',
        value: '',
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> esDevolucionEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'esDevolucion',
        value: value,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> esDevolucionValidaEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'esDevolucionValida',
        value: value,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> esUrgenteEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'esUrgente',
        value: value,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> estaPagadaEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estaPagada',
        value: value,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> estaRecibidaEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estaRecibida',
        value: value,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> estadoEqualTo(
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

  QueryBuilder<Compra, Compra, QAfterFilterCondition> estadoGreaterThan(
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

  QueryBuilder<Compra, Compra, QAfterFilterCondition> estadoLessThan(
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

  QueryBuilder<Compra, Compra, QAfterFilterCondition> estadoBetween(
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

  QueryBuilder<Compra, Compra, QAfterFilterCondition> estadoStartsWith(
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

  QueryBuilder<Compra, Compra, QAfterFilterCondition> estadoEndsWith(
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

  QueryBuilder<Compra, Compra, QAfterFilterCondition> estadoContains(
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

  QueryBuilder<Compra, Compra, QAfterFilterCondition> estadoMatches(
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

  QueryBuilder<Compra, Compra, QAfterFilterCondition> estadoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estado',
        value: '',
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> estadoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'estado',
        value: '',
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> estadoFormateadoEqualTo(
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

  QueryBuilder<Compra, Compra, QAfterFilterCondition>
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

  QueryBuilder<Compra, Compra, QAfterFilterCondition> estadoFormateadoLessThan(
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

  QueryBuilder<Compra, Compra, QAfterFilterCondition> estadoFormateadoBetween(
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

  QueryBuilder<Compra, Compra, QAfterFilterCondition>
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

  QueryBuilder<Compra, Compra, QAfterFilterCondition> estadoFormateadoEndsWith(
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

  QueryBuilder<Compra, Compra, QAfterFilterCondition> estadoFormateadoContains(
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

  QueryBuilder<Compra, Compra, QAfterFilterCondition> estadoFormateadoMatches(
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

  QueryBuilder<Compra, Compra, QAfterFilterCondition>
      estadoFormateadoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estadoFormateado',
        value: '',
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition>
      estadoFormateadoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'estadoFormateado',
        value: '',
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition>
      estadoFormateadoCompletoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estadoFormateadoCompleto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition>
      estadoFormateadoCompletoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'estadoFormateadoCompleto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition>
      estadoFormateadoCompletoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'estadoFormateadoCompleto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition>
      estadoFormateadoCompletoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'estadoFormateadoCompleto',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition>
      estadoFormateadoCompletoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'estadoFormateadoCompleto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition>
      estadoFormateadoCompletoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'estadoFormateadoCompleto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition>
      estadoFormateadoCompletoContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'estadoFormateadoCompleto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition>
      estadoFormateadoCompletoMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'estadoFormateadoCompleto',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition>
      estadoFormateadoCompletoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estadoFormateadoCompleto',
        value: '',
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition>
      estadoFormateadoCompletoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'estadoFormateadoCompleto',
        value: '',
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> fechaEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fecha',
        value: value,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> fechaGreaterThan(
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

  QueryBuilder<Compra, Compra, QAfterFilterCondition> fechaLessThan(
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

  QueryBuilder<Compra, Compra, QAfterFilterCondition> fechaBetween(
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

  QueryBuilder<Compra, Compra, QAfterFilterCondition>
      fechaActualizacionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fechaActualizacion',
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition>
      fechaActualizacionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fechaActualizacion',
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> fechaActualizacionEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaActualizacion',
        value: value,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition>
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

  QueryBuilder<Compra, Compra, QAfterFilterCondition>
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

  QueryBuilder<Compra, Compra, QAfterFilterCondition> fechaActualizacionBetween(
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

  QueryBuilder<Compra, Compra, QAfterFilterCondition> fechaCreacionEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaCreacion',
        value: value,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> fechaCreacionGreaterThan(
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

  QueryBuilder<Compra, Compra, QAfterFilterCondition> fechaCreacionLessThan(
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

  QueryBuilder<Compra, Compra, QAfterFilterCondition> fechaCreacionBetween(
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

  QueryBuilder<Compra, Compra, QAfterFilterCondition> fechaDevolucionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fechaDevolucion',
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition>
      fechaDevolucionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fechaDevolucion',
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> fechaDevolucionEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaDevolucion',
        value: value,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition>
      fechaDevolucionGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fechaDevolucion',
        value: value,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> fechaDevolucionLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fechaDevolucion',
        value: value,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> fechaDevolucionBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fechaDevolucion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> fechaRecepcionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fechaRecepcion',
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition>
      fechaRecepcionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fechaRecepcion',
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> fechaRecepcionEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaRecepcion',
        value: value,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> fechaRecepcionGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fechaRecepcion',
        value: value,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> fechaRecepcionLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fechaRecepcion',
        value: value,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> fechaRecepcionBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fechaRecepcion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Compra, Compra, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Compra, Compra, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Compra, Compra, QAfterFilterCondition> metodoPagoEqualTo(
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

  QueryBuilder<Compra, Compra, QAfterFilterCondition> metodoPagoGreaterThan(
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

  QueryBuilder<Compra, Compra, QAfterFilterCondition> metodoPagoLessThan(
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

  QueryBuilder<Compra, Compra, QAfterFilterCondition> metodoPagoBetween(
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

  QueryBuilder<Compra, Compra, QAfterFilterCondition> metodoPagoStartsWith(
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

  QueryBuilder<Compra, Compra, QAfterFilterCondition> metodoPagoEndsWith(
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

  QueryBuilder<Compra, Compra, QAfterFilterCondition> metodoPagoContains(
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

  QueryBuilder<Compra, Compra, QAfterFilterCondition> metodoPagoMatches(
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

  QueryBuilder<Compra, Compra, QAfterFilterCondition> metodoPagoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'metodoPago',
        value: '',
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> metodoPagoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'metodoPago',
        value: '',
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition>
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

  QueryBuilder<Compra, Compra, QAfterFilterCondition>
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

  QueryBuilder<Compra, Compra, QAfterFilterCondition>
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

  QueryBuilder<Compra, Compra, QAfterFilterCondition>
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

  QueryBuilder<Compra, Compra, QAfterFilterCondition>
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

  QueryBuilder<Compra, Compra, QAfterFilterCondition>
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

  QueryBuilder<Compra, Compra, QAfterFilterCondition>
      metodoPagoFormateadoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'metodoPagoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition>
      metodoPagoFormateadoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'metodoPagoFormateado',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition>
      metodoPagoFormateadoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'metodoPagoFormateado',
        value: '',
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition>
      metodoPagoFormateadoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'metodoPagoFormateado',
        value: '',
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> montoPagadoEqualTo(
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

  QueryBuilder<Compra, Compra, QAfterFilterCondition> montoPagadoGreaterThan(
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

  QueryBuilder<Compra, Compra, QAfterFilterCondition> montoPagadoLessThan(
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

  QueryBuilder<Compra, Compra, QAfterFilterCondition> montoPagadoBetween(
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

  QueryBuilder<Compra, Compra, QAfterFilterCondition> motivoDevolucionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'motivoDevolucion',
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition>
      motivoDevolucionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'motivoDevolucion',
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> motivoDevolucionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'motivoDevolucion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition>
      motivoDevolucionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'motivoDevolucion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> motivoDevolucionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'motivoDevolucion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> motivoDevolucionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'motivoDevolucion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition>
      motivoDevolucionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'motivoDevolucion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> motivoDevolucionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'motivoDevolucion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> motivoDevolucionContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'motivoDevolucion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> motivoDevolucionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'motivoDevolucion',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition>
      motivoDevolucionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'motivoDevolucion',
        value: '',
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition>
      motivoDevolucionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'motivoDevolucion',
        value: '',
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> numeroDocumentoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'numeroDocumento',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition>
      numeroDocumentoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'numeroDocumento',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> numeroDocumentoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'numeroDocumento',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> numeroDocumentoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'numeroDocumento',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> numeroDocumentoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'numeroDocumento',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> numeroDocumentoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'numeroDocumento',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> numeroDocumentoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'numeroDocumento',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> numeroDocumentoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'numeroDocumento',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> numeroDocumentoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'numeroDocumento',
        value: '',
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition>
      numeroDocumentoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'numeroDocumento',
        value: '',
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> numeroFacturaEqualTo(
    String value, {
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

  QueryBuilder<Compra, Compra, QAfterFilterCondition> numeroFacturaGreaterThan(
    String value, {
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

  QueryBuilder<Compra, Compra, QAfterFilterCondition> numeroFacturaLessThan(
    String value, {
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

  QueryBuilder<Compra, Compra, QAfterFilterCondition> numeroFacturaBetween(
    String lower,
    String upper, {
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

  QueryBuilder<Compra, Compra, QAfterFilterCondition> numeroFacturaStartsWith(
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

  QueryBuilder<Compra, Compra, QAfterFilterCondition> numeroFacturaEndsWith(
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

  QueryBuilder<Compra, Compra, QAfterFilterCondition> numeroFacturaContains(
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

  QueryBuilder<Compra, Compra, QAfterFilterCondition> numeroFacturaMatches(
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

  QueryBuilder<Compra, Compra, QAfterFilterCondition> numeroFacturaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'numeroFactura',
        value: '',
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition>
      numeroFacturaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'numeroFactura',
        value: '',
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> numeroGuiaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'numeroGuia',
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> numeroGuiaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'numeroGuia',
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> numeroGuiaEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'numeroGuia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> numeroGuiaGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'numeroGuia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> numeroGuiaLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'numeroGuia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> numeroGuiaBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'numeroGuia',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> numeroGuiaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'numeroGuia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> numeroGuiaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'numeroGuia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> numeroGuiaContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'numeroGuia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> numeroGuiaMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'numeroGuia',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> numeroGuiaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'numeroGuia',
        value: '',
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> numeroGuiaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'numeroGuia',
        value: '',
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> numeroOrdenIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'numeroOrden',
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> numeroOrdenIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'numeroOrden',
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> numeroOrdenEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'numeroOrden',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> numeroOrdenGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'numeroOrden',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> numeroOrdenLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'numeroOrden',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> numeroOrdenBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'numeroOrden',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> numeroOrdenStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'numeroOrden',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> numeroOrdenEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'numeroOrden',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> numeroOrdenContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'numeroOrden',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> numeroOrdenMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'numeroOrden',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> numeroOrdenIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'numeroOrden',
        value: '',
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> numeroOrdenIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'numeroOrden',
        value: '',
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> numeroRemitoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'numeroRemito',
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> numeroRemitoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'numeroRemito',
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> numeroRemitoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'numeroRemito',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> numeroRemitoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'numeroRemito',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> numeroRemitoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'numeroRemito',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> numeroRemitoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'numeroRemito',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> numeroRemitoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'numeroRemito',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> numeroRemitoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'numeroRemito',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> numeroRemitoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'numeroRemito',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> numeroRemitoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'numeroRemito',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> numeroRemitoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'numeroRemito',
        value: '',
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> numeroRemitoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'numeroRemito',
        value: '',
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> observacionesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'observaciones',
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> observacionesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'observaciones',
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> observacionesEqualTo(
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

  QueryBuilder<Compra, Compra, QAfterFilterCondition> observacionesGreaterThan(
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

  QueryBuilder<Compra, Compra, QAfterFilterCondition> observacionesLessThan(
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

  QueryBuilder<Compra, Compra, QAfterFilterCondition> observacionesBetween(
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

  QueryBuilder<Compra, Compra, QAfterFilterCondition> observacionesStartsWith(
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

  QueryBuilder<Compra, Compra, QAfterFilterCondition> observacionesEndsWith(
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

  QueryBuilder<Compra, Compra, QAfterFilterCondition> observacionesContains(
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

  QueryBuilder<Compra, Compra, QAfterFilterCondition> observacionesMatches(
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

  QueryBuilder<Compra, Compra, QAfterFilterCondition> observacionesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'observaciones',
        value: '',
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition>
      observacionesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'observaciones',
        value: '',
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> plazoEntregaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'plazoEntrega',
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> plazoEntregaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'plazoEntrega',
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> plazoEntregaEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'plazoEntrega',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> plazoEntregaGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'plazoEntrega',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> plazoEntregaLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'plazoEntrega',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> plazoEntregaBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'plazoEntrega',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> plazoEntregaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'plazoEntrega',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> plazoEntregaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'plazoEntrega',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> plazoEntregaContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'plazoEntrega',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> plazoEntregaMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'plazoEntrega',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> plazoEntregaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'plazoEntrega',
        value: '',
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> plazoEntregaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'plazoEntrega',
        value: '',
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> prioridadIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'prioridad',
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> prioridadIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'prioridad',
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> prioridadEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'prioridad',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> prioridadGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'prioridad',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> prioridadLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'prioridad',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> prioridadBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'prioridad',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> prioridadStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'prioridad',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> prioridadEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'prioridad',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> prioridadContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'prioridad',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> prioridadMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'prioridad',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> prioridadIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'prioridad',
        value: '',
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> prioridadIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'prioridad',
        value: '',
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> productosLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'productos',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> productosIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'productos',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> productosIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'productos',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> productosLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'productos',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition>
      productosLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'productos',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> productosLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'productos',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> proveedorIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'proveedorId',
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> proveedorIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'proveedorId',
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> proveedorIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'proveedorId',
        value: value,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> proveedorIdGreaterThan(
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

  QueryBuilder<Compra, Compra, QAfterFilterCondition> proveedorIdLessThan(
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

  QueryBuilder<Compra, Compra, QAfterFilterCondition> proveedorIdBetween(
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

  QueryBuilder<Compra, Compra, QAfterFilterCondition> puedeDevolverEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'puedeDevolver',
        value: value,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition>
      referenciaProveedorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'referenciaProveedor',
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition>
      referenciaProveedorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'referenciaProveedor',
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition>
      referenciaProveedorEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'referenciaProveedor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition>
      referenciaProveedorGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'referenciaProveedor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition>
      referenciaProveedorLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'referenciaProveedor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition>
      referenciaProveedorBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'referenciaProveedor',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition>
      referenciaProveedorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'referenciaProveedor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition>
      referenciaProveedorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'referenciaProveedor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition>
      referenciaProveedorContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'referenciaProveedor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition>
      referenciaProveedorMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'referenciaProveedor',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition>
      referenciaProveedorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'referenciaProveedor',
        value: '',
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition>
      referenciaProveedorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'referenciaProveedor',
        value: '',
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> saldoPendienteEqualTo(
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

  QueryBuilder<Compra, Compra, QAfterFilterCondition> saldoPendienteGreaterThan(
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

  QueryBuilder<Compra, Compra, QAfterFilterCondition> saldoPendienteLessThan(
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

  QueryBuilder<Compra, Compra, QAfterFilterCondition> saldoPendienteBetween(
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

  QueryBuilder<Compra, Compra, QAfterFilterCondition>
      telefonoProveedorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'telefonoProveedor',
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition>
      telefonoProveedorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'telefonoProveedor',
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> telefonoProveedorEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'telefonoProveedor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition>
      telefonoProveedorGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'telefonoProveedor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> telefonoProveedorLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'telefonoProveedor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> telefonoProveedorBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'telefonoProveedor',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition>
      telefonoProveedorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'telefonoProveedor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> telefonoProveedorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'telefonoProveedor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> telefonoProveedorContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'telefonoProveedor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> telefonoProveedorMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'telefonoProveedor',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition>
      telefonoProveedorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'telefonoProveedor',
        value: '',
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition>
      telefonoProveedorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'telefonoProveedor',
        value: '',
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> tipoDocumentoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tipoDocumento',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> tipoDocumentoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tipoDocumento',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> tipoDocumentoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tipoDocumento',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> tipoDocumentoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tipoDocumento',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> tipoDocumentoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tipoDocumento',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> tipoDocumentoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tipoDocumento',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> tipoDocumentoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tipoDocumento',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> tipoDocumentoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tipoDocumento',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> tipoDocumentoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tipoDocumento',
        value: '',
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition>
      tipoDocumentoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tipoDocumento',
        value: '',
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> totalEqualTo(
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

  QueryBuilder<Compra, Compra, QAfterFilterCondition> totalGreaterThan(
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

  QueryBuilder<Compra, Compra, QAfterFilterCondition> totalLessThan(
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

  QueryBuilder<Compra, Compra, QAfterFilterCondition> totalBetween(
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

  QueryBuilder<Compra, Compra, QAfterFilterCondition> totalConSignoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalConSigno',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> totalConSignoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalConSigno',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> totalConSignoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalConSigno',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> totalConSignoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalConSigno',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> totalConSignoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'totalConSigno',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> totalConSignoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'totalConSigno',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> totalConSignoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'totalConSigno',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> totalConSignoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'totalConSigno',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> totalConSignoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalConSigno',
        value: '',
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition>
      totalConSignoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'totalConSigno',
        value: '',
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition>
      usuarioDevolucionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'usuarioDevolucion',
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition>
      usuarioDevolucionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'usuarioDevolucion',
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> usuarioDevolucionEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'usuarioDevolucion',
        value: value,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition>
      usuarioDevolucionGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'usuarioDevolucion',
        value: value,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> usuarioDevolucionLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'usuarioDevolucion',
        value: value,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> usuarioDevolucionBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'usuarioDevolucion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> usuarioIdEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'usuarioId',
        value: value,
      ));
    });
  }

  QueryBuilder<Compra, Compra, QAfterFilterCondition> usuarioIdGreaterThan(
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

  QueryBuilder<Compra, Compra, QAfterFilterCondition> usuarioIdLessThan(
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

  QueryBuilder<Compra, Compra, QAfterFilterCondition> usuarioIdBetween(
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

extension CompraQueryObject on QueryBuilder<Compra, Compra, QFilterCondition> {
  QueryBuilder<Compra, Compra, QAfterFilterCondition> productosElement(
      FilterQuery<CompraProducto> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'productos');
    });
  }
}

extension CompraQueryLinks on QueryBuilder<Compra, Compra, QFilterCondition> {}

extension CompraQuerySortBy on QueryBuilder<Compra, Compra, QSortBy> {
  QueryBuilder<Compra, Compra, QAfterSortBy> sortByColorEstado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorEstado', Sort.asc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> sortByColorEstadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorEstado', Sort.desc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> sortByCompraOriginalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'compraOriginalId', Sort.asc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> sortByCompraOriginalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'compraOriginalId', Sort.desc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> sortByCondicionesPago() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'condicionesPago', Sort.asc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> sortByCondicionesPagoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'condicionesPago', Sort.desc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> sortByContactoProveedor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactoProveedor', Sort.asc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> sortByContactoProveedorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactoProveedor', Sort.desc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> sortByDireccionEntrega() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'direccionEntrega', Sort.asc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> sortByDireccionEntregaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'direccionEntrega', Sort.desc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> sortByEmailProveedor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emailProveedor', Sort.asc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> sortByEmailProveedorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emailProveedor', Sort.desc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> sortByEsDevolucion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esDevolucion', Sort.asc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> sortByEsDevolucionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esDevolucion', Sort.desc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> sortByEsDevolucionValida() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esDevolucionValida', Sort.asc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> sortByEsDevolucionValidaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esDevolucionValida', Sort.desc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> sortByEsUrgente() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esUrgente', Sort.asc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> sortByEsUrgenteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esUrgente', Sort.desc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> sortByEstaPagada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estaPagada', Sort.asc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> sortByEstaPagadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estaPagada', Sort.desc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> sortByEstaRecibida() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estaRecibida', Sort.asc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> sortByEstaRecibidaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estaRecibida', Sort.desc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> sortByEstado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.asc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> sortByEstadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.desc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> sortByEstadoFormateado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estadoFormateado', Sort.asc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> sortByEstadoFormateadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estadoFormateado', Sort.desc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> sortByEstadoFormateadoCompleto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estadoFormateadoCompleto', Sort.asc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy>
      sortByEstadoFormateadoCompletoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estadoFormateadoCompleto', Sort.desc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> sortByFecha() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fecha', Sort.asc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> sortByFechaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fecha', Sort.desc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> sortByFechaActualizacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaActualizacion', Sort.asc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> sortByFechaActualizacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaActualizacion', Sort.desc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> sortByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.asc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> sortByFechaCreacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.desc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> sortByFechaDevolucion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaDevolucion', Sort.asc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> sortByFechaDevolucionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaDevolucion', Sort.desc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> sortByFechaRecepcion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaRecepcion', Sort.asc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> sortByFechaRecepcionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaRecepcion', Sort.desc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> sortByMetodoPago() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'metodoPago', Sort.asc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> sortByMetodoPagoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'metodoPago', Sort.desc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> sortByMetodoPagoFormateado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'metodoPagoFormateado', Sort.asc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> sortByMetodoPagoFormateadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'metodoPagoFormateado', Sort.desc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> sortByMontoPagado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoPagado', Sort.asc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> sortByMontoPagadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoPagado', Sort.desc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> sortByMotivoDevolucion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'motivoDevolucion', Sort.asc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> sortByMotivoDevolucionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'motivoDevolucion', Sort.desc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> sortByNumeroDocumento() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroDocumento', Sort.asc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> sortByNumeroDocumentoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroDocumento', Sort.desc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> sortByNumeroFactura() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroFactura', Sort.asc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> sortByNumeroFacturaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroFactura', Sort.desc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> sortByNumeroGuia() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroGuia', Sort.asc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> sortByNumeroGuiaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroGuia', Sort.desc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> sortByNumeroOrden() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroOrden', Sort.asc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> sortByNumeroOrdenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroOrden', Sort.desc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> sortByNumeroRemito() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroRemito', Sort.asc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> sortByNumeroRemitoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroRemito', Sort.desc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> sortByObservaciones() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observaciones', Sort.asc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> sortByObservacionesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observaciones', Sort.desc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> sortByPlazoEntrega() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plazoEntrega', Sort.asc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> sortByPlazoEntregaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plazoEntrega', Sort.desc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> sortByPrioridad() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prioridad', Sort.asc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> sortByPrioridadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prioridad', Sort.desc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> sortByProveedorId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proveedorId', Sort.asc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> sortByProveedorIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proveedorId', Sort.desc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> sortByPuedeDevolver() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'puedeDevolver', Sort.asc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> sortByPuedeDevolverDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'puedeDevolver', Sort.desc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> sortByReferenciaProveedor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'referenciaProveedor', Sort.asc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> sortByReferenciaProveedorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'referenciaProveedor', Sort.desc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> sortBySaldoPendiente() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saldoPendiente', Sort.asc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> sortBySaldoPendienteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saldoPendiente', Sort.desc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> sortByTelefonoProveedor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'telefonoProveedor', Sort.asc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> sortByTelefonoProveedorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'telefonoProveedor', Sort.desc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> sortByTipoDocumento() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipoDocumento', Sort.asc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> sortByTipoDocumentoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipoDocumento', Sort.desc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> sortByTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.asc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> sortByTotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.desc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> sortByTotalConSigno() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalConSigno', Sort.asc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> sortByTotalConSignoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalConSigno', Sort.desc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> sortByUsuarioDevolucion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usuarioDevolucion', Sort.asc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> sortByUsuarioDevolucionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usuarioDevolucion', Sort.desc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> sortByUsuarioId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usuarioId', Sort.asc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> sortByUsuarioIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usuarioId', Sort.desc);
    });
  }
}

extension CompraQuerySortThenBy on QueryBuilder<Compra, Compra, QSortThenBy> {
  QueryBuilder<Compra, Compra, QAfterSortBy> thenByColorEstado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorEstado', Sort.asc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> thenByColorEstadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorEstado', Sort.desc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> thenByCompraOriginalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'compraOriginalId', Sort.asc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> thenByCompraOriginalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'compraOriginalId', Sort.desc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> thenByCondicionesPago() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'condicionesPago', Sort.asc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> thenByCondicionesPagoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'condicionesPago', Sort.desc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> thenByContactoProveedor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactoProveedor', Sort.asc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> thenByContactoProveedorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactoProveedor', Sort.desc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> thenByDireccionEntrega() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'direccionEntrega', Sort.asc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> thenByDireccionEntregaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'direccionEntrega', Sort.desc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> thenByEmailProveedor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emailProveedor', Sort.asc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> thenByEmailProveedorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emailProveedor', Sort.desc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> thenByEsDevolucion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esDevolucion', Sort.asc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> thenByEsDevolucionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esDevolucion', Sort.desc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> thenByEsDevolucionValida() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esDevolucionValida', Sort.asc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> thenByEsDevolucionValidaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esDevolucionValida', Sort.desc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> thenByEsUrgente() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esUrgente', Sort.asc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> thenByEsUrgenteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esUrgente', Sort.desc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> thenByEstaPagada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estaPagada', Sort.asc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> thenByEstaPagadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estaPagada', Sort.desc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> thenByEstaRecibida() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estaRecibida', Sort.asc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> thenByEstaRecibidaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estaRecibida', Sort.desc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> thenByEstado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.asc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> thenByEstadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.desc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> thenByEstadoFormateado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estadoFormateado', Sort.asc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> thenByEstadoFormateadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estadoFormateado', Sort.desc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> thenByEstadoFormateadoCompleto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estadoFormateadoCompleto', Sort.asc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy>
      thenByEstadoFormateadoCompletoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estadoFormateadoCompleto', Sort.desc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> thenByFecha() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fecha', Sort.asc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> thenByFechaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fecha', Sort.desc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> thenByFechaActualizacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaActualizacion', Sort.asc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> thenByFechaActualizacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaActualizacion', Sort.desc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> thenByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.asc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> thenByFechaCreacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.desc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> thenByFechaDevolucion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaDevolucion', Sort.asc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> thenByFechaDevolucionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaDevolucion', Sort.desc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> thenByFechaRecepcion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaRecepcion', Sort.asc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> thenByFechaRecepcionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaRecepcion', Sort.desc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> thenByMetodoPago() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'metodoPago', Sort.asc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> thenByMetodoPagoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'metodoPago', Sort.desc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> thenByMetodoPagoFormateado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'metodoPagoFormateado', Sort.asc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> thenByMetodoPagoFormateadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'metodoPagoFormateado', Sort.desc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> thenByMontoPagado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoPagado', Sort.asc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> thenByMontoPagadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoPagado', Sort.desc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> thenByMotivoDevolucion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'motivoDevolucion', Sort.asc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> thenByMotivoDevolucionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'motivoDevolucion', Sort.desc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> thenByNumeroDocumento() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroDocumento', Sort.asc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> thenByNumeroDocumentoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroDocumento', Sort.desc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> thenByNumeroFactura() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroFactura', Sort.asc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> thenByNumeroFacturaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroFactura', Sort.desc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> thenByNumeroGuia() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroGuia', Sort.asc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> thenByNumeroGuiaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroGuia', Sort.desc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> thenByNumeroOrden() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroOrden', Sort.asc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> thenByNumeroOrdenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroOrden', Sort.desc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> thenByNumeroRemito() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroRemito', Sort.asc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> thenByNumeroRemitoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroRemito', Sort.desc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> thenByObservaciones() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observaciones', Sort.asc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> thenByObservacionesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observaciones', Sort.desc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> thenByPlazoEntrega() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plazoEntrega', Sort.asc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> thenByPlazoEntregaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plazoEntrega', Sort.desc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> thenByPrioridad() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prioridad', Sort.asc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> thenByPrioridadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prioridad', Sort.desc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> thenByProveedorId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proveedorId', Sort.asc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> thenByProveedorIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proveedorId', Sort.desc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> thenByPuedeDevolver() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'puedeDevolver', Sort.asc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> thenByPuedeDevolverDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'puedeDevolver', Sort.desc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> thenByReferenciaProveedor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'referenciaProveedor', Sort.asc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> thenByReferenciaProveedorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'referenciaProveedor', Sort.desc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> thenBySaldoPendiente() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saldoPendiente', Sort.asc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> thenBySaldoPendienteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saldoPendiente', Sort.desc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> thenByTelefonoProveedor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'telefonoProveedor', Sort.asc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> thenByTelefonoProveedorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'telefonoProveedor', Sort.desc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> thenByTipoDocumento() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipoDocumento', Sort.asc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> thenByTipoDocumentoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipoDocumento', Sort.desc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> thenByTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.asc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> thenByTotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.desc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> thenByTotalConSigno() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalConSigno', Sort.asc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> thenByTotalConSignoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalConSigno', Sort.desc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> thenByUsuarioDevolucion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usuarioDevolucion', Sort.asc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> thenByUsuarioDevolucionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usuarioDevolucion', Sort.desc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> thenByUsuarioId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usuarioId', Sort.asc);
    });
  }

  QueryBuilder<Compra, Compra, QAfterSortBy> thenByUsuarioIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usuarioId', Sort.desc);
    });
  }
}

extension CompraQueryWhereDistinct on QueryBuilder<Compra, Compra, QDistinct> {
  QueryBuilder<Compra, Compra, QDistinct> distinctByColorEstado(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'colorEstado', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Compra, Compra, QDistinct> distinctByCompraOriginalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'compraOriginalId');
    });
  }

  QueryBuilder<Compra, Compra, QDistinct> distinctByCondicionesPago(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'condicionesPago',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Compra, Compra, QDistinct> distinctByContactoProveedor(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'contactoProveedor',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Compra, Compra, QDistinct> distinctByDireccionEntrega(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'direccionEntrega',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Compra, Compra, QDistinct> distinctByEmailProveedor(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'emailProveedor',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Compra, Compra, QDistinct> distinctByEsDevolucion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'esDevolucion');
    });
  }

  QueryBuilder<Compra, Compra, QDistinct> distinctByEsDevolucionValida() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'esDevolucionValida');
    });
  }

  QueryBuilder<Compra, Compra, QDistinct> distinctByEsUrgente() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'esUrgente');
    });
  }

  QueryBuilder<Compra, Compra, QDistinct> distinctByEstaPagada() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estaPagada');
    });
  }

  QueryBuilder<Compra, Compra, QDistinct> distinctByEstaRecibida() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estaRecibida');
    });
  }

  QueryBuilder<Compra, Compra, QDistinct> distinctByEstado(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estado', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Compra, Compra, QDistinct> distinctByEstadoFormateado(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estadoFormateado',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Compra, Compra, QDistinct> distinctByEstadoFormateadoCompleto(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estadoFormateadoCompleto',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Compra, Compra, QDistinct> distinctByFecha() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fecha');
    });
  }

  QueryBuilder<Compra, Compra, QDistinct> distinctByFechaActualizacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaActualizacion');
    });
  }

  QueryBuilder<Compra, Compra, QDistinct> distinctByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaCreacion');
    });
  }

  QueryBuilder<Compra, Compra, QDistinct> distinctByFechaDevolucion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaDevolucion');
    });
  }

  QueryBuilder<Compra, Compra, QDistinct> distinctByFechaRecepcion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaRecepcion');
    });
  }

  QueryBuilder<Compra, Compra, QDistinct> distinctByMetodoPago(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'metodoPago', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Compra, Compra, QDistinct> distinctByMetodoPagoFormateado(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'metodoPagoFormateado',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Compra, Compra, QDistinct> distinctByMontoPagado() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'montoPagado');
    });
  }

  QueryBuilder<Compra, Compra, QDistinct> distinctByMotivoDevolucion(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'motivoDevolucion',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Compra, Compra, QDistinct> distinctByNumeroDocumento(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'numeroDocumento',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Compra, Compra, QDistinct> distinctByNumeroFactura(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'numeroFactura',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Compra, Compra, QDistinct> distinctByNumeroGuia(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'numeroGuia', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Compra, Compra, QDistinct> distinctByNumeroOrden(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'numeroOrden', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Compra, Compra, QDistinct> distinctByNumeroRemito(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'numeroRemito', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Compra, Compra, QDistinct> distinctByObservaciones(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'observaciones',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Compra, Compra, QDistinct> distinctByPlazoEntrega(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'plazoEntrega', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Compra, Compra, QDistinct> distinctByPrioridad(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'prioridad', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Compra, Compra, QDistinct> distinctByProveedorId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'proveedorId');
    });
  }

  QueryBuilder<Compra, Compra, QDistinct> distinctByPuedeDevolver() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'puedeDevolver');
    });
  }

  QueryBuilder<Compra, Compra, QDistinct> distinctByReferenciaProveedor(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'referenciaProveedor',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Compra, Compra, QDistinct> distinctBySaldoPendiente() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'saldoPendiente');
    });
  }

  QueryBuilder<Compra, Compra, QDistinct> distinctByTelefonoProveedor(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'telefonoProveedor',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Compra, Compra, QDistinct> distinctByTipoDocumento(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tipoDocumento',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Compra, Compra, QDistinct> distinctByTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'total');
    });
  }

  QueryBuilder<Compra, Compra, QDistinct> distinctByTotalConSigno(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalConSigno',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Compra, Compra, QDistinct> distinctByUsuarioDevolucion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'usuarioDevolucion');
    });
  }

  QueryBuilder<Compra, Compra, QDistinct> distinctByUsuarioId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'usuarioId');
    });
  }
}

extension CompraQueryProperty on QueryBuilder<Compra, Compra, QQueryProperty> {
  QueryBuilder<Compra, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Compra, String, QQueryOperations> colorEstadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'colorEstado');
    });
  }

  QueryBuilder<Compra, int?, QQueryOperations> compraOriginalIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'compraOriginalId');
    });
  }

  QueryBuilder<Compra, String?, QQueryOperations> condicionesPagoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'condicionesPago');
    });
  }

  QueryBuilder<Compra, String?, QQueryOperations> contactoProveedorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'contactoProveedor');
    });
  }

  QueryBuilder<Compra, String?, QQueryOperations> direccionEntregaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'direccionEntrega');
    });
  }

  QueryBuilder<Compra, String?, QQueryOperations> emailProveedorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'emailProveedor');
    });
  }

  QueryBuilder<Compra, bool, QQueryOperations> esDevolucionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'esDevolucion');
    });
  }

  QueryBuilder<Compra, bool, QQueryOperations> esDevolucionValidaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'esDevolucionValida');
    });
  }

  QueryBuilder<Compra, bool, QQueryOperations> esUrgenteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'esUrgente');
    });
  }

  QueryBuilder<Compra, bool, QQueryOperations> estaPagadaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estaPagada');
    });
  }

  QueryBuilder<Compra, bool, QQueryOperations> estaRecibidaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estaRecibida');
    });
  }

  QueryBuilder<Compra, String, QQueryOperations> estadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estado');
    });
  }

  QueryBuilder<Compra, String, QQueryOperations> estadoFormateadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estadoFormateado');
    });
  }

  QueryBuilder<Compra, String, QQueryOperations>
      estadoFormateadoCompletoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estadoFormateadoCompleto');
    });
  }

  QueryBuilder<Compra, DateTime, QQueryOperations> fechaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fecha');
    });
  }

  QueryBuilder<Compra, DateTime?, QQueryOperations>
      fechaActualizacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaActualizacion');
    });
  }

  QueryBuilder<Compra, DateTime, QQueryOperations> fechaCreacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaCreacion');
    });
  }

  QueryBuilder<Compra, DateTime?, QQueryOperations> fechaDevolucionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaDevolucion');
    });
  }

  QueryBuilder<Compra, DateTime?, QQueryOperations> fechaRecepcionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaRecepcion');
    });
  }

  QueryBuilder<Compra, String, QQueryOperations> metodoPagoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'metodoPago');
    });
  }

  QueryBuilder<Compra, String, QQueryOperations>
      metodoPagoFormateadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'metodoPagoFormateado');
    });
  }

  QueryBuilder<Compra, double, QQueryOperations> montoPagadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'montoPagado');
    });
  }

  QueryBuilder<Compra, String?, QQueryOperations> motivoDevolucionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'motivoDevolucion');
    });
  }

  QueryBuilder<Compra, String, QQueryOperations> numeroDocumentoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'numeroDocumento');
    });
  }

  QueryBuilder<Compra, String, QQueryOperations> numeroFacturaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'numeroFactura');
    });
  }

  QueryBuilder<Compra, String?, QQueryOperations> numeroGuiaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'numeroGuia');
    });
  }

  QueryBuilder<Compra, String?, QQueryOperations> numeroOrdenProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'numeroOrden');
    });
  }

  QueryBuilder<Compra, String?, QQueryOperations> numeroRemitoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'numeroRemito');
    });
  }

  QueryBuilder<Compra, String?, QQueryOperations> observacionesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'observaciones');
    });
  }

  QueryBuilder<Compra, String?, QQueryOperations> plazoEntregaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'plazoEntrega');
    });
  }

  QueryBuilder<Compra, String?, QQueryOperations> prioridadProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'prioridad');
    });
  }

  QueryBuilder<Compra, List<CompraProducto>, QQueryOperations>
      productosProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'productos');
    });
  }

  QueryBuilder<Compra, int?, QQueryOperations> proveedorIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'proveedorId');
    });
  }

  QueryBuilder<Compra, bool, QQueryOperations> puedeDevolverProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'puedeDevolver');
    });
  }

  QueryBuilder<Compra, String?, QQueryOperations>
      referenciaProveedorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'referenciaProveedor');
    });
  }

  QueryBuilder<Compra, double, QQueryOperations> saldoPendienteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'saldoPendiente');
    });
  }

  QueryBuilder<Compra, String?, QQueryOperations> telefonoProveedorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'telefonoProveedor');
    });
  }

  QueryBuilder<Compra, String, QQueryOperations> tipoDocumentoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tipoDocumento');
    });
  }

  QueryBuilder<Compra, double, QQueryOperations> totalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'total');
    });
  }

  QueryBuilder<Compra, String, QQueryOperations> totalConSignoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalConSigno');
    });
  }

  QueryBuilder<Compra, int?, QQueryOperations> usuarioDevolucionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'usuarioDevolucion');
    });
  }

  QueryBuilder<Compra, int, QQueryOperations> usuarioIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'usuarioId');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const CompraProductoSchema = Schema(
  name: r'CompraProducto',
  id: 1448419736905501363,
  properties: {
    r'cantidad': PropertySchema(
      id: 0,
      name: r'cantidad',
      type: IsarType.long,
    ),
    r'nombreProducto': PropertySchema(
      id: 1,
      name: r'nombreProducto',
      type: IsarType.string,
    ),
    r'observaciones': PropertySchema(
      id: 2,
      name: r'observaciones',
      type: IsarType.string,
    ),
    r'precioUnitario': PropertySchema(
      id: 3,
      name: r'precioUnitario',
      type: IsarType.double,
    ),
    r'productoId': PropertySchema(
      id: 4,
      name: r'productoId',
      type: IsarType.long,
    ),
    r'subtotal': PropertySchema(
      id: 5,
      name: r'subtotal',
      type: IsarType.double,
    )
  },
  estimateSize: _compraProductoEstimateSize,
  serialize: _compraProductoSerialize,
  deserialize: _compraProductoDeserialize,
  deserializeProp: _compraProductoDeserializeProp,
);

int _compraProductoEstimateSize(
  CompraProducto object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.nombreProducto.length * 3;
  {
    final value = object.observaciones;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _compraProductoSerialize(
  CompraProducto object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.cantidad);
  writer.writeString(offsets[1], object.nombreProducto);
  writer.writeString(offsets[2], object.observaciones);
  writer.writeDouble(offsets[3], object.precioUnitario);
  writer.writeLong(offsets[4], object.productoId);
  writer.writeDouble(offsets[5], object.subtotal);
}

CompraProducto _compraProductoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CompraProducto(
    cantidad: reader.readLongOrNull(offsets[0]) ?? 0,
    nombreProducto: reader.readStringOrNull(offsets[1]) ?? '',
    observaciones: reader.readStringOrNull(offsets[2]),
    precioUnitario: reader.readDoubleOrNull(offsets[3]) ?? 0.0,
    productoId: reader.readLongOrNull(offsets[4]) ?? 0,
  );
  object.subtotal = reader.readDouble(offsets[5]);
  return object;
}

P _compraProductoDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 1:
      return (reader.readStringOrNull(offset) ?? '') as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readDoubleOrNull(offset) ?? 0.0) as P;
    case 4:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension CompraProductoQueryFilter
    on QueryBuilder<CompraProducto, CompraProducto, QFilterCondition> {
  QueryBuilder<CompraProducto, CompraProducto, QAfterFilterCondition>
      cantidadEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cantidad',
        value: value,
      ));
    });
  }

  QueryBuilder<CompraProducto, CompraProducto, QAfterFilterCondition>
      cantidadGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cantidad',
        value: value,
      ));
    });
  }

  QueryBuilder<CompraProducto, CompraProducto, QAfterFilterCondition>
      cantidadLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cantidad',
        value: value,
      ));
    });
  }

  QueryBuilder<CompraProducto, CompraProducto, QAfterFilterCondition>
      cantidadBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cantidad',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CompraProducto, CompraProducto, QAfterFilterCondition>
      nombreProductoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nombreProducto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompraProducto, CompraProducto, QAfterFilterCondition>
      nombreProductoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nombreProducto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompraProducto, CompraProducto, QAfterFilterCondition>
      nombreProductoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nombreProducto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompraProducto, CompraProducto, QAfterFilterCondition>
      nombreProductoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nombreProducto',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompraProducto, CompraProducto, QAfterFilterCondition>
      nombreProductoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nombreProducto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompraProducto, CompraProducto, QAfterFilterCondition>
      nombreProductoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nombreProducto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompraProducto, CompraProducto, QAfterFilterCondition>
      nombreProductoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nombreProducto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompraProducto, CompraProducto, QAfterFilterCondition>
      nombreProductoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nombreProducto',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompraProducto, CompraProducto, QAfterFilterCondition>
      nombreProductoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nombreProducto',
        value: '',
      ));
    });
  }

  QueryBuilder<CompraProducto, CompraProducto, QAfterFilterCondition>
      nombreProductoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nombreProducto',
        value: '',
      ));
    });
  }

  QueryBuilder<CompraProducto, CompraProducto, QAfterFilterCondition>
      observacionesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'observaciones',
      ));
    });
  }

  QueryBuilder<CompraProducto, CompraProducto, QAfterFilterCondition>
      observacionesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'observaciones',
      ));
    });
  }

  QueryBuilder<CompraProducto, CompraProducto, QAfterFilterCondition>
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

  QueryBuilder<CompraProducto, CompraProducto, QAfterFilterCondition>
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

  QueryBuilder<CompraProducto, CompraProducto, QAfterFilterCondition>
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

  QueryBuilder<CompraProducto, CompraProducto, QAfterFilterCondition>
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

  QueryBuilder<CompraProducto, CompraProducto, QAfterFilterCondition>
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

  QueryBuilder<CompraProducto, CompraProducto, QAfterFilterCondition>
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

  QueryBuilder<CompraProducto, CompraProducto, QAfterFilterCondition>
      observacionesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'observaciones',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompraProducto, CompraProducto, QAfterFilterCondition>
      observacionesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'observaciones',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompraProducto, CompraProducto, QAfterFilterCondition>
      observacionesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'observaciones',
        value: '',
      ));
    });
  }

  QueryBuilder<CompraProducto, CompraProducto, QAfterFilterCondition>
      observacionesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'observaciones',
        value: '',
      ));
    });
  }

  QueryBuilder<CompraProducto, CompraProducto, QAfterFilterCondition>
      precioUnitarioEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'precioUnitario',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CompraProducto, CompraProducto, QAfterFilterCondition>
      precioUnitarioGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'precioUnitario',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CompraProducto, CompraProducto, QAfterFilterCondition>
      precioUnitarioLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'precioUnitario',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CompraProducto, CompraProducto, QAfterFilterCondition>
      precioUnitarioBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'precioUnitario',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CompraProducto, CompraProducto, QAfterFilterCondition>
      productoIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'productoId',
        value: value,
      ));
    });
  }

  QueryBuilder<CompraProducto, CompraProducto, QAfterFilterCondition>
      productoIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'productoId',
        value: value,
      ));
    });
  }

  QueryBuilder<CompraProducto, CompraProducto, QAfterFilterCondition>
      productoIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'productoId',
        value: value,
      ));
    });
  }

  QueryBuilder<CompraProducto, CompraProducto, QAfterFilterCondition>
      productoIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'productoId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CompraProducto, CompraProducto, QAfterFilterCondition>
      subtotalEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'subtotal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CompraProducto, CompraProducto, QAfterFilterCondition>
      subtotalGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'subtotal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CompraProducto, CompraProducto, QAfterFilterCondition>
      subtotalLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'subtotal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CompraProducto, CompraProducto, QAfterFilterCondition>
      subtotalBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'subtotal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension CompraProductoQueryObject
    on QueryBuilder<CompraProducto, CompraProducto, QFilterCondition> {}
