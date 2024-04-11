// To parse this JSON data, do
//
//     final velocityModel = velocityModelFromJson(jsonString);

import 'dart:convert';

VelocityModel velocityModelFromJson(String str) =>
    VelocityModel.fromJson(json.decode(str));

String velocityModelToJson(VelocityModel data) => json.encode(data.toJson());

class VelocityModel {
  int? id;
  String? name;
  int? usageLimit;
  bool? approvalsOnly;
  bool? includePurchases;
  bool? includeWithdrawals;
  bool? includeTransfers;
  bool? includeCashback;
  bool? includeCredits;
  String? currencyCode;
  int? amountLimit;
  bool? active;
  int? cardId;
  int? association;
  int? merchantScope;

  VelocityModel({
    this.id,
    this.name,
    this.usageLimit,
    this.approvalsOnly,
    this.includePurchases,
    this.includeWithdrawals,
    this.includeTransfers,
    this.includeCashback,
    this.includeCredits,
    this.currencyCode,
    this.amountLimit,
    this.active,
    this.cardId,
    this.association,
    this.merchantScope,
  });

  factory VelocityModel.fromJson(Map<String, dynamic> json) => VelocityModel(
        id: json["id"],
        name: json["name"],
        usageLimit: json["usage_limit"],
        approvalsOnly: json["approvals_only"],
        includePurchases: json["include_purchases"],
        includeWithdrawals: json["include_withdrawals"],
        includeTransfers: json["include_transfers"],
        includeCashback: json["include_cashback"],
        includeCredits: json["include_credits"],
        currencyCode: json["currency_code"],
        amountLimit: json["amount_limit"],
        active: json["active"],
        cardId: json["card_id"],
        association: json["association"],
        merchantScope: json["merchant_scope"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "usage_limit": usageLimit,
        "approvals_only": approvalsOnly,
        "include_purchases": includePurchases,
        "include_withdrawals": includeWithdrawals,
        "include_transfers": includeTransfers,
        "include_cashback": includeCashback,
        "include_credits": includeCredits,
        "currency_code": currencyCode,
        "amount_limit": amountLimit,
        "active": active,
        "card_id": cardId,
        "association": association,
        "merchant_scope": merchantScope,
      };
}
