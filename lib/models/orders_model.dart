// To parse this JSON data, do
//
//     final ordersData = ordersDataFromJson(jsonString);

import 'dart:convert';

import 'package:menuus_mobile/models/plate_model.dart';

OrdersData ordersDataFromJson(String str) => OrdersData.fromJson(json.decode(str));
String ordersDataToJson(OrdersData data) => json.encode(data.toJson());

class OrdersData {
    List<Order> data;
    Links links;

    OrdersData({
        this.data,
        this.links,
    });

    factory OrdersData.fromJson(Map<String, dynamic> json) => OrdersData(
        data: json["data"] == null ? null : List<Order>.from(json["data"].map((x) => Order.fromJson(x))),
        links: json["links"] == null ? null : Links.fromJson(json["links"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
        "links": links == null ? null : links.toJson(),
    };
}

class Order {
    int id;
    int userId;
    int establishmentId;
    dynamic obs;
    DateTime createdAt;
    DateTime updatedAt;
    List<Plate> plates;

    Order({
        this.id,
        this.userId,
        this.establishmentId,
        this.obs,
        this.createdAt,
        this.updatedAt,
        this.plates,
    });

    factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"] == null ? null : json["id"],
        userId: json["user_id"] == null ? null : json["user_id"],
        establishmentId: json["establishment_id"] == null ? null : json["establishment_id"],
        obs: json["obs"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        plates: json["plates"] == null ? null : List<Plate>.from(json["plates"].map((x) => Plate.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "user_id": userId == null ? null : userId,
        "establishment_id": establishmentId == null ? null : establishmentId,
        "obs": obs,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "plates": plates == null ? null : List<dynamic>.from(plates.map((x) => x.toJson())),
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

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
