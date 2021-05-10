import 'dart:convert';

RegisterResponse registerResponseFromJson(String str) => RegisterResponse.fromJson(json.decode(str));

String registerResponseToJson(RegisterResponse data) => json.encode(data.toJson());

class RegisterResponse {
  RegisterResponse({
    this.status,
    this.timestamp,
    this.error,
    this.message,
  });

  String status;
  String timestamp;
  String error;
  String message;

  factory RegisterResponse.fromJson(Map<String, dynamic> json) => RegisterResponse(
    status: json["status"] == null ? null : json["status"],
    timestamp: json["timestamp"] == null ? null : json["timestamp"],
    error: json["error"] == null ? null : json["error"],
    message: json["message:"] == null ? null : json["message:"],
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "timestamp": timestamp == null ? null : timestamp,
    "error": error == null ? null : error,
    "message:": message == null ? null : message,
  };
}