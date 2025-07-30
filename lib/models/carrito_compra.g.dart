// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carrito_compra.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCarritoCompraCollection on Isar {
  IsarCollection<CarritoCompra> get carritoCompras => this.collection();
}

const CarritoCompraSchema = CollectionSchema(
  name: r'CarritoCompra',
  id: 1816738851941709276,
  properties: {
    r'cantidad': PropertySchema(
      id: 0,
      name: r'cantidad',
      type: IsarType.long,
    ),
    r'esUrgente': PropertySchema(
      id: 1,
      name: r'esUrgente',
      type: IsarType.bool,
    ),
    r'estado': PropertySchema(
      id: 2,
      name: r'estado',
      type: IsarType.string,
    ),
    r'fechaAgregado': PropertySchema(
      id: 3,
      name: r'fechaAgregado',
      type: IsarType.dateTime,
    ),
    r'nombreProducto': PropertySchema(
      id: 4,
      name: r'nombreProducto',
      type: IsarType.string,
    ),
    r'nombreProveedor': PropertySchema(
      id: 5,
      name: r'nombreProveedor',
      type: IsarType.string,
    ),
    r'notas': PropertySchema(
      id: 6,
      name: r'notas',
      type: IsarType.string,
    ),
    r'precioTotal': PropertySchema(
      id: 7,
      name: r'precioTotal',
      type: IsarType.double,
    ),
    r'precioUnitario': PropertySchema(
      id: 8,
      name: r'precioUnitario',
      type: IsarType.double,
    ),
    r'productoId': PropertySchema(
      id: 9,
      name: r'productoId',
      type: IsarType.long,
    ),
    r'proveedorId': PropertySchema(
      id: 10,
      name: r'proveedorId',
      type: IsarType.long,
    )
  },
  estimateSize: _carritoCompraEstimateSize,
  serialize: _carritoCompraSerialize,
  deserialize: _carritoCompraDeserialize,
  deserializeProp: _carritoCompraDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _carritoCompraGetId,
  getLinks: _carritoCompraGetLinks,
  attach: _carritoCompraAttach,
  version: '3.1.0+1',
);

int _carritoCompraEstimateSize(
  CarritoCompra object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.estado.length * 3;
  bytesCount += 3 + object.nombreProducto.length * 3;
  {
    final value = object.nombreProveedor;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.notas;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _carritoCompraSerialize(
  CarritoCompra object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.cantidad);
  writer.writeBool(offsets[1], object.esUrgente);
  writer.writeString(offsets[2], object.estado);
  writer.writeDateTime(offsets[3], object.fechaAgregado);
  writer.writeString(offsets[4], object.nombreProducto);
  writer.writeString(offsets[5], object.nombreProveedor);
  writer.writeString(offsets[6], object.notas);
  writer.writeDouble(offsets[7], object.precioTotal);
  writer.writeDouble(offsets[8], object.precioUnitario);
  writer.writeLong(offsets[9], object.productoId);
  writer.writeLong(offsets[10], object.proveedorId);
}

CarritoCompra _carritoCompraDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CarritoCompra();
  object.cantidad = reader.readLong(offsets[0]);
  object.esUrgente = reader.readBool(offsets[1]);
  object.estado = reader.readString(offsets[2]);
  object.fechaAgregado = reader.readDateTime(offsets[3]);
  object.id = id;
  object.nombreProducto = reader.readString(offsets[4]);
  object.nombreProveedor = reader.readStringOrNull(offsets[5]);
  object.notas = reader.readStringOrNull(offsets[6]);
  object.precioTotal = reader.readDoubleOrNull(offsets[7]);
  object.precioUnitario = reader.readDoubleOrNull(offsets[8]);
  object.productoId = reader.readLongOrNull(offsets[9]);
  object.proveedorId = reader.readLongOrNull(offsets[10]);
  return object;
}

