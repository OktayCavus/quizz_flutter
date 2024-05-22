// To parse this JSON data, do
//
//     final forgetPasswordModel = forgetPasswordModelFromJson(jsonString);

import 'dart:convert';

ForgetPasswordModel forgetPasswordModelFromJson(String str) =>
    ForgetPasswordModel.fromJson(json.decode(str));

String forgetPasswordModelToJson(ForgetPasswordModel data) =>
    json.encode(data.toJson());

class ForgetPasswordModel {
  final bool? status;
  final String? message;
  final dynamic data;

  ForgetPasswordModel({
    this.status,
    this.message,
    this.data,
  });

  factory ForgetPasswordModel.fromJson(Map<String, dynamic> json) =>
      ForgetPasswordModel(
        status: json["status"],
        message: json["message"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data,
      };
}
