// To parse this JSON data, do
//
//     final changeEmailCodeModel = changeEmailCodeModelFromJson(jsonString);

import 'dart:convert';

ChangeEmailCodeModel changeEmailCodeModelFromJson(String str) =>
    ChangeEmailCodeModel.fromJson(json.decode(str));

String changeEmailCodeModelToJson(ChangeEmailCodeModel data) =>
    json.encode(data.toJson());

class ChangeEmailCodeModel {
  final bool? status;
  final String? message;
  final Data? data;

  ChangeEmailCodeModel({
    this.status,
    this.message,
    this.data,
  });

  factory ChangeEmailCodeModel.fromJson(Map<String, dynamic> json) =>
      ChangeEmailCodeModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  final int? id;
  final int? roleId;
  final String? username;
  final int? isActive;
  final String? name;
  final String? lastname;
  final String? email;
  final DateTime? emailVerifiedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic deletedAt;

  Data({
    this.id,
    this.roleId,
    this.username,
    this.isActive,
    this.name,
    this.lastname,
    this.email,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        roleId: json["role_id"],
        username: json["username"],
        isActive: json["is_active"],
        name: json["name"],
        lastname: json["lastname"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"] == null
            ? null
            : DateTime.parse(json["email_verified_at"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "role_id": roleId,
        "username": username,
        "is_active": isActive,
        "name": name,
        "lastname": lastname,
        "email": email,
        "email_verified_at": emailVerifiedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "deleted_at": deletedAt,
      };
}
