// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetProductCollection on Isar {
  IsarCollection<Product> get products => this.collection();
}

const ProductSchema = CollectionSchema(
  name: r'Product',
  id: -6222113721139403729,
  properties: {
    r'barcode': PropertySchema(
      id: 0,
      name: r'barcode',
      type: IsarType.string,
    ),
    r'costPrice': PropertySchema(
      id: 1,
      name: r'costPrice',
      type: IsarType.double,
    ),
    r'createdAt': PropertySchema(
      id: 2,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'description': PropertySchema(
      id: 3,
      name: r'description',
      type: IsarType.string,
    ),
    r'discontinuedReason': PropertySchema(
      id: 4,
      name: r'discontinuedReason',
      type: IsarType.string,
    ),
    r'gainPerUnit': PropertySchema(
      id: 5,
      name: r'gainPerUnit',
      type: IsarType.double,
    ),
    r'imagePath': PropertySchema(
      id: 6,
      name: r'imagePath',
      type: IsarType.string,
    ),
    r'images': PropertySchema(
      id: 7,
      name: r'images',
      type: IsarType.stringList,
    ),
    r'isDiscontinued': PropertySchema(
      id: 8,
      name: r'isDiscontinued',
      type: IsarType.bool,
    ),
    r'isFeatured': PropertySchema(
      id: 9,
      name: r'isFeatured',
      type: IsarType.bool,
    ),
    r'isTaxable': PropertySchema(
      id: 10,
      name: r'isTaxable',
      type: IsarType.bool,
    ),
    r'isValid': PropertySchema(
      id: 11,
      name: r'isValid',
      type: IsarType.bool,
    ),
    r'lastSoldAt': PropertySchema(
      id: 12,
      name: r'lastSoldAt',
      type: IsarType.dateTime,
    ),
    r'location': PropertySchema(
      id: 13,
      name: r'location',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 14,
      name: r'name',
      type: IsarType.string,
    ),
    r'price': PropertySchema(
      id: 15,
      name: r'price',
      type: IsarType.double,
    ),
    r'profitMarginPercent': PropertySchema(
      id: 16,
      name: r'profitMarginPercent',
      type: IsarType.double,
    ),
    r'sku': PropertySchema(
      id: 17,
      name: r'sku',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 18,
      name: r'status',
      type: IsarType.byte,
      enumMap: _ProductstatusEnumValueMap,
    ),
    r'stock': PropertySchema(
      id: 19,
      name: r'stock',
      type: IsarType.long,
    ),
    r'stockMinimo': PropertySchema(
      id: 20,
      name: r'stockMinimo',
      type: IsarType.long,
    ),
    r'suggestedPrice': PropertySchema(
      id: 21,
      name: r'suggestedPrice',
      type: IsarType.double,
    ),
    r'tags': PropertySchema(
      id: 22,
      name: r'tags',
      type: IsarType.stringList,
    ),
    r'totalPotentialGain': PropertySchema(
      id: 23,
      name: r'totalPotentialGain',
      type: IsarType.double,
    ),
    r'warrantyMonths': PropertySchema(
      id: 24,
      name: r'warrantyMonths',
      type: IsarType.long,
    ),
    r'weightGrams': PropertySchema(
      id: 25,
      name: r'weightGrams',
      type: IsarType.long,
    )
  },
  estimateSize: _productEstimateSize,
  serialize: _productSerialize,
  deserialize: _productDeserialize,
  deserializeProp: _productDeserializeProp,
  idName: r'id',
  indexes: {
    r'name': IndexSchema(
      id: 879695947855722453,
      name: r'name',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'name',
          type: IndexType.hash,
          caseSensitive: false,
        )
      ],
    ),
    r'sku': IndexSchema(
      id: -3348042439688860591,
      name: r'sku',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'sku',
          type: IndexType.hash,
          caseSensitive: false,
        )
      ],
    ),
    r'barcode': IndexSchema(
      id: 1156800733621869998,
      name: r'barcode',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'barcode',
          type: IndexType.hash,
          caseSensitive: false,
        )
      ],
    ),
    r'status': IndexSchema(
      id: -107785170620420283,
      name: r'status',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'status',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'createdAt': IndexSchema(
      id: -3433535483987302584,
      name: r'createdAt',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'createdAt',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {
    r'category': LinkSchema(
      id: 5603473967927819009,
      name: r'category',
      target: r'ProductAttribute',
      single: true,
    ),
    r'size': LinkSchema(
      id: -5173611518290094966,
      name: r'size',
      target: r'ProductAttribute',
      single: true,
    ),
    r'color': LinkSchema(
      id: 3254376285291363733,
      name: r'color',
      target: r'ProductAttribute',
      single: true,
    ),
    r'season': LinkSchema(
      id: 3679869780224698783,
      name: r'season',
      target: r'ProductAttribute',
      single: true,
    ),
    r'brand': LinkSchema(
      id: 4920476351995984485,
      name: r'brand',
      target: r'ProductAttribute',
      single: true,
    ),
    r'gender': LinkSchema(
      id: 7531836134116160081,
      name: r'gender',
      target: r'ProductAttribute',
      single: true,
    ),
    r'parent': LinkSchema(
      id: 826371409899215518,
      name: r'parent',
      target: r'Product',
      single: true,
    ),
    r'variants': LinkSchema(
      id: -6238971154009720285,
      name: r'variants',
      target: r'Product',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _productGetId,
  getLinks: _productGetLinks,
  attach: _productAttach,
  version: '3.1.0+1',
);

int _productEstimateSize(
  Product object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.barcode.length * 3;
  {
    final value = object.description;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.discontinuedReason;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.imagePath;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.images;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  {
    final value = object.location;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.sku.length * 3;
  {
    final list = object.tags;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  return bytesCount;
}

void _productSerialize(
  Product object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.barcode);
  writer.writeDouble(offsets[1], object.costPrice);
  writer.writeDateTime(offsets[2], object.createdAt);
  writer.writeString(offsets[3], object.description);
  writer.writeString(offsets[4], object.discontinuedReason);
  writer.writeDouble(offsets[5], object.gainPerUnit);
  writer.writeString(offsets[6], object.imagePath);
  writer.writeStringList(offsets[7], object.images);
  writer.writeBool(offsets[8], object.isDiscontinued);
  writer.writeBool(offsets[9], object.isFeatured);
  writer.writeBool(offsets[10], object.isTaxable);
  writer.writeBool(offsets[11], object.isValid);
  writer.writeDateTime(offsets[12], object.lastSoldAt);
  writer.writeString(offsets[13], object.location);
  writer.writeString(offsets[14], object.name);
  writer.writeDouble(offsets[15], object.price);
  writer.writeDouble(offsets[16], object.profitMarginPercent);
  writer.writeString(offsets[17], object.sku);
  writer.writeByte(offsets[18], object.status.index);
  writer.writeLong(offsets[19], object.stock);
  writer.writeLong(offsets[20], object.stockMinimo);
  writer.writeDouble(offsets[21], object.suggestedPrice);
  writer.writeStringList(offsets[22], object.tags);
  writer.writeDouble(offsets[23], object.totalPotentialGain);
  writer.writeLong(offsets[24], object.warrantyMonths);
  writer.writeLong(offsets[25], object.weightGrams);
}

Product _productDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Product();
  object.barcode = reader.readString(offsets[0]);
  object.costPrice = reader.readDouble(offsets[1]);
  object.createdAt = reader.readDateTime(offsets[2]);
  object.description = reader.readStringOrNull(offsets[3]);
  object.discontinuedReason = reader.readStringOrNull(offsets[4]);
  object.id = id;
  object.imagePath = reader.readStringOrNull(offsets[6]);
  object.images = reader.readStringList(offsets[7]);
  object.isFeatured = reader.readBool(offsets[9]);
  object.isTaxable = reader.readBool(offsets[10]);
  object.lastSoldAt = reader.readDateTimeOrNull(offsets[12]);
  object.location = reader.readStringOrNull(offsets[13]);
  object.name = reader.readString(offsets[14]);
  object.price = reader.readDouble(offsets[15]);
  object.profitMarginPercent = reader.readDoubleOrNull(offsets[16]);
  object.sku = reader.readString(offsets[17]);
  object.status =
      _ProductstatusValueEnumMap[reader.readByteOrNull(offsets[18])] ??
          ProductStatus.activo;
  object.stock = reader.readLong(offsets[19]);
  object.stockMinimo = reader.readLong(offsets[20]);
  object.tags = reader.readStringList(offsets[22]);
  object.warrantyMonths = reader.readLongOrNull(offsets[24]);
  object.weightGrams = reader.readLongOrNull(offsets[25]);
  return object;
}

P _productDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringList(offset)) as P;
    case 8:
      return (reader.readBool(offset)) as P;
    case 9:
      return (reader.readBool(offset)) as P;
    case 10:
      return (reader.readBool(offset)) as P;
    case 11:
      return (reader.readBool(offset)) as P;
    case 12:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    case 14:
      return (reader.readString(offset)) as P;
    case 15:
      return (reader.readDouble(offset)) as P;
    case 16:
      return (reader.readDoubleOrNull(offset)) as P;
    case 17:
      return (reader.readString(offset)) as P;
    case 18:
      return (_ProductstatusValueEnumMap[reader.readByteOrNull(offset)] ??
          ProductStatus.activo) as P;
    case 19:
      return (reader.readLong(offset)) as P;
    case 20:
      return (reader.readLong(offset)) as P;
    case 21:
      return (reader.readDouble(offset)) as P;
    case 22:
      return (reader.readStringList(offset)) as P;
    case 23:
      return (reader.readDouble(offset)) as P;
    case 24:
      return (reader.readLongOrNull(offset)) as P;
    case 25:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _ProductstatusEnumValueMap = {
  'activo': 0,
  'sinStock': 1,
  'descontinuado': 2,
  'estacional': 3,
  'oculto': 4,
};
const _ProductstatusValueEnumMap = {
  0: ProductStatus.activo,
  1: ProductStatus.sinStock,
  2: ProductStatus.descontinuado,
  3: ProductStatus.estacional,
  4: ProductStatus.oculto,
};

Id _productGetId(Product object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _productGetLinks(Product object) {
  return [
    object.category,
    object.size,
    object.color,
    object.season,
    object.brand,
    object.gender,
    object.parent,
    object.variants
  ];
}

void _productAttach(IsarCollection<dynamic> col, Id id, Product object) {
  object.id = id;
  object.category
      .attach(col, col.isar.collection<ProductAttribute>(), r'category', id);
  object.size.attach(col, col.isar.collection<ProductAttribute>(), r'size', id);
  object.color
      .attach(col, col.isar.collection<ProductAttribute>(), r'color', id);
  object.season
      .attach(col, col.isar.collection<ProductAttribute>(), r'season', id);
  object.brand
      .attach(col, col.isar.collection<ProductAttribute>(), r'brand', id);
  object.gender
      .attach(col, col.isar.collection<ProductAttribute>(), r'gender', id);
  object.parent.attach(col, col.isar.collection<Product>(), r'parent', id);
  object.variants.attach(col, col.isar.collection<Product>(), r'variants', id);
}

extension ProductByIndex on IsarCollection<Product> {
  Future<Product?> getBySku(String sku) {
    return getByIndex(r'sku', [sku]);
  }

  Product? getBySkuSync(String sku) {
    return getByIndexSync(r'sku', [sku]);
  }

  Future<bool> deleteBySku(String sku) {
    return deleteByIndex(r'sku', [sku]);
  }

  bool deleteBySkuSync(String sku) {
    return deleteByIndexSync(r'sku', [sku]);
  }

  Future<List<Product?>> getAllBySku(List<String> skuValues) {
    final values = skuValues.map((e) => [e]).toList();
    return getAllByIndex(r'sku', values);
  }

  List<Product?> getAllBySkuSync(List<String> skuValues) {
    final values = skuValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'sku', values);
  }

  Future<int> deleteAllBySku(List<String> skuValues) {
    final values = skuValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'sku', values);
  }

  int deleteAllBySkuSync(List<String> skuValues) {
    final values = skuValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'sku', values);
  }

  Future<Id> putBySku(Product object) {
    return putByIndex(r'sku', object);
  }

  Id putBySkuSync(Product object, {bool saveLinks = true}) {
    return putByIndexSync(r'sku', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllBySku(List<Product> objects) {
    return putAllByIndex(r'sku', objects);
  }

  List<Id> putAllBySkuSync(List<Product> objects, {bool saveLinks = true}) {
    return putAllByIndexSync(r'sku', objects, saveLinks: saveLinks);
  }

  Future<Product?> getByBarcode(String barcode) {
    return getByIndex(r'barcode', [barcode]);
  }

  Product? getByBarcodeSync(String barcode) {
    return getByIndexSync(r'barcode', [barcode]);
  }

  Future<bool> deleteByBarcode(String barcode) {
    return deleteByIndex(r'barcode', [barcode]);
  }

  bool deleteByBarcodeSync(String barcode) {
    return deleteByIndexSync(r'barcode', [barcode]);
  }

  Future<List<Product?>> getAllByBarcode(List<String> barcodeValues) {
    final values = barcodeValues.map((e) => [e]).toList();
    return getAllByIndex(r'barcode', values);
  }

  List<Product?> getAllByBarcodeSync(List<String> barcodeValues) {
    final values = barcodeValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'barcode', values);
  }

  Future<int> deleteAllByBarcode(List<String> barcodeValues) {
    final values = barcodeValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'barcode', values);
  }

  int deleteAllByBarcodeSync(List<String> barcodeValues) {
    final values = barcodeValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'barcode', values);
  }

  Future<Id> putByBarcode(Product object) {
    return putByIndex(r'barcode', object);
  }

  Id putByBarcodeSync(Product object, {bool saveLinks = true}) {
    return putByIndexSync(r'barcode', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByBarcode(List<Product> objects) {
    return putAllByIndex(r'barcode', objects);
  }

  List<Id> putAllByBarcodeSync(List<Product> objects, {bool saveLinks = true}) {
    return putAllByIndexSync(r'barcode', objects, saveLinks: saveLinks);
  }
}

extension ProductQueryWhereSort on QueryBuilder<Product, Product, QWhere> {
  QueryBuilder<Product, Product, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<Product, Product, QAfterWhere> anyStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'status'),
      );
    });
  }

  QueryBuilder<Product, Product, QAfterWhere> anyCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'createdAt'),
      );
    });
  }
}

