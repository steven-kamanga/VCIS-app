// To parse this JSON data, do
//
//     final fundingModel = fundingModelFromJson(jsonString);

import 'dart:convert';

FundingModel fundingModelFromJson(String str) =>
    FundingModel.fromJson(json.decode(str));

String fundingModelToJson(FundingModel data) => json.encode(data.toJson());

class FundingModel {
  int? id;
  String? token;
  String? amount;
  String? currencyCode;
  int? user;
  int? card;
  int? fundingSourceToken;

  FundingModel({
    this.id,
    this.token,
    this.amount,
    this.currencyCode,
    this.user,
    this.card,
    this.fundingSourceToken,
  });

  factory FundingModel.fromJson(Map<String, dynamic> json) => FundingModel(
        id: json["id"],
        token: json["token"],
        amount: json["amount"],
        currencyCode: json["currency_code"],
        user: json["user"],
        card: json["card"],
        fundingSourceToken: json["funding_source_token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "token": token,
        "amount": amount,
        "currency_code": currencyCode,
        "user": user,
        "card": card,
        "funding_source_token": fundingSourceToken,
      };
}
