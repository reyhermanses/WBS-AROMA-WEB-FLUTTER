class AuthModel {
  bool? status;
  String? message;
  int? code;
  int? isLoggedIn;
  String? token;

  AuthModel({
    this.status,
    this.message,
    this.code,
    this.isLoggedIn,
    this.token,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        status: json["status"],
        message: json["message"],
        code: json["code"],
        isLoggedIn: json["is_logged_in"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "code": code,
        "is_logged_in": isLoggedIn,
        "token": token,
      };
}
