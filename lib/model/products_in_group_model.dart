
import 'dart:convert';


ProductsInGroupModel productsInGroupModelFromJson(
    String str) =>
    ProductsInGroupModel.fromJson(json.decode(str));

String productsInGroupModelToJson(
    ProductsInGroupModel data) =>
    json.encode(data.toJson());

class ProductsInGroupModel {
  final String? message;
  final Data? data;

  ProductsInGroupModel({
    this.message,
    this.data,
  });

  ProductsInGroupModel copyWith({
    String? message,
    Data? data,
  }) =>
      ProductsInGroupModel(
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory ProductsInGroupModel.fromJson(
      Map<String, dynamic> json) =>
      ProductsInGroupModel(
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  final int? totalSize;
  final int? limit;
  final String? offset;
  //final int? offset;
  final List<Product>? products;
  final List<Category>? categories;

  Data({
    this.totalSize,
    this.limit,
    this.offset,
    this.products,
    this.categories,
  });

  Data copyWith({
    int? totalSize,
    int? limit,
    String? offset,
    // int? offset,
    List<Product>? products,
    List<Category>? categories,
  }) =>
      Data(
        totalSize: totalSize ?? this.totalSize,
        limit: limit ?? this.limit,
        offset: offset ?? this.offset,
        products: products ?? this.products,
      );

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      totalSize: json["total_size"],
      limit: json["limit"],
      offset: json["offset"],
      products: json["products"] == null
          ? []
          : List<Product>.from(json["products"]!
          .map((x) => Product.fromJson(x))),
      categories: json["categories"] == null
          ? []
          : List<Category>.from(
          json["categories"]!.map((x) => Category.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "total_size": totalSize,
    "limit": limit,
    "offset": offset,
    "products": products == null
        ? []
        : List<dynamic>.from(products!.map((x) => x.toJson())),
    "categories": categories == null
        ? []
        : List<dynamic>.from(categories!.map((x) => x.toJson())),
  };
}
class Product {
  final int? id;
  final int? boutiqueId;
  final String? name;
  final String? slug;
  final String? shareLink;
  final String? maxAllowedQty;
  final String? details;
  final Thumbnail? thumbnail;
  final List<Thumbnail>? images;
  final List<Category>? categories;
  final Category? category;
  final List<SyncColorImage>? syncColorImages;
  final double? price;
  final String? priceFormatted;
  final double? offerPrice;
  final String? offerPriceFormatted;
  final bool? isFavourite;
  final bool? inStock;
  final Rating? rating;
  final dynamic flashDealDetails;
  final dynamic flashDealMaxAllowedQuantity;
  final String? dateNow;

  Product({
    this.id,
    this.boutiqueId,
    this.name,
    this.slug,
    this.shareLink,
    this.details,
    this.thumbnail,
    this.maxAllowedQty,
    this.images,
    this.categories,
    this.category,
    this.syncColorImages,
    this.price,
    this.priceFormatted,
    this.offerPrice,
    this.offerPriceFormatted,
    this.isFavourite,
    this.inStock,
    this.rating,
    this.flashDealDetails,
    this.flashDealMaxAllowedQuantity,
    this.dateNow,
  });

  Product copyWith({
    int? id,
    int? boutiqueId,
    String? name,
    String? slug,
    String? shareLink,
    String? details,
    Thumbnail? thumbnail,
    List<Thumbnail>? images,
    List<Category>? categories,
    Category? category,
    List<SyncColorImage>? syncColorImages,
    double? price,
    String? priceFormatted,
    double? offerPrice,
    String? offerPriceFormatted,
    bool? isFavourite,
    String? maxAllowedQty,
    bool? inStock,
    Rating? rating,
    dynamic flashDealDetails,
    dynamic flashDealMaxAllowedQuantity,
    String? date,
  }) =>
      Product(
        id: id ?? this.id,
        boutiqueId: boutiqueId ?? this.boutiqueId,
        name: name ?? this.name,
        slug: slug ?? this.slug,
        shareLink: shareLink ?? this.shareLink,
        details: details ?? this.details,
        thumbnail: thumbnail ?? this.thumbnail,
        images: images ?? this.images,
        categories: categories ?? this.categories,
        category: category ?? this.category,
        syncColorImages: syncColorImages ?? this.syncColorImages,
        maxAllowedQty: maxAllowedQty ?? this.maxAllowedQty,
        price: price ?? this.price,
        priceFormatted: priceFormatted ?? this.priceFormatted,
        offerPrice: offerPrice ?? this.offerPrice,
        offerPriceFormatted: offerPriceFormatted ?? this.offerPriceFormatted,
        isFavourite: isFavourite ?? this.isFavourite,
        inStock: inStock ?? this.inStock,
        rating: rating ?? this.rating,
        flashDealDetails: flashDealDetails ?? this.flashDealDetails,
        flashDealMaxAllowedQuantity:
        flashDealMaxAllowedQuantity ?? this.flashDealMaxAllowedQuantity,
      );

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    boutiqueId: json["boutique_id"],
    name: json["name"],
    slug: json["slug"],
    shareLink: json["share_link"],
    details: json["details"],
    thumbnail: json["thumbnail"] == null
        ? null
        : Thumbnail.fromJson(json["thumbnail"]),
    images: json["images"] == null
        ? []
        : List<Thumbnail>.from(
        json["images"]!.map((x) => Thumbnail.fromJson(x))),
    categories: json["categories"] == null
        ? []
        : List<Category>.from(
        json["categories"]!.map((x) => Category.fromJson(x))),
    category: json["category"] == null || json["category"] != []
        ? null
        : Category.fromJson(json["category"]),
    syncColorImages: json["sync_color_images"] == null
        ? []
        : List<SyncColorImage>.from(json["sync_color_images"]!
        .map((x) => SyncColorImage.fromJson(x))),
    price: json["price"].toDouble(),
    priceFormatted: json["price_formatted"],
    offerPrice: json["offer_price"].toDouble(),
    maxAllowedQty: json["max_allowed_qty"],
    offerPriceFormatted: json["offer_price_formatted"],
    isFavourite: json["is_favourite"],
    inStock: json["in_stock"],
    rating: json["rating"] == null ? null : Rating.fromJson(json["rating"]),
    flashDealDetails: json["flash_deal_details"],
    flashDealMaxAllowedQuantity: json["flash_deal_max_allowed_quantity"],
    dateNow: DateTime.now().toString(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "boutique_id": boutiqueId,
    "name": name,
    "slug": slug,
    "share_link": shareLink,
    "details": details,
    "thumbnail": thumbnail?.toJson(),
    "images": images == null
        ? []
        : List<dynamic>.from(images!.map((x) => x.toJson())),
    "categories": categories == null
        ? []
        : List<dynamic>.from(categories!.map((x) => x.toJson())),
    "category": category?.toJson(),
    "sync_color_images": syncColorImages == null
        ? []
        : List<dynamic>.from(syncColorImages!.map((x) => x.toJson())),
    "price": price,
    "price_formatted": priceFormatted,
    "offer_price": offerPrice,
    "max_allowed_qty": maxAllowedQty,
    "offer_price_formatted": offerPriceFormatted,
    "is_favourite": isFavourite,
    "in_stock": inStock,
    "rating": rating?.toJson(),
    "flash_deal_details": flashDealDetails,
    "flash_deal_max_allowed_quantity": flashDealMaxAllowedQuantity,
    "date_now": dateNow,
  };
}

class Thumbnail {
  final String? filePath;
  final String? originalWidth;
  final String? originalHeight;

  Thumbnail({
    this.filePath,
    this.originalWidth,
    this.originalHeight,
  });

  Thumbnail copyWith({
    String? filePath,
    String? originalWidth,
    String? originalHeight,
  }) =>
      Thumbnail(
        filePath: filePath ?? this.filePath,
        originalWidth: originalWidth ?? this.originalWidth,
        originalHeight: originalHeight ?? this.originalHeight,
      );

  factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
    filePath: json["file_path"],
    originalWidth: json["original_width"],
    originalHeight: json["original_height"],
  );

  Map<String, dynamic> toJson() => {
    "file_path": filePath,
    "original_width": originalWidth,
    "original_height": originalHeight,
  };
}

class Rating {
  final int? overallRating;
  final int? totalRating;

  Rating({
    this.overallRating,
    this.totalRating,
  });

  Rating copyWith({
    int? overallRating,
    int? totalRating,
  }) =>
      Rating(
        overallRating: overallRating ?? this.overallRating,
        totalRating: totalRating ?? this.totalRating,
      );

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
    overallRating: json["overall_rating"],
    totalRating: json["total_rating"],
  );

  Map<String, dynamic> toJson() => {
    "overall_rating": overallRating,
    "total_rating": totalRating,
  };
}

class SyncColorImage {
  final String? colorName;
  final List<Thumbnail>? images;
  final bool? colorTrend;

