// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'oferta.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetOfertaCollection on Isar {
  IsarCollection<Oferta> get ofertas => this.collection();
}

const OfertaSchema = CollectionSchema(
  name: r'Oferta',
  id: 2532976208115820795,
  properties: {
    r'activa': PropertySchema(
      id: 0,
      name: r'activa',
      type: IsarType.bool,
    ),
    r'ahorroEnPesos': PropertySchema(
      id: 1,
      name: r'ahorroEnPesos',
      type: IsarType.double,
    ),
    r'ahorroFormateado': PropertySchema(
      id: 2,
      name: r'ahorroFormateado',
      type: IsarType.string,
    ),
    r'cantidadMaxima': PropertySchema(
      id: 3,
      name: r'cantidadMaxima',
      type: IsarType.long,
    ),
    r'cantidadMinima': PropertySchema(
      id: 4,
      name: r'cantidadMinima',
      type: IsarType.long,
    ),
    r'codigoDescuento': PropertySchema(
      id: 5,
      name: r'codigoDescuento',
      type: IsarType.string,
    ),
    r'colorEstado': PropertySchema(
      id: 6,
      name: r'colorEstado',
      type: IsarType.string,
    ),
    r'condiciones': PropertySchema(
      id: 7,
      name: r'condiciones',
      type: IsarType.string,
    ),
    r'descripcion': PropertySchema(
      id: 8,
      name: r'descripcion',
      type: IsarType.string,
    ),
    r'diasRestantes': PropertySchema(
      id: 9,
      name: r'diasRestantes',
      type: IsarType.long,
    ),
    r'diasTranscurridos': PropertySchema(
      id: 10,
      name: r'diasTranscurridos',
      type: IsarType.long,
    ),
    r'estaActiva': PropertySchema(
      id: 11,
      name: r'estaActiva',
      type: IsarType.bool,
    ),
    r'estaPorComenzar': PropertySchema(
      id: 12,
      name: r'estaPorComenzar',
      type: IsarType.bool,
    ),
    r'estadoOferta': PropertySchema(
      id: 13,
      name: r'estadoOferta',
      type: IsarType.string,
    ),
    r'fechaActualizacion': PropertySchema(
      id: 14,
      name: r'fechaActualizacion',
      type: IsarType.dateTime,
    ),
    r'fechaCreacion': PropertySchema(
      id: 15,
      name: r'fechaCreacion',
      type: IsarType.dateTime,
    ),
    r'fechaFin': PropertySchema(
      id: 16,
      name: r'fechaFin',
      type: IsarType.dateTime,
    ),
    r'fechaInicio': PropertySchema(
      id: 17,
      name: r'fechaInicio',
      type: IsarType.dateTime,
    ),
    r'haExpirado': PropertySchema(
      id: 18,
      name: r'haExpirado',
      type: IsarType.bool,
    ),
    r'hayStockDisponible': PropertySchema(
      id: 19,
      name: r'hayStockDisponible',
      type: IsarType.bool,
    ),
    r'imagenOferta': PropertySchema(
      id: 20,
      name: r'imagenOferta',
      type: IsarType.string,
    ),
    r'ingresosGenerados': PropertySchema(
      id: 21,
      name: r'ingresosGenerados',
      type: IsarType.double,
    ),
    r'nombre': PropertySchema(
      id: 22,
      name: r'nombre',
      type: IsarType.string,
    ),
    r'porcentajeDescuento': PropertySchema(
      id: 23,
      name: r'porcentajeDescuento',
      type: IsarType.double,
    ),
    r'porcentajeDescuentoFormateado': PropertySchema(
      id: 24,
      name: r'porcentajeDescuentoFormateado',
      type: IsarType.string,
    ),
    r'precioOferta': PropertySchema(
      id: 25,
      name: r'precioOferta',
      type: IsarType.double,
    ),
    r'precioOfertaFormateado': PropertySchema(
      id: 26,
      name: r'precioOfertaFormateado',
      type: IsarType.string,
    ),
    r'precioOriginal': PropertySchema(
      id: 27,
      name: r'precioOriginal',
      type: IsarType.double,
    ),
    r'precioOriginalFormateado': PropertySchema(
      id: 28,
      name: r'precioOriginalFormateado',
      type: IsarType.string,
    ),
    r'productoId': PropertySchema(
      id: 29,
      name: r'productoId',
      type: IsarType.long,
    ),
    r'progresoOferta': PropertySchema(
      id: 30,
      name: r'progresoOferta',
      type: IsarType.double,
    ),
    r'requiereCodigo': PropertySchema(
      id: 31,
      name: r'requiereCodigo',
      type: IsarType.bool,
    ),
    r'stockDisponible': PropertySchema(
      id: 32,
      name: r'stockDisponible',
      type: IsarType.long,
    ),
    r'ventasRealizadas': PropertySchema(
      id: 33,
      name: r'ventasRealizadas',
      type: IsarType.long,
    )
  },
  estimateSize: _ofertaEstimateSize,
  serialize: _ofertaSerialize,
  deserialize: _ofertaDeserialize,
  deserializeProp: _ofertaDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _ofertaGetId,
  getLinks: _ofertaGetLinks,
  attach: _ofertaAttach,
  version: '3.1.0+1',
);

