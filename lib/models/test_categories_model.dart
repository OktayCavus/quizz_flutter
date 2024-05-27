// To parse this JSON data, do
//
//     final testCategoriesModel = testCategoriesModelFromJson(jsonString);

import 'dart:convert';

TestCategoriesModel testCategoriesModelFromJson(String str) =>
    TestCategoriesModel.fromJson(json.decode(str));

String testCategoriesModelToJson(TestCategoriesModel data) =>
    json.encode(data.toJson());

class TestCategoriesModel {
  final bool? status;
  final String? message;
  final List<Category>? data;

  TestCategoriesModel({
    this.status,
    this.message,
    this.data,
  });

  factory TestCategoriesModel.fromJson(Map<String, dynamic> json) =>
      TestCategoriesModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Category>.from(
                json["data"]!.map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Category {
  final int? categoryId;
  final String? categoryName;

  Category({
    this.categoryId,
    this.categoryName,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        categoryId: json["category_id"],
        categoryName: json["category_name"],
      );

  Map<String, dynamic> toJson() => {
        "category_id": categoryId,
        "category_name": categoryName,
      };
}
