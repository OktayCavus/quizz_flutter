// To parse this JSON data, do
//
//     final userTestsModel = userTestsModelFromJson(jsonString);

import 'dart:convert';

UserTestsModel userTestsModelFromJson(String str) =>
    UserTestsModel.fromJson(json.decode(str));

String userTestsModelToJson(UserTestsModel data) => json.encode(data.toJson());

class UserTestsModel {
  final bool? status;
  final String? message;
  final List<UserTests>? data;

  UserTestsModel({
    this.status,
    this.message,
    this.data,
  });

  factory UserTestsModel.fromJson(Map<String, dynamic> json) => UserTestsModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<UserTests>.from(
                json["data"]!.map((x) => UserTests.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class UserTests {
  final int? testId;
  final int? categoryId;

  UserTests({
    this.testId,
    this.categoryId,
  });

  factory UserTests.fromJson(Map<String, dynamic> json) => UserTests(
        testId: json["test_id"],
        categoryId: json["category_id"],
      );

  Map<String, dynamic> toJson() => {
        "test_id": testId,
        "category_id": categoryId,
      };
}
