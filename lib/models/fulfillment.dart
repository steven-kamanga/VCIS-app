// To parse this JSON data, do
//
//     final fulfillmentModel = fulfillmentModelFromJson(jsonString);

import 'dart:convert';

FulfillmentModel fulfillmentModelFromJson(String str) =>
    FulfillmentModel.fromJson(json.decode(str));

String fulfillmentModelToJson(FulfillmentModel data) =>
    json.encode(data.toJson());

class FulfillmentModel {
  int id;
  String cardFulfillmentReason;
  int shipping;

  FulfillmentModel({
    required this.id,
    required this.cardFulfillmentReason,
    required this.shipping,
  });

  factory FulfillmentModel.fromJson(Map<String, dynamic> json) =>
      FulfillmentModel(
        id: json["id"],
        cardFulfillmentReason: json["card_fulfillment_reason"],
        shipping: json["shipping"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "card_fulfillment_reason": cardFulfillmentReason,
        "shipping": shipping,
      };
}