int _ofertaEstimateSize(
  Oferta object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.ahorroFormateado.length * 3;
  {
    final value = object.codigoDescuento;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.colorEstado.length * 3;
  {
    final value = object.condiciones;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.descripcion;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.estadoOferta.length * 3;
  {
    final value = object.imagenOferta;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.nombre.length * 3;
  bytesCount += 3 + object.porcentajeDescuentoFormateado.length * 3;
  bytesCount += 3 + object.precioOfertaFormateado.length * 3;
  bytesCount += 3 + object.precioOriginalFormateado.length * 3;
  return bytesCount;
}

void _ofertaSerialize(
  Oferta object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.activa);
  writer.writeDouble(offsets[1], object.ahorroEnPesos);
  writer.writeString(offsets[2], object.ahorroFormateado);
  writer.writeLong(offsets[3], object.cantidadMaxima);
  writer.writeLong(offsets[4], object.cantidadMinima);
  writer.writeString(offsets[5], object.codigoDescuento);
  writer.writeString(offsets[6], object.colorEstado);
  writer.writeString(offsets[7], object.condiciones);
  writer.writeString(offsets[8], object.descripcion);
  writer.writeLong(offsets[9], object.diasRestantes);
  writer.writeLong(offsets[10], object.diasTranscurridos);
  writer.writeBool(offsets[11], object.estaActiva);
  writer.writeBool(offsets[12], object.estaPorComenzar);
  writer.writeString(offsets[13], object.estadoOferta);
  writer.writeDateTime(offsets[14], object.fechaActualizacion);
  writer.writeDateTime(offsets[15], object.fechaCreacion);
  writer.writeDateTime(offsets[16], object.fechaFin);
  writer.writeDateTime(offsets[17], object.fechaInicio);
  writer.writeBool(offsets[18], object.haExpirado);
  writer.writeBool(offsets[19], object.hayStockDisponible);
  writer.writeString(offsets[20], object.imagenOferta);
  writer.writeDouble(offsets[21], object.ingresosGenerados);
  writer.writeString(offsets[22], object.nombre);
  writer.writeDouble(offsets[23], object.porcentajeDescuento);
  writer.writeString(offsets[24], object.porcentajeDescuentoFormateado);
  writer.writeDouble(offsets[25], object.precioOferta);
  writer.writeString(offsets[26], object.precioOfertaFormateado);
  writer.writeDouble(offsets[27], object.precioOriginal);
  writer.writeString(offsets[28], object.precioOriginalFormateado);
  writer.writeLong(offsets[29], object.productoId);
  writer.writeDouble(offsets[30], object.progresoOferta);
  writer.writeBool(offsets[31], object.requiereCodigo);
  writer.writeLong(offsets[32], object.stockDisponible);
  writer.writeLong(offsets[33], object.ventasRealizadas);
}

Oferta _ofertaDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Oferta(
    cantidadMaxima: reader.readLongOrNull(offsets[3]),
    cantidadMinima: reader.readLongOrNull(offsets[4]),
    codigoDescuento: reader.readStringOrNull(offsets[5]),
    condiciones: reader.readStringOrNull(offsets[7]),
    descripcion: reader.readStringOrNull(offsets[8]),
    fechaFin: reader.readDateTime(offsets[16]),
    fechaInicio: reader.readDateTime(offsets[17]),
    imagenOferta: reader.readStringOrNull(offsets[20]),
    nombre: reader.readString(offsets[22]),
    porcentajeDescuento: reader.readDouble(offsets[23]),
    precioOferta: reader.readDouble(offsets[25]),
    precioOriginal: reader.readDouble(offsets[27]),
    productoId: reader.readLong(offsets[29]),
    requiereCodigo: reader.readBoolOrNull(offsets[31]) ?? false,
    stockDisponible: reader.readLongOrNull(offsets[32]),
  );
  object.activa = reader.readBool(offsets[0]);
  object.fechaActualizacion = reader.readDateTimeOrNull(offsets[14]);
  object.fechaCreacion = reader.readDateTime(offsets[15]);
  object.id = id;
  object.ingresosGenerados = reader.readDouble(offsets[21]);
  object.ventasRealizadas = reader.readLong(offsets[33]);
  return object;
}

P _ofertaDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readLong(offset)) as P;
    case 10:
      return (reader.readLong(offset)) as P;
    case 11:
      return (reader.readBool(offset)) as P;
    case 12:
      return (reader.readBool(offset)) as P;
    case 13:
      return (reader.readString(offset)) as P;
    case 14:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 15:
      return (reader.readDateTime(offset)) as P;
    case 16:
      return (reader.readDateTime(offset)) as P;
    case 17:
      return (reader.readDateTime(offset)) as P;
    case 18:
      return (reader.readBool(offset)) as P;
    case 19:
      return (reader.readBool(offset)) as P;
    case 20:
      return (reader.readStringOrNull(offset)) as P;
    case 21:
      return (reader.readDouble(offset)) as P;
    case 22:
      return (reader.readString(offset)) as P;
    case 23:
      return (reader.readDouble(offset)) as P;
    case 24:
      return (reader.readString(offset)) as P;
    case 25:
      return (reader.readDouble(offset)) as P;
    case 26:
      return (reader.readString(offset)) as P;
    case 27:
      return (reader.readDouble(offset)) as P;
    case 28:
      return (reader.readString(offset)) as P;
    case 29:
      return (reader.readLong(offset)) as P;
    case 30:
      return (reader.readDouble(offset)) as P;
    case 31:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 32:
      return (reader.readLongOrNull(offset)) as P;
    case 33:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _ofertaGetId(Oferta object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _ofertaGetLinks(Oferta object) {
  return [];
}

void _ofertaAttach(IsarCollection<dynamic> col, Id id, Oferta object) {
  object.id = id;
}

extension OfertaQueryWhereSort on QueryBuilder<Oferta, Oferta, QWhere> {
  QueryBuilder<Oferta, Oferta, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension OfertaQueryWhere on QueryBuilder<Oferta, Oferta, QWhereClause> {
  QueryBuilder<Oferta, Oferta, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Oferta, Oferta, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterWhereClause> idBetween(
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

extension OfertaQueryFilter on QueryBuilder<Oferta, Oferta, QFilterCondition> {
  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> activaEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'activa',
        value: value,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> ahorroEnPesosEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ahorroEnPesos',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> ahorroEnPesosGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ahorroEnPesos',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> ahorroEnPesosLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ahorroEnPesos',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> ahorroEnPesosBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ahorroEnPesos',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> ahorroFormateadoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ahorroFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition>
      ahorroFormateadoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ahorroFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> ahorroFormateadoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ahorroFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> ahorroFormateadoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ahorroFormateado',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition>
      ahorroFormateadoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ahorroFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> ahorroFormateadoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ahorroFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> ahorroFormateadoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ahorroFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> ahorroFormateadoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ahorroFormateado',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition>
      ahorroFormateadoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ahorroFormateado',
        value: '',
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition>
      ahorroFormateadoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ahorroFormateado',
        value: '',
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> cantidadMaximaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cantidadMaxima',
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition>
      cantidadMaximaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cantidadMaxima',
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> cantidadMaximaEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cantidadMaxima',
        value: value,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> cantidadMaximaGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cantidadMaxima',
        value: value,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> cantidadMaximaLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cantidadMaxima',
        value: value,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> cantidadMaximaBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cantidadMaxima',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> cantidadMinimaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cantidadMinima',
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition>
      cantidadMinimaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cantidadMinima',
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> cantidadMinimaEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cantidadMinima',
        value: value,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> cantidadMinimaGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cantidadMinima',
        value: value,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> cantidadMinimaLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cantidadMinima',
        value: value,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> cantidadMinimaBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cantidadMinima',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> codigoDescuentoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'codigoDescuento',
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition>
      codigoDescuentoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'codigoDescuento',
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> codigoDescuentoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'codigoDescuento',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition>
      codigoDescuentoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'codigoDescuento',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> codigoDescuentoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'codigoDescuento',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> codigoDescuentoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'codigoDescuento',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> codigoDescuentoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'codigoDescuento',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> codigoDescuentoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'codigoDescuento',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> codigoDescuentoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'codigoDescuento',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> codigoDescuentoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'codigoDescuento',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> codigoDescuentoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'codigoDescuento',
        value: '',
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition>
      codigoDescuentoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'codigoDescuento',
        value: '',
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> colorEstadoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'colorEstado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> colorEstadoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'colorEstado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> colorEstadoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'colorEstado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> colorEstadoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'colorEstado',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> colorEstadoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'colorEstado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> colorEstadoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'colorEstado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> colorEstadoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'colorEstado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> colorEstadoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'colorEstado',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> colorEstadoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'colorEstado',
        value: '',
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> colorEstadoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'colorEstado',
        value: '',
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> condicionesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'condiciones',
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> condicionesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'condiciones',
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> condicionesEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'condiciones',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> condicionesGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'condiciones',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> condicionesLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'condiciones',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> condicionesBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'condiciones',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> condicionesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'condiciones',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> condicionesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'condiciones',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> condicionesContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'condiciones',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> condicionesMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'condiciones',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> condicionesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'condiciones',
        value: '',
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> condicionesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'condiciones',
        value: '',
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> descripcionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'descripcion',
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> descripcionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'descripcion',
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> descripcionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'descripcion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> descripcionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'descripcion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> descripcionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'descripcion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> descripcionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'descripcion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> descripcionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'descripcion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> descripcionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'descripcion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> descripcionContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'descripcion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> descripcionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'descripcion',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> descripcionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'descripcion',
        value: '',
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> descripcionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'descripcion',
        value: '',
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> diasRestantesEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'diasRestantes',
        value: value,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> diasRestantesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'diasRestantes',
        value: value,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> diasRestantesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'diasRestantes',
        value: value,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> diasRestantesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'diasRestantes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> diasTranscurridosEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'diasTranscurridos',
        value: value,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition>
      diasTranscurridosGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'diasTranscurridos',
        value: value,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> diasTranscurridosLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'diasTranscurridos',
        value: value,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> diasTranscurridosBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'diasTranscurridos',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> estaActivaEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estaActiva',
        value: value,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> estaPorComenzarEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estaPorComenzar',
        value: value,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> estadoOfertaEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estadoOferta',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> estadoOfertaGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'estadoOferta',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> estadoOfertaLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'estadoOferta',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> estadoOfertaBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'estadoOferta',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> estadoOfertaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'estadoOferta',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> estadoOfertaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'estadoOferta',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> estadoOfertaContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'estadoOferta',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> estadoOfertaMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'estadoOferta',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> estadoOfertaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estadoOferta',
        value: '',
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> estadoOfertaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'estadoOferta',
        value: '',
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition>
      fechaActualizacionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fechaActualizacion',
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition>
      fechaActualizacionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fechaActualizacion',
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> fechaActualizacionEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaActualizacion',
        value: value,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition>
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

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition>
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

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> fechaActualizacionBetween(
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

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> fechaCreacionEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaCreacion',
        value: value,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> fechaCreacionGreaterThan(
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

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> fechaCreacionLessThan(
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

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> fechaCreacionBetween(
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

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> fechaFinEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaFin',
        value: value,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> fechaFinGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fechaFin',
        value: value,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> fechaFinLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fechaFin',
        value: value,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> fechaFinBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fechaFin',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> fechaInicioEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaInicio',
        value: value,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> fechaInicioGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fechaInicio',
        value: value,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> fechaInicioLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fechaInicio',
        value: value,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> fechaInicioBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fechaInicio',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> haExpiradoEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'haExpirado',
        value: value,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> hayStockDisponibleEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hayStockDisponible',
        value: value,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> imagenOfertaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'imagenOferta',
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> imagenOfertaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'imagenOferta',
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> imagenOfertaEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imagenOferta',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> imagenOfertaGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'imagenOferta',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> imagenOfertaLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'imagenOferta',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> imagenOfertaBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'imagenOferta',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> imagenOfertaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'imagenOferta',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> imagenOfertaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'imagenOferta',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> imagenOfertaContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'imagenOferta',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> imagenOfertaMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'imagenOferta',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> imagenOfertaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imagenOferta',
        value: '',
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> imagenOfertaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'imagenOferta',
        value: '',
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> ingresosGeneradosEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ingresosGenerados',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition>
      ingresosGeneradosGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ingresosGenerados',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> ingresosGeneradosLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ingresosGenerados',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> ingresosGeneradosBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ingresosGenerados',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> nombreEqualTo(
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

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> nombreGreaterThan(
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

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> nombreLessThan(
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

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> nombreBetween(
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

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> nombreStartsWith(
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

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> nombreEndsWith(
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

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> nombreContains(
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

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> nombreMatches(
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

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> nombreIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nombre',
        value: '',
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> nombreIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nombre',
        value: '',
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition>
      porcentajeDescuentoEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'porcentajeDescuento',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition>
      porcentajeDescuentoGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'porcentajeDescuento',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition>
      porcentajeDescuentoLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'porcentajeDescuento',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition>
      porcentajeDescuentoBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'porcentajeDescuento',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition>
      porcentajeDescuentoFormateadoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'porcentajeDescuentoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition>
      porcentajeDescuentoFormateadoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'porcentajeDescuentoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition>
      porcentajeDescuentoFormateadoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'porcentajeDescuentoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition>
      porcentajeDescuentoFormateadoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'porcentajeDescuentoFormateado',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition>
      porcentajeDescuentoFormateadoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'porcentajeDescuentoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition>
      porcentajeDescuentoFormateadoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'porcentajeDescuentoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition>
      porcentajeDescuentoFormateadoContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'porcentajeDescuentoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition>
      porcentajeDescuentoFormateadoMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'porcentajeDescuentoFormateado',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition>
      porcentajeDescuentoFormateadoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'porcentajeDescuentoFormateado',
        value: '',
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition>
      porcentajeDescuentoFormateadoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'porcentajeDescuentoFormateado',
        value: '',
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> precioOfertaEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'precioOferta',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> precioOfertaGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'precioOferta',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> precioOfertaLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'precioOferta',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> precioOfertaBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'precioOferta',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition>
      precioOfertaFormateadoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'precioOfertaFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition>
      precioOfertaFormateadoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'precioOfertaFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition>
      precioOfertaFormateadoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'precioOfertaFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition>
      precioOfertaFormateadoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'precioOfertaFormateado',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition>
      precioOfertaFormateadoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'precioOfertaFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition>
      precioOfertaFormateadoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'precioOfertaFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition>
      precioOfertaFormateadoContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'precioOfertaFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition>
      precioOfertaFormateadoMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'precioOfertaFormateado',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition>
      precioOfertaFormateadoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'precioOfertaFormateado',
        value: '',
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition>
      precioOfertaFormateadoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'precioOfertaFormateado',
        value: '',
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> precioOriginalEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'precioOriginal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> precioOriginalGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'precioOriginal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> precioOriginalLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'precioOriginal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> precioOriginalBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'precioOriginal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition>
      precioOriginalFormateadoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'precioOriginalFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition>
      precioOriginalFormateadoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'precioOriginalFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition>
      precioOriginalFormateadoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'precioOriginalFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition>
      precioOriginalFormateadoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'precioOriginalFormateado',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition>
      precioOriginalFormateadoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'precioOriginalFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition>
      precioOriginalFormateadoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'precioOriginalFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition>
      precioOriginalFormateadoContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'precioOriginalFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition>
      precioOriginalFormateadoMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'precioOriginalFormateado',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition>
      precioOriginalFormateadoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'precioOriginalFormateado',
        value: '',
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition>
      precioOriginalFormateadoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'precioOriginalFormateado',
        value: '',
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> productoIdEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'productoId',
        value: value,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> productoIdGreaterThan(
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

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> productoIdLessThan(
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

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> productoIdBetween(
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

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> progresoOfertaEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'progresoOferta',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> progresoOfertaGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'progresoOferta',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> progresoOfertaLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'progresoOferta',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> progresoOfertaBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'progresoOferta',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> requiereCodigoEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'requiereCodigo',
        value: value,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> stockDisponibleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'stockDisponible',
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition>
      stockDisponibleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'stockDisponible',
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> stockDisponibleEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stockDisponible',
        value: value,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition>
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

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> stockDisponibleLessThan(
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

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> stockDisponibleBetween(
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

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> ventasRealizadasEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ventasRealizadas',
        value: value,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition>
      ventasRealizadasGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ventasRealizadas',
        value: value,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> ventasRealizadasLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ventasRealizadas',
        value: value,
      ));
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterFilterCondition> ventasRealizadasBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ventasRealizadas',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension OfertaQueryObject on QueryBuilder<Oferta, Oferta, QFilterCondition> {}

extension OfertaQueryLinks on QueryBuilder<Oferta, Oferta, QFilterCondition> {}

extension OfertaQuerySortBy on QueryBuilder<Oferta, Oferta, QSortBy> {
  QueryBuilder<Oferta, Oferta, QAfterSortBy> sortByActiva() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activa', Sort.asc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> sortByActivaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activa', Sort.desc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> sortByAhorroEnPesos() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ahorroEnPesos', Sort.asc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> sortByAhorroEnPesosDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ahorroEnPesos', Sort.desc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> sortByAhorroFormateado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ahorroFormateado', Sort.asc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> sortByAhorroFormateadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ahorroFormateado', Sort.desc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> sortByCantidadMaxima() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cantidadMaxima', Sort.asc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> sortByCantidadMaximaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cantidadMaxima', Sort.desc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> sortByCantidadMinima() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cantidadMinima', Sort.asc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> sortByCantidadMinimaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cantidadMinima', Sort.desc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> sortByCodigoDescuento() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'codigoDescuento', Sort.asc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> sortByCodigoDescuentoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'codigoDescuento', Sort.desc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> sortByColorEstado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorEstado', Sort.asc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> sortByColorEstadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorEstado', Sort.desc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> sortByCondiciones() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'condiciones', Sort.asc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> sortByCondicionesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'condiciones', Sort.desc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> sortByDescripcion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descripcion', Sort.asc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> sortByDescripcionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descripcion', Sort.desc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> sortByDiasRestantes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diasRestantes', Sort.asc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> sortByDiasRestantesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diasRestantes', Sort.desc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> sortByDiasTranscurridos() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diasTranscurridos', Sort.asc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> sortByDiasTranscurridosDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diasTranscurridos', Sort.desc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> sortByEstaActiva() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estaActiva', Sort.asc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> sortByEstaActivaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estaActiva', Sort.desc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> sortByEstaPorComenzar() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estaPorComenzar', Sort.asc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> sortByEstaPorComenzarDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estaPorComenzar', Sort.desc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> sortByEstadoOferta() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estadoOferta', Sort.asc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> sortByEstadoOfertaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estadoOferta', Sort.desc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> sortByFechaActualizacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaActualizacion', Sort.asc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> sortByFechaActualizacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaActualizacion', Sort.desc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> sortByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.asc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> sortByFechaCreacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.desc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> sortByFechaFin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaFin', Sort.asc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> sortByFechaFinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaFin', Sort.desc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> sortByFechaInicio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaInicio', Sort.asc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> sortByFechaInicioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaInicio', Sort.desc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> sortByHaExpirado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'haExpirado', Sort.asc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> sortByHaExpiradoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'haExpirado', Sort.desc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> sortByHayStockDisponible() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hayStockDisponible', Sort.asc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> sortByHayStockDisponibleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hayStockDisponible', Sort.desc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> sortByImagenOferta() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagenOferta', Sort.asc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> sortByImagenOfertaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagenOferta', Sort.desc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> sortByIngresosGenerados() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ingresosGenerados', Sort.asc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> sortByIngresosGeneradosDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ingresosGenerados', Sort.desc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> sortByNombre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.asc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> sortByNombreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.desc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> sortByPorcentajeDescuento() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'porcentajeDescuento', Sort.asc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> sortByPorcentajeDescuentoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'porcentajeDescuento', Sort.desc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy>
      sortByPorcentajeDescuentoFormateado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'porcentajeDescuentoFormateado', Sort.asc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy>
      sortByPorcentajeDescuentoFormateadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'porcentajeDescuentoFormateado', Sort.desc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> sortByPrecioOferta() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precioOferta', Sort.asc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> sortByPrecioOfertaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precioOferta', Sort.desc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> sortByPrecioOfertaFormateado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precioOfertaFormateado', Sort.asc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy>
      sortByPrecioOfertaFormateadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precioOfertaFormateado', Sort.desc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> sortByPrecioOriginal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precioOriginal', Sort.asc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> sortByPrecioOriginalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precioOriginal', Sort.desc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> sortByPrecioOriginalFormateado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precioOriginalFormateado', Sort.asc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy>
      sortByPrecioOriginalFormateadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precioOriginalFormateado', Sort.desc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> sortByProductoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productoId', Sort.asc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> sortByProductoIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productoId', Sort.desc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> sortByProgresoOferta() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'progresoOferta', Sort.asc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> sortByProgresoOfertaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'progresoOferta', Sort.desc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> sortByRequiereCodigo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requiereCodigo', Sort.asc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> sortByRequiereCodigoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requiereCodigo', Sort.desc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> sortByStockDisponible() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stockDisponible', Sort.asc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> sortByStockDisponibleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stockDisponible', Sort.desc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> sortByVentasRealizadas() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ventasRealizadas', Sort.asc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> sortByVentasRealizadasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ventasRealizadas', Sort.desc);
    });
  }
}

extension OfertaQuerySortThenBy on QueryBuilder<Oferta, Oferta, QSortThenBy> {
  QueryBuilder<Oferta, Oferta, QAfterSortBy> thenByActiva() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activa', Sort.asc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> thenByActivaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activa', Sort.desc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> thenByAhorroEnPesos() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ahorroEnPesos', Sort.asc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> thenByAhorroEnPesosDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ahorroEnPesos', Sort.desc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> thenByAhorroFormateado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ahorroFormateado', Sort.asc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> thenByAhorroFormateadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ahorroFormateado', Sort.desc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> thenByCantidadMaxima() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cantidadMaxima', Sort.asc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> thenByCantidadMaximaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cantidadMaxima', Sort.desc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> thenByCantidadMinima() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cantidadMinima', Sort.asc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> thenByCantidadMinimaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cantidadMinima', Sort.desc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> thenByCodigoDescuento() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'codigoDescuento', Sort.asc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> thenByCodigoDescuentoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'codigoDescuento', Sort.desc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> thenByColorEstado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorEstado', Sort.asc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> thenByColorEstadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorEstado', Sort.desc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> thenByCondiciones() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'condiciones', Sort.asc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> thenByCondicionesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'condiciones', Sort.desc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> thenByDescripcion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descripcion', Sort.asc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> thenByDescripcionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descripcion', Sort.desc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> thenByDiasRestantes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diasRestantes', Sort.asc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> thenByDiasRestantesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diasRestantes', Sort.desc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> thenByDiasTranscurridos() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diasTranscurridos', Sort.asc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> thenByDiasTranscurridosDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diasTranscurridos', Sort.desc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> thenByEstaActiva() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estaActiva', Sort.asc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> thenByEstaActivaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estaActiva', Sort.desc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> thenByEstaPorComenzar() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estaPorComenzar', Sort.asc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> thenByEstaPorComenzarDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estaPorComenzar', Sort.desc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> thenByEstadoOferta() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estadoOferta', Sort.asc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> thenByEstadoOfertaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estadoOferta', Sort.desc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> thenByFechaActualizacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaActualizacion', Sort.asc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> thenByFechaActualizacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaActualizacion', Sort.desc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> thenByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.asc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> thenByFechaCreacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.desc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> thenByFechaFin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaFin', Sort.asc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> thenByFechaFinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaFin', Sort.desc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> thenByFechaInicio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaInicio', Sort.asc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> thenByFechaInicioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaInicio', Sort.desc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> thenByHaExpirado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'haExpirado', Sort.asc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> thenByHaExpiradoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'haExpirado', Sort.desc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> thenByHayStockDisponible() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hayStockDisponible', Sort.asc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> thenByHayStockDisponibleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hayStockDisponible', Sort.desc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> thenByImagenOferta() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagenOferta', Sort.asc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> thenByImagenOfertaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagenOferta', Sort.desc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> thenByIngresosGenerados() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ingresosGenerados', Sort.asc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> thenByIngresosGeneradosDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ingresosGenerados', Sort.desc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> thenByNombre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.asc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> thenByNombreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.desc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> thenByPorcentajeDescuento() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'porcentajeDescuento', Sort.asc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> thenByPorcentajeDescuentoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'porcentajeDescuento', Sort.desc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy>
      thenByPorcentajeDescuentoFormateado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'porcentajeDescuentoFormateado', Sort.asc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy>
      thenByPorcentajeDescuentoFormateadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'porcentajeDescuentoFormateado', Sort.desc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> thenByPrecioOferta() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precioOferta', Sort.asc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> thenByPrecioOfertaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precioOferta', Sort.desc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> thenByPrecioOfertaFormateado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precioOfertaFormateado', Sort.asc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy>
      thenByPrecioOfertaFormateadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precioOfertaFormateado', Sort.desc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> thenByPrecioOriginal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precioOriginal', Sort.asc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> thenByPrecioOriginalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precioOriginal', Sort.desc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> thenByPrecioOriginalFormateado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precioOriginalFormateado', Sort.asc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy>
      thenByPrecioOriginalFormateadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precioOriginalFormateado', Sort.desc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> thenByProductoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productoId', Sort.asc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> thenByProductoIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productoId', Sort.desc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> thenByProgresoOferta() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'progresoOferta', Sort.asc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> thenByProgresoOfertaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'progresoOferta', Sort.desc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> thenByRequiereCodigo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requiereCodigo', Sort.asc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> thenByRequiereCodigoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requiereCodigo', Sort.desc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> thenByStockDisponible() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stockDisponible', Sort.asc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> thenByStockDisponibleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stockDisponible', Sort.desc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> thenByVentasRealizadas() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ventasRealizadas', Sort.asc);
    });
  }

  QueryBuilder<Oferta, Oferta, QAfterSortBy> thenByVentasRealizadasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ventasRealizadas', Sort.desc);
    });
  }
}

extension OfertaQueryWhereDistinct on QueryBuilder<Oferta, Oferta, QDistinct> {
  QueryBuilder<Oferta, Oferta, QDistinct> distinctByActiva() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'activa');
    });
  }

  QueryBuilder<Oferta, Oferta, QDistinct> distinctByAhorroEnPesos() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ahorroEnPesos');
    });
  }

  QueryBuilder<Oferta, Oferta, QDistinct> distinctByAhorroFormateado(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ahorroFormateado',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Oferta, Oferta, QDistinct> distinctByCantidadMaxima() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cantidadMaxima');
    });
  }

  QueryBuilder<Oferta, Oferta, QDistinct> distinctByCantidadMinima() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cantidadMinima');
    });
  }

  QueryBuilder<Oferta, Oferta, QDistinct> distinctByCodigoDescuento(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'codigoDescuento',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Oferta, Oferta, QDistinct> distinctByColorEstado(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'colorEstado', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Oferta, Oferta, QDistinct> distinctByCondiciones(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'condiciones', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Oferta, Oferta, QDistinct> distinctByDescripcion(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'descripcion', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Oferta, Oferta, QDistinct> distinctByDiasRestantes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'diasRestantes');
    });
  }

  QueryBuilder<Oferta, Oferta, QDistinct> distinctByDiasTranscurridos() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'diasTranscurridos');
    });
  }

  QueryBuilder<Oferta, Oferta, QDistinct> distinctByEstaActiva() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estaActiva');
    });
  }

  QueryBuilder<Oferta, Oferta, QDistinct> distinctByEstaPorComenzar() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estaPorComenzar');
    });
  }

  QueryBuilder<Oferta, Oferta, QDistinct> distinctByEstadoOferta(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estadoOferta', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Oferta, Oferta, QDistinct> distinctByFechaActualizacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaActualizacion');
    });
  }

  QueryBuilder<Oferta, Oferta, QDistinct> distinctByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaCreacion');
    });
  }

  QueryBuilder<Oferta, Oferta, QDistinct> distinctByFechaFin() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaFin');
    });
  }

  QueryBuilder<Oferta, Oferta, QDistinct> distinctByFechaInicio() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaInicio');
    });
  }

  QueryBuilder<Oferta, Oferta, QDistinct> distinctByHaExpirado() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'haExpirado');
    });
  }

  QueryBuilder<Oferta, Oferta, QDistinct> distinctByHayStockDisponible() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hayStockDisponible');
    });
  }

  QueryBuilder<Oferta, Oferta, QDistinct> distinctByImagenOferta(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'imagenOferta', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Oferta, Oferta, QDistinct> distinctByIngresosGenerados() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ingresosGenerados');
    });
  }

  QueryBuilder<Oferta, Oferta, QDistinct> distinctByNombre(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nombre', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Oferta, Oferta, QDistinct> distinctByPorcentajeDescuento() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'porcentajeDescuento');
    });
  }

  QueryBuilder<Oferta, Oferta, QDistinct>
      distinctByPorcentajeDescuentoFormateado({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'porcentajeDescuentoFormateado',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Oferta, Oferta, QDistinct> distinctByPrecioOferta() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'precioOferta');
    });
  }

  QueryBuilder<Oferta, Oferta, QDistinct> distinctByPrecioOfertaFormateado(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'precioOfertaFormateado',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Oferta, Oferta, QDistinct> distinctByPrecioOriginal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'precioOriginal');
    });
  }

  QueryBuilder<Oferta, Oferta, QDistinct> distinctByPrecioOriginalFormateado(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'precioOriginalFormateado',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Oferta, Oferta, QDistinct> distinctByProductoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'productoId');
    });
  }

  QueryBuilder<Oferta, Oferta, QDistinct> distinctByProgresoOferta() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'progresoOferta');
    });
  }

  QueryBuilder<Oferta, Oferta, QDistinct> distinctByRequiereCodigo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'requiereCodigo');
    });
  }

  QueryBuilder<Oferta, Oferta, QDistinct> distinctByStockDisponible() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stockDisponible');
    });
  }

  QueryBuilder<Oferta, Oferta, QDistinct> distinctByVentasRealizadas() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ventasRealizadas');
    });
  }
}

