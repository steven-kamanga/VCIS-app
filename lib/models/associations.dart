// To parse this JSON data, do
//
//     final associationModel = associationModelFromJson(jsonString);

import 'dart:convert';

AssociationModel associationModelFromJson(String str) =>
    AssociationModel.fromJson(json.decode(str));

String associationModelToJson(AssociationModel data) =>
    json.encode(data.toJson());

class AssociationModel {
  int? id;
  String? token;
  String? name;
  int? userToken;
  int? cardProductToken;

  AssociationModel({
    this.id,
    this.token,
    this.name,
    this.userToken,
    this.cardProductToken,
  });

  factory AssociationModel.fromJson(Map<String, dynamic> json) =>
      AssociationModel(
        id: json["id"],
        token: json["token"],
        name: json["name"],
        userToken: json["user_token"],
        cardProductToken: json["card_product_token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "token": token,
        "name": name,
        "user_token": userToken,
        "card_product_token": cardProductToken,
      };
}
