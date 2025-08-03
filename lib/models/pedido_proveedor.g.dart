// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pedido_proveedor.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPedidoProveedorCollection on Isar {
  IsarCollection<PedidoProveedor> get pedidoProveedors => this.collection();
}

const PedidoProveedorSchema = CollectionSchema(
  name: r'PedidoProveedor',
  id: 5615121090259171730,
  properties: {
    r'compraId': PropertySchema(
      id: 0,
      name: r'compraId',
      type: IsarType.long,
    ),
    r'estado': PropertySchema(
      id: 1,
      name: r'estado',
      type: IsarType.string,
    ),
    r'fechaCreacion': PropertySchema(
      id: 2,
      name: r'fechaCreacion',
      type: IsarType.dateTime,
    ),
    r'fechaEnvio': PropertySchema(
      id: 3,
      name: r'fechaEnvio',
      type: IsarType.dateTime,
    ),
    r'fechaRecepcion': PropertySchema(
      id: 4,
      name: r'fechaRecepcion',
      type: IsarType.dateTime,
    ),
    r'items': PropertySchema(
      id: 5,
      name: r'items',
      type: IsarType.objectList,
      target: r'ItemPedidoProveedor',
    ),
    r'observaciones': PropertySchema(
      id: 6,
      name: r'observaciones',
      type: IsarType.string,
    ),
    r'proveedorId': PropertySchema(
      id: 7,
      name: r'proveedorId',
      type: IsarType.long,
    ),
    r'puedeCancelar': PropertySchema(
      id: 8,
      name: r'puedeCancelar',
      type: IsarType.bool,
    ),
    r'puedeEnviar': PropertySchema(
      id: 9,
      name: r'puedeEnviar',
      type: IsarType.bool,
    ),
    r'puedeRecibir': PropertySchema(
      id: 10,
      name: r'puedeRecibir',
      type: IsarType.bool,
    ),
    r'totalEstimado': PropertySchema(
      id: 11,
      name: r'totalEstimado',
      type: IsarType.double,
    )
  },
  estimateSize: _pedidoProveedorEstimateSize,
  serialize: _pedidoProveedorSerialize,
  deserialize: _pedidoProveedorDeserialize,
  deserializeProp: _pedidoProveedorDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {r'ItemPedidoProveedor': ItemPedidoProveedorSchema},
  getId: _pedidoProveedorGetId,
  getLinks: _pedidoProveedorGetLinks,
  attach: _pedidoProveedorAttach,
  version: '3.1.0+1',
);