  SyncColorImage({
    this.colorName,
    this.images,
    this.colorTrend,
  });

  SyncColorImage copyWith({
    String? colorName,
    List<Thumbnail>? images,
    bool? colorTrend,
  }) =>
      SyncColorImage(
        colorName: colorName ?? this.colorName,
        images: images ?? this.images,
        colorTrend: colorTrend ?? this.colorTrend,
      );

  factory SyncColorImage.fromJson(Map<String, dynamic> json) => SyncColorImage(
    colorName: json["color_name"],
    images: json["images"] == null
        ? []
        : List<Thumbnail>.from(
        json["images"]!.map((x) => Thumbnail.fromJson(x))),
    colorTrend: json["color_trend"],
  );

  Map<String, dynamic> toJson() => {
    "color_name": colorName,
    "images": images == null
        ? []
        : List<dynamic>.from(images!.map((x) => x.toJson())),
    "color_trend": colorTrend,
  };
}

class Category {
  final int? id;
  final String? slug;
  final String? name;
  final int? numAvailableProduct;

  final bool isSubCategory;
  final bool isSelected;
  final List<SubCategory>? subCategories;

  Category({
    this.id,
    this.slug,
    this.name,
    this.numAvailableProduct,
    this.isSubCategory = false,
    this.isSelected = false,
    this.subCategories,
  });

