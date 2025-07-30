// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proveedor.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetProveedorCollection on Isar {
  IsarCollection<Proveedor> get proveedors => this.collection();
}

const ProveedorSchema = CollectionSchema(
  name: r'Proveedor',
  id: 1513744050638001131,
  properties: {
    r'contacto': PropertySchema(
      id: 0,
      name: r'contacto',
      type: IsarType.string,
    ),
    r'cuit': PropertySchema(
      id: 1,
      name: r'cuit',
      type: IsarType.string,
    ),
    r'direccion': PropertySchema(
      id: 2,
      name: r'direccion',
      type: IsarType.string,
    ),
    r'email': PropertySchema(
      id: 3,
      name: r'email',
      type: IsarType.string,
    ),
    r'fechaRegistro': PropertySchema(
      id: 4,
      name: r'fechaRegistro',
      type: IsarType.dateTime,
    ),
    r'hashCode': PropertySchema(
      id: 5,
      name: r'hashCode',
      type: IsarType.long,
    ),
    r'nombre': PropertySchema(
      id: 6,
      name: r'nombre',
      type: IsarType.string,
    ),
    r'observaciones': PropertySchema(
      id: 7,
      name: r'observaciones',
      type: IsarType.string,
    ),
    r'razonSocial': PropertySchema(
      id: 8,
      name: r'razonSocial',
      type: IsarType.string,
    ),
    r'telefono': PropertySchema(
      id: 9,
      name: r'telefono',
      type: IsarType.string,
    )
  },
  estimateSize: _proveedorEstimateSize,
  serialize: _proveedorSerialize,
  deserialize: _proveedorDeserialize,
  deserializeProp: _proveedorDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _proveedorGetId,
  getLinks: _proveedorGetLinks,
  attach: _proveedorAttach,
  version: '3.1.0+1',
);

int _proveedorEstimateSize(
  Proveedor object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.contacto;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.cuit;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.direccion;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.email;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.nombre.length * 3;
  {
    final value = object.observaciones;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.razonSocial;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.telefono;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _proveedorSerialize(
  Proveedor object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.contacto);
  writer.writeString(offsets[1], object.cuit);
  writer.writeString(offsets[2], object.direccion);
  writer.writeString(offsets[3], object.email);
  writer.writeDateTime(offsets[4], object.fechaRegistro);
  writer.writeLong(offsets[5], object.hashCode);
  writer.writeString(offsets[6], object.nombre);
  writer.writeString(offsets[7], object.observaciones);
  writer.writeString(offsets[8], object.razonSocial);
  writer.writeString(offsets[9], object.telefono);
}

Proveedor _proveedorDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Proveedor();
  object.contacto = reader.readStringOrNull(offsets[0]);
  object.cuit = reader.readStringOrNull(offsets[1]);
  object.direccion = reader.readStringOrNull(offsets[2]);
  object.email = reader.readStringOrNull(offsets[3]);
  object.fechaRegistro = reader.readDateTimeOrNull(offsets[4]);
  object.id = id;
  object.nombre = reader.readString(offsets[6]);
  object.observaciones = reader.readStringOrNull(offsets[7]);
  object.razonSocial = reader.readStringOrNull(offsets[8]);
  object.telefono = reader.readStringOrNull(offsets[9]);
  return object;
}

