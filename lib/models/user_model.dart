// To parse this JSON data, do
//
//     final fetchUser = fetchUserFromJson(jsonString);

import 'dart:convert';

FetchUser fetchUserFromJson(String str) => FetchUser.fromJson(json.decode(str));
String fetchUserToJson(FetchUser data) => json.encode(data.toJson());

class FetchUser {
  UserData data;

  FetchUser({
    this.data,
  });

  factory FetchUser.fromJson(Map<String, dynamic> json) => FetchUser(
        data: json["data"] == null ? null : UserData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null ? null : data.toJson(),
      };
}

class UserData {
  User user;
  String accessToken;

  UserData({
    this.user,
    this.accessToken,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        accessToken: json["access_token"] == null ? null : json["access_token"],
      );

  Map<String, dynamic> toJson() => {
        "user": user == null ? null : user.toJson(),
        "access_token": accessToken == null ? null : accessToken,
      };
}

class User {
  int id;
  String profileType;
  int profileId;
  String name;
  String email;
  DateTime emailVerifiedAt;
  DateTime createdAt;
  DateTime updatedAt;
  Profile profile;

  User({
    this.id,
    this.profileType,
    this.profileId,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
    this.profile,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] == null ? null : json["id"],
        profileType: json["profile_type"] == null ? null : json["profile_type"],
        profileId: json["profile_id"] == null ? null : json["profile_id"],
        name: json["name"] == null ? null : json["name"],
        email: json["email"] == null ? null : json["email"],
        emailVerifiedAt: json["email_verified_at"] == null ? null : DateTime.parse(json["email_verified_at"]),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        profile: json["profile"] == null ? null : Profile.fromJson(json["profile"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "profile_type": profileType == null ? null : profileType,
        "profile_id": profileId == null ? null : profileId,
        "name": name == null ? null : name,
        "email": email == null ? null : email,
        "email_verified_at": emailVerifiedAt == null ? null : emailVerifiedAt.toIso8601String(),
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "profile": profile == null ? null : profile.toJson(),
      };
}

class Profile {
  int id;
  dynamic imageId;
  DateTime createdAt;
  DateTime updatedAt;

  Profile({
    this.id,
    this.imageId,
    this.createdAt,
    this.updatedAt,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json["id"] == null ? null : json["id"],
        imageId: json["image_id"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "image_id": imageId,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
      };
}
