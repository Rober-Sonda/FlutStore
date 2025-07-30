// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'producto_proveedor.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetProductoProveedorCollection on Isar {
  IsarCollection<ProductoProveedor> get productoProveedors => this.collection();
}

const ProductoProveedorSchema = CollectionSchema(
  name: r'ProductoProveedor',
  id: -3739553084913032690,
  properties: {
    r'codigoProveedor': PropertySchema(
      id: 0,
      name: r'codigoProveedor',
      type: IsarType.string,
    ),
    r'esProveedorPorDefecto': PropertySchema(
      id: 1,
      name: r'esProveedorPorDefecto',
      type: IsarType.bool,
    ),
    r'estaDisponible': PropertySchema(
      id: 2,
      name: r'estaDisponible',
      type: IsarType.bool,
    ),
    r'estadoStock': PropertySchema(
      id: 3,
      name: r'estadoStock',
      type: IsarType.string,
    ),
    r'fechaActualizacion': PropertySchema(
      id: 4,
      name: r'fechaActualizacion',
      type: IsarType.dateTime,
    ),
    r'fechaCreacion': PropertySchema(
      id: 5,
      name: r'fechaCreacion',
      type: IsarType.dateTime,
    ),
    r'observaciones': PropertySchema(
      id: 6,
      name: r'observaciones',
      type: IsarType.string,
    ),
    r'precioFormateado': PropertySchema(
      id: 7,
      name: r'precioFormateado',
      type: IsarType.string,
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
    ),
    r'stockDisponible': PropertySchema(
      id: 11,
      name: r'stockDisponible',
      type: IsarType.long,
    ),
    r'stockFormateado': PropertySchema(
      id: 12,
      name: r'stockFormateado',
      type: IsarType.string,
    )
  },
  estimateSize: _productoProveedorEstimateSize,
  serialize: _productoProveedorSerialize,
  deserialize: _productoProveedorDeserialize,
  deserializeProp: _productoProveedorDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _productoProveedorGetId,
  getLinks: _productoProveedorGetLinks,
  attach: _productoProveedorAttach,
  version: '3.1.0+1',
);

int _productoProveedorEstimateSize(
  ProductoProveedor object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.codigoProveedor;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.estadoStock.length * 3;
  {
    final value = object.observaciones;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.precioFormateado.length * 3;
  bytesCount += 3 + object.stockFormateado.length * 3;
  return bytesCount;
}

void _productoProveedorSerialize(
  ProductoProveedor object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.codigoProveedor);
  writer.writeBool(offsets[1], object.esProveedorPorDefecto);
  writer.writeBool(offsets[2], object.estaDisponible);
  writer.writeString(offsets[3], object.estadoStock);
  writer.writeDateTime(offsets[4], object.fechaActualizacion);
  writer.writeDateTime(offsets[5], object.fechaCreacion);
  writer.writeString(offsets[6], object.observaciones);
  writer.writeString(offsets[7], object.precioFormateado);
  writer.writeDouble(offsets[8], object.precioUnitario);
  writer.writeLong(offsets[9], object.productoId);
  writer.writeLong(offsets[10], object.proveedorId);
  writer.writeLong(offsets[11], object.stockDisponible);
  writer.writeString(offsets[12], object.stockFormateado);
}

ProductoProveedor _productoProveedorDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ProductoProveedor(
    codigoProveedor: reader.readStringOrNull(offsets[0]),
    esProveedorPorDefecto: reader.readBoolOrNull(offsets[1]) ?? false,
    observaciones: reader.readStringOrNull(offsets[6]),
    precioUnitario: reader.readDoubleOrNull(offsets[8]),
    productoId: reader.readLong(offsets[9]),
    proveedorId: reader.readLong(offsets[10]),
    stockDisponible: reader.readLongOrNull(offsets[11]),
  );
  object.fechaActualizacion = reader.readDateTimeOrNull(offsets[4]);
  object.fechaCreacion = reader.readDateTime(offsets[5]);
  object.id = id;
  return object;
}

