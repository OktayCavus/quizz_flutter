// To parse this JSON data, do
//
//     final selectedQuestionModel = selectedQuestionModelFromJson(jsonString);

import 'dart:convert';

SelectedQuestionModel selectedQuestionModelFromJson(String str) =>
    SelectedQuestionModel.fromJson(json.decode(str));

String selectedQuestionModelToJson(SelectedQuestionModel data) =>
    json.encode(data.toJson());

class SelectedQuestionModel {
  final bool? status;
  final String? message;
  final SelectedQuestion? data;

  SelectedQuestionModel({
    this.status,
    this.message,
    this.data,
  });

  factory SelectedQuestionModel.fromJson(Map<String, dynamic> json) =>
      SelectedQuestionModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? null
            : SelectedQuestion.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class SelectedQuestion {
  final String? questionText;
  final List<Option>? options;

  SelectedQuestion({
    this.questionText,
    this.options,
  });

  factory SelectedQuestion.fromJson(Map<String, dynamic> json) =>
      SelectedQuestion(
        questionText: json["question_text"],
        options: json["options"] == null
            ? []
            : List<Option>.from(
                json["options"]!.map((x) => Option.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "question_text": questionText,
        "options": options == null
            ? []
            : List<dynamic>.from(options!.map((x) => x.toJson())),
      };
}

class Option {
  final int? id;
  final int? questionId;
  final String? optionText;
  final int? isCorrect;

  Option({
    this.id,
    this.questionId,
    this.optionText,
    this.isCorrect,
  });

  factory Option.fromJson(Map<String, dynamic> json) => Option(
        id: json["id"],
        questionId: json["question_id"],
        optionText: json["option_text"],
        isCorrect: json["is_correct"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "question_id": questionId,
        "option_text": optionText,
        "is_correct": isCorrect,
      };
}
