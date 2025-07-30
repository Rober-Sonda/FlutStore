// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_theme.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCustomThemeCollection on Isar {
  IsarCollection<CustomTheme> get customThemes => this.collection();
}

const CustomThemeSchema = CollectionSchema(
  name: r'CustomTheme',
  id: -1460072789270169582,
  properties: {
    r'accentColorValue': PropertySchema(
      id: 0,
      name: r'accentColorValue',
      type: IsarType.long,
    ),
    r'backgroundColorValue': PropertySchema(
      id: 1,
      name: r'backgroundColorValue',
      type: IsarType.long,
    ),
    r'createdAt': PropertySchema(
      id: 2,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'errorColorValue': PropertySchema(
      id: 3,
      name: r'errorColorValue',
      type: IsarType.long,
    ),
    r'infoColorValue': PropertySchema(
      id: 4,
      name: r'infoColorValue',
      type: IsarType.long,
    ),
    r'isDark': PropertySchema(
      id: 5,
      name: r'isDark',
      type: IsarType.bool,
    ),
    r'name': PropertySchema(
      id: 6,
      name: r'name',
      type: IsarType.string,
    ),
    r'primaryColorValue': PropertySchema(
      id: 7,
      name: r'primaryColorValue',
      type: IsarType.long,
    ),
    r'secondaryColorValue': PropertySchema(
      id: 8,
      name: r'secondaryColorValue',
      type: IsarType.long,
    ),
    r'successColorValue': PropertySchema(
      id: 9,
      name: r'successColorValue',
      type: IsarType.long,
    ),
    r'surfaceColorValue': PropertySchema(
      id: 10,
      name: r'surfaceColorValue',
      type: IsarType.long,
    ),
    r'textColorValue': PropertySchema(
      id: 11,
      name: r'textColorValue',
      type: IsarType.long,
    ),
    r'textSecondaryColorValue': PropertySchema(
      id: 12,
      name: r'textSecondaryColorValue',
      type: IsarType.long,
    ),
    r'updatedAt': PropertySchema(
      id: 13,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'userId': PropertySchema(
      id: 14,
      name: r'userId',
      type: IsarType.string,
    ),
    r'warningColorValue': PropertySchema(
      id: 15,
      name: r'warningColorValue',
      type: IsarType.long,
    )
  },
  estimateSize: _customThemeEstimateSize,
  serialize: _customThemeSerialize,
  deserialize: _customThemeDeserialize,
  deserializeProp: _customThemeDeserializeProp,
  idName: r'id',
  indexes: {
    r'userId': IndexSchema(
      id: -2005826577402374815,
      name: r'userId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'userId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _customThemeGetId,
  getLinks: _customThemeGetLinks,
  attach: _customThemeAttach,
  version: '3.1.0+1',
);

int _customThemeEstimateSize(
  CustomTheme object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.userId.length * 3;
  return bytesCount;
}

void _customThemeSerialize(
  CustomTheme object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.accentColorValue);
  writer.writeLong(offsets[1], object.backgroundColorValue);
  writer.writeDateTime(offsets[2], object.createdAt);
  writer.writeLong(offsets[3], object.errorColorValue);
  writer.writeLong(offsets[4], object.infoColorValue);
  writer.writeBool(offsets[5], object.isDark);
  writer.writeString(offsets[6], object.name);
  writer.writeLong(offsets[7], object.primaryColorValue);
  writer.writeLong(offsets[8], object.secondaryColorValue);
  writer.writeLong(offsets[9], object.successColorValue);
  writer.writeLong(offsets[10], object.surfaceColorValue);
  writer.writeLong(offsets[11], object.textColorValue);
  writer.writeLong(offsets[12], object.textSecondaryColorValue);
  writer.writeDateTime(offsets[13], object.updatedAt);
  writer.writeString(offsets[14], object.userId);
  writer.writeLong(offsets[15], object.warningColorValue);
}

CustomTheme _customThemeDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CustomTheme();
  object.accentColorValue = reader.readLong(offsets[0]);
  object.backgroundColorValue = reader.readLong(offsets[1]);
  object.createdAt = reader.readDateTime(offsets[2]);
  object.errorColorValue = reader.readLong(offsets[3]);
  object.id = id;
  object.infoColorValue = reader.readLong(offsets[4]);
  object.isDark = reader.readBool(offsets[5]);
  object.name = reader.readString(offsets[6]);
  object.primaryColorValue = reader.readLong(offsets[7]);
  object.secondaryColorValue = reader.readLong(offsets[8]);
  object.successColorValue = reader.readLong(offsets[9]);
  object.surfaceColorValue = reader.readLong(offsets[10]);
  object.textColorValue = reader.readLong(offsets[11]);
  object.textSecondaryColorValue = reader.readLong(offsets[12]);
  object.updatedAt = reader.readDateTime(offsets[13]);
  object.userId = reader.readString(offsets[14]);
  object.warningColorValue = reader.readLong(offsets[15]);
  return object;
}

P _customThemeDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    case 9:
      return (reader.readLong(offset)) as P;
    case 10:
      return (reader.readLong(offset)) as P;
    case 11:
      return (reader.readLong(offset)) as P;
    case 12:
      return (reader.readLong(offset)) as P;
    case 13:
      return (reader.readDateTime(offset)) as P;
    case 14:
      return (reader.readString(offset)) as P;
    case 15:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _customThemeGetId(CustomTheme object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _customThemeGetLinks(CustomTheme object) {
  return [];
}

void _customThemeAttach(
    IsarCollection<dynamic> col, Id id, CustomTheme object) {
  object.id = id;
}

extension CustomThemeQueryWhereSort
    on QueryBuilder<CustomTheme, CustomTheme, QWhere> {
  QueryBuilder<CustomTheme, CustomTheme, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CustomThemeQueryWhere
    on QueryBuilder<CustomTheme, CustomTheme, QWhereClause> {
  QueryBuilder<CustomTheme, CustomTheme, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<CustomTheme, CustomTheme, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterWhereClause> idBetween(
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

  QueryBuilder<CustomTheme, CustomTheme, QAfterWhereClause> userIdEqualTo(
      String userId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userId',
        value: [userId],
      ));
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterWhereClause> userIdNotEqualTo(
      String userId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [],
              upper: [userId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [userId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [userId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [],
              upper: [userId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension CustomThemeQueryFilter
    on QueryBuilder<CustomTheme, CustomTheme, QFilterCondition> {
  QueryBuilder<CustomTheme, CustomTheme, QAfterFilterCondition>
      accentColorValueEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accentColorValue',
        value: value,
      ));
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterFilterCondition>
      accentColorValueGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'accentColorValue',
        value: value,
      ));
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterFilterCondition>
      accentColorValueLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'accentColorValue',
        value: value,
      ));
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterFilterCondition>
      accentColorValueBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'accentColorValue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterFilterCondition>
      backgroundColorValueEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backgroundColorValue',
        value: value,
      ));
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterFilterCondition>
      backgroundColorValueGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'backgroundColorValue',
        value: value,
      ));
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterFilterCondition>
      backgroundColorValueLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'backgroundColorValue',
        value: value,
      ));
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterFilterCondition>
      backgroundColorValueBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'backgroundColorValue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterFilterCondition>
      createdAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterFilterCondition>
      createdAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterFilterCondition>
      createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterFilterCondition>
      errorColorValueEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'errorColorValue',
        value: value,
      ));
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterFilterCondition>
      errorColorValueGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'errorColorValue',
        value: value,
      ));
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterFilterCondition>
      errorColorValueLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'errorColorValue',
        value: value,
      ));
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterFilterCondition>
      errorColorValueBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'errorColorValue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<CustomTheme, CustomTheme, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<CustomTheme, CustomTheme, QAfterFilterCondition> idBetween(
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

  QueryBuilder<CustomTheme, CustomTheme, QAfterFilterCondition>
      infoColorValueEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'infoColorValue',
        value: value,
      ));
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterFilterCondition>
      infoColorValueGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'infoColorValue',
        value: value,
      ));
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterFilterCondition>
      infoColorValueLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'infoColorValue',
        value: value,
      ));
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterFilterCondition>
      infoColorValueBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'infoColorValue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterFilterCondition> isDarkEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isDark',
        value: value,
      ));
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterFilterCondition>
      primaryColorValueEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'primaryColorValue',
        value: value,
      ));
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterFilterCondition>
      primaryColorValueGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'primaryColorValue',
        value: value,
      ));
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterFilterCondition>
      primaryColorValueLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'primaryColorValue',
        value: value,
      ));
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterFilterCondition>
      primaryColorValueBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'primaryColorValue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterFilterCondition>
      secondaryColorValueEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'secondaryColorValue',
        value: value,
      ));
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterFilterCondition>
      secondaryColorValueGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'secondaryColorValue',
        value: value,
      ));
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterFilterCondition>
      secondaryColorValueLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'secondaryColorValue',
        value: value,
      ));
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterFilterCondition>
      secondaryColorValueBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'secondaryColorValue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterFilterCondition>
      successColorValueEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'successColorValue',
        value: value,
      ));
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterFilterCondition>
      successColorValueGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'successColorValue',
        value: value,
      ));
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterFilterCondition>
      successColorValueLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'successColorValue',
        value: value,
      ));
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterFilterCondition>
      successColorValueBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'successColorValue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterFilterCondition>
      surfaceColorValueEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'surfaceColorValue',
        value: value,
      ));
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterFilterCondition>
      surfaceColorValueGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'surfaceColorValue',
        value: value,
      ));
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterFilterCondition>
      surfaceColorValueLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'surfaceColorValue',
        value: value,
      ));
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterFilterCondition>
      surfaceColorValueBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'surfaceColorValue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterFilterCondition>
      textColorValueEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'textColorValue',
        value: value,
      ));
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterFilterCondition>
      textColorValueGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'textColorValue',
        value: value,
      ));
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterFilterCondition>
      textColorValueLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'textColorValue',
        value: value,
      ));
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterFilterCondition>
      textColorValueBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'textColorValue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterFilterCondition>
      textSecondaryColorValueEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'textSecondaryColorValue',
        value: value,
      ));
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterFilterCondition>
      textSecondaryColorValueGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'textSecondaryColorValue',
        value: value,
      ));
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterFilterCondition>
      textSecondaryColorValueLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'textSecondaryColorValue',
        value: value,
      ));
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterFilterCondition>
      textSecondaryColorValueBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'textSecondaryColorValue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterFilterCondition>
      updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterFilterCondition>
      updatedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterFilterCondition>
      updatedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterFilterCondition>
      updatedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updatedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterFilterCondition> userIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterFilterCondition>
      userIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterFilterCondition> userIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterFilterCondition> userIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterFilterCondition>
      userIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterFilterCondition> userIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterFilterCondition> userIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterFilterCondition> userIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterFilterCondition>
      userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterFilterCondition>
      userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterFilterCondition>
      warningColorValueEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'warningColorValue',
        value: value,
      ));
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterFilterCondition>
      warningColorValueGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'warningColorValue',
        value: value,
      ));
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterFilterCondition>
      warningColorValueLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'warningColorValue',
        value: value,
      ));
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterFilterCondition>
      warningColorValueBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'warningColorValue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension CustomThemeQueryObject
    on QueryBuilder<CustomTheme, CustomTheme, QFilterCondition> {}