P _productoProveedorDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 5:
      return (reader.readDateTime(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readDoubleOrNull(offset)) as P;
    case 9:
      return (reader.readLong(offset)) as P;
    case 10:
      return (reader.readLong(offset)) as P;
    case 11:
      return (reader.readLongOrNull(offset)) as P;
    case 12:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _productoProveedorGetId(ProductoProveedor object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _productoProveedorGetLinks(
    ProductoProveedor object) {
  return [];
}

void _productoProveedorAttach(
    IsarCollection<dynamic> col, Id id, ProductoProveedor object) {
  object.id = id;
}

extension ProductoProveedorQueryWhereSort
    on QueryBuilder<ProductoProveedor, ProductoProveedor, QWhere> {
  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ProductoProveedorQueryWhere
    on QueryBuilder<ProductoProveedor, ProductoProveedor, QWhereClause> {
  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterWhereClause>
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

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterWhereClause>
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

extension ProductoProveedorQueryFilter
    on QueryBuilder<ProductoProveedor, ProductoProveedor, QFilterCondition> {
  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
      codigoProveedorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'codigoProveedor',
      ));
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
      codigoProveedorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'codigoProveedor',
      ));
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
      codigoProveedorEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'codigoProveedor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
      codigoProveedorGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'codigoProveedor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
      codigoProveedorLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'codigoProveedor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
      codigoProveedorBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'codigoProveedor',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
      codigoProveedorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'codigoProveedor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
      codigoProveedorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'codigoProveedor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
      codigoProveedorContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'codigoProveedor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
      codigoProveedorMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'codigoProveedor',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
      codigoProveedorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'codigoProveedor',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
      codigoProveedorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'codigoProveedor',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
      esProveedorPorDefectoEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'esProveedorPorDefecto',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
      estaDisponibleEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estaDisponible',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
      estadoStockEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estadoStock',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
      estadoStockGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'estadoStock',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
      estadoStockLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'estadoStock',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
      estadoStockBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'estadoStock',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
      estadoStockStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'estadoStock',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
      estadoStockEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'estadoStock',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
      estadoStockContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'estadoStock',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
      estadoStockMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'estadoStock',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
      estadoStockIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estadoStock',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
      estadoStockIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'estadoStock',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
      fechaActualizacionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fechaActualizacion',
      ));
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
      fechaActualizacionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fechaActualizacion',
      ));
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
      fechaActualizacionEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaActualizacion',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
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

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
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

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
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

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
      fechaCreacionEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaCreacion',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
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

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
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

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
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

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
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

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
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

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
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

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
      observacionesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'observaciones',
      ));
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
      observacionesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'observaciones',
      ));
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
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

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
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

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
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

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
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

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
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

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
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

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
      observacionesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'observaciones',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
      observacionesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'observaciones',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
      observacionesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'observaciones',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
      observacionesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'observaciones',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
      precioFormateadoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'precioFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
      precioFormateadoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'precioFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
      precioFormateadoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'precioFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
      precioFormateadoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'precioFormateado',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
      precioFormateadoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'precioFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
      precioFormateadoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'precioFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
      precioFormateadoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'precioFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
      precioFormateadoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'precioFormateado',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
      precioFormateadoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'precioFormateado',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
      precioFormateadoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'precioFormateado',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
      precioUnitarioIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'precioUnitario',
      ));
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
      precioUnitarioIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'precioUnitario',
      ));
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
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

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
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

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
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

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
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

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
      productoIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'productoId',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
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

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
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

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
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

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
      proveedorIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'proveedorId',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
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

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
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

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
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

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
      stockDisponibleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'stockDisponible',
      ));
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
      stockDisponibleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'stockDisponible',
      ));
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
      stockDisponibleEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stockDisponible',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
      stockDisponibleGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'stockDisponible',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
      stockDisponibleLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'stockDisponible',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
      stockDisponibleBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'stockDisponible',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
      stockFormateadoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stockFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
      stockFormateadoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'stockFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
      stockFormateadoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'stockFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
      stockFormateadoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'stockFormateado',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
      stockFormateadoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'stockFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
      stockFormateadoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'stockFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
      stockFormateadoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'stockFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
      stockFormateadoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'stockFormateado',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
      stockFormateadoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stockFormateado',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterFilterCondition>
      stockFormateadoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'stockFormateado',
        value: '',
      ));
    });
  }
}

