// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'venta.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetVentaCollection on Isar {
  IsarCollection<Venta> get ventas => this.collection();
}

const VentaSchema = CollectionSchema(
  name: r'Venta',
  id: -2270150413385075991,
  properties: {
    r'banco': PropertySchema(
      id: 0,
      name: r'banco',
      type: IsarType.string,
    ),
    r'cambio': PropertySchema(
      id: 1,
      name: r'cambio',
      type: IsarType.double,
    ),
    r'clienteDireccion': PropertySchema(
      id: 2,
      name: r'clienteDireccion',
      type: IsarType.string,
    ),
    r'clienteDocumento': PropertySchema(
      id: 3,
      name: r'clienteDocumento',
      type: IsarType.string,
    ),
    r'clienteEmail': PropertySchema(
      id: 4,
      name: r'clienteEmail',
      type: IsarType.string,
    ),
    r'clienteId': PropertySchema(
      id: 5,
      name: r'clienteId',
      type: IsarType.long,
    ),
    r'clienteNombre': PropertySchema(
      id: 6,
      name: r'clienteNombre',
      type: IsarType.string,
    ),
    r'clienteTelefono': PropertySchema(
      id: 7,
      name: r'clienteTelefono',
      type: IsarType.string,
    ),
    r'clienteTipoCliente': PropertySchema(
      id: 8,
      name: r'clienteTipoCliente',
      type: IsarType.string,
    ),
    r'colorEstado': PropertySchema(
      id: 9,
      name: r'colorEstado',
      type: IsarType.string,
    ),
    r'colorPeriodo': PropertySchema(
      id: 10,
      name: r'colorPeriodo',
      type: IsarType.string,
    ),
    r'condicionesVenta': PropertySchema(
      id: 11,
      name: r'condicionesVenta',
      type: IsarType.string,
    ),
    r'detalles': PropertySchema(
      id: 12,
      name: r'detalles',
      type: IsarType.objectList,
      target: r'ProductoVentaCompleto',
    ),
    r'direccionEntrega': PropertySchema(
      id: 13,
      name: r'direccionEntrega',
      type: IsarType.string,
    ),
    r'emailCliente': PropertySchema(
      id: 14,
      name: r'emailCliente',
      type: IsarType.string,
    ),
    r'esDeLaSemana': PropertySchema(
      id: 15,
      name: r'esDeLaSemana',
      type: IsarType.bool,
    ),
    r'esDelDia': PropertySchema(
      id: 16,
      name: r'esDelDia',
      type: IsarType.bool,
    ),
    r'esDelMes': PropertySchema(
      id: 17,
      name: r'esDelMes',
      type: IsarType.bool,
    ),
    r'esDevolucion': PropertySchema(
      id: 18,
      name: r'esDevolucion',
      type: IsarType.bool,
    ),
    r'esDevolucionValida': PropertySchema(
      id: 19,
      name: r'esDevolucionValida',
      type: IsarType.bool,
    ),
    r'esReciente': PropertySchema(
      id: 20,
      name: r'esReciente',
      type: IsarType.bool,
    ),
    r'estado': PropertySchema(
      id: 21,
      name: r'estado',
      type: IsarType.string,
    ),
    r'estadoFormateado': PropertySchema(
      id: 22,
      name: r'estadoFormateado',
      type: IsarType.string,
    ),
    r'fecha': PropertySchema(
      id: 23,
      name: r'fecha',
      type: IsarType.dateTime,
    ),
    r'fechaActualizacion': PropertySchema(
      id: 24,
      name: r'fechaActualizacion',
      type: IsarType.dateTime,
    ),
    r'fechaCreacion': PropertySchema(
      id: 25,
      name: r'fechaCreacion',
      type: IsarType.dateTime,
    ),
    r'fechaDevolucion': PropertySchema(
      id: 26,
      name: r'fechaDevolucion',
      type: IsarType.dateTime,
    ),
    r'fechaFormateada': PropertySchema(
      id: 27,
      name: r'fechaFormateada',
      type: IsarType.string,
    ),
    r'fechaHoraFormateada': PropertySchema(
      id: 28,
      name: r'fechaHoraFormateada',
      type: IsarType.string,
    ),
    r'horaFormateada': PropertySchema(
      id: 29,
      name: r'horaFormateada',
      type: IsarType.string,
    ),
    r'iconoMetodoPago': PropertySchema(
      id: 30,
      name: r'iconoMetodoPago',
      type: IsarType.string,
    ),
    r'metodoPago': PropertySchema(
      id: 31,
      name: r'metodoPago',
      type: IsarType.string,
    ),
    r'metodoPagoFormateado': PropertySchema(
      id: 32,
      name: r'metodoPagoFormateado',
      type: IsarType.string,
    ),
    r'montoPagado': PropertySchema(
      id: 33,
      name: r'montoPagado',
      type: IsarType.double,
    ),
    r'motivoDevolucion': PropertySchema(
      id: 34,
      name: r'motivoDevolucion',
      type: IsarType.string,
    ),
    r'notasInternas': PropertySchema(
      id: 35,
      name: r'notasInternas',
      type: IsarType.string,
    ),
    r'numeroDocumento': PropertySchema(
      id: 36,
      name: r'numeroDocumento',
      type: IsarType.string,
    ),
    r'numeroFactura': PropertySchema(
      id: 37,
      name: r'numeroFactura',
      type: IsarType.string,
    ),
    r'numeroOrden': PropertySchema(
      id: 38,
      name: r'numeroOrden',
      type: IsarType.string,
    ),
    r'numeroRecibo': PropertySchema(
      id: 39,
      name: r'numeroRecibo',
      type: IsarType.string,
    ),
    r'numeroTarjeta': PropertySchema(
      id: 40,
      name: r'numeroTarjeta',
      type: IsarType.string,
    ),
    r'numeroTicket': PropertySchema(
      id: 41,
      name: r'numeroTicket',
      type: IsarType.string,
    ),
    r'observaciones': PropertySchema(
      id: 42,
      name: r'observaciones',
      type: IsarType.string,
    ),
    r'periodoVenta': PropertySchema(
      id: 43,
      name: r'periodoVenta',
      type: IsarType.string,
    ),
    r'puedeDevolver': PropertySchema(
      id: 44,
      name: r'puedeDevolver',
      type: IsarType.bool,
    ),
    r'referenciaPago': PropertySchema(
      id: 45,
      name: r'referenciaPago',
      type: IsarType.string,
    ),
    r'telefonoCliente': PropertySchema(
      id: 46,
      name: r'telefonoCliente',
      type: IsarType.string,
    ),
    r'tipoDocumento': PropertySchema(
      id: 47,
      name: r'tipoDocumento',
      type: IsarType.string,
    ),
    r'total': PropertySchema(
      id: 48,
      name: r'total',
      type: IsarType.double,
    ),
    r'totalConSigno': PropertySchema(
      id: 49,
      name: r'totalConSigno',
      type: IsarType.string,
    ),
    r'totalFormateado': PropertySchema(
      id: 50,
      name: r'totalFormateado',
      type: IsarType.string,
    ),
    r'usuarioDevolucion': PropertySchema(
      id: 51,
      name: r'usuarioDevolucion',
      type: IsarType.long,
    ),
    r'usuarioId': PropertySchema(
      id: 52,
      name: r'usuarioId',
      type: IsarType.long,
    ),
    r'vendedor': PropertySchema(
      id: 53,
      name: r'vendedor',
      type: IsarType.string,
    ),
    r'ventaOriginalId': PropertySchema(
      id: 54,
      name: r'ventaOriginalId',
      type: IsarType.long,
    )
  },
  estimateSize: _ventaEstimateSize,
  serialize: _ventaSerialize,
  deserialize: _ventaDeserialize,
  deserializeProp: _ventaDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {r'ProductoVentaCompleto': ProductoVentaCompletoSchema},
  getId: _ventaGetId,
  getLinks: _ventaGetLinks,
  attach: _ventaAttach,
  version: '3.1.0+1',
);