extension CustomThemeQueryLinks
    on QueryBuilder<CustomTheme, CustomTheme, QFilterCondition> {}

extension CustomThemeQuerySortBy
    on QueryBuilder<CustomTheme, CustomTheme, QSortBy> {
  QueryBuilder<CustomTheme, CustomTheme, QAfterSortBy>
      sortByAccentColorValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accentColorValue', Sort.asc);
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterSortBy>
      sortByAccentColorValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accentColorValue', Sort.desc);
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterSortBy>
      sortByBackgroundColorValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backgroundColorValue', Sort.asc);
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterSortBy>
      sortByBackgroundColorValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backgroundColorValue', Sort.desc);
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterSortBy> sortByErrorColorValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'errorColorValue', Sort.asc);
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterSortBy>
      sortByErrorColorValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'errorColorValue', Sort.desc);
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterSortBy> sortByInfoColorValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'infoColorValue', Sort.asc);
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterSortBy>
      sortByInfoColorValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'infoColorValue', Sort.desc);
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterSortBy> sortByIsDark() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDark', Sort.asc);
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterSortBy> sortByIsDarkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDark', Sort.desc);
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterSortBy>
      sortByPrimaryColorValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'primaryColorValue', Sort.asc);
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterSortBy>
      sortByPrimaryColorValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'primaryColorValue', Sort.desc);
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterSortBy>
      sortBySecondaryColorValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'secondaryColorValue', Sort.asc);
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterSortBy>
      sortBySecondaryColorValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'secondaryColorValue', Sort.desc);
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterSortBy>
      sortBySuccessColorValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'successColorValue', Sort.asc);
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterSortBy>
      sortBySuccessColorValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'successColorValue', Sort.desc);
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterSortBy>
      sortBySurfaceColorValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surfaceColorValue', Sort.asc);
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterSortBy>
      sortBySurfaceColorValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surfaceColorValue', Sort.desc);
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterSortBy> sortByTextColorValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'textColorValue', Sort.asc);
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterSortBy>
      sortByTextColorValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'textColorValue', Sort.desc);
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterSortBy>
      sortByTextSecondaryColorValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'textSecondaryColorValue', Sort.asc);
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterSortBy>
      sortByTextSecondaryColorValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'textSecondaryColorValue', Sort.desc);
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterSortBy> sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterSortBy> sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterSortBy>
      sortByWarningColorValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warningColorValue', Sort.asc);
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterSortBy>
      sortByWarningColorValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warningColorValue', Sort.desc);
    });
  }
}

