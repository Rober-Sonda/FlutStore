// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'producto.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetProductoCollection on Isar {
  IsarCollection<Producto> get productos => this.collection();
}

const ProductoSchema = CollectionSchema(
  name: r'Producto',
  id: -5697193943419826423,
  properties: {
    r'categoriaId': PropertySchema(
      id: 0,
      name: r'categoriaId',
      type: IsarType.long,
    ),
    r'imagenPrincipal': PropertySchema(
      id: 1,
      name: r'imagenPrincipal',
      type: IsarType.string,
    ),
    r'imagenPrincipalOpcional': PropertySchema(
      id: 2,
      name: r'imagenPrincipalOpcional',
      type: IsarType.string,
    ),
    r'imagenes': PropertySchema(
      id: 3,
      name: r'imagenes',
      type: IsarType.stringList,
    ),
    r'nombre': PropertySchema(
      id: 4,
      name: r'nombre',
      type: IsarType.string,
    ),
    r'precio': PropertySchema(
      id: 5,
      name: r'precio',
      type: IsarType.double,
    ),
    r'stock': PropertySchema(
      id: 6,
      name: r'stock',
      type: IsarType.long,
    ),
    r'valoresPropiedades': PropertySchema(
      id: 7,
      name: r'valoresPropiedades',
      type: IsarType.objectList,
      target: r'ValorPropiedadProducto',
    )
  },
  estimateSize: _productoEstimateSize,
  serialize: _productoSerialize,
  deserialize: _productoDeserialize,
  deserializeProp: _productoDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {r'ValorPropiedadProducto': ValorPropiedadProductoSchema},
  getId: _productoGetId,
  getLinks: _productoGetLinks,
  attach: _productoAttach,
  version: '3.1.0+1',
);