int _ventaEstimateSize(
  Venta object,
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
  bytesCount += 3 + object.clienteDireccion.length * 3;
  bytesCount += 3 + object.clienteDocumento.length * 3;
  bytesCount += 3 + object.clienteEmail.length * 3;
  bytesCount += 3 + object.clienteNombre.length * 3;
  bytesCount += 3 + object.clienteTelefono.length * 3;
  bytesCount += 3 + object.clienteTipoCliente.length * 3;
  bytesCount += 3 + object.colorEstado.length * 3;
  bytesCount += 3 + object.colorPeriodo.length * 3;
  {
    final value = object.condicionesVenta;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.detalles.length * 3;
  {
    final offsets = allOffsets[ProductoVentaCompleto]!;
    for (var i = 0; i < object.detalles.length; i++) {
      final value = object.detalles[i];
      bytesCount +=
          ProductoVentaCompletoSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  {
    final value = object.direccionEntrega;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.emailCliente;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.estado.length * 3;
  bytesCount += 3 + object.estadoFormateado.length * 3;
  bytesCount += 3 + object.fechaFormateada.length * 3;
  bytesCount += 3 + object.fechaHoraFormateada.length * 3;
  bytesCount += 3 + object.horaFormateada.length * 3;
  bytesCount += 3 + object.iconoMetodoPago.length * 3;
  bytesCount += 3 + object.metodoPago.length * 3;
  bytesCount += 3 + object.metodoPagoFormateado.length * 3;
  {
    final value = object.motivoDevolucion;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.notasInternas;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.numeroDocumento.length * 3;
  {
    final value = object.numeroFactura;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.numeroOrden;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.numeroRecibo;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.numeroTarjeta;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.numeroTicket;
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
  bytesCount += 3 + object.periodoVenta.length * 3;
  {
    final value = object.referenciaPago;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.telefonoCliente;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.tipoDocumento.length * 3;
  bytesCount += 3 + object.totalConSigno.length * 3;
  bytesCount += 3 + object.totalFormateado.length * 3;
  {
    final value = object.vendedor;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _ventaSerialize(
  Venta object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.banco);
  writer.writeDouble(offsets[1], object.cambio);
  writer.writeString(offsets[2], object.clienteDireccion);
  writer.writeString(offsets[3], object.clienteDocumento);
  writer.writeString(offsets[4], object.clienteEmail);
  writer.writeLong(offsets[5], object.clienteId);
  writer.writeString(offsets[6], object.clienteNombre);
  writer.writeString(offsets[7], object.clienteTelefono);
  writer.writeString(offsets[8], object.clienteTipoCliente);
  writer.writeString(offsets[9], object.colorEstado);
  writer.writeString(offsets[10], object.colorPeriodo);
  writer.writeString(offsets[11], object.condicionesVenta);
  writer.writeObjectList<ProductoVentaCompleto>(
    offsets[12],
    allOffsets,
    ProductoVentaCompletoSchema.serialize,
    object.detalles,
  );
  writer.writeString(offsets[13], object.direccionEntrega);
  writer.writeString(offsets[14], object.emailCliente);
  writer.writeBool(offsets[15], object.esDeLaSemana);
  writer.writeBool(offsets[16], object.esDelDia);
  writer.writeBool(offsets[17], object.esDelMes);
  writer.writeBool(offsets[18], object.esDevolucion);
  writer.writeBool(offsets[19], object.esDevolucionValida);
  writer.writeBool(offsets[20], object.esReciente);
  writer.writeString(offsets[21], object.estado);
  writer.writeString(offsets[22], object.estadoFormateado);
  writer.writeDateTime(offsets[23], object.fecha);
  writer.writeDateTime(offsets[24], object.fechaActualizacion);
  writer.writeDateTime(offsets[25], object.fechaCreacion);
  writer.writeDateTime(offsets[26], object.fechaDevolucion);
  writer.writeString(offsets[27], object.fechaFormateada);
  writer.writeString(offsets[28], object.fechaHoraFormateada);
  writer.writeString(offsets[29], object.horaFormateada);
  writer.writeString(offsets[30], object.iconoMetodoPago);
  writer.writeString(offsets[31], object.metodoPago);
  writer.writeString(offsets[32], object.metodoPagoFormateado);
  writer.writeDouble(offsets[33], object.montoPagado);
  writer.writeString(offsets[34], object.motivoDevolucion);
  writer.writeString(offsets[35], object.notasInternas);
  writer.writeString(offsets[36], object.numeroDocumento);
  writer.writeString(offsets[37], object.numeroFactura);
  writer.writeString(offsets[38], object.numeroOrden);
  writer.writeString(offsets[39], object.numeroRecibo);
  writer.writeString(offsets[40], object.numeroTarjeta);
  writer.writeString(offsets[41], object.numeroTicket);
  writer.writeString(offsets[42], object.observaciones);
  writer.writeString(offsets[43], object.periodoVenta);
  writer.writeBool(offsets[44], object.puedeDevolver);
  writer.writeString(offsets[45], object.referenciaPago);
  writer.writeString(offsets[46], object.telefonoCliente);
  writer.writeString(offsets[47], object.tipoDocumento);
  writer.writeDouble(offsets[48], object.total);
  writer.writeString(offsets[49], object.totalConSigno);
  writer.writeString(offsets[50], object.totalFormateado);
  writer.writeLong(offsets[51], object.usuarioDevolucion);
  writer.writeLong(offsets[52], object.usuarioId);
  writer.writeString(offsets[53], object.vendedor);
  writer.writeLong(offsets[54], object.ventaOriginalId);
}

Venta _ventaDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Venta(
    banco: reader.readStringOrNull(offsets[0]),
    cambio: reader.readDoubleOrNull(offsets[1]),
    clienteDireccion: reader.readString(offsets[2]),
    clienteDocumento: reader.readString(offsets[3]),
    clienteEmail: reader.readString(offsets[4]),
    clienteId: reader.readLongOrNull(offsets[5]),
    clienteNombre: reader.readString(offsets[6]),
    clienteTelefono: reader.readString(offsets[7]),
    clienteTipoCliente: reader.readString(offsets[8]),
    condicionesVenta: reader.readStringOrNull(offsets[11]),
    direccionEntrega: reader.readStringOrNull(offsets[13]),
    emailCliente: reader.readStringOrNull(offsets[14]),
    esDevolucion: reader.readBoolOrNull(offsets[18]) ?? false,
    estado: reader.readString(offsets[21]),
    fecha: reader.readDateTime(offsets[23]),
    fechaDevolucion: reader.readDateTimeOrNull(offsets[26]),
    metodoPago: reader.readString(offsets[31]),
    montoPagado: reader.readDoubleOrNull(offsets[33]),
    motivoDevolucion: reader.readStringOrNull(offsets[34]),
    notasInternas: reader.readStringOrNull(offsets[35]),
    numeroFactura: reader.readStringOrNull(offsets[37]),
    numeroOrden: reader.readStringOrNull(offsets[38]),
    numeroRecibo: reader.readStringOrNull(offsets[39]),
    numeroTarjeta: reader.readStringOrNull(offsets[40]),
    numeroTicket: reader.readStringOrNull(offsets[41]),
    observaciones: reader.readStringOrNull(offsets[42]),
    referenciaPago: reader.readStringOrNull(offsets[45]),
    telefonoCliente: reader.readStringOrNull(offsets[46]),
    total: reader.readDouble(offsets[48]),
    usuarioDevolucion: reader.readLongOrNull(offsets[51]),
    usuarioId: reader.readLong(offsets[52]),
    vendedor: reader.readStringOrNull(offsets[53]),
    ventaOriginalId: reader.readLongOrNull(offsets[54]),
  );
  object.detalles = reader.readObjectList<ProductoVentaCompleto>(
        offsets[12],
        ProductoVentaCompletoSchema.deserialize,
        allOffsets,
        ProductoVentaCompleto(),
      ) ??
      [];
  object.fechaActualizacion = reader.readDateTimeOrNull(offsets[24]);
  object.fechaCreacion = reader.readDateTime(offsets[25]);
  object.id = id;
  return object;
}

P _ventaDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readDoubleOrNull(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readObjectList<ProductoVentaCompleto>(
            offset,
            ProductoVentaCompletoSchema.deserialize,
            allOffsets,
            ProductoVentaCompleto(),
          ) ??
          []) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    case 14:
      return (reader.readStringOrNull(offset)) as P;
    case 15:
      return (reader.readBool(offset)) as P;
    case 16:
      return (reader.readBool(offset)) as P;
    case 17:
      return (reader.readBool(offset)) as P;
    case 18:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 19:
      return (reader.readBool(offset)) as P;
    case 20:
      return (reader.readBool(offset)) as P;
    case 21:
      return (reader.readString(offset)) as P;
    case 22:
      return (reader.readString(offset)) as P;
    case 23:
      return (reader.readDateTime(offset)) as P;
    case 24:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 25:
      return (reader.readDateTime(offset)) as P;
    case 26:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 27:
      return (reader.readString(offset)) as P;
    case 28:
      return (reader.readString(offset)) as P;
    case 29:
      return (reader.readString(offset)) as P;
    case 30:
      return (reader.readString(offset)) as P;
    case 31:
      return (reader.readString(offset)) as P;
    case 32:
      return (reader.readString(offset)) as P;
    case 33:
      return (reader.readDoubleOrNull(offset)) as P;
    case 34:
      return (reader.readStringOrNull(offset)) as P;
    case 35:
      return (reader.readStringOrNull(offset)) as P;
    case 36:
      return (reader.readString(offset)) as P;
    case 37:
      return (reader.readStringOrNull(offset)) as P;
    case 38:
      return (reader.readStringOrNull(offset)) as P;
    case 39:
      return (reader.readStringOrNull(offset)) as P;
    case 40:
      return (reader.readStringOrNull(offset)) as P;
    case 41:
      return (reader.readStringOrNull(offset)) as P;
    case 42:
      return (reader.readStringOrNull(offset)) as P;
    case 43:
      return (reader.readString(offset)) as P;
    case 44:
      return (reader.readBool(offset)) as P;
    case 45:
      return (reader.readStringOrNull(offset)) as P;
    case 46:
      return (reader.readStringOrNull(offset)) as P;
    case 47:
      return (reader.readString(offset)) as P;
    case 48:
      return (reader.readDouble(offset)) as P;
    case 49:
      return (reader.readString(offset)) as P;
    case 50:
      return (reader.readString(offset)) as P;
    case 51:
      return (reader.readLongOrNull(offset)) as P;
    case 52:
      return (reader.readLong(offset)) as P;
    case 53:
      return (reader.readStringOrNull(offset)) as P;
    case 54:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _ventaGetId(Venta object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _ventaGetLinks(Venta object) {
  return [];
}

void _ventaAttach(IsarCollection<dynamic> col, Id id, Venta object) {
  object.id = id;
}

extension VentaQueryWhereSort on QueryBuilder<Venta, Venta, QWhere> {
  QueryBuilder<Venta, Venta, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension VentaQueryWhere on QueryBuilder<Venta, Venta, QWhereClause> {
  QueryBuilder<Venta, Venta, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Venta, Venta, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Venta, Venta, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Venta, Venta, QAfterWhereClause> idBetween(
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

extension VentaQueryFilter on QueryBuilder<Venta, Venta, QFilterCondition> {
  QueryBuilder<Venta, Venta, QAfterFilterCondition> bancoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'banco',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> bancoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'banco',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> bancoEqualTo(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> bancoGreaterThan(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> bancoLessThan(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> bancoBetween(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> bancoStartsWith(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> bancoEndsWith(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> bancoContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'banco',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> bancoMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'banco',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> bancoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'banco',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> bancoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'banco',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> cambioIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cambio',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> cambioIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cambio',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> cambioEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cambio',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> cambioGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cambio',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> cambioLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cambio',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> cambioBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cambio',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> clienteDireccionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'clienteDireccion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> clienteDireccionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'clienteDireccion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> clienteDireccionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'clienteDireccion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> clienteDireccionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'clienteDireccion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> clienteDireccionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'clienteDireccion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> clienteDireccionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'clienteDireccion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> clienteDireccionContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'clienteDireccion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> clienteDireccionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'clienteDireccion',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> clienteDireccionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'clienteDireccion',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition>
      clienteDireccionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'clienteDireccion',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> clienteDocumentoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'clienteDocumento',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> clienteDocumentoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'clienteDocumento',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> clienteDocumentoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'clienteDocumento',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> clienteDocumentoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'clienteDocumento',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> clienteDocumentoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'clienteDocumento',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> clienteDocumentoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'clienteDocumento',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> clienteDocumentoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'clienteDocumento',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> clienteDocumentoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'clienteDocumento',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> clienteDocumentoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'clienteDocumento',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition>
      clienteDocumentoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'clienteDocumento',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> clienteEmailEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'clienteEmail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> clienteEmailGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'clienteEmail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> clienteEmailLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'clienteEmail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> clienteEmailBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'clienteEmail',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> clienteEmailStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'clienteEmail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> clienteEmailEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'clienteEmail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> clienteEmailContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'clienteEmail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> clienteEmailMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'clienteEmail',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> clienteEmailIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'clienteEmail',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> clienteEmailIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'clienteEmail',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> clienteIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'clienteId',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> clienteIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'clienteId',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> clienteIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'clienteId',
        value: value,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> clienteIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'clienteId',
        value: value,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> clienteIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'clienteId',
        value: value,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> clienteIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'clienteId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> clienteNombreEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'clienteNombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> clienteNombreGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'clienteNombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> clienteNombreLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'clienteNombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> clienteNombreBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'clienteNombre',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> clienteNombreStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'clienteNombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> clienteNombreEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'clienteNombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> clienteNombreContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'clienteNombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> clienteNombreMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'clienteNombre',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> clienteNombreIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'clienteNombre',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> clienteNombreIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'clienteNombre',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> clienteTelefonoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'clienteTelefono',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> clienteTelefonoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'clienteTelefono',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> clienteTelefonoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'clienteTelefono',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> clienteTelefonoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'clienteTelefono',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> clienteTelefonoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'clienteTelefono',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> clienteTelefonoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'clienteTelefono',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> clienteTelefonoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'clienteTelefono',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> clienteTelefonoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'clienteTelefono',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> clienteTelefonoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'clienteTelefono',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition>
      clienteTelefonoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'clienteTelefono',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> clienteTipoClienteEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'clienteTipoCliente',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition>
      clienteTipoClienteGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'clienteTipoCliente',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> clienteTipoClienteLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'clienteTipoCliente',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> clienteTipoClienteBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'clienteTipoCliente',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition>
      clienteTipoClienteStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'clienteTipoCliente',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> clienteTipoClienteEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'clienteTipoCliente',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> clienteTipoClienteContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'clienteTipoCliente',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> clienteTipoClienteMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'clienteTipoCliente',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition>
      clienteTipoClienteIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'clienteTipoCliente',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition>
      clienteTipoClienteIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'clienteTipoCliente',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> colorEstadoEqualTo(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> colorEstadoGreaterThan(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> colorEstadoLessThan(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> colorEstadoBetween(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> colorEstadoStartsWith(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> colorEstadoEndsWith(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> colorEstadoContains(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> colorEstadoMatches(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> colorEstadoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'colorEstado',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> colorEstadoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'colorEstado',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> colorPeriodoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'colorPeriodo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> colorPeriodoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'colorPeriodo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> colorPeriodoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'colorPeriodo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> colorPeriodoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'colorPeriodo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> colorPeriodoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'colorPeriodo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> colorPeriodoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'colorPeriodo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> colorPeriodoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'colorPeriodo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> colorPeriodoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'colorPeriodo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> colorPeriodoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'colorPeriodo',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> colorPeriodoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'colorPeriodo',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> condicionesVentaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'condicionesVenta',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition>
      condicionesVentaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'condicionesVenta',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> condicionesVentaEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'condicionesVenta',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> condicionesVentaGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'condicionesVenta',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> condicionesVentaLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'condicionesVenta',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> condicionesVentaBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'condicionesVenta',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> condicionesVentaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'condicionesVenta',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> condicionesVentaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'condicionesVenta',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> condicionesVentaContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'condicionesVenta',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> condicionesVentaMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'condicionesVenta',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> condicionesVentaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'condicionesVenta',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition>
      condicionesVentaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'condicionesVenta',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> detallesLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'detalles',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> detallesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'detalles',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> detallesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'detalles',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> detallesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'detalles',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> detallesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'detalles',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> detallesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'detalles',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> direccionEntregaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'direccionEntrega',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition>
      direccionEntregaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'direccionEntrega',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> direccionEntregaEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'direccionEntrega',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> direccionEntregaGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'direccionEntrega',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> direccionEntregaLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'direccionEntrega',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> direccionEntregaBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'direccionEntrega',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> direccionEntregaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'direccionEntrega',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> direccionEntregaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'direccionEntrega',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> direccionEntregaContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'direccionEntrega',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> direccionEntregaMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'direccionEntrega',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> direccionEntregaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'direccionEntrega',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition>
      direccionEntregaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'direccionEntrega',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> emailClienteIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'emailCliente',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> emailClienteIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'emailCliente',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> emailClienteEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'emailCliente',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> emailClienteGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'emailCliente',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> emailClienteLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'emailCliente',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> emailClienteBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'emailCliente',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> emailClienteStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'emailCliente',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> emailClienteEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'emailCliente',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> emailClienteContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'emailCliente',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> emailClienteMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'emailCliente',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> emailClienteIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'emailCliente',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> emailClienteIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'emailCliente',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> esDeLaSemanaEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'esDeLaSemana',
        value: value,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> esDelDiaEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'esDelDia',
        value: value,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> esDelMesEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'esDelMes',
        value: value,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> esDevolucionEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'esDevolucion',
        value: value,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> esDevolucionValidaEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'esDevolucionValida',
        value: value,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> esRecienteEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'esReciente',
        value: value,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> estadoEqualTo(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> estadoGreaterThan(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> estadoLessThan(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> estadoBetween(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> estadoStartsWith(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> estadoEndsWith(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> estadoContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'estado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> estadoMatches(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> estadoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estado',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> estadoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'estado',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> estadoFormateadoEqualTo(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> estadoFormateadoGreaterThan(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> estadoFormateadoLessThan(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> estadoFormateadoBetween(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> estadoFormateadoStartsWith(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> estadoFormateadoEndsWith(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> estadoFormateadoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'estadoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> estadoFormateadoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'estadoFormateado',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> estadoFormateadoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estadoFormateado',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition>
      estadoFormateadoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'estadoFormateado',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> fechaEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fecha',
        value: value,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> fechaGreaterThan(
    DateTime value, {
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> fechaLessThan(
    DateTime value, {
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> fechaBetween(
    DateTime lower,
    DateTime upper, {
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> fechaActualizacionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fechaActualizacion',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition>
      fechaActualizacionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fechaActualizacion',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> fechaActualizacionEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaActualizacion',
        value: value,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition>
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> fechaActualizacionLessThan(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> fechaActualizacionBetween(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> fechaCreacionEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaCreacion',
        value: value,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> fechaCreacionGreaterThan(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> fechaCreacionLessThan(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> fechaCreacionBetween(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> fechaDevolucionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fechaDevolucion',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> fechaDevolucionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fechaDevolucion',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> fechaDevolucionEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaDevolucion',
        value: value,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> fechaDevolucionGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fechaDevolucion',
        value: value,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> fechaDevolucionLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fechaDevolucion',
        value: value,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> fechaDevolucionBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fechaDevolucion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> fechaFormateadaEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaFormateada',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> fechaFormateadaGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fechaFormateada',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> fechaFormateadaLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fechaFormateada',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> fechaFormateadaBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fechaFormateada',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> fechaFormateadaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fechaFormateada',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> fechaFormateadaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fechaFormateada',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> fechaFormateadaContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fechaFormateada',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> fechaFormateadaMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fechaFormateada',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> fechaFormateadaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaFormateada',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition>
      fechaFormateadaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fechaFormateada',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> fechaHoraFormateadaEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaHoraFormateada',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition>
      fechaHoraFormateadaGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fechaHoraFormateada',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> fechaHoraFormateadaLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fechaHoraFormateada',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> fechaHoraFormateadaBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fechaHoraFormateada',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition>
      fechaHoraFormateadaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fechaHoraFormateada',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> fechaHoraFormateadaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fechaHoraFormateada',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> fechaHoraFormateadaContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fechaHoraFormateada',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> fechaHoraFormateadaMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fechaHoraFormateada',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition>
      fechaHoraFormateadaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaHoraFormateada',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition>
      fechaHoraFormateadaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fechaHoraFormateada',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> horaFormateadaEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'horaFormateada',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> horaFormateadaGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'horaFormateada',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> horaFormateadaLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'horaFormateada',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> horaFormateadaBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'horaFormateada',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> horaFormateadaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'horaFormateada',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> horaFormateadaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'horaFormateada',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> horaFormateadaContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'horaFormateada',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> horaFormateadaMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'horaFormateada',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> horaFormateadaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'horaFormateada',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> horaFormateadaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'horaFormateada',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> iconoMetodoPagoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'iconoMetodoPago',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> iconoMetodoPagoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'iconoMetodoPago',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> iconoMetodoPagoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'iconoMetodoPago',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> iconoMetodoPagoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'iconoMetodoPago',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> iconoMetodoPagoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'iconoMetodoPago',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> iconoMetodoPagoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'iconoMetodoPago',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> iconoMetodoPagoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'iconoMetodoPago',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> iconoMetodoPagoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'iconoMetodoPago',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> iconoMetodoPagoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'iconoMetodoPago',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition>
      iconoMetodoPagoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'iconoMetodoPago',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> metodoPagoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'metodoPago',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> metodoPagoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'metodoPago',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> metodoPagoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'metodoPago',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> metodoPagoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'metodoPago',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> metodoPagoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'metodoPago',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> metodoPagoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'metodoPago',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> metodoPagoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'metodoPago',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> metodoPagoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'metodoPago',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> metodoPagoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'metodoPago',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> metodoPagoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'metodoPago',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> metodoPagoFormateadoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'metodoPagoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition>
      metodoPagoFormateadoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'metodoPagoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition>
      metodoPagoFormateadoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'metodoPagoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> metodoPagoFormateadoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'metodoPagoFormateado',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition>
      metodoPagoFormateadoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'metodoPagoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition>
      metodoPagoFormateadoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'metodoPagoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition>
      metodoPagoFormateadoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'metodoPagoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> metodoPagoFormateadoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'metodoPagoFormateado',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition>
      metodoPagoFormateadoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'metodoPagoFormateado',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition>
      metodoPagoFormateadoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'metodoPagoFormateado',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> montoPagadoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'montoPagado',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> montoPagadoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'montoPagado',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> montoPagadoEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'montoPagado',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> montoPagadoGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'montoPagado',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> montoPagadoLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'montoPagado',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> montoPagadoBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'montoPagado',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> motivoDevolucionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'motivoDevolucion',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition>
      motivoDevolucionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'motivoDevolucion',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> motivoDevolucionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'motivoDevolucion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> motivoDevolucionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'motivoDevolucion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> motivoDevolucionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'motivoDevolucion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> motivoDevolucionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'motivoDevolucion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> motivoDevolucionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'motivoDevolucion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> motivoDevolucionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'motivoDevolucion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> motivoDevolucionContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'motivoDevolucion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> motivoDevolucionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'motivoDevolucion',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> motivoDevolucionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'motivoDevolucion',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition>
      motivoDevolucionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'motivoDevolucion',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> notasInternasIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'notasInternas',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> notasInternasIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'notasInternas',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> notasInternasEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notasInternas',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> notasInternasGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'notasInternas',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> notasInternasLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'notasInternas',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> notasInternasBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'notasInternas',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> notasInternasStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'notasInternas',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> notasInternasEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'notasInternas',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> notasInternasContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'notasInternas',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> notasInternasMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'notasInternas',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> notasInternasIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notasInternas',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> notasInternasIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notasInternas',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroDocumentoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'numeroDocumento',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroDocumentoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'numeroDocumento',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroDocumentoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'numeroDocumento',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroDocumentoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'numeroDocumento',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroDocumentoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'numeroDocumento',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroDocumentoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'numeroDocumento',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroDocumentoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'numeroDocumento',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroDocumentoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'numeroDocumento',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroDocumentoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'numeroDocumento',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition>
      numeroDocumentoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'numeroDocumento',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroFacturaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'numeroFactura',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroFacturaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'numeroFactura',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroFacturaEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'numeroFactura',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroFacturaGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'numeroFactura',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroFacturaLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'numeroFactura',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroFacturaBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'numeroFactura',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroFacturaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'numeroFactura',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroFacturaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'numeroFactura',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroFacturaContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'numeroFactura',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroFacturaMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'numeroFactura',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroFacturaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'numeroFactura',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroFacturaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'numeroFactura',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroOrdenIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'numeroOrden',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroOrdenIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'numeroOrden',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroOrdenEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'numeroOrden',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroOrdenGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'numeroOrden',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroOrdenLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'numeroOrden',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroOrdenBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'numeroOrden',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroOrdenStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'numeroOrden',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroOrdenEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'numeroOrden',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroOrdenContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'numeroOrden',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroOrdenMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'numeroOrden',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroOrdenIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'numeroOrden',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroOrdenIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'numeroOrden',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroReciboIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'numeroRecibo',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroReciboIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'numeroRecibo',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroReciboEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'numeroRecibo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroReciboGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'numeroRecibo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroReciboLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'numeroRecibo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroReciboBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'numeroRecibo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroReciboStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'numeroRecibo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroReciboEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'numeroRecibo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroReciboContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'numeroRecibo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroReciboMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'numeroRecibo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroReciboIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'numeroRecibo',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroReciboIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'numeroRecibo',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroTarjetaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'numeroTarjeta',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroTarjetaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'numeroTarjeta',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroTarjetaEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'numeroTarjeta',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroTarjetaGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'numeroTarjeta',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroTarjetaLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'numeroTarjeta',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroTarjetaBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'numeroTarjeta',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroTarjetaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'numeroTarjeta',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroTarjetaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'numeroTarjeta',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroTarjetaContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'numeroTarjeta',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroTarjetaMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'numeroTarjeta',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroTarjetaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'numeroTarjeta',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroTarjetaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'numeroTarjeta',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroTicketIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'numeroTicket',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroTicketIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'numeroTicket',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroTicketEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'numeroTicket',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroTicketGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'numeroTicket',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroTicketLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'numeroTicket',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroTicketBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'numeroTicket',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroTicketStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'numeroTicket',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroTicketEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'numeroTicket',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroTicketContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'numeroTicket',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroTicketMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'numeroTicket',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroTicketIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'numeroTicket',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> numeroTicketIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'numeroTicket',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> observacionesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'observaciones',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> observacionesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'observaciones',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> observacionesEqualTo(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> observacionesGreaterThan(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> observacionesLessThan(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> observacionesBetween(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> observacionesStartsWith(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> observacionesEndsWith(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> observacionesContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'observaciones',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> observacionesMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'observaciones',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> observacionesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'observaciones',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> observacionesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'observaciones',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> periodoVentaEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'periodoVenta',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> periodoVentaGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'periodoVenta',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> periodoVentaLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'periodoVenta',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> periodoVentaBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'periodoVenta',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> periodoVentaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'periodoVenta',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> periodoVentaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'periodoVenta',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> periodoVentaContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'periodoVenta',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> periodoVentaMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'periodoVenta',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> periodoVentaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'periodoVenta',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> periodoVentaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'periodoVenta',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> puedeDevolverEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'puedeDevolver',
        value: value,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> referenciaPagoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'referenciaPago',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> referenciaPagoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'referenciaPago',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> referenciaPagoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'referenciaPago',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> referenciaPagoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'referenciaPago',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> referenciaPagoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'referenciaPago',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> referenciaPagoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'referenciaPago',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> referenciaPagoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'referenciaPago',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> referenciaPagoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'referenciaPago',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> referenciaPagoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'referenciaPago',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> referenciaPagoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'referenciaPago',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> referenciaPagoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'referenciaPago',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> referenciaPagoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'referenciaPago',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> telefonoClienteIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'telefonoCliente',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> telefonoClienteIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'telefonoCliente',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> telefonoClienteEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'telefonoCliente',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> telefonoClienteGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'telefonoCliente',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> telefonoClienteLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'telefonoCliente',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> telefonoClienteBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'telefonoCliente',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> telefonoClienteStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'telefonoCliente',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> telefonoClienteEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'telefonoCliente',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> telefonoClienteContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'telefonoCliente',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> telefonoClienteMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'telefonoCliente',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> telefonoClienteIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'telefonoCliente',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition>
      telefonoClienteIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'telefonoCliente',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> tipoDocumentoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tipoDocumento',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> tipoDocumentoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tipoDocumento',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> tipoDocumentoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tipoDocumento',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> tipoDocumentoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tipoDocumento',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> tipoDocumentoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tipoDocumento',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> tipoDocumentoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tipoDocumento',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> tipoDocumentoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tipoDocumento',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> tipoDocumentoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tipoDocumento',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> tipoDocumentoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tipoDocumento',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> tipoDocumentoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tipoDocumento',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> totalEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'total',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> totalGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'total',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> totalLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'total',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> totalBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'total',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> totalConSignoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalConSigno',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> totalConSignoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalConSigno',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> totalConSignoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalConSigno',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> totalConSignoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalConSigno',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> totalConSignoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'totalConSigno',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> totalConSignoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'totalConSigno',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> totalConSignoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'totalConSigno',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> totalConSignoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'totalConSigno',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> totalConSignoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalConSigno',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> totalConSignoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'totalConSigno',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> totalFormateadoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> totalFormateadoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> totalFormateadoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> totalFormateadoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalFormateado',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> totalFormateadoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'totalFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> totalFormateadoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'totalFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> totalFormateadoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'totalFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> totalFormateadoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'totalFormateado',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> totalFormateadoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalFormateado',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition>
      totalFormateadoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'totalFormateado',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> usuarioDevolucionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'usuarioDevolucion',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition>
      usuarioDevolucionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'usuarioDevolucion',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> usuarioDevolucionEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'usuarioDevolucion',
        value: value,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition>
      usuarioDevolucionGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'usuarioDevolucion',
        value: value,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> usuarioDevolucionLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'usuarioDevolucion',
        value: value,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> usuarioDevolucionBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'usuarioDevolucion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> usuarioIdEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'usuarioId',
        value: value,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> usuarioIdGreaterThan(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> usuarioIdLessThan(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> usuarioIdBetween(
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

  QueryBuilder<Venta, Venta, QAfterFilterCondition> vendedorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'vendedor',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> vendedorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'vendedor',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> vendedorEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vendedor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> vendedorGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'vendedor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> vendedorLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'vendedor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> vendedorBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'vendedor',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> vendedorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'vendedor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> vendedorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'vendedor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> vendedorContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'vendedor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> vendedorMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'vendedor',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> vendedorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vendedor',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> vendedorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'vendedor',
        value: '',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> ventaOriginalIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ventaOriginalId',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> ventaOriginalIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ventaOriginalId',
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> ventaOriginalIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ventaOriginalId',
        value: value,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> ventaOriginalIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ventaOriginalId',
        value: value,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> ventaOriginalIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ventaOriginalId',
        value: value,
      ));
    });
  }

  QueryBuilder<Venta, Venta, QAfterFilterCondition> ventaOriginalIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ventaOriginalId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension VentaQueryObject on QueryBuilder<Venta, Venta, QFilterCondition> {
  QueryBuilder<Venta, Venta, QAfterFilterCondition> detallesElement(
      FilterQuery<ProductoVentaCompleto> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'detalles');
    });
  }
}

extension VentaQueryLinks on QueryBuilder<Venta, Venta, QFilterCondition> {}

extension VentaQuerySortBy on QueryBuilder<Venta, Venta, QSortBy> {
  QueryBuilder<Venta, Venta, QAfterSortBy> sortByBanco() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'banco', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByBancoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'banco', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByCambio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cambio', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByCambioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cambio', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByClienteDireccion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clienteDireccion', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByClienteDireccionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clienteDireccion', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByClienteDocumento() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clienteDocumento', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByClienteDocumentoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clienteDocumento', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByClienteEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clienteEmail', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByClienteEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clienteEmail', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByClienteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clienteId', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByClienteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clienteId', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByClienteNombre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clienteNombre', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByClienteNombreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clienteNombre', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByClienteTelefono() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clienteTelefono', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByClienteTelefonoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clienteTelefono', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByClienteTipoCliente() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clienteTipoCliente', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByClienteTipoClienteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clienteTipoCliente', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByColorEstado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorEstado', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByColorEstadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorEstado', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByColorPeriodo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorPeriodo', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByColorPeriodoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorPeriodo', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByCondicionesVenta() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'condicionesVenta', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByCondicionesVentaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'condicionesVenta', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByDireccionEntrega() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'direccionEntrega', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByDireccionEntregaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'direccionEntrega', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByEmailCliente() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emailCliente', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByEmailClienteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emailCliente', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByEsDeLaSemana() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esDeLaSemana', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByEsDeLaSemanaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esDeLaSemana', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByEsDelDia() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esDelDia', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByEsDelDiaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esDelDia', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByEsDelMes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esDelMes', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByEsDelMesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esDelMes', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByEsDevolucion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esDevolucion', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByEsDevolucionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esDevolucion', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByEsDevolucionValida() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esDevolucionValida', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByEsDevolucionValidaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esDevolucionValida', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByEsReciente() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esReciente', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByEsRecienteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esReciente', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByEstado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByEstadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByEstadoFormateado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estadoFormateado', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByEstadoFormateadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estadoFormateado', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByFecha() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fecha', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByFechaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fecha', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByFechaActualizacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaActualizacion', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByFechaActualizacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaActualizacion', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByFechaCreacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByFechaDevolucion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaDevolucion', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByFechaDevolucionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaDevolucion', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByFechaFormateada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaFormateada', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByFechaFormateadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaFormateada', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByFechaHoraFormateada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaHoraFormateada', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByFechaHoraFormateadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaHoraFormateada', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByHoraFormateada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'horaFormateada', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByHoraFormateadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'horaFormateada', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByIconoMetodoPago() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconoMetodoPago', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByIconoMetodoPagoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconoMetodoPago', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByMetodoPago() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'metodoPago', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByMetodoPagoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'metodoPago', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByMetodoPagoFormateado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'metodoPagoFormateado', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByMetodoPagoFormateadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'metodoPagoFormateado', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByMontoPagado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoPagado', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByMontoPagadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoPagado', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByMotivoDevolucion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'motivoDevolucion', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByMotivoDevolucionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'motivoDevolucion', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByNotasInternas() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notasInternas', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByNotasInternasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notasInternas', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByNumeroDocumento() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroDocumento', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByNumeroDocumentoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroDocumento', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByNumeroFactura() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroFactura', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByNumeroFacturaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroFactura', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByNumeroOrden() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroOrden', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByNumeroOrdenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroOrden', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByNumeroRecibo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroRecibo', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByNumeroReciboDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroRecibo', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByNumeroTarjeta() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroTarjeta', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByNumeroTarjetaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroTarjeta', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByNumeroTicket() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroTicket', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByNumeroTicketDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroTicket', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByObservaciones() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observaciones', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByObservacionesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observaciones', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByPeriodoVenta() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'periodoVenta', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByPeriodoVentaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'periodoVenta', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByPuedeDevolver() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'puedeDevolver', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByPuedeDevolverDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'puedeDevolver', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByReferenciaPago() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'referenciaPago', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByReferenciaPagoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'referenciaPago', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByTelefonoCliente() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'telefonoCliente', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByTelefonoClienteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'telefonoCliente', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByTipoDocumento() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipoDocumento', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByTipoDocumentoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipoDocumento', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByTotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByTotalConSigno() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalConSigno', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByTotalConSignoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalConSigno', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByTotalFormateado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalFormateado', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByTotalFormateadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalFormateado', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByUsuarioDevolucion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usuarioDevolucion', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByUsuarioDevolucionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usuarioDevolucion', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByUsuarioId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usuarioId', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByUsuarioIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usuarioId', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByVendedor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vendedor', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByVendedorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vendedor', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByVentaOriginalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ventaOriginalId', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> sortByVentaOriginalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ventaOriginalId', Sort.desc);
    });
  }
}

extension VentaQuerySortThenBy on QueryBuilder<Venta, Venta, QSortThenBy> {
  QueryBuilder<Venta, Venta, QAfterSortBy> thenByBanco() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'banco', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByBancoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'banco', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByCambio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cambio', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByCambioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cambio', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByClienteDireccion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clienteDireccion', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByClienteDireccionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clienteDireccion', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByClienteDocumento() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clienteDocumento', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByClienteDocumentoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clienteDocumento', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByClienteEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clienteEmail', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByClienteEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clienteEmail', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByClienteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clienteId', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByClienteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clienteId', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByClienteNombre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clienteNombre', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByClienteNombreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clienteNombre', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByClienteTelefono() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clienteTelefono', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByClienteTelefonoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clienteTelefono', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByClienteTipoCliente() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clienteTipoCliente', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByClienteTipoClienteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clienteTipoCliente', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByColorEstado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorEstado', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByColorEstadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorEstado', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByColorPeriodo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorPeriodo', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByColorPeriodoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorPeriodo', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByCondicionesVenta() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'condicionesVenta', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByCondicionesVentaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'condicionesVenta', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByDireccionEntrega() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'direccionEntrega', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByDireccionEntregaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'direccionEntrega', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByEmailCliente() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emailCliente', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByEmailClienteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emailCliente', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByEsDeLaSemana() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esDeLaSemana', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByEsDeLaSemanaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esDeLaSemana', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByEsDelDia() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esDelDia', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByEsDelDiaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esDelDia', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByEsDelMes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esDelMes', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByEsDelMesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esDelMes', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByEsDevolucion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esDevolucion', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByEsDevolucionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esDevolucion', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByEsDevolucionValida() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esDevolucionValida', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByEsDevolucionValidaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esDevolucionValida', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByEsReciente() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esReciente', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByEsRecienteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esReciente', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByEstado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByEstadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByEstadoFormateado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estadoFormateado', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByEstadoFormateadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estadoFormateado', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByFecha() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fecha', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByFechaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fecha', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByFechaActualizacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaActualizacion', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByFechaActualizacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaActualizacion', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByFechaCreacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByFechaDevolucion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaDevolucion', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByFechaDevolucionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaDevolucion', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByFechaFormateada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaFormateada', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByFechaFormateadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaFormateada', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByFechaHoraFormateada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaHoraFormateada', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByFechaHoraFormateadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaHoraFormateada', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByHoraFormateada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'horaFormateada', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByHoraFormateadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'horaFormateada', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByIconoMetodoPago() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconoMetodoPago', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByIconoMetodoPagoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconoMetodoPago', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByMetodoPago() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'metodoPago', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByMetodoPagoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'metodoPago', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByMetodoPagoFormateado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'metodoPagoFormateado', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByMetodoPagoFormateadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'metodoPagoFormateado', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByMontoPagado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoPagado', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByMontoPagadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoPagado', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByMotivoDevolucion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'motivoDevolucion', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByMotivoDevolucionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'motivoDevolucion', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByNotasInternas() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notasInternas', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByNotasInternasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notasInternas', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByNumeroDocumento() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroDocumento', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByNumeroDocumentoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroDocumento', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByNumeroFactura() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroFactura', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByNumeroFacturaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroFactura', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByNumeroOrden() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroOrden', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByNumeroOrdenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroOrden', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByNumeroRecibo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroRecibo', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByNumeroReciboDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroRecibo', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByNumeroTarjeta() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroTarjeta', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByNumeroTarjetaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroTarjeta', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByNumeroTicket() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroTicket', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByNumeroTicketDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroTicket', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByObservaciones() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observaciones', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByObservacionesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observaciones', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByPeriodoVenta() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'periodoVenta', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByPeriodoVentaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'periodoVenta', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByPuedeDevolver() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'puedeDevolver', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByPuedeDevolverDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'puedeDevolver', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByReferenciaPago() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'referenciaPago', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByReferenciaPagoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'referenciaPago', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByTelefonoCliente() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'telefonoCliente', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByTelefonoClienteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'telefonoCliente', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByTipoDocumento() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipoDocumento', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByTipoDocumentoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipoDocumento', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByTotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByTotalConSigno() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalConSigno', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByTotalConSignoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalConSigno', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByTotalFormateado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalFormateado', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByTotalFormateadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalFormateado', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByUsuarioDevolucion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usuarioDevolucion', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByUsuarioDevolucionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usuarioDevolucion', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByUsuarioId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usuarioId', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByUsuarioIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usuarioId', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByVendedor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vendedor', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByVendedorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vendedor', Sort.desc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByVentaOriginalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ventaOriginalId', Sort.asc);
    });
  }

  QueryBuilder<Venta, Venta, QAfterSortBy> thenByVentaOriginalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ventaOriginalId', Sort.desc);
    });
  }
}

extension VentaQueryWhereDistinct on QueryBuilder<Venta, Venta, QDistinct> {
  QueryBuilder<Venta, Venta, QDistinct> distinctByBanco(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'banco', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Venta, Venta, QDistinct> distinctByCambio() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cambio');
    });
  }

  QueryBuilder<Venta, Venta, QDistinct> distinctByClienteDireccion(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'clienteDireccion',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Venta, Venta, QDistinct> distinctByClienteDocumento(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'clienteDocumento',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Venta, Venta, QDistinct> distinctByClienteEmail(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'clienteEmail', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Venta, Venta, QDistinct> distinctByClienteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'clienteId');
    });
  }

  QueryBuilder<Venta, Venta, QDistinct> distinctByClienteNombre(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'clienteNombre',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Venta, Venta, QDistinct> distinctByClienteTelefono(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'clienteTelefono',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Venta, Venta, QDistinct> distinctByClienteTipoCliente(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'clienteTipoCliente',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Venta, Venta, QDistinct> distinctByColorEstado(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'colorEstado', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Venta, Venta, QDistinct> distinctByColorPeriodo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'colorPeriodo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Venta, Venta, QDistinct> distinctByCondicionesVenta(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'condicionesVenta',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Venta, Venta, QDistinct> distinctByDireccionEntrega(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'direccionEntrega',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Venta, Venta, QDistinct> distinctByEmailCliente(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'emailCliente', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Venta, Venta, QDistinct> distinctByEsDeLaSemana() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'esDeLaSemana');
    });
  }

  QueryBuilder<Venta, Venta, QDistinct> distinctByEsDelDia() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'esDelDia');
    });
  }

  QueryBuilder<Venta, Venta, QDistinct> distinctByEsDelMes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'esDelMes');
    });
  }

  QueryBuilder<Venta, Venta, QDistinct> distinctByEsDevolucion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'esDevolucion');
    });
  }

  QueryBuilder<Venta, Venta, QDistinct> distinctByEsDevolucionValida() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'esDevolucionValida');
    });
  }

  QueryBuilder<Venta, Venta, QDistinct> distinctByEsReciente() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'esReciente');
    });
  }

  QueryBuilder<Venta, Venta, QDistinct> distinctByEstado(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estado', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Venta, Venta, QDistinct> distinctByEstadoFormateado(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estadoFormateado',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Venta, Venta, QDistinct> distinctByFecha() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fecha');
    });
  }

  QueryBuilder<Venta, Venta, QDistinct> distinctByFechaActualizacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaActualizacion');
    });
  }

  QueryBuilder<Venta, Venta, QDistinct> distinctByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaCreacion');
    });
  }

  QueryBuilder<Venta, Venta, QDistinct> distinctByFechaDevolucion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaDevolucion');
    });
  }

  QueryBuilder<Venta, Venta, QDistinct> distinctByFechaFormateada(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaFormateada',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Venta, Venta, QDistinct> distinctByFechaHoraFormateada(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaHoraFormateada',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Venta, Venta, QDistinct> distinctByHoraFormateada(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'horaFormateada',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Venta, Venta, QDistinct> distinctByIconoMetodoPago(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'iconoMetodoPago',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Venta, Venta, QDistinct> distinctByMetodoPago(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'metodoPago', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Venta, Venta, QDistinct> distinctByMetodoPagoFormateado(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'metodoPagoFormateado',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Venta, Venta, QDistinct> distinctByMontoPagado() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'montoPagado');
    });
  }

  QueryBuilder<Venta, Venta, QDistinct> distinctByMotivoDevolucion(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'motivoDevolucion',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Venta, Venta, QDistinct> distinctByNotasInternas(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notasInternas',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Venta, Venta, QDistinct> distinctByNumeroDocumento(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'numeroDocumento',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Venta, Venta, QDistinct> distinctByNumeroFactura(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'numeroFactura',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Venta, Venta, QDistinct> distinctByNumeroOrden(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'numeroOrden', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Venta, Venta, QDistinct> distinctByNumeroRecibo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'numeroRecibo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Venta, Venta, QDistinct> distinctByNumeroTarjeta(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'numeroTarjeta',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Venta, Venta, QDistinct> distinctByNumeroTicket(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'numeroTicket', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Venta, Venta, QDistinct> distinctByObservaciones(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'observaciones',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Venta, Venta, QDistinct> distinctByPeriodoVenta(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'periodoVenta', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Venta, Venta, QDistinct> distinctByPuedeDevolver() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'puedeDevolver');
    });
  }

  QueryBuilder<Venta, Venta, QDistinct> distinctByReferenciaPago(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'referenciaPago',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Venta, Venta, QDistinct> distinctByTelefonoCliente(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'telefonoCliente',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Venta, Venta, QDistinct> distinctByTipoDocumento(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tipoDocumento',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Venta, Venta, QDistinct> distinctByTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'total');
    });
  }

  QueryBuilder<Venta, Venta, QDistinct> distinctByTotalConSigno(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalConSigno',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Venta, Venta, QDistinct> distinctByTotalFormateado(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalFormateado',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Venta, Venta, QDistinct> distinctByUsuarioDevolucion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'usuarioDevolucion');
    });
  }

  QueryBuilder<Venta, Venta, QDistinct> distinctByUsuarioId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'usuarioId');
    });
  }

  QueryBuilder<Venta, Venta, QDistinct> distinctByVendedor(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vendedor', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Venta, Venta, QDistinct> distinctByVentaOriginalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ventaOriginalId');
    });
  }
}

