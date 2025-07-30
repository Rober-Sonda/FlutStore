// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pedido.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPedidoCollection on Isar {
  IsarCollection<Pedido> get pedidos => this.collection();
}

const PedidoSchema = CollectionSchema(
  name: r'Pedido',
  id: -6371224144056768827,
  properties: {
    r'clienteId': PropertySchema(
      id: 0,
      name: r'clienteId',
      type: IsarType.long,
    ),
    r'descuento': PropertySchema(
      id: 1,
      name: r'descuento',
      type: IsarType.double,
    ),
    r'estado': PropertySchema(
      id: 2,
      name: r'estado',
      type: IsarType.string,
    ),
    r'fecha': PropertySchema(
      id: 3,
      name: r'fecha',
      type: IsarType.dateTime,
    ),
    r'productos': PropertySchema(
      id: 4,
      name: r'productos',
      type: IsarType.longList,
    ),
    r'total': PropertySchema(
      id: 5,
      name: r'total',
      type: IsarType.double,
    )
  },
  estimateSize: _pedidoEstimateSize,
  serialize: _pedidoSerialize,
  deserialize: _pedidoDeserialize,
  deserializeProp: _pedidoDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _pedidoGetId,
  getLinks: _pedidoGetLinks,
  attach: _pedidoAttach,
  version: '3.1.0+1',
);

int _pedidoEstimateSize(
  Pedido object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.estado;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.productos.length * 8;
  return bytesCount;
}

void _pedidoSerialize(
  Pedido object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.clienteId);
  writer.writeDouble(offsets[1], object.descuento);
  writer.writeString(offsets[2], object.estado);
  writer.writeDateTime(offsets[3], object.fecha);
  writer.writeLongList(offsets[4], object.productos);
  writer.writeDouble(offsets[5], object.total);
}

Pedido _pedidoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Pedido();
  object.clienteId = reader.readLongOrNull(offsets[0]);
  object.descuento = reader.readDoubleOrNull(offsets[1]);
  object.estado = reader.readStringOrNull(offsets[2]);
  object.fecha = reader.readDateTimeOrNull(offsets[3]);
  object.id = id;
  object.productos = reader.readLongList(offsets[4]) ?? [];
  object.total = reader.readDoubleOrNull(offsets[5]);
  return object;
}

