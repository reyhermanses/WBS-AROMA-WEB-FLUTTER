// To parse this JSON data, do
//
//     final reportModel = reportModelFromJson(jsonString);

import 'dart:convert';

ReportModel reportModelFromJson(String str) =>
    ReportModel.fromJson(json.decode(str));

String reportModelToJson(ReportModel data) => json.encode(data.toJson());

class ReportModel {
  bool? status;
  String? message;
  int? code;
  String? id;

  ReportModel({
    this.status,
    this.message,
    this.code,
    this.id,
  });

  factory ReportModel.fromJson(Map<String, dynamic> json) => ReportModel(
        status: json["status"],
        message: json["message"],
        code: json["code"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "code": code,
        "id": id,
      };
}