P _proveedorDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _proveedorGetId(Proveedor object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _proveedorGetLinks(Proveedor object) {
  return [];
}

void _proveedorAttach(IsarCollection<dynamic> col, Id id, Proveedor object) {
  object.id = id;
}

extension ProveedorQueryWhereSort
    on QueryBuilder<Proveedor, Proveedor, QWhere> {
  QueryBuilder<Proveedor, Proveedor, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ProveedorQueryWhere
    on QueryBuilder<Proveedor, Proveedor, QWhereClause> {
  QueryBuilder<Proveedor, Proveedor, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Proveedor, Proveedor, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterWhereClause> idBetween(
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

extension ProveedorQueryFilter
    on QueryBuilder<Proveedor, Proveedor, QFilterCondition> {
  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> contactoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'contacto',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      contactoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'contacto',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> contactoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'contacto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> contactoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'contacto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> contactoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'contacto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> contactoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'contacto',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> contactoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'contacto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> contactoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'contacto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> contactoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'contacto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> contactoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'contacto',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> contactoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'contacto',
        value: '',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      contactoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'contacto',
        value: '',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> cuitIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cuit',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> cuitIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cuit',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> cuitEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cuit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> cuitGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cuit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> cuitLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cuit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> cuitBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cuit',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> cuitStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'cuit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> cuitEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'cuit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> cuitContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'cuit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> cuitMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'cuit',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> cuitIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cuit',
        value: '',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> cuitIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'cuit',
        value: '',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> direccionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'direccion',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      direccionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'direccion',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> direccionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'direccion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      direccionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'direccion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> direccionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'direccion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> direccionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'direccion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> direccionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'direccion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> direccionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'direccion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> direccionContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'direccion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> direccionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'direccion',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> direccionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'direccion',
        value: '',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      direccionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'direccion',
        value: '',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> emailIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'email',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> emailIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'email',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> emailEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> emailGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> emailLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> emailBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'email',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> emailStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> emailEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> emailContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> emailMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'email',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> emailIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'email',
        value: '',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> emailIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'email',
        value: '',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      fechaRegistroIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fechaRegistro',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      fechaRegistroIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fechaRegistro',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      fechaRegistroEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaRegistro',
        value: value,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      fechaRegistroGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fechaRegistro',
        value: value,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      fechaRegistroLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fechaRegistro',
        value: value,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      fechaRegistroBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fechaRegistro',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> hashCodeEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> hashCodeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> hashCodeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> hashCodeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hashCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> nombreEqualTo(
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

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> nombreGreaterThan(
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

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> nombreLessThan(
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

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> nombreBetween(
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

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> nombreStartsWith(
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

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> nombreEndsWith(
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

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> nombreContains(
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

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> nombreMatches(
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

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> nombreIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nombre',
        value: '',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> nombreIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nombre',
        value: '',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      observacionesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'observaciones',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      observacionesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'observaciones',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
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

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
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

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
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

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
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

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
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

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
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

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      observacionesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'observaciones',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      observacionesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'observaciones',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      observacionesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'observaciones',
        value: '',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      observacionesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'observaciones',
        value: '',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      razonSocialIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'razonSocial',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      razonSocialIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'razonSocial',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> razonSocialEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'razonSocial',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      razonSocialGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'razonSocial',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> razonSocialLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'razonSocial',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> razonSocialBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'razonSocial',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      razonSocialStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'razonSocial',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> razonSocialEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'razonSocial',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> razonSocialContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'razonSocial',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> razonSocialMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'razonSocial',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      razonSocialIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'razonSocial',
        value: '',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      razonSocialIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'razonSocial',
        value: '',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> telefonoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'telefono',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      telefonoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'telefono',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> telefonoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'telefono',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> telefonoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'telefono',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> telefonoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'telefono',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> telefonoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'telefono',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> telefonoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'telefono',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> telefonoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'telefono',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> telefonoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'telefono',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> telefonoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'telefono',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> telefonoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'telefono',
        value: '',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      telefonoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'telefono',
        value: '',
      ));
    });
  }
}

extension ProveedorQueryObject
    on QueryBuilder<Proveedor, Proveedor, QFilterCondition> {}

extension ProveedorQueryLinks
    on QueryBuilder<Proveedor, Proveedor, QFilterCondition> {}

extension ProveedorQuerySortBy on QueryBuilder<Proveedor, Proveedor, QSortBy> {
  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> sortByContacto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contacto', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> sortByContactoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contacto', Sort.desc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> sortByCuit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cuit', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> sortByCuitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cuit', Sort.desc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> sortByDireccion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'direccion', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> sortByDireccionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'direccion', Sort.desc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> sortByEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> sortByEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.desc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> sortByFechaRegistro() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaRegistro', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> sortByFechaRegistroDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaRegistro', Sort.desc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> sortByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> sortByHashCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.desc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> sortByNombre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> sortByNombreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.desc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> sortByObservaciones() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observaciones', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> sortByObservacionesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observaciones', Sort.desc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> sortByRazonSocial() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'razonSocial', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> sortByRazonSocialDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'razonSocial', Sort.desc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> sortByTelefono() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'telefono', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> sortByTelefonoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'telefono', Sort.desc);
    });
  }
}

extension ProveedorQuerySortThenBy
    on QueryBuilder<Proveedor, Proveedor, QSortThenBy> {
  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> thenByContacto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contacto', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> thenByContactoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contacto', Sort.desc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> thenByCuit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cuit', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> thenByCuitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cuit', Sort.desc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> thenByDireccion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'direccion', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> thenByDireccionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'direccion', Sort.desc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> thenByEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> thenByEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.desc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> thenByFechaRegistro() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaRegistro', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> thenByFechaRegistroDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaRegistro', Sort.desc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> thenByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> thenByHashCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.desc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> thenByNombre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> thenByNombreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.desc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> thenByObservaciones() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observaciones', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> thenByObservacionesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observaciones', Sort.desc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> thenByRazonSocial() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'razonSocial', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> thenByRazonSocialDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'razonSocial', Sort.desc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> thenByTelefono() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'telefono', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> thenByTelefonoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'telefono', Sort.desc);
    });
  }
}

