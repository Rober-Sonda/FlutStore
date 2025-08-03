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
    r'esUrgente': PropertySchema(
      id: 1,
      name: r'esUrgente',
      type: IsarType.bool,
    ),
    r'estaPagada': PropertySchema(
      id: 2,
      name: r'estaPagada',
      type: IsarType.bool,
    ),
    r'estaRecibida': PropertySchema(
      id: 3,
      name: r'estaRecibida',
      type: IsarType.bool,
    ),
    r'estado': PropertySchema(
      id: 4,
      name: r'estado',
      type: IsarType.string,
    ),
    r'estadoFormateado': PropertySchema(
      id: 5,
      name: r'estadoFormateado',
      type: IsarType.string,
    ),
    r'fecha': PropertySchema(
      id: 6,
      name: r'fecha',
      type: IsarType.dateTime,
    ),
    r'fechaActualizacion': PropertySchema(
      id: 7,
      name: r'fechaActualizacion',
      type: IsarType.dateTime,
    ),
    r'fechaCreacion': PropertySchema(
      id: 8,
      name: r'fechaCreacion',
      type: IsarType.dateTime,
    ),
    r'fechaRecepcion': PropertySchema(
      id: 9,
      name: r'fechaRecepcion',
      type: IsarType.dateTime,
    ),
    r'metodoPago': PropertySchema(
      id: 10,
      name: r'metodoPago',
      type: IsarType.string,
    ),
    r'metodoPagoFormateado': PropertySchema(
      id: 11,
      name: r'metodoPagoFormateado',
      type: IsarType.string,
    ),
    r'montoPagado': PropertySchema(
      id: 12,
      name: r'montoPagado',
      type: IsarType.double,
    ),
    r'numeroFactura': PropertySchema(
      id: 13,
      name: r'numeroFactura',
      type: IsarType.string,
    ),
    r'observaciones': PropertySchema(
      id: 14,
      name: r'observaciones',
      type: IsarType.string,
    ),
    r'prioridad': PropertySchema(
      id: 15,
      name: r'prioridad',
      type: IsarType.string,
    ),
    r'productos': PropertySchema(
      id: 16,
      name: r'productos',
      type: IsarType.objectList,
      target: r'CompraProducto',
    ),
    r'proveedorId': PropertySchema(
      id: 17,
      name: r'proveedorId',
      type: IsarType.long,
    ),
    r'saldoPendiente': PropertySchema(
      id: 18,
      name: r'saldoPendiente',
      type: IsarType.double,
    ),
    r'total': PropertySchema(
      id: 19,
      name: r'total',
      type: IsarType.double,
    ),
    r'usuarioId': PropertySchema(
      id: 20,
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
  bytesCount += 3 + object.estado.length * 3;
  bytesCount += 3 + object.estadoFormateado.length * 3;
  bytesCount += 3 + object.metodoPago.length * 3;
  bytesCount += 3 + object.metodoPagoFormateado.length * 3;
  bytesCount += 3 + object.numeroFactura.length * 3;
  {
    final value = object.observaciones;
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
  return bytesCount;
}

void _compraSerialize(
  Compra object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.colorEstado);
  writer.writeBool(offsets[1], object.esUrgente);
  writer.writeBool(offsets[2], object.estaPagada);
  writer.writeBool(offsets[3], object.estaRecibida);
  writer.writeString(offsets[4], object.estado);
  writer.writeString(offsets[5], object.estadoFormateado);
  writer.writeDateTime(offsets[6], object.fecha);
  writer.writeDateTime(offsets[7], object.fechaActualizacion);
  writer.writeDateTime(offsets[8], object.fechaCreacion);
  writer.writeDateTime(offsets[9], object.fechaRecepcion);
  writer.writeString(offsets[10], object.metodoPago);
  writer.writeString(offsets[11], object.metodoPagoFormateado);
  writer.writeDouble(offsets[12], object.montoPagado);
  writer.writeString(offsets[13], object.numeroFactura);
  writer.writeString(offsets[14], object.observaciones);
  writer.writeString(offsets[15], object.prioridad);
  writer.writeObjectList<CompraProducto>(
    offsets[16],
    allOffsets,
    CompraProductoSchema.serialize,
    object.productos,
  );
  writer.writeLong(offsets[17], object.proveedorId);
  writer.writeDouble(offsets[18], object.saldoPendiente);
  writer.writeDouble(offsets[19], object.total);
  writer.writeLong(offsets[20], object.usuarioId);
}

Compra _compraDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Compra(
    esUrgente: reader.readBoolOrNull(offsets[1]) ?? false,
    estado: reader.readStringOrNull(offsets[4]) ?? 'pendiente',
    fecha: reader.readDateTime(offsets[6]),
    metodoPago: reader.readStringOrNull(offsets[10]) ?? 'efectivo',
    montoPagado: reader.readDoubleOrNull(offsets[12]) ?? 0.0,
    numeroFactura: reader.readString(offsets[13]),
    observaciones: reader.readStringOrNull(offsets[14]),
    prioridad: reader.readStringOrNull(offsets[15]),
    proveedorId: reader.readLongOrNull(offsets[17]),
    saldoPendiente: reader.readDoubleOrNull(offsets[18]) ?? 0.0,
    total: reader.readDouble(offsets[19]),
    usuarioId: reader.readLongOrNull(offsets[20]) ?? 1,
  );
  object.fechaActualizacion = reader.readDateTimeOrNull(offsets[7]);
  object.fechaCreacion = reader.readDateTime(offsets[8]);
  object.fechaRecepcion = reader.readDateTimeOrNull(offsets[9]);
  object.id = id;
  object.productos = reader.readObjectList<CompraProducto>(
        offsets[16],
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
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset) ?? 'pendiente') as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readDateTime(offset)) as P;
    case 7:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 8:
      return (reader.readDateTime(offset)) as P;
    case 9:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset) ?? 'efectivo') as P;
    case 11:
      return (reader.readString(offset)) as P;
    case 12:
      return (reader.readDoubleOrNull(offset) ?? 0.0) as P;
    case 13:
      return (reader.readString(offset)) as P;
    case 14:
      return (reader.readStringOrNull(offset)) as P;
    case 15:
      return (reader.readStringOrNull(offset)) as P;
    case 16:
      return (reader.readObjectList<CompraProducto>(
            offset,
            CompraProductoSchema.deserialize,
            allOffsets,
            CompraProducto(),
          ) ??
          []) as P;
    case 17:
      return (reader.readLongOrNull(offset)) as P;
    case 18:
      return (reader.readDoubleOrNull(offset) ?? 0.0) as P;
    case 19:
      return (reader.readDouble(offset)) as P;
    case 20:
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

  QueryBuilder<Compra, Compra, QDistinct> distinctByNumeroFactura(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'numeroFactura',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Compra, Compra, QDistinct> distinctByObservaciones(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'observaciones',
          caseSensitive: caseSensitive);
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

  QueryBuilder<Compra, Compra, QDistinct> distinctBySaldoPendiente() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'saldoPendiente');
    });
  }

  QueryBuilder<Compra, Compra, QDistinct> distinctByTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'total');
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

  QueryBuilder<Compra, String, QQueryOperations> numeroFacturaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'numeroFactura');
    });
  }

  QueryBuilder<Compra, String?, QQueryOperations> observacionesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'observaciones');
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

  QueryBuilder<Compra, double, QQueryOperations> saldoPendienteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'saldoPendiente');
    });
  }

  QueryBuilder<Compra, double, QQueryOperations> totalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'total');
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