extension VentaQueryProperty on QueryBuilder<Venta, Venta, QQueryProperty> {
  QueryBuilder<Venta, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Venta, String?, QQueryOperations> bancoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'banco');
    });
  }

  QueryBuilder<Venta, double?, QQueryOperations> cambioProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cambio');
    });
  }

  QueryBuilder<Venta, String, QQueryOperations> clienteDireccionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'clienteDireccion');
    });
  }

  QueryBuilder<Venta, String, QQueryOperations> clienteDocumentoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'clienteDocumento');
    });
  }

  QueryBuilder<Venta, String, QQueryOperations> clienteEmailProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'clienteEmail');
    });
  }

  QueryBuilder<Venta, int?, QQueryOperations> clienteIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'clienteId');
    });
  }

  QueryBuilder<Venta, String, QQueryOperations> clienteNombreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'clienteNombre');
    });
  }

  QueryBuilder<Venta, String, QQueryOperations> clienteTelefonoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'clienteTelefono');
    });
  }

  QueryBuilder<Venta, String, QQueryOperations> clienteTipoClienteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'clienteTipoCliente');
    });
  }

  QueryBuilder<Venta, String, QQueryOperations> colorEstadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'colorEstado');
    });
  }

  QueryBuilder<Venta, String, QQueryOperations> colorPeriodoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'colorPeriodo');
    });
  }

  QueryBuilder<Venta, String?, QQueryOperations> condicionesVentaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'condicionesVenta');
    });
  }

  QueryBuilder<Venta, List<ProductoVentaCompleto>, QQueryOperations>
      detallesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'detalles');
    });
  }

  QueryBuilder<Venta, String?, QQueryOperations> direccionEntregaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'direccionEntrega');
    });
  }

  QueryBuilder<Venta, String?, QQueryOperations> emailClienteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'emailCliente');
    });
  }

  QueryBuilder<Venta, bool, QQueryOperations> esDeLaSemanaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'esDeLaSemana');
    });
  }

  QueryBuilder<Venta, bool, QQueryOperations> esDelDiaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'esDelDia');
    });
  }

  QueryBuilder<Venta, bool, QQueryOperations> esDelMesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'esDelMes');
    });
  }

  QueryBuilder<Venta, bool, QQueryOperations> esDevolucionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'esDevolucion');
    });
  }

  QueryBuilder<Venta, bool, QQueryOperations> esDevolucionValidaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'esDevolucionValida');
    });
  }

  QueryBuilder<Venta, bool, QQueryOperations> esRecienteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'esReciente');
    });
  }

  QueryBuilder<Venta, String, QQueryOperations> estadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estado');
    });
  }

  QueryBuilder<Venta, String, QQueryOperations> estadoFormateadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estadoFormateado');
    });
  }

  QueryBuilder<Venta, DateTime, QQueryOperations> fechaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fecha');
    });
  }

  QueryBuilder<Venta, DateTime?, QQueryOperations>
      fechaActualizacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaActualizacion');
    });
  }

  QueryBuilder<Venta, DateTime, QQueryOperations> fechaCreacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaCreacion');
    });
  }

  QueryBuilder<Venta, DateTime?, QQueryOperations> fechaDevolucionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaDevolucion');
    });
  }

  QueryBuilder<Venta, String, QQueryOperations> fechaFormateadaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaFormateada');
    });
  }

  QueryBuilder<Venta, String, QQueryOperations> fechaHoraFormateadaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaHoraFormateada');
    });
  }

  QueryBuilder<Venta, String, QQueryOperations> horaFormateadaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'horaFormateada');
    });
  }

  QueryBuilder<Venta, String, QQueryOperations> iconoMetodoPagoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'iconoMetodoPago');
    });
  }

  QueryBuilder<Venta, String, QQueryOperations> metodoPagoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'metodoPago');
    });
  }

  QueryBuilder<Venta, String, QQueryOperations> metodoPagoFormateadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'metodoPagoFormateado');
    });
  }

  QueryBuilder<Venta, double?, QQueryOperations> montoPagadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'montoPagado');
    });
  }

  QueryBuilder<Venta, String?, QQueryOperations> motivoDevolucionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'motivoDevolucion');
    });
  }

  QueryBuilder<Venta, String?, QQueryOperations> notasInternasProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notasInternas');
    });
  }

  QueryBuilder<Venta, String, QQueryOperations> numeroDocumentoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'numeroDocumento');
    });
  }

  QueryBuilder<Venta, String?, QQueryOperations> numeroFacturaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'numeroFactura');
    });
  }

  QueryBuilder<Venta, String?, QQueryOperations> numeroOrdenProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'numeroOrden');
    });
  }

  QueryBuilder<Venta, String?, QQueryOperations> numeroReciboProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'numeroRecibo');
    });
  }

  QueryBuilder<Venta, String?, QQueryOperations> numeroTarjetaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'numeroTarjeta');
    });
  }

  QueryBuilder<Venta, String?, QQueryOperations> numeroTicketProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'numeroTicket');
    });
  }

  QueryBuilder<Venta, String?, QQueryOperations> observacionesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'observaciones');
    });
  }

  QueryBuilder<Venta, String, QQueryOperations> periodoVentaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'periodoVenta');
    });
  }

  QueryBuilder<Venta, bool, QQueryOperations> puedeDevolverProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'puedeDevolver');
    });
  }

  QueryBuilder<Venta, String?, QQueryOperations> referenciaPagoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'referenciaPago');
    });
  }

  QueryBuilder<Venta, String?, QQueryOperations> telefonoClienteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'telefonoCliente');
    });
  }

  QueryBuilder<Venta, String, QQueryOperations> tipoDocumentoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tipoDocumento');
    });
  }

  QueryBuilder<Venta, double, QQueryOperations> totalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'total');
    });
  }

  QueryBuilder<Venta, String, QQueryOperations> totalConSignoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalConSigno');
    });
  }

  QueryBuilder<Venta, String, QQueryOperations> totalFormateadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalFormateado');
    });
  }

  QueryBuilder<Venta, int?, QQueryOperations> usuarioDevolucionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'usuarioDevolucion');
    });
  }

  QueryBuilder<Venta, int, QQueryOperations> usuarioIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'usuarioId');
    });
  }

  QueryBuilder<Venta, String?, QQueryOperations> vendedorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vendedor');
    });
  }

  QueryBuilder<Venta, int?, QQueryOperations> ventaOriginalIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ventaOriginalId');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const ProductoVentaCompletoSchema = Schema(
  name: r'ProductoVentaCompleto',
  id: 4851202008397947485,
  properties: {
    r'cantidad': PropertySchema(
      id: 0,
      name: r'cantidad',
      type: IsarType.long,
    ),
    r'categoria': PropertySchema(
      id: 1,
      name: r'categoria',
      type: IsarType.string,
    ),
    r'codigo': PropertySchema(
      id: 2,
      name: r'codigo',
      type: IsarType.string,
    ),
    r'descripcion': PropertySchema(
      id: 3,
      name: r'descripcion',
      type: IsarType.string,
    ),
    r'descuentoAplicado': PropertySchema(
      id: 4,
      name: r'descuentoAplicado',
      type: IsarType.double,
    ),
    r'fechaVencimiento': PropertySchema(
      id: 5,
      name: r'fechaVencimiento',
      type: IsarType.dateTime,
    ),
    r'lote': PropertySchema(
      id: 6,
      name: r'lote',
      type: IsarType.string,
    ),
    r'marca': PropertySchema(
      id: 7,
      name: r'marca',
      type: IsarType.string,
    ),
    r'nombre': PropertySchema(
      id: 8,
      name: r'nombre',
      type: IsarType.string,
    ),
    r'observaciones': PropertySchema(
      id: 9,
      name: r'observaciones',
      type: IsarType.string,
    ),
    r'precioCompra': PropertySchema(
      id: 10,
      name: r'precioCompra',
      type: IsarType.double,
    ),
    r'precioFinal': PropertySchema(
      id: 11,
      name: r'precioFinal',
      type: IsarType.double,
    ),
    r'precioVenta': PropertySchema(
      id: 12,
      name: r'precioVenta',
      type: IsarType.double,
    ),
    r'productoId': PropertySchema(
      id: 13,
      name: r'productoId',
      type: IsarType.long,
    ),
    r'subtotal': PropertySchema(
      id: 14,
      name: r'subtotal',
      type: IsarType.double,
    ),
    r'unidadMedida': PropertySchema(
      id: 15,
      name: r'unidadMedida',
      type: IsarType.string,
    )
  },
  estimateSize: _productoVentaCompletoEstimateSize,
  serialize: _productoVentaCompletoSerialize,
  deserialize: _productoVentaCompletoDeserialize,
  deserializeProp: _productoVentaCompletoDeserializeProp,
);