int _pedidoProveedorEstimateSize(
  PedidoProveedor object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.estado.length * 3;
  bytesCount += 3 + object.items.length * 3;
  {
    final offsets = allOffsets[ItemPedidoProveedor]!;
    for (var i = 0; i < object.items.length; i++) {
      final value = object.items[i];
      bytesCount +=
          ItemPedidoProveedorSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  {
    final value = object.observaciones;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _pedidoProveedorSerialize(
  PedidoProveedor object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.compraId);
  writer.writeString(offsets[1], object.estado);
  writer.writeDateTime(offsets[2], object.fechaCreacion);
  writer.writeDateTime(offsets[3], object.fechaEnvio);
  writer.writeDateTime(offsets[4], object.fechaRecepcion);
  writer.writeObjectList<ItemPedidoProveedor>(
    offsets[5],
    allOffsets,
    ItemPedidoProveedorSchema.serialize,
    object.items,
  );
  writer.writeString(offsets[6], object.observaciones);
  writer.writeLong(offsets[7], object.proveedorId);
  writer.writeBool(offsets[8], object.puedeCancelar);
  writer.writeBool(offsets[9], object.puedeEnviar);
  writer.writeBool(offsets[10], object.puedeRecibir);
  writer.writeDouble(offsets[11], object.totalEstimado);
}

PedidoProveedor _pedidoProveedorDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PedidoProveedor();
  object.compraId = reader.readLongOrNull(offsets[0]);
  object.estado = reader.readString(offsets[1]);
  object.fechaCreacion = reader.readDateTime(offsets[2]);
  object.fechaEnvio = reader.readDateTimeOrNull(offsets[3]);
  object.fechaRecepcion = reader.readDateTimeOrNull(offsets[4]);
  object.id = id;
  object.items = reader.readObjectList<ItemPedidoProveedor>(
        offsets[5],
        ItemPedidoProveedorSchema.deserialize,
        allOffsets,
        ItemPedidoProveedor(),
      ) ??
      [];
  object.observaciones = reader.readStringOrNull(offsets[6]);
  object.proveedorId = reader.readLong(offsets[7]);
  object.totalEstimado = reader.readDoubleOrNull(offsets[11]);
  return object;
}

P _pedidoProveedorDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 4:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 5:
      return (reader.readObjectList<ItemPedidoProveedor>(
            offset,
            ItemPedidoProveedorSchema.deserialize,
            allOffsets,
            ItemPedidoProveedor(),
          ) ??
          []) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readBool(offset)) as P;
    case 9:
      return (reader.readBool(offset)) as P;
    case 10:
      return (reader.readBool(offset)) as P;
    case 11:
      return (reader.readDoubleOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _pedidoProveedorGetId(PedidoProveedor object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _pedidoProveedorGetLinks(PedidoProveedor object) {
  return [];
}

void _pedidoProveedorAttach(
    IsarCollection<dynamic> col, Id id, PedidoProveedor object) {
  object.id = id;
}

extension PedidoProveedorQueryWhereSort
    on QueryBuilder<PedidoProveedor, PedidoProveedor, QWhere> {
  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PedidoProveedorQueryWhere
    on QueryBuilder<PedidoProveedor, PedidoProveedor, QWhereClause> {
  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterWhereClause>
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

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterWhereClause> idBetween(
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

extension PedidoProveedorQueryFilter
    on QueryBuilder<PedidoProveedor, PedidoProveedor, QFilterCondition> {
  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterFilterCondition>
      compraIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'compraId',
      ));
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterFilterCondition>
      compraIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'compraId',
      ));
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterFilterCondition>
      compraIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'compraId',
        value: value,
      ));
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterFilterCondition>
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

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterFilterCondition>
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

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterFilterCondition>
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

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterFilterCondition>
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

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterFilterCondition>
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

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterFilterCondition>
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

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterFilterCondition>
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

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterFilterCondition>
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

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterFilterCondition>
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

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterFilterCondition>
      estadoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'estado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterFilterCondition>
      estadoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'estado',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterFilterCondition>
      estadoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estado',
        value: '',
      ));
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterFilterCondition>
      estadoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'estado',
        value: '',
      ));
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterFilterCondition>
      fechaCreacionEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaCreacion',
        value: value,
      ));
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterFilterCondition>
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

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterFilterCondition>
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

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterFilterCondition>
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

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterFilterCondition>
      fechaEnvioIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fechaEnvio',
      ));
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterFilterCondition>
      fechaEnvioIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fechaEnvio',
      ));
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterFilterCondition>
      fechaEnvioEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaEnvio',
        value: value,
      ));
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterFilterCondition>
      fechaEnvioGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fechaEnvio',
        value: value,
      ));
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterFilterCondition>
      fechaEnvioLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fechaEnvio',
        value: value,
      ));
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterFilterCondition>
      fechaEnvioBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fechaEnvio',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterFilterCondition>
      fechaRecepcionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fechaRecepcion',
      ));
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterFilterCondition>
      fechaRecepcionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fechaRecepcion',
      ));
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterFilterCondition>
      fechaRecepcionEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaRecepcion',
        value: value,
      ));
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterFilterCondition>
      fechaRecepcionGreaterThan(
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

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterFilterCondition>
      fechaRecepcionLessThan(
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

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterFilterCondition>
      fechaRecepcionBetween(
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

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterFilterCondition>
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

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterFilterCondition>
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

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterFilterCondition>
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

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterFilterCondition>
      itemsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'items',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterFilterCondition>
      itemsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'items',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterFilterCondition>
      itemsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'items',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterFilterCondition>
      itemsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'items',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterFilterCondition>
      itemsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'items',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterFilterCondition>
      itemsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'items',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterFilterCondition>
      observacionesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'observaciones',
      ));
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterFilterCondition>
      observacionesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'observaciones',
      ));
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterFilterCondition>
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

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterFilterCondition>
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

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterFilterCondition>
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

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterFilterCondition>
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

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterFilterCondition>
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

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterFilterCondition>
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

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterFilterCondition>
      observacionesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'observaciones',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterFilterCondition>
      observacionesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'observaciones',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterFilterCondition>
      observacionesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'observaciones',
        value: '',
      ));
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterFilterCondition>
      observacionesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'observaciones',
        value: '',
      ));
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterFilterCondition>
      proveedorIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'proveedorId',
        value: value,
      ));
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterFilterCondition>
      proveedorIdGreaterThan(
    int value, {
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

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterFilterCondition>
      proveedorIdLessThan(
    int value, {
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

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterFilterCondition>
      proveedorIdBetween(
    int lower,
    int upper, {
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

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterFilterCondition>
      puedeCancelarEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'puedeCancelar',
        value: value,
      ));
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterFilterCondition>
      puedeEnviarEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'puedeEnviar',
        value: value,
      ));
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterFilterCondition>
      puedeRecibirEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'puedeRecibir',
        value: value,
      ));
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterFilterCondition>
      totalEstimadoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'totalEstimado',
      ));
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterFilterCondition>
      totalEstimadoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'totalEstimado',
      ));
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterFilterCondition>
      totalEstimadoEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalEstimado',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterFilterCondition>
      totalEstimadoGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalEstimado',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterFilterCondition>
      totalEstimadoLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalEstimado',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterFilterCondition>
      totalEstimadoBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalEstimado',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension PedidoProveedorQueryObject
    on QueryBuilder<PedidoProveedor, PedidoProveedor, QFilterCondition> {
  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterFilterCondition>
      itemsElement(FilterQuery<ItemPedidoProveedor> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'items');
    });
  }
}

