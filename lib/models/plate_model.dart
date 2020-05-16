// To parse this JSON data, do
//
//     final plateData = plateDataFromJson(jsonString);

import 'dart:convert';

PlateData plateDataFromJson(String str) => PlateData.fromJson(json.decode(str));
String plateDataToJson(PlateData data) => json.encode(data.toJson());

PlateDataList plateDataListFromJson(String str) => PlateDataList.fromJson(json.decode(str));
String plateDataListToJson(PlateDataList data) => json.encode(data.toJson());

class PlateData {
  Plate data;

  PlateData({
    this.data,
  });

  factory PlateData.fromJson(Map<String, dynamic> json) =>
      PlateData(data: json["data"] == null ? null : Plate.fromJson(json["data"]));

  Map<String, dynamic> toJson() => {"data": data == null ? null : data.toJson()};
}

class PlateDataList {
  List<Plate> data;
  Links links;

  PlateDataList({
    this.data,
    this.links,
  });

  factory PlateDataList.fromJson(Map<String, dynamic> json) => PlateDataList(
        data: json["data"] == null ? null : List<Plate>.from(json["data"].map((x) => Plate.fromJson(x))),
        links: json["links"] == null ? null : Links.fromJson(json["links"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
        "links": links == null ? null : links.toJson(),
      };
}

class Plate {
  int id;
  int establishmentId;
  int menuTypeId;
  int plateCategoryId;
  String name;
  String slug;
  String description;
  String price;
  DateTime createdAt;
  DateTime updatedAt;
  List<PlateImage> images;
  Establishment establishment;
  PlateCategory plateCategory;
  Establishment menuType;

  Plate({
    this.id,
    this.establishmentId,
    this.menuTypeId,
    this.plateCategoryId,
    this.name,
    this.slug,
    this.description,
    this.price,
    this.createdAt,
    this.updatedAt,
    this.images,
    this.establishment,
    this.plateCategory,
    this.menuType,
  });

  factory Plate.fromJson(Map<String, dynamic> json) => Plate(
        id: json["id"] == null ? null : json["id"],
        establishmentId: json["establishment_id"] == null ? null : json["establishment_id"],
        menuTypeId: json["menu_type_id"] == null ? null : json["menu_type_id"],
        plateCategoryId: json["plate_category_id"] == null ? null : json["plate_category_id"],
        name: json["name"] == null ? null : json["name"],
        slug: json["slug"] == null ? null : json["slug"],
        description: json["description"] == null ? null : json["description"],
        price: json["price"] == null ? null : json["price"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        images: json["images"] == null ? null : List<PlateImage>.from(json["images"].map((x) => PlateImage.fromJson(x))),
        establishment: json["establishment"] == null ? null : Establishment.fromJson(json["establishment"]),
        plateCategory: json["plate_category"] == null ? null : PlateCategory.fromJson(json["plate_category"]),
        menuType: json["menu_type"] == null ? null : Establishment.fromJson(json["menu_type"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "establishment_id": establishmentId == null ? null : establishmentId,
        "menu_type_id": menuTypeId == null ? null : menuTypeId,
        "plate_category_id": plateCategoryId == null ? null : plateCategoryId,
        "name": name == null ? null : name,
        "slug": slug == null ? null : slug,
        "description": description == null ? null : description,
        "price": price == null ? null : price,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "images": images == null ? null : List<dynamic>.from(images.map((x) => x.toJson())),
        "establishment": establishment == null ? null : establishment.toJson(),
        "plate_category": plateCategory == null ? null : plateCategory.toJson(),
        "menu_type": menuType == null ? null : menuType.toJson(),
      };
}

class Establishment {
  int id;
  int foodCourtId;
  int establishmentCategoryId;
  String name;
  String slug;
  String description;
  DateTime createdAt;
  DateTime updatedAt;
  String color;

  Establishment({
    this.id,
    this.foodCourtId,
    this.establishmentCategoryId,
    this.name,
    this.slug,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.color,
  });

  factory Establishment.fromJson(Map<String, dynamic> json) => Establishment(
        id: json["id"] == null ? null : json["id"],
        foodCourtId: json["food_court_id"] == null ? null : json["food_court_id"],
        establishmentCategoryId: json["establishment_category_id"] == null ? null : json["establishment_category_id"],
        name: json["name"] == null ? null : json["name"],
        slug: json["slug"] == null ? null : json["slug"],
        description: json["description"] == null ? null : json["description"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        color: json["color"] == null ? null : json["color"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "food_court_id": foodCourtId == null ? null : foodCourtId,
        "establishment_category_id": establishmentCategoryId == null ? null : establishmentCategoryId,
        "name": name == null ? null : name,
        "slug": slug == null ? null : slug,
        "description": description == null ? null : description,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "color": color == null ? null : color,
      };
}

class PlateImage {
  int id;
  String name;
  String description;
  String path;
  DateTime createdAt;
  DateTime updatedAt;

  PlateImage({
    this.id,
    this.name,
    this.description,
    this.path,
    this.createdAt,
    this.updatedAt,
  });

  factory PlateImage.fromJson(Map<String, dynamic> json) => PlateImage(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        description: json["description"] == null ? null : json["description"],
        path: json["path"] == null ? null : json["path"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "description": description == null ? null : description,
        "path": path == null ? null : path,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
      };
}

class PlateCategory {
  int id;
  String name;
  String slug;
  DateTime createdAt;
  DateTime updatedAt;

  PlateCategory({
    this.id,
    this.name,
    this.slug,
    this.createdAt,
    this.updatedAt,
  });

  factory PlateCategory.fromJson(Map<String, dynamic> json) => PlateCategory(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        slug: json["slug"] == null ? null : json["slug"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "slug": slug == null ? null : slug,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
      };
}

class Links {
  String first;
  String last;
  dynamic prev;
  String next;

  Links({
    this.first,
    this.last,
    this.prev,
    this.next,
  });

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        first: json["first"] == null ? null : json["first"],
        last: json["last"] == null ? null : json["last"],
        prev: json["prev"],
        next: json["next"] == null ? null : json["next"],
      );

  Map<String, dynamic> toJson() => {
        "first": first == null ? null : first,
        "last": last == null ? null : last,
        "prev": prev,
        "next": next == null ? null : next,
      };
}
