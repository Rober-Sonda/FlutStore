import 'package:isar/isar.dart';
import 'product_attribute.dart';

part 'product.g.dart';

/// Estados posibles del producto
enum ProductStatus {
  activo, // Disponible para la venta
  sinStock, // No hay stock disponible
  descontinuado, // Ya no se vende más
  estacional, // Solo se vende en ciertas épocas
  oculto, // Oculto en el catálogo o venta
}

/// Modelo que representa un producto en el sistema.
/// Se recomienda crear un producto por combinación de color/talle,
/// utilizando la relación con variantes si comparten diseño o familia.
@collection
class Product {
  /// ID autogenerado por Isar
  Id id = Isar.autoIncrement;

  /// Nombre comercial del producto (ej. “Sweater corderoy”)
  @Index(caseSensitive: false)
  late String name;

  /// SKU único que identifica el producto (ej. “SW2024-RED-M”)
  @Index(unique: true, caseSensitive: false)
  late String sku;

  /// Código de barras o QR para escanear el producto
  @Index(unique: true, caseSensitive: false)
  late String barcode;

  /// Atributos principales (relacionados con la entidad ProductAttribute)
  final category = IsarLink<ProductAttribute>(); // Ej: “Ropa”
  final size = IsarLink<ProductAttribute>(); // Ej: “M”
  final color = IsarLink<ProductAttribute>(); // Ej: “Rojo”
  final season = IsarLink<ProductAttribute>(); // Ej: “Invierno”
  final brand = IsarLink<ProductAttribute>(); // Ej: “Nike”
  final gender = IsarLink<ProductAttribute>(); // Ej: “Unisex”

  /// Precio final de venta (valor que se muestra en el sistema)
  double price = 0.0;

  /// Precio de costo del artículo (lo que se pagó al proveedor)
  double costPrice = 0.0;

  /// Margen de ganancia deseado (opcional). Si se define,
  /// el campo `suggestedPrice` lo usará para calcular el precio sugerido.
  double? profitMarginPercent;

  /// Stock actual disponible
  int stock = 0;

  /// Stock mínimo recomendado (para alertas o reposición)
  int stockMinimo = 0;

  /// Ubicación física del producto en el local o depósito (opcional)
  String? location;

  /// Estado actual del producto (activo, sin stock, etc.)
  @enumerated
  @Index()
  ProductStatus status = ProductStatus.activo;

  /// Razón por la cual el producto fue descontinuado (opcional)
  String? discontinuedReason;

  /// Descripción larga o técnica del producto
  String? description;

  /// Imagen principal del producto (URL o ruta local)
  String? imagePath;

  /// Otras imágenes opcionales
  List<String>? images;

  /// Fecha en la que se cargó o dio de alta el producto
  @Index()
  late DateTime createdAt;

  /// Relación con un producto padre (por ejemplo, otro color o talle)
  final parent = IsarLink<Product>();

  /// Relación con variantes de este producto (otros talles o colores)
  final variants = IsarLinks<Product>();

  /// Etiquetas o tags para búsquedas o filtros
  List<String>? tags;

  /// Indica si el producto debe destacarse en la tienda
  bool isFeatured = false;

  /// Garantía del producto en meses (opcional)
  int? warrantyMonths;

  /// Peso del producto en gramos (opcional, útil para envíos)
  int? weightGrams;

  /// Define si al producto se le aplica IVA (true por defecto)
  bool isTaxable = true;

  /// Fecha de la última venta registrada
  DateTime? lastSoldAt;

  // Constructor por defecto (Isar lo requiere)
  Product() {
    sku = '';
    barcode = '';
  }

  /// Constructor para facilitar creación de productos desde UI o seeding
  Product.create({
    required this.name,
    required this.price,
    required this.costPrice,
    required this.stock,
    required this.stockMinimo,
    required this.sku,
    required this.barcode,
    required this.status,
    this.profitMarginPercent,
    this.location,
    this.discontinuedReason,
    this.description,
    this.imagePath,
    this.images,
    this.tags,
    this.isFeatured = false,
    this.warrantyMonths,
    this.weightGrams,
    this.isTaxable = true,
    this.lastSoldAt,
    DateTime? createdAt,
  }) {
    this.createdAt = createdAt ?? DateTime.now();
  }

  /// Si el producto está descontinuado
  bool get isDiscontinued => status == ProductStatus.descontinuado;

  /// Valida si el producto es válido, especialmente si está descontinuado
  bool get isValid {
    if (isDiscontinued &&
        (discontinuedReason == null || discontinuedReason!.trim().isEmpty)) {
      return false;
    }
    return true;
  }

  /// Calcula la ganancia por unidad vendida (sin contar impuestos)
  double get gainPerUnit => price - costPrice;

  /// Ganancia total estimada del stock actual
  double get totalPotentialGain => gainPerUnit * stock;

  /// Precio sugerido calculado automáticamente con el % de utilidad
  double get suggestedPrice {
    if (profitMarginPercent != null && profitMarginPercent! > 0) {
      return costPrice * (1 + profitMarginPercent! / 100);
    }
    return price;
  }
}