extension ProductQueryWhere on QueryBuilder<Product, Product, QWhereClause> {
  QueryBuilder<Product, Product, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Product, Product, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Product, Product, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Product, Product, QAfterWhereClause> idBetween(
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

  QueryBuilder<Product, Product, QAfterWhereClause> nameEqualTo(String name) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'name',
        value: [name],
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterWhereClause> nameNotEqualTo(
      String name) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [],
              upper: [name],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [name],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [name],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [],
              upper: [name],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Product, Product, QAfterWhereClause> skuEqualTo(String sku) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'sku',
        value: [sku],
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterWhereClause> skuNotEqualTo(String sku) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'sku',
              lower: [],
              upper: [sku],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'sku',
              lower: [sku],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'sku',
              lower: [sku],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'sku',
              lower: [],
              upper: [sku],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Product, Product, QAfterWhereClause> barcodeEqualTo(
      String barcode) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'barcode',
        value: [barcode],
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterWhereClause> barcodeNotEqualTo(
      String barcode) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'barcode',
              lower: [],
              upper: [barcode],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'barcode',
              lower: [barcode],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'barcode',
              lower: [barcode],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'barcode',
              lower: [],
              upper: [barcode],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Product, Product, QAfterWhereClause> statusEqualTo(
      ProductStatus status) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'status',
        value: [status],
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterWhereClause> statusNotEqualTo(
      ProductStatus status) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'status',
              lower: [],
              upper: [status],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'status',
              lower: [status],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'status',
              lower: [status],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'status',
              lower: [],
              upper: [status],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Product, Product, QAfterWhereClause> statusGreaterThan(
    ProductStatus status, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'status',
        lower: [status],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterWhereClause> statusLessThan(
    ProductStatus status, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'status',
        lower: [],
        upper: [status],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterWhereClause> statusBetween(
    ProductStatus lowerStatus,
    ProductStatus upperStatus, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'status',
        lower: [lowerStatus],
        includeLower: includeLower,
        upper: [upperStatus],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterWhereClause> createdAtEqualTo(
      DateTime createdAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'createdAt',
        value: [createdAt],
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterWhereClause> createdAtNotEqualTo(
      DateTime createdAt) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdAt',
              lower: [],
              upper: [createdAt],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdAt',
              lower: [createdAt],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdAt',
              lower: [createdAt],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdAt',
              lower: [],
              upper: [createdAt],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Product, Product, QAfterWhereClause> createdAtGreaterThan(
    DateTime createdAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createdAt',
        lower: [createdAt],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterWhereClause> createdAtLessThan(
    DateTime createdAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createdAt',
        lower: [],
        upper: [createdAt],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterWhereClause> createdAtBetween(
    DateTime lowerCreatedAt,
    DateTime upperCreatedAt, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createdAt',
        lower: [lowerCreatedAt],
        includeLower: includeLower,
        upper: [upperCreatedAt],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ProductQueryFilter
    on QueryBuilder<Product, Product, QFilterCondition> {
  QueryBuilder<Product, Product, QAfterFilterCondition> barcodeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'barcode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> barcodeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'barcode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> barcodeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'barcode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> barcodeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'barcode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> barcodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'barcode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> barcodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'barcode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> barcodeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'barcode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> barcodeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'barcode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> barcodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'barcode',
        value: '',
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> barcodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'barcode',
        value: '',
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> costPriceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'costPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> costPriceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'costPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> costPriceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'costPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> costPriceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'costPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> createdAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> createdAtGreaterThan(
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

  QueryBuilder<Product, Product, QAfterFilterCondition> createdAtLessThan(
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

  QueryBuilder<Product, Product, QAfterFilterCondition> createdAtBetween(
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

  QueryBuilder<Product, Product, QAfterFilterCondition> descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> descriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> descriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> descriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> descriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> descriptionContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> descriptionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition>
      discontinuedReasonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'discontinuedReason',
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition>
      discontinuedReasonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'discontinuedReason',
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition>
      discontinuedReasonEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'discontinuedReason',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition>
      discontinuedReasonGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'discontinuedReason',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition>
      discontinuedReasonLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'discontinuedReason',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition>
      discontinuedReasonBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'discontinuedReason',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition>
      discontinuedReasonStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'discontinuedReason',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition>
      discontinuedReasonEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'discontinuedReason',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition>
      discontinuedReasonContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'discontinuedReason',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition>
      discontinuedReasonMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'discontinuedReason',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition>
      discontinuedReasonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'discontinuedReason',
        value: '',
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition>
      discontinuedReasonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'discontinuedReason',
        value: '',
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> gainPerUnitEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gainPerUnit',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> gainPerUnitGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'gainPerUnit',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> gainPerUnitLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'gainPerUnit',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> gainPerUnitBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'gainPerUnit',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Product, Product, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Product, Product, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Product, Product, QAfterFilterCondition> imagePathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'imagePath',
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> imagePathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'imagePath',
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> imagePathEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> imagePathGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'imagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> imagePathLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'imagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> imagePathBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'imagePath',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> imagePathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'imagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> imagePathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'imagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> imagePathContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'imagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> imagePathMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'imagePath',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> imagePathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imagePath',
        value: '',
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> imagePathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'imagePath',
        value: '',
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> imagesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'images',
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> imagesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'images',
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> imagesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'images',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition>
      imagesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'images',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> imagesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'images',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> imagesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'images',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> imagesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'images',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> imagesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'images',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> imagesElementContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'images',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> imagesElementMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'images',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> imagesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'images',
        value: '',
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition>
      imagesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'images',
        value: '',
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> imagesLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'images',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> imagesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'images',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> imagesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'images',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> imagesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'images',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> imagesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'images',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> imagesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'images',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> isDiscontinuedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isDiscontinued',
        value: value,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> isFeaturedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isFeatured',
        value: value,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> isTaxableEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isTaxable',
        value: value,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> isValidEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isValid',
        value: value,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> lastSoldAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastSoldAt',
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> lastSoldAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastSoldAt',
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> lastSoldAtEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastSoldAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> lastSoldAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastSoldAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> lastSoldAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastSoldAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> lastSoldAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastSoldAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> locationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'location',
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> locationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'location',
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> locationEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'location',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> locationGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'location',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> locationLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'location',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> locationBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'location',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> locationStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'location',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> locationEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'location',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> locationContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'location',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> locationMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'location',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> locationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'location',
        value: '',
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> locationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'location',
        value: '',
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<Product, Product, QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<Product, Product, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<Product, Product, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<Product, Product, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<Product, Product, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<Product, Product, QAfterFilterCondition> nameContains(
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

  QueryBuilder<Product, Product, QAfterFilterCondition> nameMatches(
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

  QueryBuilder<Product, Product, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> priceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'price',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> priceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'price',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> priceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'price',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> priceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'price',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition>
      profitMarginPercentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'profitMarginPercent',
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition>
      profitMarginPercentIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'profitMarginPercent',
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition>
      profitMarginPercentEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'profitMarginPercent',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition>
      profitMarginPercentGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'profitMarginPercent',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition>
      profitMarginPercentLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'profitMarginPercent',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition>
      profitMarginPercentBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'profitMarginPercent',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> skuEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sku',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> skuGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sku',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> skuLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sku',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> skuBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sku',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> skuStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'sku',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> skuEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'sku',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> skuContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sku',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> skuMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sku',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> skuIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sku',
        value: '',
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> skuIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sku',
        value: '',
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> statusEqualTo(
      ProductStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> statusGreaterThan(
    ProductStatus value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> statusLessThan(
    ProductStatus value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> statusBetween(
    ProductStatus lower,
    ProductStatus upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'status',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> stockEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stock',
        value: value,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> stockGreaterThan(
    int value, {
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

  QueryBuilder<Product, Product, QAfterFilterCondition> stockLessThan(
    int value, {
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

  QueryBuilder<Product, Product, QAfterFilterCondition> stockBetween(
    int lower,
    int upper, {
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

  QueryBuilder<Product, Product, QAfterFilterCondition> stockMinimoEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stockMinimo',
        value: value,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> stockMinimoGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'stockMinimo',
        value: value,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> stockMinimoLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'stockMinimo',
        value: value,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> stockMinimoBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'stockMinimo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> suggestedPriceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'suggestedPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition>
      suggestedPriceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'suggestedPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> suggestedPriceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'suggestedPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> suggestedPriceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'suggestedPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> tagsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tags',
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> tagsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tags',
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> tagsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> tagsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> tagsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> tagsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tags',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> tagsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> tagsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> tagsElementContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> tagsElementMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tags',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> tagsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tags',
        value: '',
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition>
      tagsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tags',
        value: '',
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> tagsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> tagsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> tagsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> tagsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> tagsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> tagsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition>
      totalPotentialGainEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalPotentialGain',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition>
      totalPotentialGainGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalPotentialGain',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition>
      totalPotentialGainLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalPotentialGain',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition>
      totalPotentialGainBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalPotentialGain',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> warrantyMonthsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'warrantyMonths',
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition>
      warrantyMonthsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'warrantyMonths',
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> warrantyMonthsEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'warrantyMonths',
        value: value,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition>
      warrantyMonthsGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'warrantyMonths',
        value: value,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> warrantyMonthsLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'warrantyMonths',
        value: value,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> warrantyMonthsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'warrantyMonths',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> weightGramsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'weightGrams',
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> weightGramsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'weightGrams',
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> weightGramsEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'weightGrams',
        value: value,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> weightGramsGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'weightGrams',
        value: value,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> weightGramsLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'weightGrams',
        value: value,
      ));
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> weightGramsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'weightGrams',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ProductQueryObject
    on QueryBuilder<Product, Product, QFilterCondition> {}

extension ProductQueryLinks
    on QueryBuilder<Product, Product, QFilterCondition> {
  QueryBuilder<Product, Product, QAfterFilterCondition> category(
      FilterQuery<ProductAttribute> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'category');
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> categoryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'category', 0, true, 0, true);
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> size(
      FilterQuery<ProductAttribute> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'size');
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> sizeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'size', 0, true, 0, true);
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> color(
      FilterQuery<ProductAttribute> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'color');
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> colorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'color', 0, true, 0, true);
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> season(
      FilterQuery<ProductAttribute> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'season');
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> seasonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'season', 0, true, 0, true);
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> brand(
      FilterQuery<ProductAttribute> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'brand');
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> brandIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'brand', 0, true, 0, true);
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> gender(
      FilterQuery<ProductAttribute> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'gender');
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> genderIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'gender', 0, true, 0, true);
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> parent(
      FilterQuery<Product> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'parent');
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> parentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'parent', 0, true, 0, true);
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> variants(
      FilterQuery<Product> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'variants');
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> variantsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'variants', length, true, length, true);
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> variantsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'variants', 0, true, 0, true);
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> variantsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'variants', 0, false, 999999, true);
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> variantsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'variants', 0, true, length, include);
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition>
      variantsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'variants', length, include, 999999, true);
    });
  }

  QueryBuilder<Product, Product, QAfterFilterCondition> variantsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'variants', lower, includeLower, upper, includeUpper);
    });
  }
}

extension ProductQuerySortBy on QueryBuilder<Product, Product, QSortBy> {
  QueryBuilder<Product, Product, QAfterSortBy> sortByBarcode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'barcode', Sort.asc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> sortByBarcodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'barcode', Sort.desc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> sortByCostPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'costPrice', Sort.asc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> sortByCostPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'costPrice', Sort.desc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> sortByDiscontinuedReason() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discontinuedReason', Sort.asc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> sortByDiscontinuedReasonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discontinuedReason', Sort.desc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> sortByGainPerUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gainPerUnit', Sort.asc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> sortByGainPerUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gainPerUnit', Sort.desc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> sortByImagePath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagePath', Sort.asc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> sortByImagePathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagePath', Sort.desc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> sortByIsDiscontinued() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDiscontinued', Sort.asc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> sortByIsDiscontinuedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDiscontinued', Sort.desc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> sortByIsFeatured() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFeatured', Sort.asc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> sortByIsFeaturedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFeatured', Sort.desc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> sortByIsTaxable() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isTaxable', Sort.asc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> sortByIsTaxableDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isTaxable', Sort.desc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> sortByIsValid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isValid', Sort.asc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> sortByIsValidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isValid', Sort.desc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> sortByLastSoldAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSoldAt', Sort.asc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> sortByLastSoldAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSoldAt', Sort.desc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> sortByLocation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'location', Sort.asc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> sortByLocationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'location', Sort.desc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> sortByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.asc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> sortByPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.desc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> sortByProfitMarginPercent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'profitMarginPercent', Sort.asc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> sortByProfitMarginPercentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'profitMarginPercent', Sort.desc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> sortBySku() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sku', Sort.asc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> sortBySkuDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sku', Sort.desc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> sortByStock() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stock', Sort.asc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> sortByStockDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stock', Sort.desc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> sortByStockMinimo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stockMinimo', Sort.asc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> sortByStockMinimoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stockMinimo', Sort.desc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> sortBySuggestedPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'suggestedPrice', Sort.asc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> sortBySuggestedPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'suggestedPrice', Sort.desc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> sortByTotalPotentialGain() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPotentialGain', Sort.asc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> sortByTotalPotentialGainDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPotentialGain', Sort.desc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> sortByWarrantyMonths() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warrantyMonths', Sort.asc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> sortByWarrantyMonthsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warrantyMonths', Sort.desc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> sortByWeightGrams() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weightGrams', Sort.asc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> sortByWeightGramsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weightGrams', Sort.desc);
    });
  }
}