int _productoEstimateSize(
  Producto object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.imagenPrincipal;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.imagenPrincipalOpcional;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.imagenes.length * 3;
  {
    for (var i = 0; i < object.imagenes.length; i++) {
      final value = object.imagenes[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.nombre.length * 3;
  bytesCount += 3 + object.valoresPropiedades.length * 3;
  {
    final offsets = allOffsets[ValorPropiedadProducto]!;
    for (var i = 0; i < object.valoresPropiedades.length; i++) {
      final value = object.valoresPropiedades[i];
      bytesCount +=
          ValorPropiedadProductoSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  return bytesCount;
}

void _productoSerialize(
  Producto object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.categoriaId);
  writer.writeString(offsets[1], object.imagenPrincipal);
  writer.writeString(offsets[2], object.imagenPrincipalOpcional);
  writer.writeStringList(offsets[3], object.imagenes);
  writer.writeString(offsets[4], object.nombre);
  writer.writeDouble(offsets[5], object.precio);
  writer.writeLong(offsets[6], object.stock);
  writer.writeObjectList<ValorPropiedadProducto>(
    offsets[7],
    allOffsets,
    ValorPropiedadProductoSchema.serialize,
    object.valoresPropiedades,
  );
}

Producto _productoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Producto();
  object.categoriaId = reader.readLongOrNull(offsets[0]);
  object.id = id;
  object.imagenPrincipal = reader.readStringOrNull(offsets[1]);
  object.imagenes = reader.readStringList(offsets[3]) ?? [];
  object.nombre = reader.readString(offsets[4]);
  object.precio = reader.readDoubleOrNull(offsets[5]);
  object.stock = reader.readLongOrNull(offsets[6]);
  object.valoresPropiedades = reader.readObjectList<ValorPropiedadProducto>(
        offsets[7],
        ValorPropiedadProductoSchema.deserialize,
        allOffsets,
        ValorPropiedadProducto(),
      ) ??
      [];
  return object;
}

P _productoDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringList(offset) ?? []) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readDoubleOrNull(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    case 7:
      return (reader.readObjectList<ValorPropiedadProducto>(
            offset,
            ValorPropiedadProductoSchema.deserialize,
            allOffsets,
            ValorPropiedadProducto(),
          ) ??
          []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _productoGetId(Producto object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _productoGetLinks(Producto object) {
  return [];
}

void _productoAttach(IsarCollection<dynamic> col, Id id, Producto object) {
  object.id = id;
}

extension ProductoQueryWhereSort on QueryBuilder<Producto, Producto, QWhere> {
  QueryBuilder<Producto, Producto, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ProductoQueryWhere on QueryBuilder<Producto, Producto, QWhereClause> {
  QueryBuilder<Producto, Producto, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Producto, Producto, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Producto, Producto, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Producto, Producto, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Producto, Producto, QAfterWhereClause> idBetween(
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

extension ProductoQueryFilter
    on QueryBuilder<Producto, Producto, QFilterCondition> {
  QueryBuilder<Producto, Producto, QAfterFilterCondition> categoriaIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'categoriaId',
      ));
    });
  }

  QueryBuilder<Producto, Producto, QAfterFilterCondition>
      categoriaIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'categoriaId',
      ));
    });
  }

  QueryBuilder<Producto, Producto, QAfterFilterCondition> categoriaIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'categoriaId',
        value: value,
      ));
    });
  }

  QueryBuilder<Producto, Producto, QAfterFilterCondition>
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

  QueryBuilder<Producto, Producto, QAfterFilterCondition> categoriaIdLessThan(
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

  QueryBuilder<Producto, Producto, QAfterFilterCondition> categoriaIdBetween(
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

  QueryBuilder<Producto, Producto, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Producto, Producto, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Producto, Producto, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Producto, Producto, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Producto, Producto, QAfterFilterCondition>
      imagenPrincipalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'imagenPrincipal',
      ));
    });
  }

  QueryBuilder<Producto, Producto, QAfterFilterCondition>
      imagenPrincipalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'imagenPrincipal',
      ));
    });
  }

  QueryBuilder<Producto, Producto, QAfterFilterCondition>
      imagenPrincipalEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imagenPrincipal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Producto, Producto, QAfterFilterCondition>
      imagenPrincipalGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'imagenPrincipal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Producto, Producto, QAfterFilterCondition>
      imagenPrincipalLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'imagenPrincipal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Producto, Producto, QAfterFilterCondition>
      imagenPrincipalBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'imagenPrincipal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Producto, Producto, QAfterFilterCondition>
      imagenPrincipalStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'imagenPrincipal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Producto, Producto, QAfterFilterCondition>
      imagenPrincipalEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'imagenPrincipal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Producto, Producto, QAfterFilterCondition>
      imagenPrincipalContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'imagenPrincipal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Producto, Producto, QAfterFilterCondition>
      imagenPrincipalMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'imagenPrincipal',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Producto, Producto, QAfterFilterCondition>
      imagenPrincipalIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imagenPrincipal',
        value: '',
      ));
    });
  }

  QueryBuilder<Producto, Producto, QAfterFilterCondition>
      imagenPrincipalIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'imagenPrincipal',
        value: '',
      ));
    });
  }

  QueryBuilder<Producto, Producto, QAfterFilterCondition>
      imagenPrincipalOpcionalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'imagenPrincipalOpcional',
      ));
    });
  }

  QueryBuilder<Producto, Producto, QAfterFilterCondition>
      imagenPrincipalOpcionalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'imagenPrincipalOpcional',
      ));
    });
  }

  QueryBuilder<Producto, Producto, QAfterFilterCondition>
      imagenPrincipalOpcionalEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imagenPrincipalOpcional',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Producto, Producto, QAfterFilterCondition>
      imagenPrincipalOpcionalGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'imagenPrincipalOpcional',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Producto, Producto, QAfterFilterCondition>
      imagenPrincipalOpcionalLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'imagenPrincipalOpcional',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Producto, Producto, QAfterFilterCondition>
      imagenPrincipalOpcionalBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'imagenPrincipalOpcional',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Producto, Producto, QAfterFilterCondition>
      imagenPrincipalOpcionalStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'imagenPrincipalOpcional',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Producto, Producto, QAfterFilterCondition>
      imagenPrincipalOpcionalEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'imagenPrincipalOpcional',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Producto, Producto, QAfterFilterCondition>
      imagenPrincipalOpcionalContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'imagenPrincipalOpcional',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Producto, Producto, QAfterFilterCondition>
      imagenPrincipalOpcionalMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'imagenPrincipalOpcional',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Producto, Producto, QAfterFilterCondition>
      imagenPrincipalOpcionalIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imagenPrincipalOpcional',
        value: '',
      ));
    });
  }

  QueryBuilder<Producto, Producto, QAfterFilterCondition>
      imagenPrincipalOpcionalIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'imagenPrincipalOpcional',
        value: '',
      ));
    });
  }

  QueryBuilder<Producto, Producto, QAfterFilterCondition>
      imagenesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imagenes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Producto, Producto, QAfterFilterCondition>
      imagenesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'imagenes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Producto, Producto, QAfterFilterCondition>
      imagenesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'imagenes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Producto, Producto, QAfterFilterCondition>
      imagenesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'imagenes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Producto, Producto, QAfterFilterCondition>
      imagenesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'imagenes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Producto, Producto, QAfterFilterCondition>
      imagenesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'imagenes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Producto, Producto, QAfterFilterCondition>
      imagenesElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'imagenes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Producto, Producto, QAfterFilterCondition>
      imagenesElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'imagenes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Producto, Producto, QAfterFilterCondition>
      imagenesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imagenes',
        value: '',
      ));
    });
  }

  QueryBuilder<Producto, Producto, QAfterFilterCondition>
      imagenesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'imagenes',
        value: '',
      ));
    });
  }

  QueryBuilder<Producto, Producto, QAfterFilterCondition> imagenesLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'imagenes',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Producto, Producto, QAfterFilterCondition> imagenesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'imagenes',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Producto, Producto, QAfterFilterCondition> imagenesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'imagenes',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Producto, Producto, QAfterFilterCondition>
      imagenesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'imagenes',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Producto, Producto, QAfterFilterCondition>
      imagenesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'imagenes',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Producto, Producto, QAfterFilterCondition> imagenesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'imagenes',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Producto, Producto, QAfterFilterCondition> nombreEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Producto, Producto, QAfterFilterCondition> nombreGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Producto, Producto, QAfterFilterCondition> nombreLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Producto, Producto, QAfterFilterCondition> nombreBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nombre',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Producto, Producto, QAfterFilterCondition> nombreStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Producto, Producto, QAfterFilterCondition> nombreEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Producto, Producto, QAfterFilterCondition> nombreContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Producto, Producto, QAfterFilterCondition> nombreMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nombre',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Producto, Producto, QAfterFilterCondition> nombreIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nombre',
        value: '',
      ));
    });
  }

  QueryBuilder<Producto, Producto, QAfterFilterCondition> nombreIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nombre',
        value: '',
      ));
    });
  }

  QueryBuilder<Producto, Producto, QAfterFilterCondition> precioIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'precio',
      ));
    });
  }

  QueryBuilder<Producto, Producto, QAfterFilterCondition> precioIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'precio',
      ));
    });
  }

  QueryBuilder<Producto, Producto, QAfterFilterCondition> precioEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'precio',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Producto, Producto, QAfterFilterCondition> precioGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'precio',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Producto, Producto, QAfterFilterCondition> precioLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'precio',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Producto, Producto, QAfterFilterCondition> precioBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'precio',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Producto, Producto, QAfterFilterCondition> stockIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'stock',
      ));
    });
  }

  QueryBuilder<Producto, Producto, QAfterFilterCondition> stockIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'stock',
      ));
    });
  }

  QueryBuilder<Producto, Producto, QAfterFilterCondition> stockEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stock',
        value: value,
      ));
    });
  }

  QueryBuilder<Producto, Producto, QAfterFilterCondition> stockGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'stock',
        value: value,
      ));
    });
  }

  QueryBuilder<Producto, Producto, QAfterFilterCondition> stockLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'stock',
        value: value,
      ));
    });
  }

  QueryBuilder<Producto, Producto, QAfterFilterCondition> stockBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'stock',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Producto, Producto, QAfterFilterCondition>
      valoresPropiedadesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'valoresPropiedades',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Producto, Producto, QAfterFilterCondition>
      valoresPropiedadesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'valoresPropiedades',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Producto, Producto, QAfterFilterCondition>
      valoresPropiedadesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'valoresPropiedades',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Producto, Producto, QAfterFilterCondition>
      valoresPropiedadesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'valoresPropiedades',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Producto, Producto, QAfterFilterCondition>
      valoresPropiedadesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'valoresPropiedades',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Producto, Producto, QAfterFilterCondition>
      valoresPropiedadesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'valoresPropiedades',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension ProductoQueryObject
    on QueryBuilder<Producto, Producto, QFilterCondition> {
  QueryBuilder<Producto, Producto, QAfterFilterCondition>
      valoresPropiedadesElement(FilterQuery<ValorPropiedadProducto> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'valoresPropiedades');
    });
  }
}

