// To parse this JSON data, do
//
//     final listTestModel = listTestModelFromJson(jsonString);

import 'dart:convert';

ListTestModel listTestModelFromJson(String str) =>
    ListTestModel.fromJson(json.decode(str));

String listTestModelToJson(ListTestModel data) => json.encode(data.toJson());

class ListTestModel {
  final bool? status;
  final String? message;
  final ListTest? data;

  ListTestModel({
    this.status,
    this.message,
    this.data,
  });

  factory ListTestModel.fromJson(Map<String, dynamic> json) => ListTestModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : ListTest.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class ListTest {
  final Category? category;
  final List<Test>? tests;

  ListTest({
    this.category,
    this.tests,
  });

  factory ListTest.fromJson(Map<String, dynamic> json) => ListTest(
        category: json["category"] == null
            ? null
            : Category.fromJson(json["category"]),
        tests: json["tests"] == null
            ? []
            : List<Test>.from(json["tests"]!.map((x) => Test.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "category": category?.toJson(),
        "tests": tests == null
            ? []
            : List<dynamic>.from(tests!.map((x) => x.toJson())),
      };
}

class Category {
  final int? id;
  final String? type;
  final int? testCount;

  Category({
    this.id,
    this.type,
    this.testCount,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        type: json["type"],
        testCount: json["test_count"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "test_count": testCount,
      };
}

class Test {
  final int? id;
  final int? categoryId;

  Test({
    this.id,
    this.categoryId,
  });

  factory Test.fromJson(Map<String, dynamic> json) => Test(
        id: json["id"],
        categoryId: json["category_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": categoryId,
      };
}
