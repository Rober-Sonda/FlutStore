// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'propiedad_categoria.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const PropiedadCategoriaSchema = Schema(
  name: r'PropiedadCategoria',
  id: 5810628570101552863,
  properties: {
    r'nombre': PropertySchema(
      id: 0,
      name: r'nombre',
      type: IsarType.string,
    ),
    r'opciones': PropertySchema(
      id: 1,
      name: r'opciones',
      type: IsarType.stringList,
    ),
    r'requerido': PropertySchema(
      id: 2,
      name: r'requerido',
      type: IsarType.bool,
    ),
    r'tipo': PropertySchema(
      id: 3,
      name: r'tipo',
      type: IsarType.byte,
      enumMap: _PropiedadCategoriatipoEnumValueMap,
    ),
    r'valorPorDefecto': PropertySchema(
      id: 4,
      name: r'valorPorDefecto',
      type: IsarType.string,
    )
  },
  estimateSize: _propiedadCategoriaEstimateSize,
  serialize: _propiedadCategoriaSerialize,
  deserialize: _propiedadCategoriaDeserialize,
  deserializeProp: _propiedadCategoriaDeserializeProp,
);

int _propiedadCategoriaEstimateSize(
  PropiedadCategoria object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.nombre.length * 3;
  bytesCount += 3 + object.opciones.length * 3;
  {
    for (var i = 0; i < object.opciones.length; i++) {
      final value = object.opciones[i];
      bytesCount += value.length * 3;
    }
  }
  {
    final value = object.valorPorDefecto;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _propiedadCategoriaSerialize(
  PropiedadCategoria object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.nombre);
  writer.writeStringList(offsets[1], object.opciones);
  writer.writeBool(offsets[2], object.requerido);
  writer.writeByte(offsets[3], object.tipo.index);
  writer.writeString(offsets[4], object.valorPorDefecto);
}

PropiedadCategoria _propiedadCategoriaDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PropiedadCategoria();
  object.nombre = reader.readString(offsets[0]);
  object.opciones = reader.readStringList(offsets[1]) ?? [];
  object.requerido = reader.readBool(offsets[2]);
  object.tipo =
      _PropiedadCategoriatipoValueEnumMap[reader.readByteOrNull(offsets[3])] ??
          TipoPropiedad.texto;
  object.valorPorDefecto = reader.readStringOrNull(offsets[4]);
  return object;
}

P _propiedadCategoriaDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readStringList(offset) ?? []) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (_PropiedadCategoriatipoValueEnumMap[
              reader.readByteOrNull(offset)] ??
          TipoPropiedad.texto) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _PropiedadCategoriatipoEnumValueMap = {
  'texto': 0,
  'numero': 1,
  'booleano': 2,
  'fecha': 3,
  'seleccion': 4,
};
const _PropiedadCategoriatipoValueEnumMap = {
  0: TipoPropiedad.texto,
  1: TipoPropiedad.numero,
  2: TipoPropiedad.booleano,
  3: TipoPropiedad.fecha,
  4: TipoPropiedad.seleccion,
};