extension OfertaQueryProperty on QueryBuilder<Oferta, Oferta, QQueryProperty> {
  QueryBuilder<Oferta, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Oferta, bool, QQueryOperations> activaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'activa');
    });
  }

  QueryBuilder<Oferta, double, QQueryOperations> ahorroEnPesosProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ahorroEnPesos');
    });
  }

  QueryBuilder<Oferta, String, QQueryOperations> ahorroFormateadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ahorroFormateado');
    });
  }

  QueryBuilder<Oferta, int?, QQueryOperations> cantidadMaximaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cantidadMaxima');
    });
  }

  QueryBuilder<Oferta, int?, QQueryOperations> cantidadMinimaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cantidadMinima');
    });
  }

  QueryBuilder<Oferta, String?, QQueryOperations> codigoDescuentoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'codigoDescuento');
    });
  }

  QueryBuilder<Oferta, String, QQueryOperations> colorEstadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'colorEstado');
    });
  }

  QueryBuilder<Oferta, String?, QQueryOperations> condicionesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'condiciones');
    });
  }

  QueryBuilder<Oferta, String?, QQueryOperations> descripcionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'descripcion');
    });
  }

  QueryBuilder<Oferta, int, QQueryOperations> diasRestantesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'diasRestantes');
    });
  }

  QueryBuilder<Oferta, int, QQueryOperations> diasTranscurridosProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'diasTranscurridos');
    });
  }

  QueryBuilder<Oferta, bool, QQueryOperations> estaActivaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estaActiva');
    });
  }

  QueryBuilder<Oferta, bool, QQueryOperations> estaPorComenzarProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estaPorComenzar');
    });
  }

  QueryBuilder<Oferta, String, QQueryOperations> estadoOfertaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estadoOferta');
    });
  }

  QueryBuilder<Oferta, DateTime?, QQueryOperations>
      fechaActualizacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaActualizacion');
    });
  }

  QueryBuilder<Oferta, DateTime, QQueryOperations> fechaCreacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaCreacion');
    });
  }

  QueryBuilder<Oferta, DateTime, QQueryOperations> fechaFinProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaFin');
    });
  }

  QueryBuilder<Oferta, DateTime, QQueryOperations> fechaInicioProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaInicio');
    });
  }

  QueryBuilder<Oferta, bool, QQueryOperations> haExpiradoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'haExpirado');
    });
  }

  QueryBuilder<Oferta, bool, QQueryOperations> hayStockDisponibleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hayStockDisponible');
    });
  }

  QueryBuilder<Oferta, String?, QQueryOperations> imagenOfertaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'imagenOferta');
    });
  }

  QueryBuilder<Oferta, double, QQueryOperations> ingresosGeneradosProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ingresosGenerados');
    });
  }

  QueryBuilder<Oferta, String, QQueryOperations> nombreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nombre');
    });
  }

  QueryBuilder<Oferta, double, QQueryOperations> porcentajeDescuentoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'porcentajeDescuento');
    });
  }

  QueryBuilder<Oferta, String, QQueryOperations>
      porcentajeDescuentoFormateadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'porcentajeDescuentoFormateado');
    });
  }

  QueryBuilder<Oferta, double, QQueryOperations> precioOfertaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'precioOferta');
    });
  }

  QueryBuilder<Oferta, String, QQueryOperations>
      precioOfertaFormateadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'precioOfertaFormateado');
    });
  }

  QueryBuilder<Oferta, double, QQueryOperations> precioOriginalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'precioOriginal');
    });
  }

  QueryBuilder<Oferta, String, QQueryOperations>
      precioOriginalFormateadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'precioOriginalFormateado');
    });
  }

  QueryBuilder<Oferta, int, QQueryOperations> productoIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'productoId');
    });
  }

  QueryBuilder<Oferta, double, QQueryOperations> progresoOfertaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'progresoOferta');
    });
  }

  QueryBuilder<Oferta, bool, QQueryOperations> requiereCodigoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'requiereCodigo');
    });
  }

  QueryBuilder<Oferta, int?, QQueryOperations> stockDisponibleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stockDisponible');
    });
  }

  QueryBuilder<Oferta, int, QQueryOperations> ventasRealizadasProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ventasRealizadas');
    });
  }
}