extension ProductQuerySortThenBy
    on QueryBuilder<Product, Product, QSortThenBy> {
  QueryBuilder<Product, Product, QAfterSortBy> thenByBarcode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'barcode', Sort.asc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> thenByBarcodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'barcode', Sort.desc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> thenByCostPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'costPrice', Sort.asc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> thenByCostPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'costPrice', Sort.desc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> thenByDiscontinuedReason() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discontinuedReason', Sort.asc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> thenByDiscontinuedReasonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discontinuedReason', Sort.desc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> thenByGainPerUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gainPerUnit', Sort.asc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> thenByGainPerUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gainPerUnit', Sort.desc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> thenByImagePath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagePath', Sort.asc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> thenByImagePathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagePath', Sort.desc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> thenByIsDiscontinued() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDiscontinued', Sort.asc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> thenByIsDiscontinuedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDiscontinued', Sort.desc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> thenByIsFeatured() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFeatured', Sort.asc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> thenByIsFeaturedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFeatured', Sort.desc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> thenByIsTaxable() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isTaxable', Sort.asc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> thenByIsTaxableDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isTaxable', Sort.desc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> thenByIsValid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isValid', Sort.asc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> thenByIsValidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isValid', Sort.desc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> thenByLastSoldAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSoldAt', Sort.asc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> thenByLastSoldAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSoldAt', Sort.desc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> thenByLocation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'location', Sort.asc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> thenByLocationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'location', Sort.desc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> thenByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.asc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> thenByPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.desc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> thenByProfitMarginPercent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'profitMarginPercent', Sort.asc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> thenByProfitMarginPercentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'profitMarginPercent', Sort.desc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> thenBySku() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sku', Sort.asc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> thenBySkuDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sku', Sort.desc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> thenByStock() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stock', Sort.asc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> thenByStockDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stock', Sort.desc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> thenByStockMinimo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stockMinimo', Sort.asc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> thenByStockMinimoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stockMinimo', Sort.desc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> thenBySuggestedPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'suggestedPrice', Sort.asc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> thenBySuggestedPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'suggestedPrice', Sort.desc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> thenByTotalPotentialGain() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPotentialGain', Sort.asc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> thenByTotalPotentialGainDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPotentialGain', Sort.desc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> thenByWarrantyMonths() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warrantyMonths', Sort.asc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> thenByWarrantyMonthsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warrantyMonths', Sort.desc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> thenByWeightGrams() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weightGrams', Sort.asc);
    });
  }

  QueryBuilder<Product, Product, QAfterSortBy> thenByWeightGramsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weightGrams', Sort.desc);
    });
  }
}

