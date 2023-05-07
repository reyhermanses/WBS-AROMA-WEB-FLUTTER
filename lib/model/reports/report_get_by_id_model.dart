class ReportGetByIdModel {
  bool? status;
  String? message;
  int? code;
  Data? data;

  ReportGetByIdModel({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  factory ReportGetByIdModel.fromJson(Map<String, dynamic> json) =>
      ReportGetByIdModel(
        status: json["status"],
        message: json["message"],
        code: json["code"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "code": code,
        "data": data!.toJson(),
      };
}

class Data {
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
  String? createdBy;
  String? updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;

  Data({
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
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
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
        "created_by": createdBy,
        "updated_by": updatedBy,
        "created_at":
            "${createdAt!.year.toString().padLeft(4, '0')}-${createdAt!.month.toString().padLeft(2, '0')}-${createdAt!.day.toString().padLeft(2, '0')}",
        "updated_at":
            "${updatedAt!.year.toString().padLeft(4, '0')}-${updatedAt!.month.toString().padLeft(2, '0')}-${updatedAt!.day.toString().padLeft(2, '0')}",
      };
}
