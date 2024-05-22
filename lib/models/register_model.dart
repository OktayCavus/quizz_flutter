// To parse this JSON data, do
//
//     final registerModel = registerModelFromJson(jsonString);

import 'dart:convert';

RegisterModel registerModelFromJson(String str) =>
    RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  final bool? status;
  final String? message;
  final Data? data;

  RegisterModel({
    this.status,
    this.message,
    this.data,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
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
  final String? username;
  final String? email;
  final String? name;
  final String? lastname;
  final int? isActive;
  final int? roleId;
  final DateTime? updatedAt;
  final DateTime? createdAt;
  final int? id;

  Data({
    this.username,
    this.email,
    this.name,
    this.lastname,
    this.isActive,
    this.roleId,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        username: json["username"],
        email: json["email"],
        name: json["name"],
        lastname: json["lastname"],
        isActive: json["is_active"],
        roleId: json["role_id"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "name": name,
        "lastname": lastname,
        "is_active": isActive,
        "role_id": roleId,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
      };
}
