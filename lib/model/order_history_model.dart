// To parse this JSON data, do
//
//     final orderHistoryModel = orderHistoryModelFromJson(jsonString);

import 'dart:convert';

OrderHistoryModel orderHistoryModelFromJson(String str) => OrderHistoryModel.fromJson(json.decode(str));

String orderHistoryModelToJson(OrderHistoryModel data) => json.encode(data.toJson());

class OrderHistoryModel {
  OrderHistoryModel({
    this.order,
    this.placedOn,
    this.amount,
    this.status,
  });

  String order;
  String placedOn;
  String amount;
  String status;

  factory OrderHistoryModel.fromJson(Map<String, dynamic> json) => OrderHistoryModel(
    order: json["ORDER"] == null ? null : json["ORDER"],
    placedOn: json["Placed On"] == null ? null : json["Placed On"],
    amount: json["Amount"] == null ? null : json["Amount"],
    status: json["Status:"] == null ? null : json["Status:"],
  );

  Map<String, dynamic> toJson() => {
    "ORDER": order == null ? null : order,
    "Placed On": placedOn == null ? null : placedOn,
    "Amount": amount == null ? null : amount,
    "Status:": status == null ? null : status,
  };
}