extension ProductQueryWhereDistinct
    on QueryBuilder<Product, Product, QDistinct> {
  QueryBuilder<Product, Product, QDistinct> distinctByBarcode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'barcode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Product, Product, QDistinct> distinctByCostPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'costPrice');
    });
  }

  QueryBuilder<Product, Product, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<Product, Product, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Product, Product, QDistinct> distinctByDiscontinuedReason(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'discontinuedReason',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Product, Product, QDistinct> distinctByGainPerUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'gainPerUnit');
    });
  }

  QueryBuilder<Product, Product, QDistinct> distinctByImagePath(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'imagePath', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Product, Product, QDistinct> distinctByImages() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'images');
    });
  }

  QueryBuilder<Product, Product, QDistinct> distinctByIsDiscontinued() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDiscontinued');
    });
  }

  QueryBuilder<Product, Product, QDistinct> distinctByIsFeatured() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isFeatured');
    });
  }

  QueryBuilder<Product, Product, QDistinct> distinctByIsTaxable() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isTaxable');
    });
  }

  QueryBuilder<Product, Product, QDistinct> distinctByIsValid() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isValid');
    });
  }

  QueryBuilder<Product, Product, QDistinct> distinctByLastSoldAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastSoldAt');
    });
  }

  QueryBuilder<Product, Product, QDistinct> distinctByLocation(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'location', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Product, Product, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Product, Product, QDistinct> distinctByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'price');
    });
  }

  QueryBuilder<Product, Product, QDistinct> distinctByProfitMarginPercent() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'profitMarginPercent');
    });
  }

  QueryBuilder<Product, Product, QDistinct> distinctBySku(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sku', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Product, Product, QDistinct> distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }

  QueryBuilder<Product, Product, QDistinct> distinctByStock() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stock');
    });
  }

  QueryBuilder<Product, Product, QDistinct> distinctByStockMinimo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stockMinimo');
    });
  }

  QueryBuilder<Product, Product, QDistinct> distinctBySuggestedPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'suggestedPrice');
    });
  }

  QueryBuilder<Product, Product, QDistinct> distinctByTags() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tags');
    });
  }

  QueryBuilder<Product, Product, QDistinct> distinctByTotalPotentialGain() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalPotentialGain');
    });
  }

  QueryBuilder<Product, Product, QDistinct> distinctByWarrantyMonths() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'warrantyMonths');
    });
  }

  QueryBuilder<Product, Product, QDistinct> distinctByWeightGrams() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'weightGrams');
    });
  }
}

