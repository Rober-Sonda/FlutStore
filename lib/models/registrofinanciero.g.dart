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
    r'fecha': PropertySchema(
      id: 0,
      name: r'fecha',
      type: IsarType.dateTime,
    ),
    r'monto': PropertySchema(
      id: 1,
      name: r'monto',
      type: IsarType.double,
    ),
    r'tipo': PropertySchema(
      id: 2,
      name: r'tipo',
      type: IsarType.string,
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
    final value = object.tipo;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _registroFinancieroSerialize(
  RegistroFinanciero object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.fecha);
  writer.writeDouble(offsets[1], object.monto);
  writer.writeString(offsets[2], object.tipo);
}

RegistroFinanciero _registroFinancieroDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RegistroFinanciero();
  object.fecha = reader.readDateTimeOrNull(offsets[0]);
  object.id = id;
  object.monto = reader.readDoubleOrNull(offsets[1]);
  object.tipo = reader.readStringOrNull(offsets[2]);
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
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readDoubleOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
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
      fechaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fecha',
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      fechaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fecha',
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      fechaEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fecha',
        value: value,
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      fechaGreaterThan(
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      fechaLessThan(
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

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      fechaBetween(
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
      montoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'monto',
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      montoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'monto',
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      montoEqualTo(
    double? value, {
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
    double? value, {
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
    double? value, {
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
    double? lower,
    double? upper, {
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
      tipoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tipo',
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      tipoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tipo',
      ));
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QAfterFilterCondition>
      tipoEqualTo(
    String? value, {
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
    String? value, {
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
    String? value, {
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
    String? lower,
    String? upper, {
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
}

extension RegistroFinancieroQueryObject
    on QueryBuilder<RegistroFinanciero, RegistroFinanciero, QFilterCondition> {}

extension RegistroFinancieroQueryLinks
    on QueryBuilder<RegistroFinanciero, RegistroFinanciero, QFilterCondition> {}

extension RegistroFinancieroQuerySortBy
    on QueryBuilder<RegistroFinanciero, RegistroFinanciero, QSortBy> {
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
}

extension RegistroFinancieroQuerySortThenBy
    on QueryBuilder<RegistroFinanciero, RegistroFinanciero, QSortThenBy> {
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
}

extension RegistroFinancieroQueryWhereDistinct
    on QueryBuilder<RegistroFinanciero, RegistroFinanciero, QDistinct> {
  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QDistinct>
      distinctByFecha() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fecha');
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QDistinct>
      distinctByMonto() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'monto');
    });
  }

  QueryBuilder<RegistroFinanciero, RegistroFinanciero, QDistinct>
      distinctByTipo({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tipo', caseSensitive: caseSensitive);
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

  QueryBuilder<RegistroFinanciero, DateTime?, QQueryOperations>
      fechaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fecha');
    });
  }

  QueryBuilder<RegistroFinanciero, double?, QQueryOperations> montoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'monto');
    });
  }

  QueryBuilder<RegistroFinanciero, String?, QQueryOperations> tipoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tipo');
    });
  }
}
