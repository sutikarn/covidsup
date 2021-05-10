import 'dart:convert';

RegisterRequest registerRequestFromJson(String str) => RegisterRequest.fromJson(json.decode(str));

String registerRequestToJson(RegisterRequest data) => json.encode(data.toJson());

class RegisterRequest {
  RegisterRequest({
    this.username,
    this.email,
    this.password,
    this.phoneNo,
    this.birthDate,
    this.typeAccount,
  });

  String username;
  String email;
  String password;
  String phoneNo;
  DateTime birthDate;
  String typeAccount;

  factory RegisterRequest.fromJson(Map<String, dynamic> json) => RegisterRequest(
    username: json["username"] == null ? null : json["username"],
    email: json["email"] == null ? null : json["email"],
    password: json["password"] == null ? null : json["password"],
    phoneNo: json["phoneNo:"] == null ? null : json["phoneNo:"],
    birthDate: json["birthDate"] == null ? null : json["birthDate"],
    typeAccount: json["typeAccount"] == null ? null : json["typeAccount"],
  );

  Map<String, dynamic> toJson() => {
    "username": username == null ? null : username,
    "email": email == null ? null : email,
    "password": password == null ? null : password,
    "phoneNo:": phoneNo == null ? null : phoneNo,
    "birthDate": birthDate == null ? null : birthDate,
    "typeAccount": typeAccount == null ? null : typeAccount,
  };
}