extension ProductoProveedorQueryObject
    on QueryBuilder<ProductoProveedor, ProductoProveedor, QFilterCondition> {}

extension ProductoProveedorQueryLinks
    on QueryBuilder<ProductoProveedor, ProductoProveedor, QFilterCondition> {}

extension ProductoProveedorQuerySortBy
    on QueryBuilder<ProductoProveedor, ProductoProveedor, QSortBy> {
  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterSortBy>
      sortByCodigoProveedor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'codigoProveedor', Sort.asc);
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterSortBy>
      sortByCodigoProveedorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'codigoProveedor', Sort.desc);
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterSortBy>
      sortByEsProveedorPorDefecto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esProveedorPorDefecto', Sort.asc);
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterSortBy>
      sortByEsProveedorPorDefectoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esProveedorPorDefecto', Sort.desc);
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterSortBy>
      sortByEstaDisponible() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estaDisponible', Sort.asc);
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterSortBy>
      sortByEstaDisponibleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estaDisponible', Sort.desc);
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterSortBy>
      sortByEstadoStock() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estadoStock', Sort.asc);
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterSortBy>
      sortByEstadoStockDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estadoStock', Sort.desc);
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterSortBy>
      sortByFechaActualizacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaActualizacion', Sort.asc);
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterSortBy>
      sortByFechaActualizacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaActualizacion', Sort.desc);
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterSortBy>
      sortByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.asc);
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterSortBy>
      sortByFechaCreacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.desc);
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterSortBy>
      sortByObservaciones() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observaciones', Sort.asc);
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterSortBy>
      sortByObservacionesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observaciones', Sort.desc);
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterSortBy>
      sortByPrecioFormateado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precioFormateado', Sort.asc);
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterSortBy>
      sortByPrecioFormateadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precioFormateado', Sort.desc);
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterSortBy>
      sortByPrecioUnitario() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precioUnitario', Sort.asc);
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterSortBy>
      sortByPrecioUnitarioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precioUnitario', Sort.desc);
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterSortBy>
      sortByProductoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productoId', Sort.asc);
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterSortBy>
      sortByProductoIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productoId', Sort.desc);
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterSortBy>
      sortByProveedorId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proveedorId', Sort.asc);
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterSortBy>
      sortByProveedorIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proveedorId', Sort.desc);
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterSortBy>
      sortByStockDisponible() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stockDisponible', Sort.asc);
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterSortBy>
      sortByStockDisponibleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stockDisponible', Sort.desc);
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterSortBy>
      sortByStockFormateado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stockFormateado', Sort.asc);
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterSortBy>
      sortByStockFormateadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stockFormateado', Sort.desc);
    });
  }
}

extension ProductoProveedorQuerySortThenBy
    on QueryBuilder<ProductoProveedor, ProductoProveedor, QSortThenBy> {
  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterSortBy>
      thenByCodigoProveedor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'codigoProveedor', Sort.asc);
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterSortBy>
      thenByCodigoProveedorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'codigoProveedor', Sort.desc);
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterSortBy>
      thenByEsProveedorPorDefecto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esProveedorPorDefecto', Sort.asc);
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterSortBy>
      thenByEsProveedorPorDefectoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esProveedorPorDefecto', Sort.desc);
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterSortBy>
      thenByEstaDisponible() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estaDisponible', Sort.asc);
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterSortBy>
      thenByEstaDisponibleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estaDisponible', Sort.desc);
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterSortBy>
      thenByEstadoStock() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estadoStock', Sort.asc);
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterSortBy>
      thenByEstadoStockDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estadoStock', Sort.desc);
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterSortBy>
      thenByFechaActualizacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaActualizacion', Sort.asc);
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterSortBy>
      thenByFechaActualizacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaActualizacion', Sort.desc);
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterSortBy>
      thenByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.asc);
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterSortBy>
      thenByFechaCreacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.desc);
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterSortBy>
      thenByObservaciones() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observaciones', Sort.asc);
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterSortBy>
      thenByObservacionesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observaciones', Sort.desc);
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterSortBy>
      thenByPrecioFormateado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precioFormateado', Sort.asc);
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterSortBy>
      thenByPrecioFormateadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precioFormateado', Sort.desc);
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterSortBy>
      thenByPrecioUnitario() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precioUnitario', Sort.asc);
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterSortBy>
      thenByPrecioUnitarioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precioUnitario', Sort.desc);
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterSortBy>
      thenByProductoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productoId', Sort.asc);
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterSortBy>
      thenByProductoIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productoId', Sort.desc);
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterSortBy>
      thenByProveedorId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proveedorId', Sort.asc);
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterSortBy>
      thenByProveedorIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proveedorId', Sort.desc);
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterSortBy>
      thenByStockDisponible() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stockDisponible', Sort.asc);
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterSortBy>
      thenByStockDisponibleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stockDisponible', Sort.desc);
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterSortBy>
      thenByStockFormateado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stockFormateado', Sort.asc);
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QAfterSortBy>
      thenByStockFormateadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stockFormateado', Sort.desc);
    });
  }
}

