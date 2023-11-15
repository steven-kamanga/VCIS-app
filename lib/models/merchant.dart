// To parse this JSON data, do
//
//     final merchantModel = merchantModelFromJson(jsonString);

import 'dart:convert';

MerchantModel merchantModelFromJson(String str) =>
    MerchantModel.fromJson(json.decode(str));

String merchantModelToJson(MerchantModel data) => json.encode(data.toJson());

class MerchantModel {
  int id;
  String token;
  String name;
  String mid;

  MerchantModel({
    required this.id,
    required this.token,
    required this.name,
    required this.mid,
  });

  factory MerchantModel.fromJson(Map<String, dynamic> json) => MerchantModel(
        id: json["id"],
        token: json["token"],
        name: json["name"],
        mid: json["mid"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "token": token,
        "name": name,
        "mid": mid,
      };
}