P _pedidoDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readDoubleOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 4:
      return (reader.readLongList(offset) ?? []) as P;
    case 5:
      return (reader.readDoubleOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _pedidoGetId(Pedido object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _pedidoGetLinks(Pedido object) {
  return [];
}

void _pedidoAttach(IsarCollection<dynamic> col, Id id, Pedido object) {
  object.id = id;
}

extension PedidoQueryWhereSort on QueryBuilder<Pedido, Pedido, QWhere> {
  QueryBuilder<Pedido, Pedido, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PedidoQueryWhere on QueryBuilder<Pedido, Pedido, QWhereClause> {
  QueryBuilder<Pedido, Pedido, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Pedido, Pedido, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Pedido, Pedido, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Pedido, Pedido, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Pedido, Pedido, QAfterWhereClause> idBetween(
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

extension PedidoQueryFilter on QueryBuilder<Pedido, Pedido, QFilterCondition> {
  QueryBuilder<Pedido, Pedido, QAfterFilterCondition> clienteIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'clienteId',
      ));
    });
  }

  QueryBuilder<Pedido, Pedido, QAfterFilterCondition> clienteIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'clienteId',
      ));
    });
  }

  QueryBuilder<Pedido, Pedido, QAfterFilterCondition> clienteIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'clienteId',
        value: value,
      ));
    });
  }

  QueryBuilder<Pedido, Pedido, QAfterFilterCondition> clienteIdGreaterThan(
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

  QueryBuilder<Pedido, Pedido, QAfterFilterCondition> clienteIdLessThan(
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

  QueryBuilder<Pedido, Pedido, QAfterFilterCondition> clienteIdBetween(
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

  QueryBuilder<Pedido, Pedido, QAfterFilterCondition> descuentoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'descuento',
      ));
    });
  }

  QueryBuilder<Pedido, Pedido, QAfterFilterCondition> descuentoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'descuento',
      ));
    });
  }

  QueryBuilder<Pedido, Pedido, QAfterFilterCondition> descuentoEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'descuento',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Pedido, Pedido, QAfterFilterCondition> descuentoGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'descuento',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Pedido, Pedido, QAfterFilterCondition> descuentoLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'descuento',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Pedido, Pedido, QAfterFilterCondition> descuentoBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'descuento',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Pedido, Pedido, QAfterFilterCondition> estadoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'estado',
      ));
    });
  }

  QueryBuilder<Pedido, Pedido, QAfterFilterCondition> estadoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'estado',
      ));
    });
  }

  QueryBuilder<Pedido, Pedido, QAfterFilterCondition> estadoEqualTo(
    String? value, {
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

  QueryBuilder<Pedido, Pedido, QAfterFilterCondition> estadoGreaterThan(
    String? value, {
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

  QueryBuilder<Pedido, Pedido, QAfterFilterCondition> estadoLessThan(
    String? value, {
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

  QueryBuilder<Pedido, Pedido, QAfterFilterCondition> estadoBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<Pedido, Pedido, QAfterFilterCondition> estadoStartsWith(
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

  QueryBuilder<Pedido, Pedido, QAfterFilterCondition> estadoEndsWith(
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

  QueryBuilder<Pedido, Pedido, QAfterFilterCondition> estadoContains(
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

  QueryBuilder<Pedido, Pedido, QAfterFilterCondition> estadoMatches(
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

  QueryBuilder<Pedido, Pedido, QAfterFilterCondition> estadoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estado',
        value: '',
      ));
    });
  }

  QueryBuilder<Pedido, Pedido, QAfterFilterCondition> estadoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'estado',
        value: '',
      ));
    });
  }

  QueryBuilder<Pedido, Pedido, QAfterFilterCondition> fechaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fecha',
      ));
    });
  }

  QueryBuilder<Pedido, Pedido, QAfterFilterCondition> fechaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fecha',
      ));
    });
  }

  QueryBuilder<Pedido, Pedido, QAfterFilterCondition> fechaEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fecha',
        value: value,
      ));
    });
  }

  QueryBuilder<Pedido, Pedido, QAfterFilterCondition> fechaGreaterThan(
    DateTime? value, {
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

  QueryBuilder<Pedido, Pedido, QAfterFilterCondition> fechaLessThan(
    DateTime? value, {
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

  QueryBuilder<Pedido, Pedido, QAfterFilterCondition> fechaBetween(
    DateTime? lower,
    DateTime? upper, {
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

  QueryBuilder<Pedido, Pedido, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Pedido, Pedido, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Pedido, Pedido, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Pedido, Pedido, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Pedido, Pedido, QAfterFilterCondition> productosElementEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'productos',
        value: value,
      ));
    });
  }

  QueryBuilder<Pedido, Pedido, QAfterFilterCondition>
      productosElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'productos',
        value: value,
      ));
    });
  }

  QueryBuilder<Pedido, Pedido, QAfterFilterCondition> productosElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'productos',
        value: value,
      ));
    });
  }

  QueryBuilder<Pedido, Pedido, QAfterFilterCondition> productosElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'productos',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Pedido, Pedido, QAfterFilterCondition> productosLengthEqualTo(
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

  QueryBuilder<Pedido, Pedido, QAfterFilterCondition> productosIsEmpty() {
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

  QueryBuilder<Pedido, Pedido, QAfterFilterCondition> productosIsNotEmpty() {
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

  QueryBuilder<Pedido, Pedido, QAfterFilterCondition> productosLengthLessThan(
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

  QueryBuilder<Pedido, Pedido, QAfterFilterCondition>
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

  QueryBuilder<Pedido, Pedido, QAfterFilterCondition> productosLengthBetween(
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

  QueryBuilder<Pedido, Pedido, QAfterFilterCondition> totalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'total',
      ));
    });
  }

  QueryBuilder<Pedido, Pedido, QAfterFilterCondition> totalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'total',
      ));
    });
  }

  QueryBuilder<Pedido, Pedido, QAfterFilterCondition> totalEqualTo(
    double? value, {
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

  QueryBuilder<Pedido, Pedido, QAfterFilterCondition> totalGreaterThan(
    double? value, {
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

  QueryBuilder<Pedido, Pedido, QAfterFilterCondition> totalLessThan(
    double? value, {
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

  QueryBuilder<Pedido, Pedido, QAfterFilterCondition> totalBetween(
    double? lower,
    double? upper, {
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
}

extension PedidoQueryObject on QueryBuilder<Pedido, Pedido, QFilterCondition> {}

extension PedidoQueryLinks on QueryBuilder<Pedido, Pedido, QFilterCondition> {}

extension PedidoQuerySortBy on QueryBuilder<Pedido, Pedido, QSortBy> {
  QueryBuilder<Pedido, Pedido, QAfterSortBy> sortByClienteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clienteId', Sort.asc);
    });
  }

  QueryBuilder<Pedido, Pedido, QAfterSortBy> sortByClienteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clienteId', Sort.desc);
    });
  }

  QueryBuilder<Pedido, Pedido, QAfterSortBy> sortByDescuento() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descuento', Sort.asc);
    });
  }

  QueryBuilder<Pedido, Pedido, QAfterSortBy> sortByDescuentoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descuento', Sort.desc);
    });
  }

  QueryBuilder<Pedido, Pedido, QAfterSortBy> sortByEstado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.asc);
    });
  }

  QueryBuilder<Pedido, Pedido, QAfterSortBy> sortByEstadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.desc);
    });
  }

  QueryBuilder<Pedido, Pedido, QAfterSortBy> sortByFecha() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fecha', Sort.asc);
    });
  }

  QueryBuilder<Pedido, Pedido, QAfterSortBy> sortByFechaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fecha', Sort.desc);
    });
  }

  QueryBuilder<Pedido, Pedido, QAfterSortBy> sortByTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.asc);
    });
  }

  QueryBuilder<Pedido, Pedido, QAfterSortBy> sortByTotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.desc);
    });
  }
}

