// To parse this JSON data, do
//
//     final submitAnswersModel = submitAnswersModelFromJson(jsonString);

import 'dart:convert';

SubmitAnswersModel submitAnswersModelFromJson(String str) =>
    SubmitAnswersModel.fromJson(json.decode(str));

String submitAnswersModelToJson(SubmitAnswersModel data) =>
    json.encode(data.toJson());

class SubmitAnswersModel {
  final bool? status;
  final String? message;
  final List<Answer>? data;

  SubmitAnswersModel({
    this.status,
    this.message,
    this.data,
  });

  factory SubmitAnswersModel.fromJson(Map<String, dynamic> json) =>
      SubmitAnswersModel(
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
  int? questionId;
  int? selectedOptionId;
  int? isCorrect;
  int? answerId;

  Answer({
    this.questionId,
    this.selectedOptionId,
    this.isCorrect,
    this.answerId,
  });

  factory Answer.fromJson(Map<String, dynamic> json) => Answer(
        questionId: json["question_id"],
        selectedOptionId: json["selected_option_id"],
        isCorrect: json["is_correct"],
        answerId: json["answer_id"],
      );

  Map<String, dynamic> toJson() => {
        "question_id": questionId,
        "selected_option_id": selectedOptionId,
        "is_correct": isCorrect,
        "answer_id": answerId,
      };
}