P _carritoCompraDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readDoubleOrNull(offset)) as P;
    case 8:
      return (reader.readDoubleOrNull(offset)) as P;
    case 9:
      return (reader.readLongOrNull(offset)) as P;
    case 10:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _carritoCompraGetId(CarritoCompra object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _carritoCompraGetLinks(CarritoCompra object) {
  return [];
}

void _carritoCompraAttach(
    IsarCollection<dynamic> col, Id id, CarritoCompra object) {
  object.id = id;
}

extension CarritoCompraQueryWhereSort
    on QueryBuilder<CarritoCompra, CarritoCompra, QWhere> {
  QueryBuilder<CarritoCompra, CarritoCompra, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CarritoCompraQueryWhere
    on QueryBuilder<CarritoCompra, CarritoCompra, QWhereClause> {
  QueryBuilder<CarritoCompra, CarritoCompra, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterWhereClause> idBetween(
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

extension CarritoCompraQueryFilter
    on QueryBuilder<CarritoCompra, CarritoCompra, QFilterCondition> {
  QueryBuilder<CarritoCompra, CarritoCompra, QAfterFilterCondition>
      cantidadEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cantidad',
        value: value,
      ));
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterFilterCondition>
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

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterFilterCondition>
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

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterFilterCondition>
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

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterFilterCondition>
      esUrgenteEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'esUrgente',
        value: value,
      ));
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterFilterCondition>
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

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterFilterCondition>
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

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterFilterCondition>
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

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterFilterCondition>
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

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterFilterCondition>
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

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterFilterCondition>
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

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterFilterCondition>
      estadoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'estado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterFilterCondition>
      estadoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'estado',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterFilterCondition>
      estadoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estado',
        value: '',
      ));
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterFilterCondition>
      estadoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'estado',
        value: '',
      ));
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterFilterCondition>
      fechaAgregadoEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaAgregado',
        value: value,
      ));
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterFilterCondition>
      fechaAgregadoGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fechaAgregado',
        value: value,
      ));
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterFilterCondition>
      fechaAgregadoLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fechaAgregado',
        value: value,
      ));
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterFilterCondition>
      fechaAgregadoBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fechaAgregado',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterFilterCondition>
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

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterFilterCondition> idBetween(
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

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterFilterCondition>
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

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterFilterCondition>
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

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterFilterCondition>
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

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterFilterCondition>
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

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterFilterCondition>
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

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterFilterCondition>
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

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterFilterCondition>
      nombreProductoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nombreProducto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterFilterCondition>
      nombreProductoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nombreProducto',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterFilterCondition>
      nombreProductoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nombreProducto',
        value: '',
      ));
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterFilterCondition>
      nombreProductoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nombreProducto',
        value: '',
      ));
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterFilterCondition>
      nombreProveedorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nombreProveedor',
      ));
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterFilterCondition>
      nombreProveedorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nombreProveedor',
      ));
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterFilterCondition>
      nombreProveedorEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nombreProveedor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterFilterCondition>
      nombreProveedorGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nombreProveedor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterFilterCondition>
      nombreProveedorLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nombreProveedor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterFilterCondition>
      nombreProveedorBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nombreProveedor',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterFilterCondition>
      nombreProveedorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nombreProveedor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterFilterCondition>
      nombreProveedorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nombreProveedor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterFilterCondition>
      nombreProveedorContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nombreProveedor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterFilterCondition>
      nombreProveedorMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nombreProveedor',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterFilterCondition>
      nombreProveedorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nombreProveedor',
        value: '',
      ));
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterFilterCondition>
      nombreProveedorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nombreProveedor',
        value: '',
      ));
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterFilterCondition>
      notasIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'notas',
      ));
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterFilterCondition>
      notasIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'notas',
      ));
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterFilterCondition>
      notasEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notas',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterFilterCondition>
      notasGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'notas',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterFilterCondition>
      notasLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'notas',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterFilterCondition>
      notasBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'notas',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterFilterCondition>
      notasStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'notas',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterFilterCondition>
      notasEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'notas',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterFilterCondition>
      notasContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'notas',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterFilterCondition>
      notasMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'notas',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterFilterCondition>
      notasIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notas',
        value: '',
      ));
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterFilterCondition>
      notasIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notas',
        value: '',
      ));
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterFilterCondition>
      precioTotalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'precioTotal',
      ));
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterFilterCondition>
      precioTotalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'precioTotal',
      ));
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterFilterCondition>
      precioTotalEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'precioTotal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterFilterCondition>
      precioTotalGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'precioTotal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterFilterCondition>
      precioTotalLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'precioTotal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterFilterCondition>
      precioTotalBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'precioTotal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterFilterCondition>
      precioUnitarioIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'precioUnitario',
      ));
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterFilterCondition>
      precioUnitarioIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'precioUnitario',
      ));
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterFilterCondition>
      precioUnitarioEqualTo(
    double? value, {
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

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterFilterCondition>
      precioUnitarioGreaterThan(
    double? value, {
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

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterFilterCondition>
      precioUnitarioLessThan(
    double? value, {
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

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterFilterCondition>
      precioUnitarioBetween(
    double? lower,
    double? upper, {
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

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterFilterCondition>
      productoIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'productoId',
      ));
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterFilterCondition>
      productoIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'productoId',
      ));
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterFilterCondition>
      productoIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'productoId',
        value: value,
      ));
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterFilterCondition>
      productoIdGreaterThan(
    int? value, {
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

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterFilterCondition>
      productoIdLessThan(
    int? value, {
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

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterFilterCondition>
      productoIdBetween(
    int? lower,
    int? upper, {
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

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterFilterCondition>
      proveedorIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'proveedorId',
      ));
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterFilterCondition>
      proveedorIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'proveedorId',
      ));
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterFilterCondition>
      proveedorIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'proveedorId',
        value: value,
      ));
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterFilterCondition>
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

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterFilterCondition>
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

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterFilterCondition>
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
}

extension CarritoCompraQueryObject
    on QueryBuilder<CarritoCompra, CarritoCompra, QFilterCondition> {}

extension CarritoCompraQueryLinks
    on QueryBuilder<CarritoCompra, CarritoCompra, QFilterCondition> {}

extension CarritoCompraQuerySortBy
    on QueryBuilder<CarritoCompra, CarritoCompra, QSortBy> {
  QueryBuilder<CarritoCompra, CarritoCompra, QAfterSortBy> sortByCantidad() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cantidad', Sort.asc);
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterSortBy>
      sortByCantidadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cantidad', Sort.desc);
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterSortBy> sortByEsUrgente() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esUrgente', Sort.asc);
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterSortBy>
      sortByEsUrgenteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esUrgente', Sort.desc);
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterSortBy> sortByEstado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.asc);
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterSortBy> sortByEstadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.desc);
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterSortBy>
      sortByFechaAgregado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaAgregado', Sort.asc);
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterSortBy>
      sortByFechaAgregadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaAgregado', Sort.desc);
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterSortBy>
      sortByNombreProducto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombreProducto', Sort.asc);
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterSortBy>
      sortByNombreProductoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombreProducto', Sort.desc);
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterSortBy>
      sortByNombreProveedor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombreProveedor', Sort.asc);
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterSortBy>
      sortByNombreProveedorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombreProveedor', Sort.desc);
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterSortBy> sortByNotas() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notas', Sort.asc);
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterSortBy> sortByNotasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notas', Sort.desc);
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterSortBy> sortByPrecioTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precioTotal', Sort.asc);
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterSortBy>
      sortByPrecioTotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precioTotal', Sort.desc);
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterSortBy>
      sortByPrecioUnitario() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precioUnitario', Sort.asc);
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterSortBy>
      sortByPrecioUnitarioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precioUnitario', Sort.desc);
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterSortBy> sortByProductoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productoId', Sort.asc);
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterSortBy>
      sortByProductoIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productoId', Sort.desc);
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterSortBy> sortByProveedorId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proveedorId', Sort.asc);
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterSortBy>
      sortByProveedorIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proveedorId', Sort.desc);
    });
  }
}