extension PedidoQuerySortThenBy on QueryBuilder<Pedido, Pedido, QSortThenBy> {
  QueryBuilder<Pedido, Pedido, QAfterSortBy> thenByClienteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clienteId', Sort.asc);
    });
  }

  QueryBuilder<Pedido, Pedido, QAfterSortBy> thenByClienteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clienteId', Sort.desc);
    });
  }

  QueryBuilder<Pedido, Pedido, QAfterSortBy> thenByDescuento() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descuento', Sort.asc);
    });
  }

  QueryBuilder<Pedido, Pedido, QAfterSortBy> thenByDescuentoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descuento', Sort.desc);
    });
  }

  QueryBuilder<Pedido, Pedido, QAfterSortBy> thenByEstado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.asc);
    });
  }

  QueryBuilder<Pedido, Pedido, QAfterSortBy> thenByEstadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.desc);
    });
  }

  QueryBuilder<Pedido, Pedido, QAfterSortBy> thenByFecha() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fecha', Sort.asc);
    });
  }

  QueryBuilder<Pedido, Pedido, QAfterSortBy> thenByFechaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fecha', Sort.desc);
    });
  }

  QueryBuilder<Pedido, Pedido, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Pedido, Pedido, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Pedido, Pedido, QAfterSortBy> thenByTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.asc);
    });
  }

  QueryBuilder<Pedido, Pedido, QAfterSortBy> thenByTotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.desc);
    });
  }
}

extension PedidoQueryWhereDistinct on QueryBuilder<Pedido, Pedido, QDistinct> {
  QueryBuilder<Pedido, Pedido, QDistinct> distinctByClienteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'clienteId');
    });
  }

  QueryBuilder<Pedido, Pedido, QDistinct> distinctByDescuento() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'descuento');
    });
  }

  QueryBuilder<Pedido, Pedido, QDistinct> distinctByEstado(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estado', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Pedido, Pedido, QDistinct> distinctByFecha() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fecha');
    });
  }

  QueryBuilder<Pedido, Pedido, QDistinct> distinctByProductos() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'productos');
    });
  }

  QueryBuilder<Pedido, Pedido, QDistinct> distinctByTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'total');
    });
  }
}

extension PedidoQueryProperty on QueryBuilder<Pedido, Pedido, QQueryProperty> {
  QueryBuilder<Pedido, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Pedido, int?, QQueryOperations> clienteIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'clienteId');
    });
  }

  QueryBuilder<Pedido, double?, QQueryOperations> descuentoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'descuento');
    });
  }

  QueryBuilder<Pedido, String?, QQueryOperations> estadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estado');
    });
  }

  QueryBuilder<Pedido, DateTime?, QQueryOperations> fechaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fecha');
    });
  }

  QueryBuilder<Pedido, List<int>, QQueryOperations> productosProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'productos');
    });
  }

  QueryBuilder<Pedido, double?, QQueryOperations> totalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'total');
    });
  }
}
