// To parse this JSON data, do
//
//     final allCategoryModel = allCategoryModelFromJson(jsonString);

import 'dart:convert';

AllCategoryModel allCategoryModelFromJson(String str) =>
    AllCategoryModel.fromJson(json.decode(str));

String allCategoryModelToJson(AllCategoryModel data) =>
    json.encode(data.toJson());

class AllCategoryModel {
  final bool? status;
  final String? message;
  final List<AllCategory>? data;

  AllCategoryModel({
    this.status,
    this.message,
    this.data,
  });

  factory AllCategoryModel.fromJson(Map<String, dynamic> json) =>
      AllCategoryModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<AllCategory>.from(
                json["data"]!.map((x) => AllCategory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class AllCategory {
  final int? id;
  final String? type;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic deletedAt;

  AllCategory({
    this.id,
    this.type,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory AllCategory.fromJson(Map<String, dynamic> json) => AllCategory(
        id: json["id"],
        type: json["type"],
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
        "type": type,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "deleted_at": deletedAt,
      };
}