extension CarritoCompraQuerySortThenBy
    on QueryBuilder<CarritoCompra, CarritoCompra, QSortThenBy> {
  QueryBuilder<CarritoCompra, CarritoCompra, QAfterSortBy> thenByCantidad() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cantidad', Sort.asc);
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterSortBy>
      thenByCantidadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cantidad', Sort.desc);
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterSortBy> thenByEsUrgente() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esUrgente', Sort.asc);
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterSortBy>
      thenByEsUrgenteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esUrgente', Sort.desc);
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterSortBy> thenByEstado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.asc);
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterSortBy> thenByEstadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.desc);
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterSortBy>
      thenByFechaAgregado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaAgregado', Sort.asc);
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterSortBy>
      thenByFechaAgregadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaAgregado', Sort.desc);
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterSortBy>
      thenByNombreProducto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombreProducto', Sort.asc);
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterSortBy>
      thenByNombreProductoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombreProducto', Sort.desc);
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterSortBy>
      thenByNombreProveedor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombreProveedor', Sort.asc);
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterSortBy>
      thenByNombreProveedorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombreProveedor', Sort.desc);
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterSortBy> thenByNotas() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notas', Sort.asc);
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterSortBy> thenByNotasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notas', Sort.desc);
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterSortBy> thenByPrecioTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precioTotal', Sort.asc);
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterSortBy>
      thenByPrecioTotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precioTotal', Sort.desc);
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterSortBy>
      thenByPrecioUnitario() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precioUnitario', Sort.asc);
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterSortBy>
      thenByPrecioUnitarioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precioUnitario', Sort.desc);
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterSortBy> thenByProductoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productoId', Sort.asc);
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterSortBy>
      thenByProductoIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productoId', Sort.desc);
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterSortBy> thenByProveedorId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proveedorId', Sort.asc);
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QAfterSortBy>
      thenByProveedorIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proveedorId', Sort.desc);
    });
  }
}

