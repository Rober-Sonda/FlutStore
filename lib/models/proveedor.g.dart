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
    r'activo': PropertySchema(
      id: 0,
      name: r'activo',
      type: IsarType.bool,
    ),
    r'banco': PropertySchema(
      id: 1,
      name: r'banco',
      type: IsarType.string,
    ),
    r'calificacion': PropertySchema(
      id: 2,
      name: r'calificacion',
      type: IsarType.double,
    ),
    r'calificacionFormateada': PropertySchema(
      id: 3,
      name: r'calificacionFormateada',
      type: IsarType.string,
    ),
    r'cargoContacto': PropertySchema(
      id: 4,
      name: r'cargoContacto',
      type: IsarType.string,
    ),
    r'categorias': PropertySchema(
      id: 5,
      name: r'categorias',
      type: IsarType.stringList,
    ),
    r'colorEstado': PropertySchema(
      id: 6,
      name: r'colorEstado',
      type: IsarType.string,
    ),
    r'condicionesPago': PropertySchema(
      id: 7,
      name: r'condicionesPago',
      type: IsarType.string,
    ),
    r'contacto': PropertySchema(
      id: 8,
      name: r'contacto',
      type: IsarType.string,
    ),
    r'contactoPrincipal': PropertySchema(
      id: 9,
      name: r'contactoPrincipal',
      type: IsarType.string,
    ),
    r'cuit': PropertySchema(
      id: 10,
      name: r'cuit',
      type: IsarType.string,
    ),
    r'descuento': PropertySchema(
      id: 11,
      name: r'descuento',
      type: IsarType.double,
    ),
    r'descuentoFormateado': PropertySchema(
      id: 12,
      name: r'descuentoFormateado',
      type: IsarType.string,
    ),
    r'direccion': PropertySchema(
      id: 13,
      name: r'direccion',
      type: IsarType.string,
    ),
    r'email': PropertySchema(
      id: 14,
      name: r'email',
      type: IsarType.string,
    ),
    r'emailAlternativo': PropertySchema(
      id: 15,
      name: r'emailAlternativo',
      type: IsarType.string,
    ),
    r'estaAlLimiteCredito': PropertySchema(
      id: 16,
      name: r'estaAlLimiteCredito',
      type: IsarType.bool,
    ),
    r'estado': PropertySchema(
      id: 17,
      name: r'estado',
      type: IsarType.string,
    ),
    r'estadoFormateado': PropertySchema(
      id: 18,
      name: r'estadoFormateado',
      type: IsarType.string,
    ),
    r'fechaActualizacion': PropertySchema(
      id: 19,
      name: r'fechaActualizacion',
      type: IsarType.dateTime,
    ),
    r'fechaRegistro': PropertySchema(
      id: 20,
      name: r'fechaRegistro',
      type: IsarType.dateTime,
    ),
    r'hashCode': PropertySchema(
      id: 21,
      name: r'hashCode',
      type: IsarType.long,
    ),
    r'horarioAtencion': PropertySchema(
      id: 22,
      name: r'horarioAtencion',
      type: IsarType.string,
    ),
    r'iconoContactoPrincipal': PropertySchema(
      id: 23,
      name: r'iconoContactoPrincipal',
      type: IsarType.string,
    ),
    r'limiteCredito': PropertySchema(
      id: 24,
      name: r'limiteCredito',
      type: IsarType.double,
    ),
    r'limiteCreditoFormateado': PropertySchema(
      id: 25,
      name: r'limiteCreditoFormateado',
      type: IsarType.string,
    ),
    r'nombre': PropertySchema(
      id: 26,
      name: r'nombre',
      type: IsarType.string,
    ),
    r'nombreCompleto': PropertySchema(
      id: 27,
      name: r'nombreCompleto',
      type: IsarType.string,
    ),
    r'numeroCuenta': PropertySchema(
      id: 28,
      name: r'numeroCuenta',
      type: IsarType.string,
    ),
    r'observaciones': PropertySchema(
      id: 29,
      name: r'observaciones',
      type: IsarType.string,
    ),
    r'personaContacto': PropertySchema(
      id: 30,
      name: r'personaContacto',
      type: IsarType.string,
    ),
    r'plazoEntrega': PropertySchema(
      id: 31,
      name: r'plazoEntrega',
      type: IsarType.long,
    ),
    r'razonSocial': PropertySchema(
      id: 32,
      name: r'razonSocial',
      type: IsarType.string,
    ),
    r'saldoPendiente': PropertySchema(
      id: 33,
      name: r'saldoPendiente',
      type: IsarType.double,
    ),
    r'saldoPendienteFormateado': PropertySchema(
      id: 34,
      name: r'saldoPendienteFormateado',
      type: IsarType.string,
    ),
    r'sitioWeb': PropertySchema(
      id: 35,
      name: r'sitioWeb',
      type: IsarType.string,
    ),
    r'telefono': PropertySchema(
      id: 36,
      name: r'telefono',
      type: IsarType.string,
    ),
    r'telefonoAlternativo': PropertySchema(
      id: 37,
      name: r'telefonoAlternativo',
      type: IsarType.string,
    ),
    r'tieneDescuento': PropertySchema(
      id: 38,
      name: r'tieneDescuento',
      type: IsarType.bool,
    ),
    r'tieneLimiteCredito': PropertySchema(
      id: 39,
      name: r'tieneLimiteCredito',
      type: IsarType.bool,
    ),
    r'tipoCuenta': PropertySchema(
      id: 40,
      name: r'tipoCuenta',
      type: IsarType.string,
    ),
    r'totalComprado': PropertySchema(
      id: 41,
      name: r'totalComprado',
      type: IsarType.double,
    ),
    r'totalCompradoFormateado': PropertySchema(
      id: 42,
      name: r'totalCompradoFormateado',
      type: IsarType.string,
    ),
    r'totalCompras': PropertySchema(
      id: 43,
      name: r'totalCompras',
      type: IsarType.long,
    ),
    r'usuarioId': PropertySchema(
      id: 44,
      name: r'usuarioId',
      type: IsarType.long,
    ),
    r'whatsapp': PropertySchema(
      id: 45,
      name: r'whatsapp',
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
    final value = object.banco;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.calificacionFormateada.length * 3;
  {
    final value = object.cargoContacto;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.categorias.length * 3;
  {
    for (var i = 0; i < object.categorias.length; i++) {
      final value = object.categorias[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.colorEstado.length * 3;
  {
    final value = object.condicionesPago;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.contacto;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.contactoPrincipal.length * 3;
  {
    final value = object.cuit;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.descuentoFormateado.length * 3;
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
  {
    final value = object.emailAlternativo;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.estado.length * 3;
  bytesCount += 3 + object.estadoFormateado.length * 3;
  {
    final value = object.horarioAtencion;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.iconoContactoPrincipal.length * 3;
  bytesCount += 3 + object.limiteCreditoFormateado.length * 3;
  bytesCount += 3 + object.nombre.length * 3;
  bytesCount += 3 + object.nombreCompleto.length * 3;
  {
    final value = object.numeroCuenta;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.observaciones;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.personaContacto;
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
  bytesCount += 3 + object.saldoPendienteFormateado.length * 3;
  {
    final value = object.sitioWeb;
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
  {
    final value = object.telefonoAlternativo;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.tipoCuenta;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.totalCompradoFormateado.length * 3;
  {
    final value = object.whatsapp;
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
  writer.writeBool(offsets[0], object.activo);
  writer.writeString(offsets[1], object.banco);
  writer.writeDouble(offsets[2], object.calificacion);
  writer.writeString(offsets[3], object.calificacionFormateada);
  writer.writeString(offsets[4], object.cargoContacto);
  writer.writeStringList(offsets[5], object.categorias);
  writer.writeString(offsets[6], object.colorEstado);
  writer.writeString(offsets[7], object.condicionesPago);
  writer.writeString(offsets[8], object.contacto);
  writer.writeString(offsets[9], object.contactoPrincipal);
  writer.writeString(offsets[10], object.cuit);
  writer.writeDouble(offsets[11], object.descuento);
  writer.writeString(offsets[12], object.descuentoFormateado);
  writer.writeString(offsets[13], object.direccion);
  writer.writeString(offsets[14], object.email);
  writer.writeString(offsets[15], object.emailAlternativo);
  writer.writeBool(offsets[16], object.estaAlLimiteCredito);
  writer.writeString(offsets[17], object.estado);
  writer.writeString(offsets[18], object.estadoFormateado);
  writer.writeDateTime(offsets[19], object.fechaActualizacion);
  writer.writeDateTime(offsets[20], object.fechaRegistro);
  writer.writeLong(offsets[21], object.hashCode);
  writer.writeString(offsets[22], object.horarioAtencion);
  writer.writeString(offsets[23], object.iconoContactoPrincipal);
  writer.writeDouble(offsets[24], object.limiteCredito);
  writer.writeString(offsets[25], object.limiteCreditoFormateado);
  writer.writeString(offsets[26], object.nombre);
  writer.writeString(offsets[27], object.nombreCompleto);
  writer.writeString(offsets[28], object.numeroCuenta);
  writer.writeString(offsets[29], object.observaciones);
  writer.writeString(offsets[30], object.personaContacto);
  writer.writeLong(offsets[31], object.plazoEntrega);
  writer.writeString(offsets[32], object.razonSocial);
  writer.writeDouble(offsets[33], object.saldoPendiente);
  writer.writeString(offsets[34], object.saldoPendienteFormateado);
  writer.writeString(offsets[35], object.sitioWeb);
  writer.writeString(offsets[36], object.telefono);
  writer.writeString(offsets[37], object.telefonoAlternativo);
  writer.writeBool(offsets[38], object.tieneDescuento);
  writer.writeBool(offsets[39], object.tieneLimiteCredito);
  writer.writeString(offsets[40], object.tipoCuenta);
  writer.writeDouble(offsets[41], object.totalComprado);
  writer.writeString(offsets[42], object.totalCompradoFormateado);
  writer.writeLong(offsets[43], object.totalCompras);
  writer.writeLong(offsets[44], object.usuarioId);
  writer.writeString(offsets[45], object.whatsapp);
}

Proveedor _proveedorDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Proveedor(
    activo: reader.readBoolOrNull(offsets[0]) ?? true,
    banco: reader.readStringOrNull(offsets[1]),
    calificacion: reader.readDoubleOrNull(offsets[2]) ?? 0.0,
    cargoContacto: reader.readStringOrNull(offsets[4]),
    categorias: reader.readStringList(offsets[5]) ?? const [],
    condicionesPago: reader.readStringOrNull(offsets[7]),
    contacto: reader.readStringOrNull(offsets[8]),
    cuit: reader.readStringOrNull(offsets[10]),
    descuento: reader.readDoubleOrNull(offsets[11]),
    direccion: reader.readStringOrNull(offsets[13]),
    email: reader.readStringOrNull(offsets[14]),
    emailAlternativo: reader.readStringOrNull(offsets[15]),
    estado: reader.readStringOrNull(offsets[17]) ?? 'activo',
    horarioAtencion: reader.readStringOrNull(offsets[22]),
    limiteCredito: reader.readDoubleOrNull(offsets[24]) ?? 0.0,
    nombre: reader.readString(offsets[26]),
    numeroCuenta: reader.readStringOrNull(offsets[28]),
    observaciones: reader.readStringOrNull(offsets[29]),
    personaContacto: reader.readStringOrNull(offsets[30]),
    plazoEntrega: reader.readLongOrNull(offsets[31]),
    razonSocial: reader.readStringOrNull(offsets[32]),
    saldoPendiente: reader.readDoubleOrNull(offsets[33]) ?? 0.0,
    sitioWeb: reader.readStringOrNull(offsets[35]),
    telefono: reader.readStringOrNull(offsets[36]),
    telefonoAlternativo: reader.readStringOrNull(offsets[37]),
    tipoCuenta: reader.readStringOrNull(offsets[40]),
    totalComprado: reader.readDoubleOrNull(offsets[41]) ?? 0.0,
    totalCompras: reader.readLongOrNull(offsets[43]) ?? 0,
    usuarioId: reader.readLongOrNull(offsets[44]) ?? 1,
    whatsapp: reader.readStringOrNull(offsets[45]),
  );
  object.fechaActualizacion = reader.readDateTimeOrNull(offsets[19]);
  object.fechaRegistro = reader.readDateTime(offsets[20]);
  object.id = id;
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
      return (reader.readBoolOrNull(offset) ?? true) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readDoubleOrNull(offset) ?? 0.0) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringList(offset) ?? const []) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readDoubleOrNull(offset)) as P;
    case 12:
      return (reader.readString(offset)) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    case 14:
      return (reader.readStringOrNull(offset)) as P;
    case 15:
      return (reader.readStringOrNull(offset)) as P;
    case 16:
      return (reader.readBool(offset)) as P;
    case 17:
      return (reader.readStringOrNull(offset) ?? 'activo') as P;
    case 18:
      return (reader.readString(offset)) as P;
    case 19:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 20:
      return (reader.readDateTime(offset)) as P;
    case 21:
      return (reader.readLong(offset)) as P;
    case 22:
      return (reader.readStringOrNull(offset)) as P;
    case 23:
      return (reader.readString(offset)) as P;
    case 24:
      return (reader.readDoubleOrNull(offset) ?? 0.0) as P;
    case 25:
      return (reader.readString(offset)) as P;
    case 26:
      return (reader.readString(offset)) as P;
    case 27:
      return (reader.readString(offset)) as P;
    case 28:
      return (reader.readStringOrNull(offset)) as P;
    case 29:
      return (reader.readStringOrNull(offset)) as P;
    case 30:
      return (reader.readStringOrNull(offset)) as P;
    case 31:
      return (reader.readLongOrNull(offset)) as P;
    case 32:
      return (reader.readStringOrNull(offset)) as P;
    case 33:
      return (reader.readDoubleOrNull(offset) ?? 0.0) as P;
    case 34:
      return (reader.readString(offset)) as P;
    case 35:
      return (reader.readStringOrNull(offset)) as P;
    case 36:
      return (reader.readStringOrNull(offset)) as P;
    case 37:
      return (reader.readStringOrNull(offset)) as P;
    case 38:
      return (reader.readBool(offset)) as P;
    case 39:
      return (reader.readBool(offset)) as P;
    case 40:
      return (reader.readStringOrNull(offset)) as P;
    case 41:
      return (reader.readDoubleOrNull(offset) ?? 0.0) as P;
    case 42:
      return (reader.readString(offset)) as P;
    case 43:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 44:
      return (reader.readLongOrNull(offset) ?? 1) as P;
    case 45:
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
  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> activoEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'activo',
        value: value,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> bancoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'banco',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> bancoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'banco',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> bancoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'banco',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> bancoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'banco',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> bancoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'banco',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> bancoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'banco',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> bancoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'banco',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> bancoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'banco',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> bancoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'banco',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> bancoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'banco',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> bancoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'banco',
        value: '',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> bancoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'banco',
        value: '',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> calificacionEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'calificacion',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      calificacionGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'calificacion',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      calificacionLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'calificacion',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> calificacionBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'calificacion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      calificacionFormateadaEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'calificacionFormateada',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      calificacionFormateadaGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'calificacionFormateada',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      calificacionFormateadaLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'calificacionFormateada',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      calificacionFormateadaBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'calificacionFormateada',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      calificacionFormateadaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'calificacionFormateada',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      calificacionFormateadaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'calificacionFormateada',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      calificacionFormateadaContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'calificacionFormateada',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      calificacionFormateadaMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'calificacionFormateada',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      calificacionFormateadaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'calificacionFormateada',
        value: '',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      calificacionFormateadaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'calificacionFormateada',
        value: '',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      cargoContactoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cargoContacto',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      cargoContactoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cargoContacto',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      cargoContactoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cargoContacto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      cargoContactoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cargoContacto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      cargoContactoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cargoContacto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      cargoContactoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cargoContacto',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      cargoContactoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'cargoContacto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      cargoContactoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'cargoContacto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      cargoContactoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'cargoContacto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      cargoContactoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'cargoContacto',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      cargoContactoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cargoContacto',
        value: '',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      cargoContactoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'cargoContacto',
        value: '',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      categoriasElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'categorias',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      categoriasElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'categorias',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      categoriasElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'categorias',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      categoriasElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'categorias',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      categoriasElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'categorias',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      categoriasElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'categorias',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      categoriasElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'categorias',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      categoriasElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'categorias',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      categoriasElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'categorias',
        value: '',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      categoriasElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'categorias',
        value: '',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      categoriasLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categorias',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      categoriasIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categorias',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      categoriasIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categorias',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      categoriasLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categorias',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      categoriasLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categorias',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      categoriasLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categorias',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> colorEstadoEqualTo(
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

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      colorEstadoGreaterThan(
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

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> colorEstadoLessThan(
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

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> colorEstadoBetween(
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

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      colorEstadoStartsWith(
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

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> colorEstadoEndsWith(
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

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> colorEstadoContains(
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

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> colorEstadoMatches(
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

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      colorEstadoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'colorEstado',
        value: '',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      colorEstadoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'colorEstado',
        value: '',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      condicionesPagoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'condicionesPago',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      condicionesPagoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'condicionesPago',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      condicionesPagoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'condicionesPago',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      condicionesPagoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'condicionesPago',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      condicionesPagoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'condicionesPago',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      condicionesPagoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'condicionesPago',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      condicionesPagoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'condicionesPago',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      condicionesPagoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'condicionesPago',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      condicionesPagoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'condicionesPago',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      condicionesPagoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'condicionesPago',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      condicionesPagoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'condicionesPago',
        value: '',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      condicionesPagoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'condicionesPago',
        value: '',
      ));
    });
  }

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

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      contactoPrincipalEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'contactoPrincipal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      contactoPrincipalGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'contactoPrincipal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      contactoPrincipalLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'contactoPrincipal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      contactoPrincipalBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'contactoPrincipal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      contactoPrincipalStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'contactoPrincipal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      contactoPrincipalEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'contactoPrincipal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      contactoPrincipalContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'contactoPrincipal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      contactoPrincipalMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'contactoPrincipal',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      contactoPrincipalIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'contactoPrincipal',
        value: '',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      contactoPrincipalIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'contactoPrincipal',
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

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> descuentoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'descuento',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      descuentoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'descuento',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> descuentoEqualTo(
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

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      descuentoGreaterThan(
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

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> descuentoLessThan(
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

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> descuentoBetween(
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

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      descuentoFormateadoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'descuentoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      descuentoFormateadoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'descuentoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      descuentoFormateadoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'descuentoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      descuentoFormateadoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'descuentoFormateado',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      descuentoFormateadoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'descuentoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      descuentoFormateadoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'descuentoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      descuentoFormateadoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'descuentoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      descuentoFormateadoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'descuentoFormateado',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      descuentoFormateadoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'descuentoFormateado',
        value: '',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      descuentoFormateadoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'descuentoFormateado',
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
      emailAlternativoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'emailAlternativo',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      emailAlternativoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'emailAlternativo',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      emailAlternativoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'emailAlternativo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      emailAlternativoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'emailAlternativo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      emailAlternativoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'emailAlternativo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      emailAlternativoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'emailAlternativo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      emailAlternativoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'emailAlternativo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      emailAlternativoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'emailAlternativo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      emailAlternativoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'emailAlternativo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      emailAlternativoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'emailAlternativo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      emailAlternativoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'emailAlternativo',
        value: '',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      emailAlternativoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'emailAlternativo',
        value: '',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      estaAlLimiteCreditoEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estaAlLimiteCredito',
        value: value,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> estadoEqualTo(
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

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> estadoGreaterThan(
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

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> estadoLessThan(
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

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> estadoBetween(
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

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> estadoStartsWith(
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

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> estadoEndsWith(
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

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> estadoContains(
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

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> estadoMatches(
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

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> estadoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estado',
        value: '',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> estadoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'estado',
        value: '',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      estadoFormateadoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estadoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      estadoFormateadoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'estadoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      estadoFormateadoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'estadoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      estadoFormateadoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'estadoFormateado',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      estadoFormateadoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'estadoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      estadoFormateadoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'estadoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      estadoFormateadoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'estadoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      estadoFormateadoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'estadoFormateado',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      estadoFormateadoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estadoFormateado',
        value: '',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      estadoFormateadoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'estadoFormateado',
        value: '',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      fechaActualizacionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fechaActualizacion',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      fechaActualizacionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fechaActualizacion',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      fechaActualizacionEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaActualizacion',
        value: value,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
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

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
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

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
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

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      fechaRegistroEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaRegistro',
        value: value,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      fechaRegistroGreaterThan(
    DateTime value, {
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
    DateTime value, {
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
    DateTime lower,
    DateTime upper, {
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

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      horarioAtencionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'horarioAtencion',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      horarioAtencionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'horarioAtencion',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      horarioAtencionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'horarioAtencion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      horarioAtencionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'horarioAtencion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      horarioAtencionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'horarioAtencion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      horarioAtencionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'horarioAtencion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      horarioAtencionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'horarioAtencion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      horarioAtencionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'horarioAtencion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      horarioAtencionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'horarioAtencion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      horarioAtencionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'horarioAtencion',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      horarioAtencionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'horarioAtencion',
        value: '',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      horarioAtencionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'horarioAtencion',
        value: '',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      iconoContactoPrincipalEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'iconoContactoPrincipal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      iconoContactoPrincipalGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'iconoContactoPrincipal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      iconoContactoPrincipalLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'iconoContactoPrincipal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      iconoContactoPrincipalBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'iconoContactoPrincipal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      iconoContactoPrincipalStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'iconoContactoPrincipal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      iconoContactoPrincipalEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'iconoContactoPrincipal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      iconoContactoPrincipalContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'iconoContactoPrincipal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      iconoContactoPrincipalMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'iconoContactoPrincipal',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      iconoContactoPrincipalIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'iconoContactoPrincipal',
        value: '',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      iconoContactoPrincipalIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'iconoContactoPrincipal',
        value: '',
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

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      limiteCreditoEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'limiteCredito',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      limiteCreditoGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'limiteCredito',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      limiteCreditoLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'limiteCredito',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      limiteCreditoBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'limiteCredito',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      limiteCreditoFormateadoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'limiteCreditoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      limiteCreditoFormateadoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'limiteCreditoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      limiteCreditoFormateadoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'limiteCreditoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      limiteCreditoFormateadoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'limiteCreditoFormateado',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      limiteCreditoFormateadoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'limiteCreditoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      limiteCreditoFormateadoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'limiteCreditoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      limiteCreditoFormateadoContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'limiteCreditoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      limiteCreditoFormateadoMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'limiteCreditoFormateado',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      limiteCreditoFormateadoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'limiteCreditoFormateado',
        value: '',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      limiteCreditoFormateadoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'limiteCreditoFormateado',
        value: '',
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
      nombreCompletoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nombreCompleto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      nombreCompletoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nombreCompleto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      nombreCompletoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nombreCompleto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      nombreCompletoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nombreCompleto',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      nombreCompletoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nombreCompleto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      nombreCompletoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nombreCompleto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      nombreCompletoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nombreCompleto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      nombreCompletoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nombreCompleto',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      nombreCompletoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nombreCompleto',
        value: '',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      nombreCompletoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nombreCompleto',
        value: '',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      numeroCuentaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'numeroCuenta',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      numeroCuentaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'numeroCuenta',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> numeroCuentaEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'numeroCuenta',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      numeroCuentaGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'numeroCuenta',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      numeroCuentaLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'numeroCuenta',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> numeroCuentaBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'numeroCuenta',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      numeroCuentaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'numeroCuenta',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      numeroCuentaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'numeroCuenta',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      numeroCuentaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'numeroCuenta',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> numeroCuentaMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'numeroCuenta',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      numeroCuentaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'numeroCuenta',
        value: '',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      numeroCuentaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'numeroCuenta',
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
      personaContactoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'personaContacto',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      personaContactoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'personaContacto',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      personaContactoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'personaContacto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      personaContactoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'personaContacto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      personaContactoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'personaContacto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      personaContactoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'personaContacto',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      personaContactoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'personaContacto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      personaContactoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'personaContacto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      personaContactoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'personaContacto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      personaContactoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'personaContacto',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      personaContactoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'personaContacto',
        value: '',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      personaContactoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'personaContacto',
        value: '',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      plazoEntregaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'plazoEntrega',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      plazoEntregaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'plazoEntrega',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> plazoEntregaEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'plazoEntrega',
        value: value,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      plazoEntregaGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'plazoEntrega',
        value: value,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      plazoEntregaLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'plazoEntrega',
        value: value,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> plazoEntregaBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'plazoEntrega',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
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

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      saldoPendienteEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'saldoPendiente',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      saldoPendienteGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'saldoPendiente',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      saldoPendienteLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'saldoPendiente',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      saldoPendienteBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'saldoPendiente',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      saldoPendienteFormateadoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'saldoPendienteFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      saldoPendienteFormateadoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'saldoPendienteFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      saldoPendienteFormateadoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'saldoPendienteFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      saldoPendienteFormateadoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'saldoPendienteFormateado',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      saldoPendienteFormateadoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'saldoPendienteFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      saldoPendienteFormateadoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'saldoPendienteFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      saldoPendienteFormateadoContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'saldoPendienteFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      saldoPendienteFormateadoMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'saldoPendienteFormateado',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      saldoPendienteFormateadoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'saldoPendienteFormateado',
        value: '',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      saldoPendienteFormateadoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'saldoPendienteFormateado',
        value: '',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> sitioWebIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sitioWeb',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      sitioWebIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sitioWeb',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> sitioWebEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sitioWeb',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> sitioWebGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sitioWeb',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> sitioWebLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sitioWeb',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> sitioWebBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sitioWeb',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> sitioWebStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'sitioWeb',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> sitioWebEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'sitioWeb',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> sitioWebContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sitioWeb',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> sitioWebMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sitioWeb',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> sitioWebIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sitioWeb',
        value: '',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      sitioWebIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sitioWeb',
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

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      telefonoAlternativoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'telefonoAlternativo',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      telefonoAlternativoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'telefonoAlternativo',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      telefonoAlternativoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'telefonoAlternativo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      telefonoAlternativoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'telefonoAlternativo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      telefonoAlternativoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'telefonoAlternativo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      telefonoAlternativoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'telefonoAlternativo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      telefonoAlternativoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'telefonoAlternativo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      telefonoAlternativoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'telefonoAlternativo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      telefonoAlternativoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'telefonoAlternativo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      telefonoAlternativoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'telefonoAlternativo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      telefonoAlternativoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'telefonoAlternativo',
        value: '',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      telefonoAlternativoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'telefonoAlternativo',
        value: '',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      tieneDescuentoEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tieneDescuento',
        value: value,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      tieneLimiteCreditoEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tieneLimiteCredito',
        value: value,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> tipoCuentaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tipoCuenta',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      tipoCuentaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tipoCuenta',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> tipoCuentaEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tipoCuenta',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      tipoCuentaGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tipoCuenta',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> tipoCuentaLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tipoCuenta',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> tipoCuentaBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tipoCuenta',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      tipoCuentaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tipoCuenta',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> tipoCuentaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tipoCuenta',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> tipoCuentaContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tipoCuenta',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> tipoCuentaMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tipoCuenta',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      tipoCuentaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tipoCuenta',
        value: '',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      tipoCuentaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tipoCuenta',
        value: '',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      totalCompradoEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalComprado',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      totalCompradoGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalComprado',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      totalCompradoLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalComprado',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      totalCompradoBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalComprado',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      totalCompradoFormateadoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalCompradoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      totalCompradoFormateadoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalCompradoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      totalCompradoFormateadoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalCompradoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      totalCompradoFormateadoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalCompradoFormateado',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      totalCompradoFormateadoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'totalCompradoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      totalCompradoFormateadoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'totalCompradoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      totalCompradoFormateadoContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'totalCompradoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      totalCompradoFormateadoMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'totalCompradoFormateado',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      totalCompradoFormateadoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalCompradoFormateado',
        value: '',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      totalCompradoFormateadoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'totalCompradoFormateado',
        value: '',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> totalComprasEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalCompras',
        value: value,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      totalComprasGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalCompras',
        value: value,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      totalComprasLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalCompras',
        value: value,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> totalComprasBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalCompras',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> usuarioIdEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'usuarioId',
        value: value,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      usuarioIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'usuarioId',
        value: value,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> usuarioIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'usuarioId',
        value: value,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> usuarioIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'usuarioId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> whatsappIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'whatsapp',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      whatsappIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'whatsapp',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> whatsappEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'whatsapp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> whatsappGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'whatsapp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> whatsappLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'whatsapp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> whatsappBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'whatsapp',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> whatsappStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'whatsapp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> whatsappEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'whatsapp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> whatsappContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'whatsapp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> whatsappMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'whatsapp',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition> whatsappIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'whatsapp',
        value: '',
      ));
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterFilterCondition>
      whatsappIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'whatsapp',
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
  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> sortByActivo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activo', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> sortByActivoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activo', Sort.desc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> sortByBanco() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'banco', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> sortByBancoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'banco', Sort.desc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> sortByCalificacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calificacion', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> sortByCalificacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calificacion', Sort.desc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy>
      sortByCalificacionFormateada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calificacionFormateada', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy>
      sortByCalificacionFormateadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calificacionFormateada', Sort.desc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> sortByCargoContacto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cargoContacto', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> sortByCargoContactoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cargoContacto', Sort.desc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> sortByColorEstado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorEstado', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> sortByColorEstadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorEstado', Sort.desc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> sortByCondicionesPago() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'condicionesPago', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> sortByCondicionesPagoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'condicionesPago', Sort.desc);
    });
  }

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

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> sortByContactoPrincipal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactoPrincipal', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy>
      sortByContactoPrincipalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactoPrincipal', Sort.desc);
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

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> sortByDescuento() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descuento', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> sortByDescuentoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descuento', Sort.desc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> sortByDescuentoFormateado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descuentoFormateado', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy>
      sortByDescuentoFormateadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descuentoFormateado', Sort.desc);
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

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> sortByEmailAlternativo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emailAlternativo', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy>
      sortByEmailAlternativoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emailAlternativo', Sort.desc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> sortByEstaAlLimiteCredito() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estaAlLimiteCredito', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy>
      sortByEstaAlLimiteCreditoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estaAlLimiteCredito', Sort.desc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> sortByEstado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> sortByEstadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.desc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> sortByEstadoFormateado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estadoFormateado', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy>
      sortByEstadoFormateadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estadoFormateado', Sort.desc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> sortByFechaActualizacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaActualizacion', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy>
      sortByFechaActualizacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaActualizacion', Sort.desc);
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

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> sortByHorarioAtencion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'horarioAtencion', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> sortByHorarioAtencionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'horarioAtencion', Sort.desc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy>
      sortByIconoContactoPrincipal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconoContactoPrincipal', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy>
      sortByIconoContactoPrincipalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconoContactoPrincipal', Sort.desc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> sortByLimiteCredito() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'limiteCredito', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> sortByLimiteCreditoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'limiteCredito', Sort.desc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy>
      sortByLimiteCreditoFormateado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'limiteCreditoFormateado', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy>
      sortByLimiteCreditoFormateadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'limiteCreditoFormateado', Sort.desc);
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

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> sortByNombreCompleto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombreCompleto', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> sortByNombreCompletoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombreCompleto', Sort.desc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> sortByNumeroCuenta() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroCuenta', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> sortByNumeroCuentaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroCuenta', Sort.desc);
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

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> sortByPersonaContacto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'personaContacto', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> sortByPersonaContactoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'personaContacto', Sort.desc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> sortByPlazoEntrega() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plazoEntrega', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> sortByPlazoEntregaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plazoEntrega', Sort.desc);
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

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> sortBySaldoPendiente() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saldoPendiente', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> sortBySaldoPendienteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saldoPendiente', Sort.desc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy>
      sortBySaldoPendienteFormateado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saldoPendienteFormateado', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy>
      sortBySaldoPendienteFormateadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saldoPendienteFormateado', Sort.desc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> sortBySitioWeb() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sitioWeb', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> sortBySitioWebDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sitioWeb', Sort.desc);
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

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> sortByTelefonoAlternativo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'telefonoAlternativo', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy>
      sortByTelefonoAlternativoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'telefonoAlternativo', Sort.desc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> sortByTieneDescuento() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tieneDescuento', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> sortByTieneDescuentoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tieneDescuento', Sort.desc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> sortByTieneLimiteCredito() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tieneLimiteCredito', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy>
      sortByTieneLimiteCreditoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tieneLimiteCredito', Sort.desc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> sortByTipoCuenta() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipoCuenta', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> sortByTipoCuentaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipoCuenta', Sort.desc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> sortByTotalComprado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalComprado', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> sortByTotalCompradoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalComprado', Sort.desc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy>
      sortByTotalCompradoFormateado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCompradoFormateado', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy>
      sortByTotalCompradoFormateadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCompradoFormateado', Sort.desc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> sortByTotalCompras() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCompras', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> sortByTotalComprasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCompras', Sort.desc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> sortByUsuarioId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usuarioId', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> sortByUsuarioIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usuarioId', Sort.desc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> sortByWhatsapp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'whatsapp', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> sortByWhatsappDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'whatsapp', Sort.desc);
    });
  }
}

extension ProveedorQuerySortThenBy
    on QueryBuilder<Proveedor, Proveedor, QSortThenBy> {
  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> thenByActivo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activo', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> thenByActivoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activo', Sort.desc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> thenByBanco() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'banco', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> thenByBancoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'banco', Sort.desc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> thenByCalificacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calificacion', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> thenByCalificacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calificacion', Sort.desc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy>
      thenByCalificacionFormateada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calificacionFormateada', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy>
      thenByCalificacionFormateadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calificacionFormateada', Sort.desc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> thenByCargoContacto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cargoContacto', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> thenByCargoContactoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cargoContacto', Sort.desc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> thenByColorEstado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorEstado', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> thenByColorEstadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorEstado', Sort.desc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> thenByCondicionesPago() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'condicionesPago', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> thenByCondicionesPagoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'condicionesPago', Sort.desc);
    });
  }

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

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> thenByContactoPrincipal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactoPrincipal', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy>
      thenByContactoPrincipalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactoPrincipal', Sort.desc);
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

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> thenByDescuento() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descuento', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> thenByDescuentoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descuento', Sort.desc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> thenByDescuentoFormateado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descuentoFormateado', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy>
      thenByDescuentoFormateadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descuentoFormateado', Sort.desc);
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

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> thenByEmailAlternativo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emailAlternativo', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy>
      thenByEmailAlternativoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emailAlternativo', Sort.desc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> thenByEstaAlLimiteCredito() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estaAlLimiteCredito', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy>
      thenByEstaAlLimiteCreditoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estaAlLimiteCredito', Sort.desc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> thenByEstado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> thenByEstadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.desc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> thenByEstadoFormateado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estadoFormateado', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy>
      thenByEstadoFormateadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estadoFormateado', Sort.desc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> thenByFechaActualizacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaActualizacion', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy>
      thenByFechaActualizacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaActualizacion', Sort.desc);
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

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> thenByHorarioAtencion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'horarioAtencion', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> thenByHorarioAtencionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'horarioAtencion', Sort.desc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy>
      thenByIconoContactoPrincipal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconoContactoPrincipal', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy>
      thenByIconoContactoPrincipalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconoContactoPrincipal', Sort.desc);
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

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> thenByLimiteCredito() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'limiteCredito', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> thenByLimiteCreditoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'limiteCredito', Sort.desc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy>
      thenByLimiteCreditoFormateado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'limiteCreditoFormateado', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy>
      thenByLimiteCreditoFormateadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'limiteCreditoFormateado', Sort.desc);
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

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> thenByNombreCompleto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombreCompleto', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> thenByNombreCompletoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombreCompleto', Sort.desc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> thenByNumeroCuenta() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroCuenta', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> thenByNumeroCuentaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroCuenta', Sort.desc);
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

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> thenByPersonaContacto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'personaContacto', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> thenByPersonaContactoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'personaContacto', Sort.desc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> thenByPlazoEntrega() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plazoEntrega', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> thenByPlazoEntregaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plazoEntrega', Sort.desc);
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

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> thenBySaldoPendiente() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saldoPendiente', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> thenBySaldoPendienteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saldoPendiente', Sort.desc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy>
      thenBySaldoPendienteFormateado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saldoPendienteFormateado', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy>
      thenBySaldoPendienteFormateadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saldoPendienteFormateado', Sort.desc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> thenBySitioWeb() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sitioWeb', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> thenBySitioWebDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sitioWeb', Sort.desc);
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

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> thenByTelefonoAlternativo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'telefonoAlternativo', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy>
      thenByTelefonoAlternativoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'telefonoAlternativo', Sort.desc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> thenByTieneDescuento() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tieneDescuento', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> thenByTieneDescuentoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tieneDescuento', Sort.desc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> thenByTieneLimiteCredito() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tieneLimiteCredito', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy>
      thenByTieneLimiteCreditoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tieneLimiteCredito', Sort.desc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> thenByTipoCuenta() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipoCuenta', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> thenByTipoCuentaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipoCuenta', Sort.desc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> thenByTotalComprado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalComprado', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> thenByTotalCompradoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalComprado', Sort.desc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy>
      thenByTotalCompradoFormateado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCompradoFormateado', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy>
      thenByTotalCompradoFormateadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCompradoFormateado', Sort.desc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> thenByTotalCompras() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCompras', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> thenByTotalComprasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCompras', Sort.desc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> thenByUsuarioId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usuarioId', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> thenByUsuarioIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usuarioId', Sort.desc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> thenByWhatsapp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'whatsapp', Sort.asc);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QAfterSortBy> thenByWhatsappDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'whatsapp', Sort.desc);
    });
  }
}

extension ProveedorQueryWhereDistinct
    on QueryBuilder<Proveedor, Proveedor, QDistinct> {
  QueryBuilder<Proveedor, Proveedor, QDistinct> distinctByActivo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'activo');
    });
  }

  QueryBuilder<Proveedor, Proveedor, QDistinct> distinctByBanco(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'banco', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QDistinct> distinctByCalificacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'calificacion');
    });
  }

  QueryBuilder<Proveedor, Proveedor, QDistinct>
      distinctByCalificacionFormateada({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'calificacionFormateada',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QDistinct> distinctByCargoContacto(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cargoContacto',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QDistinct> distinctByCategorias() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'categorias');
    });
  }

  QueryBuilder<Proveedor, Proveedor, QDistinct> distinctByColorEstado(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'colorEstado', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QDistinct> distinctByCondicionesPago(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'condicionesPago',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QDistinct> distinctByContacto(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'contacto', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QDistinct> distinctByContactoPrincipal(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'contactoPrincipal',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QDistinct> distinctByCuit(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cuit', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QDistinct> distinctByDescuento() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'descuento');
    });
  }

  QueryBuilder<Proveedor, Proveedor, QDistinct> distinctByDescuentoFormateado(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'descuentoFormateado',
          caseSensitive: caseSensitive);
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

  QueryBuilder<Proveedor, Proveedor, QDistinct> distinctByEmailAlternativo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'emailAlternativo',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QDistinct>
      distinctByEstaAlLimiteCredito() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estaAlLimiteCredito');
    });
  }

  QueryBuilder<Proveedor, Proveedor, QDistinct> distinctByEstado(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estado', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QDistinct> distinctByEstadoFormateado(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estadoFormateado',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QDistinct> distinctByFechaActualizacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaActualizacion');
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

  QueryBuilder<Proveedor, Proveedor, QDistinct> distinctByHorarioAtencion(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'horarioAtencion',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QDistinct>
      distinctByIconoContactoPrincipal({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'iconoContactoPrincipal',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QDistinct> distinctByLimiteCredito() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'limiteCredito');
    });
  }

  QueryBuilder<Proveedor, Proveedor, QDistinct>
      distinctByLimiteCreditoFormateado({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'limiteCreditoFormateado',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QDistinct> distinctByNombre(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nombre', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QDistinct> distinctByNombreCompleto(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nombreCompleto',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QDistinct> distinctByNumeroCuenta(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'numeroCuenta', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QDistinct> distinctByObservaciones(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'observaciones',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QDistinct> distinctByPersonaContacto(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'personaContacto',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QDistinct> distinctByPlazoEntrega() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'plazoEntrega');
    });
  }

  QueryBuilder<Proveedor, Proveedor, QDistinct> distinctByRazonSocial(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'razonSocial', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QDistinct> distinctBySaldoPendiente() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'saldoPendiente');
    });
  }

  QueryBuilder<Proveedor, Proveedor, QDistinct>
      distinctBySaldoPendienteFormateado({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'saldoPendienteFormateado',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QDistinct> distinctBySitioWeb(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sitioWeb', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QDistinct> distinctByTelefono(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'telefono', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QDistinct> distinctByTelefonoAlternativo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'telefonoAlternativo',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QDistinct> distinctByTieneDescuento() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tieneDescuento');
    });
  }

  QueryBuilder<Proveedor, Proveedor, QDistinct> distinctByTieneLimiteCredito() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tieneLimiteCredito');
    });
  }

  QueryBuilder<Proveedor, Proveedor, QDistinct> distinctByTipoCuenta(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tipoCuenta', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QDistinct> distinctByTotalComprado() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalComprado');
    });
  }

  QueryBuilder<Proveedor, Proveedor, QDistinct>
      distinctByTotalCompradoFormateado({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalCompradoFormateado',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Proveedor, Proveedor, QDistinct> distinctByTotalCompras() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalCompras');
    });
  }

  QueryBuilder<Proveedor, Proveedor, QDistinct> distinctByUsuarioId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'usuarioId');
    });
  }

  QueryBuilder<Proveedor, Proveedor, QDistinct> distinctByWhatsapp(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'whatsapp', caseSensitive: caseSensitive);
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

  QueryBuilder<Proveedor, bool, QQueryOperations> activoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'activo');
    });
  }

  QueryBuilder<Proveedor, String?, QQueryOperations> bancoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'banco');
    });
  }

  QueryBuilder<Proveedor, double, QQueryOperations> calificacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'calificacion');
    });
  }

  QueryBuilder<Proveedor, String, QQueryOperations>
      calificacionFormateadaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'calificacionFormateada');
    });
  }

  QueryBuilder<Proveedor, String?, QQueryOperations> cargoContactoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cargoContacto');
    });
  }

  QueryBuilder<Proveedor, List<String>, QQueryOperations> categoriasProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'categorias');
    });
  }

  QueryBuilder<Proveedor, String, QQueryOperations> colorEstadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'colorEstado');
    });
  }

  QueryBuilder<Proveedor, String?, QQueryOperations> condicionesPagoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'condicionesPago');
    });
  }

  QueryBuilder<Proveedor, String?, QQueryOperations> contactoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'contacto');
    });
  }

  QueryBuilder<Proveedor, String, QQueryOperations>
      contactoPrincipalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'contactoPrincipal');
    });
  }

  QueryBuilder<Proveedor, String?, QQueryOperations> cuitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cuit');
    });
  }

  QueryBuilder<Proveedor, double?, QQueryOperations> descuentoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'descuento');
    });
  }

  QueryBuilder<Proveedor, String, QQueryOperations>
      descuentoFormateadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'descuentoFormateado');
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

  QueryBuilder<Proveedor, String?, QQueryOperations>
      emailAlternativoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'emailAlternativo');
    });
  }

  QueryBuilder<Proveedor, bool, QQueryOperations>
      estaAlLimiteCreditoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estaAlLimiteCredito');
    });
  }

  QueryBuilder<Proveedor, String, QQueryOperations> estadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estado');
    });
  }

  QueryBuilder<Proveedor, String, QQueryOperations> estadoFormateadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estadoFormateado');
    });
  }

  QueryBuilder<Proveedor, DateTime?, QQueryOperations>
      fechaActualizacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaActualizacion');
    });
  }

  QueryBuilder<Proveedor, DateTime, QQueryOperations> fechaRegistroProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaRegistro');
    });
  }

  QueryBuilder<Proveedor, int, QQueryOperations> hashCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hashCode');
    });
  }

  QueryBuilder<Proveedor, String?, QQueryOperations> horarioAtencionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'horarioAtencion');
    });
  }

  QueryBuilder<Proveedor, String, QQueryOperations>
      iconoContactoPrincipalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'iconoContactoPrincipal');
    });
  }

  QueryBuilder<Proveedor, double, QQueryOperations> limiteCreditoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'limiteCredito');
    });
  }

  QueryBuilder<Proveedor, String, QQueryOperations>
      limiteCreditoFormateadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'limiteCreditoFormateado');
    });
  }

  QueryBuilder<Proveedor, String, QQueryOperations> nombreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nombre');
    });
  }

  QueryBuilder<Proveedor, String, QQueryOperations> nombreCompletoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nombreCompleto');
    });
  }

  QueryBuilder<Proveedor, String?, QQueryOperations> numeroCuentaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'numeroCuenta');
    });
  }

  QueryBuilder<Proveedor, String?, QQueryOperations> observacionesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'observaciones');
    });
  }

  QueryBuilder<Proveedor, String?, QQueryOperations> personaContactoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'personaContacto');
    });
  }

  QueryBuilder<Proveedor, int?, QQueryOperations> plazoEntregaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'plazoEntrega');
    });
  }

  QueryBuilder<Proveedor, String?, QQueryOperations> razonSocialProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'razonSocial');
    });
  }

  QueryBuilder<Proveedor, double, QQueryOperations> saldoPendienteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'saldoPendiente');
    });
  }

  QueryBuilder<Proveedor, String, QQueryOperations>
      saldoPendienteFormateadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'saldoPendienteFormateado');
    });
  }

  QueryBuilder<Proveedor, String?, QQueryOperations> sitioWebProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sitioWeb');
    });
  }

  QueryBuilder<Proveedor, String?, QQueryOperations> telefonoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'telefono');
    });
  }

  QueryBuilder<Proveedor, String?, QQueryOperations>
      telefonoAlternativoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'telefonoAlternativo');
    });
  }

  QueryBuilder<Proveedor, bool, QQueryOperations> tieneDescuentoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tieneDescuento');
    });
  }

  QueryBuilder<Proveedor, bool, QQueryOperations> tieneLimiteCreditoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tieneLimiteCredito');
    });
  }

  QueryBuilder<Proveedor, String?, QQueryOperations> tipoCuentaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tipoCuenta');
    });
  }

  QueryBuilder<Proveedor, double, QQueryOperations> totalCompradoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalComprado');
    });
  }

  QueryBuilder<Proveedor, String, QQueryOperations>
      totalCompradoFormateadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalCompradoFormateado');
    });
  }

  QueryBuilder<Proveedor, int, QQueryOperations> totalComprasProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalCompras');
    });
  }

  QueryBuilder<Proveedor, int, QQueryOperations> usuarioIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'usuarioId');
    });
  }

  QueryBuilder<Proveedor, String?, QQueryOperations> whatsappProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'whatsapp');
    });
  }
}