  Category copyWith({
    int? id,
    String? slug,
    String? name,
    int? numAvailableProduct,
    final bool? isSelected,
    List<SubCategory>? subCategories,
  }) =>
      Category(
        id: id ?? this.id,
        slug: slug ?? this.slug,
        name: name ?? this.name,
        numAvailableProduct: numAvailableProduct ?? this.numAvailableProduct,
        isSelected: isSelected ?? this.isSelected,
        subCategories: subCategories ?? this.subCategories,
      );

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json["id"],
      slug: json["slug"],
      name: json["name"],
      subCategories: json["childes"] == null || json["childes"] == []
          ? []
          : List<SubCategory>.from(
          json["childes"]!.map((x) => SubCategory.fromJson(x))),
    );
  }
  Map<String, dynamic> toJson() => {
    "id": id,
    "slug": slug,
    "name": name,
    "num_available_product": numAvailableProduct,
    "childes": subCategories == null
        ? []
        : List<dynamic>.from(subCategories!.map((x) => x.toJson())),
  };
}

class SubCategory {
  final int? id;
  final String? slug;
  final bool? isSubSubCategory;
  final String? name;
  final int? numAvailableProduct;
  final List<SubCategory>? childes;
  SubCategory({
    this.id,
    this.slug,
    this.name,
    this.numAvailableProduct,
    this.isSubSubCategory,
    this.childes,
  });

  SubCategory copyWith({
    int? id,
    String? slug,
    String? name,
    bool? isSubSubCategory,
    int? numAvailableProduct,
    List<SubCategory>? childes,
  }) =>
      SubCategory(
        id: id ?? this.id,
        slug: slug ?? this.slug,
        isSubSubCategory: isSubSubCategory ?? this.isSubSubCategory,
        name: name ?? this.name,
        numAvailableProduct: numAvailableProduct ?? this.numAvailableProduct,
        childes: childes ?? this.childes,
      );

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
    id: json["id"],
    slug: json["slug"],
    name: json["name"],
    numAvailableProduct: json["num_available_product"],
    childes: json["childes"] == null
        ? []
        : List<SubCategory>.from(
        json["childes"]!.map((x) => SubCategory.fromJson(x))),
  );
  Map<String, dynamic> toJson() => {
    "id": id,
    "slug": slug,
    "name": name,
    "num_available_product": numAvailableProduct,
    "childes": childes == null
        ? []
        : List<dynamic>.from(childes!.map((x) => x.toJson())),
  };
}

class MostViewedProductThumbnail {
  final String? originalHeight;
  final String? originalWidth;
  final String? filePath;

  MostViewedProductThumbnail({
    this.originalWidth,
    this.filePath,
    this.originalHeight,
  });

  MostViewedProductThumbnail copyWith({
    String? originalWidth,
    String? originalHeight,
    String? filePath,
  }) =>
      MostViewedProductThumbnail(
        originalWidth: originalWidth ?? this.originalWidth,
        originalHeight: originalHeight ?? this.originalHeight,
        filePath: filePath ?? this.filePath,
      );

  factory MostViewedProductThumbnail.fromJson(Map<String, dynamic> json) =>
      MostViewedProductThumbnail(
        filePath: json["file_path"],
        originalHeight: json["original_height"],
        originalWidth: json["original_width"],
      );

  Map<String, dynamic> toJson() => {
    "file_path": filePath,
    "original_width": originalWidth,
    "original_height": originalHeight,
  };
}