extension PedidoProveedorQueryLinks
    on QueryBuilder<PedidoProveedor, PedidoProveedor, QFilterCondition> {}

extension PedidoProveedorQuerySortBy
    on QueryBuilder<PedidoProveedor, PedidoProveedor, QSortBy> {
  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterSortBy>
      sortByCompraId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'compraId', Sort.asc);
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterSortBy>
      sortByCompraIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'compraId', Sort.desc);
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterSortBy> sortByEstado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.asc);
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterSortBy>
      sortByEstadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.desc);
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterSortBy>
      sortByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.asc);
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterSortBy>
      sortByFechaCreacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.desc);
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterSortBy>
      sortByFechaEnvio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaEnvio', Sort.asc);
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterSortBy>
      sortByFechaEnvioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaEnvio', Sort.desc);
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterSortBy>
      sortByFechaRecepcion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaRecepcion', Sort.asc);
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterSortBy>
      sortByFechaRecepcionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaRecepcion', Sort.desc);
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterSortBy>
      sortByObservaciones() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observaciones', Sort.asc);
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterSortBy>
      sortByObservacionesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observaciones', Sort.desc);
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterSortBy>
      sortByProveedorId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proveedorId', Sort.asc);
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterSortBy>
      sortByProveedorIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proveedorId', Sort.desc);
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterSortBy>
      sortByPuedeCancelar() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'puedeCancelar', Sort.asc);
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterSortBy>
      sortByPuedeCancelarDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'puedeCancelar', Sort.desc);
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterSortBy>
      sortByPuedeEnviar() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'puedeEnviar', Sort.asc);
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterSortBy>
      sortByPuedeEnviarDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'puedeEnviar', Sort.desc);
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterSortBy>
      sortByPuedeRecibir() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'puedeRecibir', Sort.asc);
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterSortBy>
      sortByPuedeRecibirDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'puedeRecibir', Sort.desc);
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterSortBy>
      sortByTotalEstimado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalEstimado', Sort.asc);
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterSortBy>
      sortByTotalEstimadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalEstimado', Sort.desc);
    });
  }
}