extension ProductoProveedorQueryWhereDistinct
    on QueryBuilder<ProductoProveedor, ProductoProveedor, QDistinct> {
  QueryBuilder<ProductoProveedor, ProductoProveedor, QDistinct>
      distinctByCodigoProveedor({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'codigoProveedor',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QDistinct>
      distinctByEsProveedorPorDefecto() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'esProveedorPorDefecto');
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QDistinct>
      distinctByEstaDisponible() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estaDisponible');
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QDistinct>
      distinctByEstadoStock({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estadoStock', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QDistinct>
      distinctByFechaActualizacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaActualizacion');
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QDistinct>
      distinctByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaCreacion');
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QDistinct>
      distinctByObservaciones({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'observaciones',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QDistinct>
      distinctByPrecioFormateado({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'precioFormateado',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QDistinct>
      distinctByPrecioUnitario() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'precioUnitario');
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QDistinct>
      distinctByProductoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'productoId');
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QDistinct>
      distinctByProveedorId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'proveedorId');
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QDistinct>
      distinctByStockDisponible() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stockDisponible');
    });
  }

  QueryBuilder<ProductoProveedor, ProductoProveedor, QDistinct>
      distinctByStockFormateado({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stockFormateado',
          caseSensitive: caseSensitive);
    });
  }
}

extension ProductoProveedorQueryProperty
    on QueryBuilder<ProductoProveedor, ProductoProveedor, QQueryProperty> {
  QueryBuilder<ProductoProveedor, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ProductoProveedor, String?, QQueryOperations>
      codigoProveedorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'codigoProveedor');
    });
  }

  QueryBuilder<ProductoProveedor, bool, QQueryOperations>
      esProveedorPorDefectoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'esProveedorPorDefecto');
    });
  }

  QueryBuilder<ProductoProveedor, bool, QQueryOperations>
      estaDisponibleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estaDisponible');
    });
  }

  QueryBuilder<ProductoProveedor, String, QQueryOperations>
      estadoStockProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estadoStock');
    });
  }

  QueryBuilder<ProductoProveedor, DateTime?, QQueryOperations>
      fechaActualizacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaActualizacion');
    });
  }

  QueryBuilder<ProductoProveedor, DateTime, QQueryOperations>
      fechaCreacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaCreacion');
    });
  }

  QueryBuilder<ProductoProveedor, String?, QQueryOperations>
      observacionesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'observaciones');
    });
  }

  QueryBuilder<ProductoProveedor, String, QQueryOperations>
      precioFormateadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'precioFormateado');
    });
  }

  QueryBuilder<ProductoProveedor, double?, QQueryOperations>
      precioUnitarioProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'precioUnitario');
    });
  }

  QueryBuilder<ProductoProveedor, int, QQueryOperations> productoIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'productoId');
    });
  }

  QueryBuilder<ProductoProveedor, int, QQueryOperations> proveedorIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'proveedorId');
    });
  }

  QueryBuilder<ProductoProveedor, int?, QQueryOperations>
      stockDisponibleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stockDisponible');
    });
  }

  QueryBuilder<ProductoProveedor, String, QQueryOperations>
      stockFormateadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stockFormateado');
    });
  }
}
