import 'package:isar/isar.dart';

part 'product_attribute.g.dart';

/// Tipos de atributos que se pueden asignar a un producto
enum AttributeType {
  category, // Ropa, Calzado, Perfumes, Relojes, etc.
  brand, // Nike, Armani, Casio, etc.
  gender, // Hombre, Mujer, Unisex
  size, // S, M, L, 40mm (para relojes), 100ml (perfume)
  color, // Rojo, Negro, Azul
  material, // Cuero, Metal, Algodón
  season, // Verano, Invierno, Todo el año
  style, // Elegante, Deportivo, Clásico
  fit, // Slim, Regular, Oversize (ropa)
  ageGroup, // Adulto, Adolescente, Niño
  occasion, // Casual, Fiesta, Regalo, Trabajo
  pattern, // Liso, Rayado, Estampado
  fabricWeight, // Liviano, Pesado (ropa)
  origin, // Nacional, Importado
  ecoFriendly, // Orgánico, Reciclado, Vegano
  // Atributos específicos para perfumes
  fragranceType, // Eau de Toilette, Eau de Parfum
  fragranceNote, // Floral, Amaderado, Cítrico
  fragranceIntensity, // Suave, Medio, Intenso
  volume, // 50ml, 100ml
  // Atributos específicos para relojes, pulseras, cintos
  caseSize, // 40mm, 42mm (relojes)
  strapMaterial, // Cuero, Acero, Silicona
  strapColor, // Marrón, Negro
  waterResistance, // 5 ATM, 10 ATM (relojes)
  // Otros
  expirationDate, // Para perfumes
}

@collection
class ProductAttribute {
  Id id = Isar.autoIncrement;

  @enumerated
  @Index()
  late AttributeType type;

  @Index(caseSensitive: false)
  late String name;

  @Index(caseSensitive: false)
  late String value;

  /// Slug único (opcional)
  @Index(unique: true, caseSensitive: false)
  String? slug;

  /// Descripción opcional del atributo
  String? description;

  /// Traducciones (por idioma)
  @ignore
  Map<String, String>? localizedNames;

  /// Orden en que se muestra (opcional)
  int sortOrder = 0;

  /// Color o ícono (opcional)
  String? colorHex;
  String? iconPath;

  /// Activo o inactivo
  bool isActive = true;

  /// Tags para búsqueda rápida (opcional)
  List<String>? tags;

  /// Relación jerárquica (opcional)
  final parent = IsarLink<ProductAttribute>();

  /// Sincronización externa (opcional)
  String? externalCode;

  /// Tiempos de control
  late DateTime createdAt;
  DateTime? lastUpdatedAt;

  ProductAttribute() {
    createdAt = DateTime.now();
  }

  ProductAttribute.create({
    required this.type,
    required this.name,
    required this.value,
    this.slug,
    this.description,
    this.localizedNames,
    this.sortOrder = 0,
    this.colorHex,
    this.iconPath,
    this.isActive = true,
    this.tags,
    this.externalCode,
    this.lastUpdatedAt,
    DateTime? createdAt,
  }) {
    this.createdAt = createdAt ?? DateTime.now();
  }
}
