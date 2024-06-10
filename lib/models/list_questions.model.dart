// To parse this JSON data, do
//
//     final listQuestionsModel = listQuestionsModelFromJson(jsonString);

import 'dart:convert';

ListQuestionsModel listQuestionsModelFromJson(String str) =>
    ListQuestionsModel.fromJson(json.decode(str));

String listQuestionsModelToJson(ListQuestionsModel data) =>
    json.encode(data.toJson());

class ListQuestionsModel {
  final bool? status;
  final String? message;
  final List<Questions>? data;

  ListQuestionsModel({
    this.status,
    this.message,
    this.data,
  });

  factory ListQuestionsModel.fromJson(Map<String, dynamic> json) =>
      ListQuestionsModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Questions>.from(
                json["data"]!.map((x) => Questions.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Questions {
  final int? id;
  final int? testId;
  final String? questionText;
  final int? questionId;
  final int? testCategoryId;
  final List<Option>? options;

  Questions({
    this.id,
    this.testId,
    this.questionText,
    this.questionId,
    this.testCategoryId,
    this.options,
  });

  factory Questions.fromJson(Map<String, dynamic> json) => Questions(
        id: json["id"],
        testId: json["test_id"],
        questionText: json["question_text"],
        questionId: json["question_id"],
        testCategoryId: json["test_category_id"],
        options: json["options"] == null
            ? []
            : List<Option>.from(
                json["options"]!.map((x) => Option.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "test_id": testId,
        "question_text": questionText,
        "question_id": questionId,
        "test_category_id": testCategoryId,
        "options": options == null
            ? []
            : List<dynamic>.from(options!.map((x) => x.toJson())),
      };
}

class Option {
  final String? optionText;
  final int? isCorrect;
  final int? optionId;

  Option({
    this.optionText,
    this.isCorrect,
    this.optionId,
  });

  factory Option.fromJson(Map<String, dynamic> json) => Option(
        optionText: json["option_text"],
        isCorrect: json["is_correct"],
        optionId: json["option_id"],
      );

  Map<String, dynamic> toJson() => {
        "option_text": optionText,
        "is_correct": isCorrect,
        "option_id": optionId,
      };
}