extension CarritoCompraQueryWhereDistinct
    on QueryBuilder<CarritoCompra, CarritoCompra, QDistinct> {
  QueryBuilder<CarritoCompra, CarritoCompra, QDistinct> distinctByCantidad() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cantidad');
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QDistinct> distinctByEsUrgente() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'esUrgente');
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QDistinct> distinctByEstado(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estado', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QDistinct>
      distinctByFechaAgregado() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaAgregado');
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QDistinct>
      distinctByNombreProducto({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nombreProducto',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QDistinct>
      distinctByNombreProveedor({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nombreProveedor',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QDistinct> distinctByNotas(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notas', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QDistinct>
      distinctByPrecioTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'precioTotal');
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QDistinct>
      distinctByPrecioUnitario() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'precioUnitario');
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QDistinct> distinctByProductoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'productoId');
    });
  }

  QueryBuilder<CarritoCompra, CarritoCompra, QDistinct>
      distinctByProveedorId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'proveedorId');
    });
  }
}

extension CarritoCompraQueryProperty
    on QueryBuilder<CarritoCompra, CarritoCompra, QQueryProperty> {
  QueryBuilder<CarritoCompra, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CarritoCompra, int, QQueryOperations> cantidadProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cantidad');
    });
  }

  QueryBuilder<CarritoCompra, bool, QQueryOperations> esUrgenteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'esUrgente');
    });
  }

  QueryBuilder<CarritoCompra, String, QQueryOperations> estadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estado');
    });
  }

  QueryBuilder<CarritoCompra, DateTime, QQueryOperations>
      fechaAgregadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaAgregado');
    });
  }

  QueryBuilder<CarritoCompra, String, QQueryOperations>
      nombreProductoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nombreProducto');
    });
  }

  QueryBuilder<CarritoCompra, String?, QQueryOperations>
      nombreProveedorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nombreProveedor');
    });
  }

  QueryBuilder<CarritoCompra, String?, QQueryOperations> notasProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notas');
    });
  }

  QueryBuilder<CarritoCompra, double?, QQueryOperations> precioTotalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'precioTotal');
    });
  }

  QueryBuilder<CarritoCompra, double?, QQueryOperations>
      precioUnitarioProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'precioUnitario');
    });
  }

  QueryBuilder<CarritoCompra, int?, QQueryOperations> productoIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'productoId');
    });
  }

  QueryBuilder<CarritoCompra, int?, QQueryOperations> proveedorIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'proveedorId');
    });
  }
}
