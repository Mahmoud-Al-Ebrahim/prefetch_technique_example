
import 'dart:convert';

GroupsResponseModel groupsResponseModelFromJson(String str) =>
    GroupsResponseModel.fromJson(json.decode(str));

String groupsResponseModelToJson(GroupsResponseModel data) =>
    json.encode(data.toJson());

class GroupsResponseModel {
  final String? message;
  final Data? data;

  GroupsResponseModel({
    this.message,
    this.data,
  });

  GroupsResponseModel copyWith({
    String? message,
    Data? data,
  }) =>
      GroupsResponseModel(
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory GroupsResponseModel.fromJson(Map<String, dynamic> json) =>
      GroupsResponseModel(
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  final int? total;
  final int? limit;
  final String? offset;
  final List<GroupModel>? groups;

  Data({
    this.total,
    this.limit,
    this.offset,
    this.groups,
  });

  Data copyWith({
    int? total,
    int? limit,
    String? offset,
    List<GroupModel>? groups,
  }) =>
      Data(
        total: total ?? this.total,
        limit: limit ?? this.limit,
        offset: offset ?? this.offset,
        groups: groups ?? this.groups,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    total: json["total"],
    limit: json["limit"],
    offset: json["offset"],
    groups: json["boutiques"] == null
        ? []
        : List<GroupModel>.from(
        json["boutiques"]!.map((x) => GroupModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "limit": limit,
    "offset": offset,
    "boutiques": groups == null
        ? []
        : List<dynamic>.from(groups!.map((x) => x.toJson())),
  };
}

class GroupModel {
  final int? id;
  final String? name;
  final Icon? icon;
  final String? slug;
  final int? position;
  final String? description;
  final List<Icon>? banners;
  final List<MainCategoriesForProductId>? mainCategoriesForProductIds;
  final List<ChildCategoriesForProductId>? childCategoriesForProductIds;

  GroupModel({
    this.id,
    this.name,
    this.icon,
    this.slug,
    this.position,
    this.description,
    this.banners,
    this.mainCategoriesForProductIds,
    this.childCategoriesForProductIds,
  });

  GroupModel copyWith({
    int? id,
    String? name,
    Icon? icon,
    String? slug,
    int? position,
    String? description,
    List<Icon>? banners,
    List<MainCategoriesForProductId>? mainCategoriesForProductIds,
    List<ChildCategoriesForProductId>? childCategoriesForProductIds,
  }) =>
      GroupModel(
        id: id ?? this.id,
        name: name ?? this.name,
        icon: icon ?? this.icon,
        slug: slug ?? this.slug,
        position: position ?? this.position,
        description: description ?? this.description,
        banners: banners ?? this.banners,
        mainCategoriesForProductIds:
        mainCategoriesForProductIds ?? this.mainCategoriesForProductIds,
        childCategoriesForProductIds:
        childCategoriesForProductIds ?? this.childCategoriesForProductIds,
      );

  factory GroupModel.fromJson(Map<String, dynamic> json) => GroupModel(
    id: json["id"],
    name: json["name"],
    icon: json["icon"] == null ? null : Icon.fromJson(json["icon"]),
    slug: json["slug"],
    position: json["position"],
    description: json["description"],
    banners: json["banners"] == null
        ? []
        : List<Icon>.from(json["banners"]!.map((x) => Icon.fromJson(x))),
    mainCategoriesForProductIds: json["mainCategoriesForProductIds"] == null
        ? []
        : List<MainCategoriesForProductId>.from(
        json["mainCategoriesForProductIds"]!
            .map((x) => MainCategoriesForProductId.fromJson(x))),
    childCategoriesForProductIds:
    json["childCategoriesForProductIds"] == null
        ? []
        : List<ChildCategoriesForProductId>.from(
        json["childCategoriesForProductIds"]!
            .map((x) => ChildCategoriesForProductId.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "icon": icon?.toJson(),
    "slug": slug,
    "position": position,
    "description": description,
    "banners": banners == null
        ? []
        : List<dynamic>.from(banners!.map((x) => x.toJson())),
    "mainCategoriesForProductIds": mainCategoriesForProductIds == null
        ? []
        : List<dynamic>.from(
        mainCategoriesForProductIds!.map((x) => x.toJson())),
    "childCategoriesForProductIds": childCategoriesForProductIds == null
        ? []
        : List<dynamic>.from(
        childCategoriesForProductIds!.map((x) => x.toJson())),
  };
}

class Icon {
  final String? filePath;
  final String? originalWidth;
  final String? originalHeight;

  Icon({
    this.filePath,
    this.originalWidth,
    this.originalHeight,
  });

  Icon copyWith({
    String? filePath,
    String? originalWidth,
    String? originalHeight,
  }) =>
      Icon(
        filePath: filePath ?? this.filePath,
        originalWidth: originalWidth ?? this.originalWidth,
        originalHeight: originalHeight ?? this.originalHeight,
      );

  factory Icon.fromJson(Map<String, dynamic> json) => Icon(
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

class ChildCategoriesForProductId {
  final int? categoryId;
  final String? categorySlug;
  final String? categoryName;
  final String? productName;
  final int? countProducts;
  final Icon? mostViewedProductThumbnail;

  ChildCategoriesForProductId({
    this.categoryId,
    this.categorySlug,
    this.categoryName,
    this.productName,
    this.countProducts,
    this.mostViewedProductThumbnail,
  });

  ChildCategoriesForProductId copyWith({
    int? categoryId,
    String? categorySlug,
    String? categoryName,
    String? productName,
    int? countProducts,
    Icon? mostViewedProductThumbnail,
  }) =>
      ChildCategoriesForProductId(
        categoryId: categoryId ?? this.categoryId,
        categorySlug: categorySlug ?? this.categorySlug,
        categoryName: categoryName ?? this.categoryName,
        productName: productName ?? this.productName,
        countProducts: countProducts ?? this.countProducts,
        mostViewedProductThumbnail:
        mostViewedProductThumbnail ?? this.mostViewedProductThumbnail,
      );

  factory ChildCategoriesForProductId.fromJson(Map<String, dynamic> json) =>
      ChildCategoriesForProductId(
        categoryId: json["id"],
        categorySlug: json["slug"],
        categoryName: json["name"],
        productName: json["most_viewed_product_name"],
        countProducts: json["num_available_product"],
        mostViewedProductThumbnail:
        json["most_viewed_product_thumbnail"] == null
            ? null
            : Icon.fromJson(json["most_viewed_product_thumbnail"]),
      );

  Map<String, dynamic> toJson() => {
    "id": categoryId,
    "slug": categorySlug,
    "name": categoryName,
    "most_viewed_product_name": productName,
    "num_available_product": countProducts,
    "most_viewed_product_thumbnail": mostViewedProductThumbnail?.toJson(),
  };
}

class MainCategoriesForProductId {
  final int? categoryId;
  final String? productName;
  final int? countProducts;
  final Icon? mostViewedProductThumbnail;
  final String? categorySlug;
  final String? categoryName;
  final Icon? flatPhotoPath;

  MainCategoriesForProductId({
    this.categoryId,
    this.categorySlug,
    this.productName,
    this.countProducts,
    this.mostViewedProductThumbnail,
    this.categoryName,
    this.flatPhotoPath,
  });

  MainCategoriesForProductId copyWith({
    int? categoryId,
    String? categorySlug,
    String? categoryName,
    String? productName,
    int? countProducts,
    Icon? mostViewedProductThumbnail,
    Icon? flatPhotoPath,
  }) =>
      MainCategoriesForProductId(
        categoryId: categoryId ?? this.categoryId,
        categorySlug: categorySlug ?? this.categorySlug,
        categoryName: categoryName ?? this.categoryName,
        productName: productName ?? this.productName,
        countProducts: countProducts ?? this.countProducts,
        mostViewedProductThumbnail:
        mostViewedProductThumbnail ?? this.mostViewedProductThumbnail,
        flatPhotoPath: flatPhotoPath ?? this.flatPhotoPath,
      );

  factory MainCategoriesForProductId.fromJson(Map<String, dynamic> json) =>
      MainCategoriesForProductId(
        categoryId: json["id"],
        categorySlug: json["slug"],
        categoryName: json["name"],
        productName: json["most_viewed_product_name"],
        countProducts: json["num_available_product"],
        mostViewedProductThumbnail:
        json["most_viewed_product_thumbnail"] == null
            ? null
            : Icon.fromJson(json["most_viewed_product_thumbnail"]),
        flatPhotoPath: json["flat_photo_path"] == null
            ? null
            : Icon.fromJson(json["flat_photo_path"]),
      );

  Map<String, dynamic> toJson() => {
    "id": categoryId,
    "slug": categorySlug,
    "name": categoryName,
    "flat_photo_path": flatPhotoPath?.toJson(),
    "most_viewed_product_name": productName,
    "num_available_product": countProducts,
    "most_viewed_product_thumbnail": mostViewedProductThumbnail?.toJson(),
  };
}
