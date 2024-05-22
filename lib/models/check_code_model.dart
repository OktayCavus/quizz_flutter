// To parse this JSON data, do
//
//     final checkCodeModel = checkCodeModelFromJson(jsonString);

import 'dart:convert';

CheckCodeModel checkCodeModelFromJson(String str) =>
    CheckCodeModel.fromJson(json.decode(str));

String checkCodeModelToJson(CheckCodeModel data) => json.encode(data.toJson());

class CheckCodeModel {
  final bool? status;
  final String? message;
  final Data? data;

  CheckCodeModel({
    this.status,
    this.message,
    this.data,
  });

  factory CheckCodeModel.fromJson(Map<String, dynamic> json) => CheckCodeModel(
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
  final String? code;

  Data({
    this.code,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
      };
}
