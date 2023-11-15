// To parse this JSON data, do
//
//     final shippingModel = shippingModelFromJson(jsonString);

import 'dart:convert';

ShippingModel shippingModelFromJson(String str) =>
    ShippingModel.fromJson(json.decode(str));

String shippingModelToJson(ShippingModel data) => json.encode(data.toJson());

class ShippingModel {
  int id;
  String method;
  String careOfLine;
  int returnAddress;
  int recipientAddress;

  ShippingModel({
    required this.id,
    required this.method,
    required this.careOfLine,
    required this.returnAddress,
    required this.recipientAddress,
  });

  factory ShippingModel.fromJson(Map<String, dynamic> json) => ShippingModel(
        id: json["id"],
        method: json["method"],
        careOfLine: json["care_of_line"],
        returnAddress: json["return_address"],
        recipientAddress: json["recipient_address"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "method": method,
        "care_of_line": careOfLine,
        "return_address": returnAddress,
        "recipient_address": recipientAddress,
      };
}