extension PedidoProveedorQuerySortThenBy
    on QueryBuilder<PedidoProveedor, PedidoProveedor, QSortThenBy> {
  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterSortBy>
      thenByCompraId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'compraId', Sort.asc);
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterSortBy>
      thenByCompraIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'compraId', Sort.desc);
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterSortBy> thenByEstado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.asc);
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterSortBy>
      thenByEstadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.desc);
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterSortBy>
      thenByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.asc);
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterSortBy>
      thenByFechaCreacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.desc);
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterSortBy>
      thenByFechaEnvio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaEnvio', Sort.asc);
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterSortBy>
      thenByFechaEnvioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaEnvio', Sort.desc);
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterSortBy>
      thenByFechaRecepcion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaRecepcion', Sort.asc);
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterSortBy>
      thenByFechaRecepcionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaRecepcion', Sort.desc);
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterSortBy>
      thenByObservaciones() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observaciones', Sort.asc);
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterSortBy>
      thenByObservacionesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observaciones', Sort.desc);
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterSortBy>
      thenByProveedorId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proveedorId', Sort.asc);
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterSortBy>
      thenByProveedorIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proveedorId', Sort.desc);
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterSortBy>
      thenByPuedeCancelar() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'puedeCancelar', Sort.asc);
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterSortBy>
      thenByPuedeCancelarDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'puedeCancelar', Sort.desc);
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterSortBy>
      thenByPuedeEnviar() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'puedeEnviar', Sort.asc);
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterSortBy>
      thenByPuedeEnviarDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'puedeEnviar', Sort.desc);
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterSortBy>
      thenByPuedeRecibir() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'puedeRecibir', Sort.asc);
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterSortBy>
      thenByPuedeRecibirDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'puedeRecibir', Sort.desc);
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterSortBy>
      thenByTotalEstimado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalEstimado', Sort.asc);
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QAfterSortBy>
      thenByTotalEstimadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalEstimado', Sort.desc);
    });
  }
}

extension PedidoProveedorQueryWhereDistinct
    on QueryBuilder<PedidoProveedor, PedidoProveedor, QDistinct> {
  QueryBuilder<PedidoProveedor, PedidoProveedor, QDistinct>
      distinctByCompraId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'compraId');
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QDistinct> distinctByEstado(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estado', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QDistinct>
      distinctByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaCreacion');
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QDistinct>
      distinctByFechaEnvio() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaEnvio');
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QDistinct>
      distinctByFechaRecepcion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaRecepcion');
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QDistinct>
      distinctByObservaciones({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'observaciones',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QDistinct>
      distinctByProveedorId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'proveedorId');
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QDistinct>
      distinctByPuedeCancelar() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'puedeCancelar');
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QDistinct>
      distinctByPuedeEnviar() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'puedeEnviar');
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QDistinct>
      distinctByPuedeRecibir() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'puedeRecibir');
    });
  }

  QueryBuilder<PedidoProveedor, PedidoProveedor, QDistinct>
      distinctByTotalEstimado() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalEstimado');
    });
  }
}

