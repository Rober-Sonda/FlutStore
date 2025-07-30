// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'valor_propiedad_producto.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const ValorPropiedadProductoSchema = Schema(
  name: r'ValorPropiedadProducto',
  id: -9182533221346434044,
  properties: {
    r'nombrePropiedad': PropertySchema(
      id: 0,
      name: r'nombrePropiedad',
      type: IsarType.string,
    ),
    r'valor': PropertySchema(
      id: 1,
      name: r'valor',
      type: IsarType.string,
    )
  },
  estimateSize: _valorPropiedadProductoEstimateSize,
  serialize: _valorPropiedadProductoSerialize,
  deserialize: _valorPropiedadProductoDeserialize,
  deserializeProp: _valorPropiedadProductoDeserializeProp,
);

int _valorPropiedadProductoEstimateSize(
  ValorPropiedadProducto object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.nombrePropiedad.length * 3;
  {
    final value = object.valor;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _valorPropiedadProductoSerialize(
  ValorPropiedadProducto object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.nombrePropiedad);
  writer.writeString(offsets[1], object.valor);
}

ValorPropiedadProducto _valorPropiedadProductoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ValorPropiedadProducto();
  object.nombrePropiedad = reader.readString(offsets[0]);
  object.valor = reader.readStringOrNull(offsets[1]);
  return object;
}

P _valorPropiedadProductoDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension ValorPropiedadProductoQueryFilter on QueryBuilder<
    ValorPropiedadProducto, ValorPropiedadProducto, QFilterCondition> {
  QueryBuilder<ValorPropiedadProducto, ValorPropiedadProducto,
      QAfterFilterCondition> nombrePropiedadEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nombrePropiedad',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ValorPropiedadProducto, ValorPropiedadProducto,
      QAfterFilterCondition> nombrePropiedadGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nombrePropiedad',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ValorPropiedadProducto, ValorPropiedadProducto,
      QAfterFilterCondition> nombrePropiedadLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nombrePropiedad',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ValorPropiedadProducto, ValorPropiedadProducto,
      QAfterFilterCondition> nombrePropiedadBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nombrePropiedad',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ValorPropiedadProducto, ValorPropiedadProducto,
      QAfterFilterCondition> nombrePropiedadStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nombrePropiedad',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ValorPropiedadProducto, ValorPropiedadProducto,
      QAfterFilterCondition> nombrePropiedadEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nombrePropiedad',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ValorPropiedadProducto, ValorPropiedadProducto,
          QAfterFilterCondition>
      nombrePropiedadContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nombrePropiedad',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ValorPropiedadProducto, ValorPropiedadProducto,
          QAfterFilterCondition>
      nombrePropiedadMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nombrePropiedad',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ValorPropiedadProducto, ValorPropiedadProducto,
      QAfterFilterCondition> nombrePropiedadIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nombrePropiedad',
        value: '',
      ));
    });
  }

  QueryBuilder<ValorPropiedadProducto, ValorPropiedadProducto,
      QAfterFilterCondition> nombrePropiedadIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nombrePropiedad',
        value: '',
      ));
    });
  }

  QueryBuilder<ValorPropiedadProducto, ValorPropiedadProducto,
      QAfterFilterCondition> valorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'valor',
      ));
    });
  }

  QueryBuilder<ValorPropiedadProducto, ValorPropiedadProducto,
      QAfterFilterCondition> valorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'valor',
      ));
    });
  }

  QueryBuilder<ValorPropiedadProducto, ValorPropiedadProducto,
      QAfterFilterCondition> valorEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'valor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ValorPropiedadProducto, ValorPropiedadProducto,
      QAfterFilterCondition> valorGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'valor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ValorPropiedadProducto, ValorPropiedadProducto,
      QAfterFilterCondition> valorLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'valor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ValorPropiedadProducto, ValorPropiedadProducto,
      QAfterFilterCondition> valorBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'valor',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ValorPropiedadProducto, ValorPropiedadProducto,
      QAfterFilterCondition> valorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'valor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ValorPropiedadProducto, ValorPropiedadProducto,
      QAfterFilterCondition> valorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'valor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ValorPropiedadProducto, ValorPropiedadProducto,
          QAfterFilterCondition>
      valorContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'valor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ValorPropiedadProducto, ValorPropiedadProducto,
          QAfterFilterCondition>
      valorMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'valor',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ValorPropiedadProducto, ValorPropiedadProducto,
      QAfterFilterCondition> valorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'valor',
        value: '',
      ));
    });
  }

  QueryBuilder<ValorPropiedadProducto, ValorPropiedadProducto,
      QAfterFilterCondition> valorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'valor',
        value: '',
      ));
    });
  }
}

extension ValorPropiedadProductoQueryObject on QueryBuilder<
    ValorPropiedadProducto, ValorPropiedadProducto, QFilterCondition> {}