extension PropiedadCategoriaQueryFilter
    on QueryBuilder<PropiedadCategoria, PropiedadCategoria, QFilterCondition> {
  QueryBuilder<PropiedadCategoria, PropiedadCategoria, QAfterFilterCondition>
      nombreEqualTo(
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

  QueryBuilder<PropiedadCategoria, PropiedadCategoria, QAfterFilterCondition>
      nombreGreaterThan(
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

  QueryBuilder<PropiedadCategoria, PropiedadCategoria, QAfterFilterCondition>
      nombreLessThan(
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

  QueryBuilder<PropiedadCategoria, PropiedadCategoria, QAfterFilterCondition>
      nombreBetween(
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

  QueryBuilder<PropiedadCategoria, PropiedadCategoria, QAfterFilterCondition>
      nombreStartsWith(
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

  QueryBuilder<PropiedadCategoria, PropiedadCategoria, QAfterFilterCondition>
      nombreEndsWith(
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

  QueryBuilder<PropiedadCategoria, PropiedadCategoria, QAfterFilterCondition>
      nombreContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PropiedadCategoria, PropiedadCategoria, QAfterFilterCondition>
      nombreMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nombre',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PropiedadCategoria, PropiedadCategoria, QAfterFilterCondition>
      nombreIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nombre',
        value: '',
      ));
    });
  }

  QueryBuilder<PropiedadCategoria, PropiedadCategoria, QAfterFilterCondition>
      nombreIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nombre',
        value: '',
      ));
    });
  }

  QueryBuilder<PropiedadCategoria, PropiedadCategoria, QAfterFilterCondition>
      opcionesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'opciones',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PropiedadCategoria, PropiedadCategoria, QAfterFilterCondition>
      opcionesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'opciones',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PropiedadCategoria, PropiedadCategoria, QAfterFilterCondition>
      opcionesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'opciones',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PropiedadCategoria, PropiedadCategoria, QAfterFilterCondition>
      opcionesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'opciones',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PropiedadCategoria, PropiedadCategoria, QAfterFilterCondition>
      opcionesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'opciones',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PropiedadCategoria, PropiedadCategoria, QAfterFilterCondition>
      opcionesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'opciones',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PropiedadCategoria, PropiedadCategoria, QAfterFilterCondition>
      opcionesElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'opciones',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PropiedadCategoria, PropiedadCategoria, QAfterFilterCondition>
      opcionesElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'opciones',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PropiedadCategoria, PropiedadCategoria, QAfterFilterCondition>
      opcionesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'opciones',
        value: '',
      ));
    });
  }

  QueryBuilder<PropiedadCategoria, PropiedadCategoria, QAfterFilterCondition>
      opcionesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'opciones',
        value: '',
      ));
    });
  }

  QueryBuilder<PropiedadCategoria, PropiedadCategoria, QAfterFilterCondition>
      opcionesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'opciones',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<PropiedadCategoria, PropiedadCategoria, QAfterFilterCondition>
      opcionesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'opciones',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<PropiedadCategoria, PropiedadCategoria, QAfterFilterCondition>
      opcionesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'opciones',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<PropiedadCategoria, PropiedadCategoria, QAfterFilterCondition>
      opcionesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'opciones',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<PropiedadCategoria, PropiedadCategoria, QAfterFilterCondition>
      opcionesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'opciones',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<PropiedadCategoria, PropiedadCategoria, QAfterFilterCondition>
      opcionesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'opciones',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<PropiedadCategoria, PropiedadCategoria, QAfterFilterCondition>
      requeridoEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'requerido',
        value: value,
      ));
    });
  }

  QueryBuilder<PropiedadCategoria, PropiedadCategoria, QAfterFilterCondition>
      tipoEqualTo(TipoPropiedad value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tipo',
        value: value,
      ));
    });
  }

  QueryBuilder<PropiedadCategoria, PropiedadCategoria, QAfterFilterCondition>
      tipoGreaterThan(
    TipoPropiedad value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tipo',
        value: value,
      ));
    });
  }

  QueryBuilder<PropiedadCategoria, PropiedadCategoria, QAfterFilterCondition>
      tipoLessThan(
    TipoPropiedad value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tipo',
        value: value,
      ));
    });
  }

  QueryBuilder<PropiedadCategoria, PropiedadCategoria, QAfterFilterCondition>
      tipoBetween(
    TipoPropiedad lower,
    TipoPropiedad upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tipo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PropiedadCategoria, PropiedadCategoria, QAfterFilterCondition>
      valorPorDefectoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'valorPorDefecto',
      ));
    });
  }

  QueryBuilder<PropiedadCategoria, PropiedadCategoria, QAfterFilterCondition>
      valorPorDefectoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'valorPorDefecto',
      ));
    });
  }

  QueryBuilder<PropiedadCategoria, PropiedadCategoria, QAfterFilterCondition>
      valorPorDefectoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'valorPorDefecto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PropiedadCategoria, PropiedadCategoria, QAfterFilterCondition>
      valorPorDefectoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'valorPorDefecto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PropiedadCategoria, PropiedadCategoria, QAfterFilterCondition>
      valorPorDefectoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'valorPorDefecto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PropiedadCategoria, PropiedadCategoria, QAfterFilterCondition>
      valorPorDefectoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'valorPorDefecto',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PropiedadCategoria, PropiedadCategoria, QAfterFilterCondition>
      valorPorDefectoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'valorPorDefecto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PropiedadCategoria, PropiedadCategoria, QAfterFilterCondition>
      valorPorDefectoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'valorPorDefecto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PropiedadCategoria, PropiedadCategoria, QAfterFilterCondition>
      valorPorDefectoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'valorPorDefecto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PropiedadCategoria, PropiedadCategoria, QAfterFilterCondition>
      valorPorDefectoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'valorPorDefecto',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PropiedadCategoria, PropiedadCategoria, QAfterFilterCondition>
      valorPorDefectoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'valorPorDefecto',
        value: '',
      ));
    });
  }

  QueryBuilder<PropiedadCategoria, PropiedadCategoria, QAfterFilterCondition>
      valorPorDefectoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'valorPorDefecto',
        value: '',
      ));
    });
  }
}

extension PropiedadCategoriaQueryObject
    on QueryBuilder<PropiedadCategoria, PropiedadCategoria, QFilterCondition> {}