extension PedidoProveedorQueryProperty
    on QueryBuilder<PedidoProveedor, PedidoProveedor, QQueryProperty> {
  QueryBuilder<PedidoProveedor, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<PedidoProveedor, int?, QQueryOperations> compraIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'compraId');
    });
  }

  QueryBuilder<PedidoProveedor, String, QQueryOperations> estadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estado');
    });
  }

  QueryBuilder<PedidoProveedor, DateTime, QQueryOperations>
      fechaCreacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaCreacion');
    });
  }

  QueryBuilder<PedidoProveedor, DateTime?, QQueryOperations>
      fechaEnvioProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaEnvio');
    });
  }

  QueryBuilder<PedidoProveedor, DateTime?, QQueryOperations>
      fechaRecepcionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaRecepcion');
    });
  }

  QueryBuilder<PedidoProveedor, List<ItemPedidoProveedor>, QQueryOperations>
      itemsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'items');
    });
  }

  QueryBuilder<PedidoProveedor, String?, QQueryOperations>
      observacionesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'observaciones');
    });
  }

  QueryBuilder<PedidoProveedor, int, QQueryOperations> proveedorIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'proveedorId');
    });
  }

  QueryBuilder<PedidoProveedor, bool, QQueryOperations>
      puedeCancelarProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'puedeCancelar');
    });
  }

  QueryBuilder<PedidoProveedor, bool, QQueryOperations> puedeEnviarProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'puedeEnviar');
    });
  }

  QueryBuilder<PedidoProveedor, bool, QQueryOperations> puedeRecibirProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'puedeRecibir');
    });
  }

  QueryBuilder<PedidoProveedor, double?, QQueryOperations>
      totalEstimadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalEstimado');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const ItemPedidoProveedorSchema = Schema(
  name: r'ItemPedidoProveedor',
  id: -4673825232682524082,
  properties: {
    r'cantidad': PropertySchema(
      id: 0,
      name: r'cantidad',
      type: IsarType.long,
    ),
    r'compraItemId': PropertySchema(
      id: 1,
      name: r'compraItemId',
      type: IsarType.long,
    ),
    r'convertidoEnCompra': PropertySchema(
      id: 2,
      name: r'convertidoEnCompra',
      type: IsarType.bool,
    ),
    r'nombreProducto': PropertySchema(
      id: 3,
      name: r'nombreProducto',
      type: IsarType.string,
    ),
    r'observaciones': PropertySchema(
      id: 4,
      name: r'observaciones',
      type: IsarType.string,
    ),
    r'precioEstimado': PropertySchema(
      id: 5,
      name: r'precioEstimado',
      type: IsarType.double,
    ),
    r'precioFinal': PropertySchema(
      id: 6,
      name: r'precioFinal',
      type: IsarType.double,
    ),
    r'productoId': PropertySchema(
      id: 7,
      name: r'productoId',
      type: IsarType.long,
    )
  },
  estimateSize: _itemPedidoProveedorEstimateSize,
  serialize: _itemPedidoProveedorSerialize,
  deserialize: _itemPedidoProveedorDeserialize,
  deserializeProp: _itemPedidoProveedorDeserializeProp,
);

int _itemPedidoProveedorEstimateSize(
  ItemPedidoProveedor object,
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

void _itemPedidoProveedorSerialize(
  ItemPedidoProveedor object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.cantidad);
  writer.writeLong(offsets[1], object.compraItemId);
  writer.writeBool(offsets[2], object.convertidoEnCompra);
  writer.writeString(offsets[3], object.nombreProducto);
  writer.writeString(offsets[4], object.observaciones);
  writer.writeDouble(offsets[5], object.precioEstimado);
  writer.writeDouble(offsets[6], object.precioFinal);
  writer.writeLong(offsets[7], object.productoId);
}

ItemPedidoProveedor _itemPedidoProveedorDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ItemPedidoProveedor();
  object.cantidad = reader.readLong(offsets[0]);
  object.compraItemId = reader.readLongOrNull(offsets[1]);
  object.convertidoEnCompra = reader.readBool(offsets[2]);
  object.nombreProducto = reader.readString(offsets[3]);
  object.observaciones = reader.readStringOrNull(offsets[4]);
  object.precioEstimado = reader.readDoubleOrNull(offsets[5]);
  object.precioFinal = reader.readDoubleOrNull(offsets[6]);
  object.productoId = reader.readLong(offsets[7]);
  return object;
}