int _productoVentaCompletoEstimateSize(
  ProductoVentaCompleto object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.categoria.length * 3;
  bytesCount += 3 + object.codigo.length * 3;
  bytesCount += 3 + object.descripcion.length * 3;
  {
    final value = object.lote;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.marca.length * 3;
  bytesCount += 3 + object.nombre.length * 3;
  {
    final value = object.observaciones;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.unidadMedida.length * 3;
  return bytesCount;
}

void _productoVentaCompletoSerialize(
  ProductoVentaCompleto object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.cantidad);
  writer.writeString(offsets[1], object.categoria);
  writer.writeString(offsets[2], object.codigo);
  writer.writeString(offsets[3], object.descripcion);
  writer.writeDouble(offsets[4], object.descuentoAplicado);
  writer.writeDateTime(offsets[5], object.fechaVencimiento);
  writer.writeString(offsets[6], object.lote);
  writer.writeString(offsets[7], object.marca);
  writer.writeString(offsets[8], object.nombre);
  writer.writeString(offsets[9], object.observaciones);
  writer.writeDouble(offsets[10], object.precioCompra);
  writer.writeDouble(offsets[11], object.precioFinal);
  writer.writeDouble(offsets[12], object.precioVenta);
  writer.writeLong(offsets[13], object.productoId);
  writer.writeDouble(offsets[14], object.subtotal);
  writer.writeString(offsets[15], object.unidadMedida);
}

ProductoVentaCompleto _productoVentaCompletoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ProductoVentaCompleto(
    cantidad: reader.readLongOrNull(offsets[0]) ?? 0,
    categoria: reader.readStringOrNull(offsets[1]) ?? '',
    codigo: reader.readStringOrNull(offsets[2]) ?? '',
    descripcion: reader.readStringOrNull(offsets[3]) ?? '',
    descuentoAplicado: reader.readDoubleOrNull(offsets[4]) ?? 0.0,
    fechaVencimiento: reader.readDateTimeOrNull(offsets[5]),
    lote: reader.readStringOrNull(offsets[6]),
    marca: reader.readStringOrNull(offsets[7]) ?? '',
    nombre: reader.readStringOrNull(offsets[8]) ?? '',
    observaciones: reader.readStringOrNull(offsets[9]),
    precioCompra: reader.readDoubleOrNull(offsets[10]) ?? 0.0,
    precioFinal: reader.readDoubleOrNull(offsets[11]) ?? 0.0,
    precioVenta: reader.readDoubleOrNull(offsets[12]) ?? 0.0,
    productoId: reader.readLongOrNull(offsets[13]),
    unidadMedida: reader.readStringOrNull(offsets[15]) ?? '',
  );
  object.subtotal = reader.readDouble(offsets[14]);
  return object;
}