extension CustomThemeQuerySortThenBy
    on QueryBuilder<CustomTheme, CustomTheme, QSortThenBy> {
  QueryBuilder<CustomTheme, CustomTheme, QAfterSortBy>
      thenByAccentColorValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accentColorValue', Sort.asc);
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterSortBy>
      thenByAccentColorValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accentColorValue', Sort.desc);
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterSortBy>
      thenByBackgroundColorValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backgroundColorValue', Sort.asc);
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterSortBy>
      thenByBackgroundColorValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backgroundColorValue', Sort.desc);
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterSortBy> thenByErrorColorValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'errorColorValue', Sort.asc);
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterSortBy>
      thenByErrorColorValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'errorColorValue', Sort.desc);
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterSortBy> thenByInfoColorValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'infoColorValue', Sort.asc);
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterSortBy>
      thenByInfoColorValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'infoColorValue', Sort.desc);
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterSortBy> thenByIsDark() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDark', Sort.asc);
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterSortBy> thenByIsDarkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDark', Sort.desc);
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterSortBy>
      thenByPrimaryColorValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'primaryColorValue', Sort.asc);
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterSortBy>
      thenByPrimaryColorValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'primaryColorValue', Sort.desc);
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterSortBy>
      thenBySecondaryColorValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'secondaryColorValue', Sort.asc);
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterSortBy>
      thenBySecondaryColorValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'secondaryColorValue', Sort.desc);
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterSortBy>
      thenBySuccessColorValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'successColorValue', Sort.asc);
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterSortBy>
      thenBySuccessColorValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'successColorValue', Sort.desc);
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterSortBy>
      thenBySurfaceColorValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surfaceColorValue', Sort.asc);
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterSortBy>
      thenBySurfaceColorValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surfaceColorValue', Sort.desc);
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterSortBy> thenByTextColorValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'textColorValue', Sort.asc);
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterSortBy>
      thenByTextColorValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'textColorValue', Sort.desc);
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterSortBy>
      thenByTextSecondaryColorValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'textSecondaryColorValue', Sort.asc);
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterSortBy>
      thenByTextSecondaryColorValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'textSecondaryColorValue', Sort.desc);
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterSortBy> thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterSortBy> thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterSortBy>
      thenByWarningColorValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warningColorValue', Sort.asc);
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QAfterSortBy>
      thenByWarningColorValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warningColorValue', Sort.desc);
    });
  }
}