extension ProveedorQueryWhereDistinct
    on QueryBuilder<Proveedor, Proveedor, QDistinct> {
  QueryBuilder<Proveedor, Proveedor, QDistinct> distinctByContacto(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'contacto', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QDistinct> distinctByCuit(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cuit', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QDistinct> distinctByDireccion(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'direccion', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QDistinct> distinctByEmail(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'email', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QDistinct> distinctByFechaRegistro() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaRegistro');
    });
  }

  QueryBuilder<Proveedor, Proveedor, QDistinct> distinctByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hashCode');
    });
  }

  QueryBuilder<Proveedor, Proveedor, QDistinct> distinctByNombre(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nombre', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QDistinct> distinctByObservaciones(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'observaciones',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QDistinct> distinctByRazonSocial(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'razonSocial', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QDistinct> distinctByTelefono(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'telefono', caseSensitive: caseSensitive);
    });
  }
}

extension ProveedorQueryProperty
    on QueryBuilder<Proveedor, Proveedor, QQueryProperty> {
  QueryBuilder<Proveedor, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Proveedor, String?, QQueryOperations> contactoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'contacto');
    });
  }

  QueryBuilder<Proveedor, String?, QQueryOperations> cuitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cuit');
    });
  }

  QueryBuilder<Proveedor, String?, QQueryOperations> direccionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'direccion');
    });
  }

  QueryBuilder<Proveedor, String?, QQueryOperations> emailProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'email');
    });
  }

  QueryBuilder<Proveedor, DateTime?, QQueryOperations> fechaRegistroProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaRegistro');
    });
  }

  QueryBuilder<Proveedor, int, QQueryOperations> hashCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hashCode');
    });
  }

  QueryBuilder<Proveedor, String, QQueryOperations> nombreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nombre');
    });
  }

  QueryBuilder<Proveedor, String?, QQueryOperations> observacionesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'observaciones');
    });
  }

  QueryBuilder<Proveedor, String?, QQueryOperations> razonSocialProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'razonSocial');
    });
  }

  QueryBuilder<Proveedor, String?, QQueryOperations> telefonoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'telefono');
    });
  }
}
