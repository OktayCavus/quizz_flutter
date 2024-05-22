// To parse this JSON data, do
//
//     final answersModel = answersModelFromJson(jsonString);

import 'dart:convert';

AnswersModel answersModelFromJson(String str) =>
    AnswersModel.fromJson(json.decode(str));

String answersModelToJson(AnswersModel data) => json.encode(data.toJson());

class AnswersModel {
  final bool? status;
  final String? message;
  final List<Answer>? data;

  AnswersModel({
    this.status,
    this.message,
    this.data,
  });

  factory AnswersModel.fromJson(Map<String, dynamic> json) => AnswersModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Answer>.from(json["data"]!.map((x) => Answer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Answer {
  final int? categoryId;
  final String? categoryName;
  final int? testId;
  final int? questionId;
  final int? selectedOptionId;
  final int? isCorrect;
  final String? questionText;
  final String? optionText;

  Answer({
    this.categoryId,
    this.categoryName,
    this.testId,
    this.questionId,
    this.selectedOptionId,
    this.isCorrect,
    this.questionText,
    this.optionText,
  });

  factory Answer.fromJson(Map<String, dynamic> json) => Answer(
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