extension CustomThemeQueryWhereDistinct
    on QueryBuilder<CustomTheme, CustomTheme, QDistinct> {
  QueryBuilder<CustomTheme, CustomTheme, QDistinct>
      distinctByAccentColorValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'accentColorValue');
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QDistinct>
      distinctByBackgroundColorValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'backgroundColorValue');
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QDistinct>
      distinctByErrorColorValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'errorColorValue');
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QDistinct> distinctByInfoColorValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'infoColorValue');
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QDistinct> distinctByIsDark() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDark');
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QDistinct>
      distinctByPrimaryColorValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'primaryColorValue');
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QDistinct>
      distinctBySecondaryColorValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'secondaryColorValue');
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QDistinct>
      distinctBySuccessColorValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'successColorValue');
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QDistinct>
      distinctBySurfaceColorValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'surfaceColorValue');
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QDistinct> distinctByTextColorValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'textColorValue');
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QDistinct>
      distinctByTextSecondaryColorValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'textSecondaryColorValue');
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QDistinct> distinctByUserId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CustomTheme, CustomTheme, QDistinct>
      distinctByWarningColorValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'warningColorValue');
    });
  }
}

extension CustomThemeQueryProperty
    on QueryBuilder<CustomTheme, CustomTheme, QQueryProperty> {
  QueryBuilder<CustomTheme, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CustomTheme, int, QQueryOperations> accentColorValueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'accentColorValue');
    });
  }

  QueryBuilder<CustomTheme, int, QQueryOperations>
      backgroundColorValueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'backgroundColorValue');
    });
  }

  QueryBuilder<CustomTheme, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<CustomTheme, int, QQueryOperations> errorColorValueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'errorColorValue');
    });
  }

  QueryBuilder<CustomTheme, int, QQueryOperations> infoColorValueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'infoColorValue');
    });
  }

  QueryBuilder<CustomTheme, bool, QQueryOperations> isDarkProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDark');
    });
  }

  QueryBuilder<CustomTheme, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<CustomTheme, int, QQueryOperations> primaryColorValueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'primaryColorValue');
    });
  }

  QueryBuilder<CustomTheme, int, QQueryOperations>
      secondaryColorValueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'secondaryColorValue');
    });
  }

  QueryBuilder<CustomTheme, int, QQueryOperations> successColorValueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'successColorValue');
    });
  }

  QueryBuilder<CustomTheme, int, QQueryOperations> surfaceColorValueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'surfaceColorValue');
    });
  }

  QueryBuilder<CustomTheme, int, QQueryOperations> textColorValueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'textColorValue');
    });
  }

  QueryBuilder<CustomTheme, int, QQueryOperations>
      textSecondaryColorValueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'textSecondaryColorValue');
    });
  }

  QueryBuilder<CustomTheme, DateTime, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<CustomTheme, String, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }

  QueryBuilder<CustomTheme, int, QQueryOperations> warningColorValueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'warningColorValue');
    });
  }
}