P _productoVentaCompletoDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 1:
      return (reader.readStringOrNull(offset) ?? '') as P;
    case 2:
      return (reader.readStringOrNull(offset) ?? '') as P;
    case 3:
      return (reader.readStringOrNull(offset) ?? '') as P;
    case 4:
      return (reader.readDoubleOrNull(offset) ?? 0.0) as P;
    case 5:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset) ?? '') as P;
    case 8:
      return (reader.readStringOrNull(offset) ?? '') as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readDoubleOrNull(offset) ?? 0.0) as P;
    case 11:
      return (reader.readDoubleOrNull(offset) ?? 0.0) as P;
    case 12:
      return (reader.readDoubleOrNull(offset) ?? 0.0) as P;
    case 13:
      return (reader.readLongOrNull(offset)) as P;
    case 14:
      return (reader.readDouble(offset)) as P;
    case 15:
      return (reader.readStringOrNull(offset) ?? '') as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension ProductoVentaCompletoQueryFilter on QueryBuilder<
    ProductoVentaCompleto, ProductoVentaCompleto, QFilterCondition> {
  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> cantidadEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cantidad',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> cantidadGreaterThan(
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

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> cantidadLessThan(
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

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> cantidadBetween(
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

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> categoriaEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'categoria',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> categoriaGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'categoria',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> categoriaLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'categoria',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> categoriaBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'categoria',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> categoriaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'categoria',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> categoriaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'categoria',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
          QAfterFilterCondition>
      categoriaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'categoria',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
          QAfterFilterCondition>
      categoriaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'categoria',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> categoriaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'categoria',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> categoriaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'categoria',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> codigoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'codigo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> codigoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'codigo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> codigoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'codigo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> codigoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'codigo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> codigoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'codigo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> codigoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'codigo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
          QAfterFilterCondition>
      codigoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'codigo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
          QAfterFilterCondition>
      codigoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'codigo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> codigoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'codigo',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> codigoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'codigo',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> descripcionEqualTo(
    String value, {
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

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> descripcionGreaterThan(
    String value, {
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

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> descripcionLessThan(
    String value, {
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

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> descripcionBetween(
    String lower,
    String upper, {
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

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> descripcionStartsWith(
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

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> descripcionEndsWith(
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

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
          QAfterFilterCondition>
      descripcionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'descripcion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
          QAfterFilterCondition>
      descripcionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'descripcion',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> descripcionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'descripcion',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> descripcionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'descripcion',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> descuentoAplicadoEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'descuentoAplicado',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> descuentoAplicadoGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'descuentoAplicado',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> descuentoAplicadoLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'descuentoAplicado',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> descuentoAplicadoBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'descuentoAplicado',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> fechaVencimientoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fechaVencimiento',
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> fechaVencimientoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fechaVencimiento',
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> fechaVencimientoEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaVencimiento',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> fechaVencimientoGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fechaVencimiento',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> fechaVencimientoLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fechaVencimiento',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> fechaVencimientoBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fechaVencimiento',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> loteIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lote',
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> loteIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lote',
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> loteEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lote',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> loteGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lote',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> loteLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lote',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> loteBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lote',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> loteStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'lote',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> loteEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'lote',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
          QAfterFilterCondition>
      loteContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'lote',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
          QAfterFilterCondition>
      loteMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'lote',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> loteIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lote',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> loteIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'lote',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> marcaEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'marca',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> marcaGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'marca',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> marcaLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'marca',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> marcaBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'marca',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> marcaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'marca',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> marcaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'marca',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
          QAfterFilterCondition>
      marcaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'marca',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
          QAfterFilterCondition>
      marcaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'marca',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> marcaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'marca',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> marcaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'marca',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> nombreEqualTo(
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

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> nombreGreaterThan(
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

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> nombreLessThan(
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

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> nombreBetween(
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

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> nombreStartsWith(
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

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> nombreEndsWith(
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

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
          QAfterFilterCondition>
      nombreContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
          QAfterFilterCondition>
      nombreMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nombre',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> nombreIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nombre',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> nombreIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nombre',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> observacionesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'observaciones',
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> observacionesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'observaciones',
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> observacionesEqualTo(
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

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> observacionesGreaterThan(
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

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> observacionesLessThan(
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

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> observacionesBetween(
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

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> observacionesStartsWith(
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

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> observacionesEndsWith(
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

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
          QAfterFilterCondition>
      observacionesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'observaciones',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
          QAfterFilterCondition>
      observacionesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'observaciones',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> observacionesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'observaciones',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> observacionesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'observaciones',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> precioCompraEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'precioCompra',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> precioCompraGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'precioCompra',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> precioCompraLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'precioCompra',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> precioCompraBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'precioCompra',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> precioFinalEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'precioFinal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> precioFinalGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'precioFinal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> precioFinalLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'precioFinal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> precioFinalBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'precioFinal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> precioVentaEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'precioVenta',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> precioVentaGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'precioVenta',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> precioVentaLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'precioVenta',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> precioVentaBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'precioVenta',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> productoIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'productoId',
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> productoIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'productoId',
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> productoIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'productoId',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> productoIdGreaterThan(
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

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> productoIdLessThan(
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

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> productoIdBetween(
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

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> subtotalEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'subtotal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> subtotalGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'subtotal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> subtotalLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'subtotal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> subtotalBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'subtotal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> unidadMedidaEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unidadMedida',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> unidadMedidaGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unidadMedida',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> unidadMedidaLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unidadMedida',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> unidadMedidaBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unidadMedida',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> unidadMedidaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'unidadMedida',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> unidadMedidaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'unidadMedida',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
          QAfterFilterCondition>
      unidadMedidaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'unidadMedida',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
          QAfterFilterCondition>
      unidadMedidaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'unidadMedida',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> unidadMedidaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unidadMedida',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductoVentaCompleto, ProductoVentaCompleto,
      QAfterFilterCondition> unidadMedidaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'unidadMedida',
        value: '',
      ));
    });
  }
}

extension ProductoVentaCompletoQueryObject on QueryBuilder<
    ProductoVentaCompleto, ProductoVentaCompleto, QFilterCondition> {}
