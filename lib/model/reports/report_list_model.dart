class ReportListModel {
  bool? status;
  String? message;
  int? code;
  int? total;
  List<Datum>? data;

  ReportListModel({
    this.status,
    this.message,
    this.code,
    this.total,
    this.data,
  });

  factory ReportListModel.fromJson(Map<String, dynamic> json) =>
      ReportListModel(
        status: json["status"],
        message: json["message"],
        code: json["code"],
        total: json["total"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "code": code,
        "total": total,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  String? id;
  String? nomor;
  String? name;
  dynamic alias;
  String? title;
  String? description;
  dynamic caseCategoryId;
  dynamic status;
  dynamic anonymous;
  dynamic information;
  dynamic complaintCategory;
  dynamic notificationAnonymous;

  Datum({
    this.id,
    this.nomor,
    this.name,
    this.alias,
    this.title,
    this.description,
    this.caseCategoryId,
    this.status,
    this.anonymous,
    this.information,
    this.complaintCategory,
    this.notificationAnonymous,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        nomor: json["nomor"],
        name: json["name"],
        alias: json["alias"],
        title: json["title"],
        description: json["description"],
        caseCategoryId: json["case_category_id"],
        status: json["status"],
        anonymous: json["anonymous"],
        information: json["information"],
        complaintCategory: json["complaint_category"],
        notificationAnonymous: json["notification_anonymous"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nomor": nomor,
        "name": name,
        "alias": alias,
        "title": title,
        "description": description,
        "case_category_id": caseCategoryId,
        "status": status,
        "anonymous": anonymous,
        "information": information,
        "complaint_category": complaintCategory,
        "notification_anonymous": notificationAnonymous,
      };
}