extension ProductoQueryLinks
    on QueryBuilder<Producto, Producto, QFilterCondition> {}

extension ProductoQuerySortBy on QueryBuilder<Producto, Producto, QSortBy> {
  QueryBuilder<Producto, Producto, QAfterSortBy> sortByCategoriaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoriaId', Sort.asc);
    });
  }

  QueryBuilder<Producto, Producto, QAfterSortBy> sortByCategoriaIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoriaId', Sort.desc);
    });
  }

  QueryBuilder<Producto, Producto, QAfterSortBy> sortByImagenPrincipal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagenPrincipal', Sort.asc);
    });
  }

  QueryBuilder<Producto, Producto, QAfterSortBy> sortByImagenPrincipalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagenPrincipal', Sort.desc);
    });
  }

  QueryBuilder<Producto, Producto, QAfterSortBy>
      sortByImagenPrincipalOpcional() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagenPrincipalOpcional', Sort.asc);
    });
  }

  QueryBuilder<Producto, Producto, QAfterSortBy>
      sortByImagenPrincipalOpcionalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagenPrincipalOpcional', Sort.desc);
    });
  }

  QueryBuilder<Producto, Producto, QAfterSortBy> sortByNombre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.asc);
    });
  }

  QueryBuilder<Producto, Producto, QAfterSortBy> sortByNombreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.desc);
    });
  }

  QueryBuilder<Producto, Producto, QAfterSortBy> sortByPrecio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precio', Sort.asc);
    });
  }

  QueryBuilder<Producto, Producto, QAfterSortBy> sortByPrecioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precio', Sort.desc);
    });
  }

  QueryBuilder<Producto, Producto, QAfterSortBy> sortByStock() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stock', Sort.asc);
    });
  }

  QueryBuilder<Producto, Producto, QAfterSortBy> sortByStockDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stock', Sort.desc);
    });
  }
}

