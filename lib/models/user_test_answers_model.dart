// To parse this JSON data, do
//
//     final userTestsAnswersModel = userTestsAnswersModelFromJson(jsonString);

import 'dart:convert';

UserTestsAnswersModel userTestsAnswersModelFromJson(String str) =>
    UserTestsAnswersModel.fromJson(json.decode(str));

String userTestsAnswersModelToJson(UserTestsAnswersModel data) =>
    json.encode(data.toJson());

class UserTestsAnswersModel {
  final bool? status;
  final String? message;
  final List<Datum>? data;

  UserTestsAnswersModel({
    this.status,
    this.message,
    this.data,
  });

  factory UserTestsAnswersModel.fromJson(Map<String, dynamic> json) =>
      UserTestsAnswersModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  final int? categoryId;
  final String? categoryName;
  final int? testId;
  final int? questionId;
  final int? selectedOptionId;
  final int? isCorrect;
  final String? questionText;
  final String? optionText;

  Datum({
    this.categoryId,
    this.categoryName,
    this.testId,
    this.questionId,
    this.selectedOptionId,
    this.isCorrect,
    this.questionText,
    this.optionText,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        categoryId: json["category_id"],
        categoryName: json["category_name"],
        testId: json["test_id"],
        questionId: json["question_id"],
        selectedOptionId: json["selected_option_id"],
        isCorrect: json["is_correct"],
        questionText: json["question_text"],
        optionText: json["option_text"],
      );

  Map<String, dynamic> toJson() => {
        "category_id": categoryId,
        "category_name": categoryName,
        "test_id": testId,
        "question_id": questionId,
        "selected_option_id": selectedOptionId,
        "is_correct": isCorrect,
        "question_text": questionText,
        "option_text": optionText,
      };
}