extension ProductQueryProperty
    on QueryBuilder<Product, Product, QQueryProperty> {
  QueryBuilder<Product, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Product, String, QQueryOperations> barcodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'barcode');
    });
  }

  QueryBuilder<Product, double, QQueryOperations> costPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'costPrice');
    });
  }

  QueryBuilder<Product, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<Product, String?, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<Product, String?, QQueryOperations>
      discontinuedReasonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'discontinuedReason');
    });
  }

  QueryBuilder<Product, double, QQueryOperations> gainPerUnitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'gainPerUnit');
    });
  }

  QueryBuilder<Product, String?, QQueryOperations> imagePathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'imagePath');
    });
  }

  QueryBuilder<Product, List<String>?, QQueryOperations> imagesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'images');
    });
  }

  QueryBuilder<Product, bool, QQueryOperations> isDiscontinuedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDiscontinued');
    });
  }

  QueryBuilder<Product, bool, QQueryOperations> isFeaturedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isFeatured');
    });
  }

  QueryBuilder<Product, bool, QQueryOperations> isTaxableProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isTaxable');
    });
  }

  QueryBuilder<Product, bool, QQueryOperations> isValidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isValid');
    });
  }

  QueryBuilder<Product, DateTime?, QQueryOperations> lastSoldAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastSoldAt');
    });
  }

  QueryBuilder<Product, String?, QQueryOperations> locationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'location');
    });
  }

  QueryBuilder<Product, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<Product, double, QQueryOperations> priceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'price');
    });
  }

  QueryBuilder<Product, double?, QQueryOperations>
      profitMarginPercentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'profitMarginPercent');
    });
  }

  QueryBuilder<Product, String, QQueryOperations> skuProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sku');
    });
  }

  QueryBuilder<Product, ProductStatus, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<Product, int, QQueryOperations> stockProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stock');
    });
  }

  QueryBuilder<Product, int, QQueryOperations> stockMinimoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stockMinimo');
    });
  }

  QueryBuilder<Product, double, QQueryOperations> suggestedPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'suggestedPrice');
    });
  }

  QueryBuilder<Product, List<String>?, QQueryOperations> tagsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tags');
    });
  }

  QueryBuilder<Product, double, QQueryOperations> totalPotentialGainProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalPotentialGain');
    });
  }

  QueryBuilder<Product, int?, QQueryOperations> warrantyMonthsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'warrantyMonths');
    });
  }

  QueryBuilder<Product, int?, QQueryOperations> weightGramsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'weightGrams');
    });
  }
}