extension ProductoQuerySortThenBy
    on QueryBuilder<Producto, Producto, QSortThenBy> {
  QueryBuilder<Producto, Producto, QAfterSortBy> thenByCategoriaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoriaId', Sort.asc);
    });
  }

  QueryBuilder<Producto, Producto, QAfterSortBy> thenByCategoriaIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoriaId', Sort.desc);
    });
  }

  QueryBuilder<Producto, Producto, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Producto, Producto, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Producto, Producto, QAfterSortBy> thenByImagenPrincipal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagenPrincipal', Sort.asc);
    });
  }

  QueryBuilder<Producto, Producto, QAfterSortBy> thenByImagenPrincipalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagenPrincipal', Sort.desc);
    });
  }

  QueryBuilder<Producto, Producto, QAfterSortBy>
      thenByImagenPrincipalOpcional() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagenPrincipalOpcional', Sort.asc);
    });
  }

  QueryBuilder<Producto, Producto, QAfterSortBy>
      thenByImagenPrincipalOpcionalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagenPrincipalOpcional', Sort.desc);
    });
  }

  QueryBuilder<Producto, Producto, QAfterSortBy> thenByNombre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.asc);
    });
  }

  QueryBuilder<Producto, Producto, QAfterSortBy> thenByNombreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.desc);
    });
  }

  QueryBuilder<Producto, Producto, QAfterSortBy> thenByPrecio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precio', Sort.asc);
    });
  }

  QueryBuilder<Producto, Producto, QAfterSortBy> thenByPrecioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precio', Sort.desc);
    });
  }

  QueryBuilder<Producto, Producto, QAfterSortBy> thenByStock() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stock', Sort.asc);
    });
  }

  QueryBuilder<Producto, Producto, QAfterSortBy> thenByStockDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stock', Sort.desc);
    });
  }
}

extension ProductoQueryWhereDistinct
    on QueryBuilder<Producto, Producto, QDistinct> {
  QueryBuilder<Producto, Producto, QDistinct> distinctByCategoriaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'categoriaId');
    });
  }

  QueryBuilder<Producto, Producto, QDistinct> distinctByImagenPrincipal(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'imagenPrincipal',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Producto, Producto, QDistinct> distinctByImagenPrincipalOpcional(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'imagenPrincipalOpcional',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Producto, Producto, QDistinct> distinctByImagenes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'imagenes');
    });
  }

  QueryBuilder<Producto, Producto, QDistinct> distinctByNombre(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nombre', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Producto, Producto, QDistinct> distinctByPrecio() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'precio');
    });
  }

  QueryBuilder<Producto, Producto, QDistinct> distinctByStock() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stock');
    });
  }
}

extension ProductoQueryProperty
    on QueryBuilder<Producto, Producto, QQueryProperty> {
  QueryBuilder<Producto, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Producto, int?, QQueryOperations> categoriaIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'categoriaId');
    });
  }

  QueryBuilder<Producto, String?, QQueryOperations> imagenPrincipalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'imagenPrincipal');
    });
  }

  QueryBuilder<Producto, String?, QQueryOperations>
      imagenPrincipalOpcionalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'imagenPrincipalOpcional');
    });
  }

  QueryBuilder<Producto, List<String>, QQueryOperations> imagenesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'imagenes');
    });
  }

  QueryBuilder<Producto, String, QQueryOperations> nombreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nombre');
    });
  }

  QueryBuilder<Producto, double?, QQueryOperations> precioProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'precio');
    });
  }

  QueryBuilder<Producto, int?, QQueryOperations> stockProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stock');
    });
  }

  QueryBuilder<Producto, List<ValorPropiedadProducto>, QQueryOperations>
      valoresPropiedadesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'valoresPropiedades');
    });
  }
}