P _itemPedidoProveedorDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readDoubleOrNull(offset)) as P;
    case 6:
      return (reader.readDoubleOrNull(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension ItemPedidoProveedorQueryFilter on QueryBuilder<ItemPedidoProveedor,
    ItemPedidoProveedor, QFilterCondition> {
  QueryBuilder<ItemPedidoProveedor, ItemPedidoProveedor, QAfterFilterCondition>
      cantidadEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cantidad',
        value: value,
      ));
    });
  }

  QueryBuilder<ItemPedidoProveedor, ItemPedidoProveedor, QAfterFilterCondition>
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

  QueryBuilder<ItemPedidoProveedor, ItemPedidoProveedor, QAfterFilterCondition>
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

  QueryBuilder<ItemPedidoProveedor, ItemPedidoProveedor, QAfterFilterCondition>
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

  QueryBuilder<ItemPedidoProveedor, ItemPedidoProveedor, QAfterFilterCondition>
      compraItemIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'compraItemId',
      ));
    });
  }

  QueryBuilder<ItemPedidoProveedor, ItemPedidoProveedor, QAfterFilterCondition>
      compraItemIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'compraItemId',
      ));
    });
  }

  QueryBuilder<ItemPedidoProveedor, ItemPedidoProveedor, QAfterFilterCondition>
      compraItemIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'compraItemId',
        value: value,
      ));
    });
  }

  QueryBuilder<ItemPedidoProveedor, ItemPedidoProveedor, QAfterFilterCondition>
      compraItemIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'compraItemId',
        value: value,
      ));
    });
  }

  QueryBuilder<ItemPedidoProveedor, ItemPedidoProveedor, QAfterFilterCondition>
      compraItemIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'compraItemId',
        value: value,
      ));
    });
  }

  QueryBuilder<ItemPedidoProveedor, ItemPedidoProveedor, QAfterFilterCondition>
      compraItemIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'compraItemId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ItemPedidoProveedor, ItemPedidoProveedor, QAfterFilterCondition>
      convertidoEnCompraEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'convertidoEnCompra',
        value: value,
      ));
    });
  }

  QueryBuilder<ItemPedidoProveedor, ItemPedidoProveedor, QAfterFilterCondition>
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

  QueryBuilder<ItemPedidoProveedor, ItemPedidoProveedor, QAfterFilterCondition>
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

  QueryBuilder<ItemPedidoProveedor, ItemPedidoProveedor, QAfterFilterCondition>
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

  QueryBuilder<ItemPedidoProveedor, ItemPedidoProveedor, QAfterFilterCondition>
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

  QueryBuilder<ItemPedidoProveedor, ItemPedidoProveedor, QAfterFilterCondition>
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

  QueryBuilder<ItemPedidoProveedor, ItemPedidoProveedor, QAfterFilterCondition>
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

  QueryBuilder<ItemPedidoProveedor, ItemPedidoProveedor, QAfterFilterCondition>
      nombreProductoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nombreProducto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ItemPedidoProveedor, ItemPedidoProveedor, QAfterFilterCondition>
      nombreProductoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nombreProducto',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ItemPedidoProveedor, ItemPedidoProveedor, QAfterFilterCondition>
      nombreProductoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nombreProducto',
        value: '',
      ));
    });
  }

  QueryBuilder<ItemPedidoProveedor, ItemPedidoProveedor, QAfterFilterCondition>
      nombreProductoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nombreProducto',
        value: '',
      ));
    });
  }

  QueryBuilder<ItemPedidoProveedor, ItemPedidoProveedor, QAfterFilterCondition>
      observacionesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'observaciones',
      ));
    });
  }

  QueryBuilder<ItemPedidoProveedor, ItemPedidoProveedor, QAfterFilterCondition>
      observacionesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'observaciones',
      ));
    });
  }

  QueryBuilder<ItemPedidoProveedor, ItemPedidoProveedor, QAfterFilterCondition>
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

  QueryBuilder<ItemPedidoProveedor, ItemPedidoProveedor, QAfterFilterCondition>
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

  QueryBuilder<ItemPedidoProveedor, ItemPedidoProveedor, QAfterFilterCondition>
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

  QueryBuilder<ItemPedidoProveedor, ItemPedidoProveedor, QAfterFilterCondition>
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

  QueryBuilder<ItemPedidoProveedor, ItemPedidoProveedor, QAfterFilterCondition>
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

  QueryBuilder<ItemPedidoProveedor, ItemPedidoProveedor, QAfterFilterCondition>
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

  QueryBuilder<ItemPedidoProveedor, ItemPedidoProveedor, QAfterFilterCondition>
      observacionesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'observaciones',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ItemPedidoProveedor, ItemPedidoProveedor, QAfterFilterCondition>
      observacionesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'observaciones',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ItemPedidoProveedor, ItemPedidoProveedor, QAfterFilterCondition>
      observacionesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'observaciones',
        value: '',
      ));
    });
  }

  QueryBuilder<ItemPedidoProveedor, ItemPedidoProveedor, QAfterFilterCondition>
      observacionesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'observaciones',
        value: '',
      ));
    });
  }

  QueryBuilder<ItemPedidoProveedor, ItemPedidoProveedor, QAfterFilterCondition>
      precioEstimadoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'precioEstimado',
      ));
    });
  }

  QueryBuilder<ItemPedidoProveedor, ItemPedidoProveedor, QAfterFilterCondition>
      precioEstimadoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'precioEstimado',
      ));
    });
  }

  QueryBuilder<ItemPedidoProveedor, ItemPedidoProveedor, QAfterFilterCondition>
      precioEstimadoEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'precioEstimado',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ItemPedidoProveedor, ItemPedidoProveedor, QAfterFilterCondition>
      precioEstimadoGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'precioEstimado',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ItemPedidoProveedor, ItemPedidoProveedor, QAfterFilterCondition>
      precioEstimadoLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'precioEstimado',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ItemPedidoProveedor, ItemPedidoProveedor, QAfterFilterCondition>
      precioEstimadoBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'precioEstimado',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ItemPedidoProveedor, ItemPedidoProveedor, QAfterFilterCondition>
      precioFinalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'precioFinal',
      ));
    });
  }

  QueryBuilder<ItemPedidoProveedor, ItemPedidoProveedor, QAfterFilterCondition>
      precioFinalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'precioFinal',
      ));
    });
  }

  QueryBuilder<ItemPedidoProveedor, ItemPedidoProveedor, QAfterFilterCondition>
      precioFinalEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'precioFinal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ItemPedidoProveedor, ItemPedidoProveedor, QAfterFilterCondition>
      precioFinalGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'precioFinal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ItemPedidoProveedor, ItemPedidoProveedor, QAfterFilterCondition>
      precioFinalLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'precioFinal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ItemPedidoProveedor, ItemPedidoProveedor, QAfterFilterCondition>
      precioFinalBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'precioFinal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ItemPedidoProveedor, ItemPedidoProveedor, QAfterFilterCondition>
      productoIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'productoId',
        value: value,
      ));
    });
  }

  QueryBuilder<ItemPedidoProveedor, ItemPedidoProveedor, QAfterFilterCondition>
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

  QueryBuilder<ItemPedidoProveedor, ItemPedidoProveedor, QAfterFilterCondition>
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

  QueryBuilder<ItemPedidoProveedor, ItemPedidoProveedor, QAfterFilterCondition>
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
}

extension ItemPedidoProveedorQueryObject on QueryBuilder<ItemPedidoProveedor,
    ItemPedidoProveedor, QFilterCondition> {}
