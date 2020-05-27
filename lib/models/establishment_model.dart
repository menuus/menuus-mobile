// To parse this JSON data, do
//
//     final establishmentData = establishmentDataFromJson(jsonString);

import 'dart:convert';

import 'plate_model.dart';

EstablishmentData establishmentDataFromJson(String str) => EstablishmentData.fromJson(json.decode(str));
String establishmentDataToJson(EstablishmentData data) => json.encode(data.toJson());

EstablishmentDataList establishmentDataListFromJson(String str) => EstablishmentDataList.fromJson(json.decode(str));
String establishmentDataListToJson(EstablishmentDataList data) => json.encode(data.toJson());

class EstablishmentData {
    Establishment data;

    EstablishmentData({
        this.data,
    });

    factory EstablishmentData.fromJson(Map<String, dynamic> json) => EstablishmentData(
        data: json["data"] == null ? null : Establishment.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? null : data.toJson(),
    };
}

class Establishment {
    int id;
    int foodCourtId;
    int establishmentCategoryId;
    int logoImageId;
    String name;
    String slug;
    String description;
    DateTime createdAt;
    DateTime updatedAt;
    int platesCount;
    List<Logo> images;
    Logo logo;

    Establishment({
        this.id,
        this.foodCourtId,
        this.establishmentCategoryId,
        this.logoImageId,
        this.name,
        this.slug,
        this.description,
        this.createdAt,
        this.updatedAt,
        this.platesCount,
        this.images,
        this.logo,
    });

    factory Establishment.fromJson(Map<String, dynamic> json) => Establishment(
        id: json["id"] == null ? null : json["id"],
        foodCourtId: json["food_court_id"] == null ? null : json["food_court_id"],
        establishmentCategoryId: json["establishment_category_id"] == null ? null : json["establishment_category_id"],
        logoImageId: json["logo_image_id"] == null ? null : json["logo_image_id"],
        name: json["name"] == null ? null : json["name"],
        slug: json["slug"] == null ? null : json["slug"],
        description: json["description"] == null ? null : json["description"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        platesCount: json["plates_count"] == null ? null : json["plates_count"],
        images: json["images"] == null ? null : List<Logo>.from(json["images"].map((x) => Logo.fromJson(x))),
        logo: json["logo"] == null ? null : Logo.fromJson(json["logo"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "food_court_id": foodCourtId == null ? null : foodCourtId,
        "establishment_category_id": establishmentCategoryId == null ? null : establishmentCategoryId,
        "logo_image_id": logoImageId == null ? null : logoImageId,
        "name": name == null ? null : name,
        "slug": slug == null ? null : slug,
        "description": description == null ? null : description,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "plates_count": platesCount == null ? null : platesCount,
        "images": images == null ? null : List<dynamic>.from(images.map((x) => x.toJson())),
        "logo": logo == null ? null : logo.toJson(),
    };
}

class EstablishmentDataList {
    List<Establishment> data;
    Links links;

    EstablishmentDataList({
        this.data,
        this.links,
    });

    factory EstablishmentDataList.fromJson(Map<String, dynamic> json) => EstablishmentDataList(
        data: json["data"] == null ? null : List<Establishment>.from(json["data"].map((x) => Establishment.fromJson(x))),
        links: json["links"] == null ? null : Links.fromJson(json["links"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
        "links": links == null ? null : links.toJson(),
    };
}

class Links {
    String first;
    String last;
    dynamic prev;
    dynamic next;

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
        next: json["next"],
    );

    Map<String, dynamic> toJson() => {
        "first": first == null ? null : first,
        "last": last == null ? null : last,
        "prev": prev,
        "next": next,
    };
}

class Logo {
    int id;
    String name;
    dynamic description;
    String path;
    DateTime createdAt;
    DateTime updatedAt;

    Logo({
        this.id,
        this.name,
        this.description,
        this.path,
        this.createdAt,
        this.updatedAt,
    });

    factory Logo.fromJson(Map<String, dynamic> json) => Logo(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        description: json["description"],
        path: json["path"] == null ? null : json["path"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "description": description,
        "path": path == null ? null : path,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
    };
}
