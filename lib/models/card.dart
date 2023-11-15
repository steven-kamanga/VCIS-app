// To parse this JSON data, do
//
//     final cardModel = cardModelFromJson(jsonString);

import 'dart:convert';

CardModel cardModelFromJson(String str) => CardModel.fromJson(json.decode(str));

String cardModelToJson(CardModel data) => json.encode(data.toJson());

class CardModel {
  int id;
  DateTime createdTime;
  DateTime lastModifiedTime;
  String token;
  String cardProductToken;
  String lastFour;
  String pan;
  String expiration;
  DateTime expirationTime;
  String cvvNumber;
  String chipCvvNumber;
  bool pinIsSet;
  String state;
  bool fulfillmentStatus;
  bool reissuePanFromCardToken;
  String newPanFromCardToken;
  String instrumentType;
  int fulfillment;
  int activationActions;

  CardModel({
    required this.id,
    required this.createdTime,
    required this.lastModifiedTime,
    required this.token,
    required this.cardProductToken,
    required this.lastFour,
    required this.pan,
    required this.expiration,
    required this.expirationTime,
    required this.cvvNumber,
    required this.chipCvvNumber,
    required this.pinIsSet,
    required this.state,
    required this.fulfillmentStatus,
    required this.reissuePanFromCardToken,
    required this.newPanFromCardToken,
    required this.instrumentType,
    required this.fulfillment,
    required this.activationActions,
  });

  factory CardModel.fromJson(Map<String, dynamic> json) => CardModel(
        id: json["id"],
        createdTime: DateTime.parse(json["created_time"]),
        lastModifiedTime: DateTime.parse(json["last_modified_time"]),
        token: json["token"],
        cardProductToken: json["card_product_token"],
        lastFour: json["last_four"],
        pan: json["pan"],
        expiration: json["expiration"],
        expirationTime: DateTime.parse(json["expiration_time"]),
        cvvNumber: json["cvv_number"],
        chipCvvNumber: json["chip_cvv_number"],
        pinIsSet: json["pin_is_set"],
        state: json["state"],
        fulfillmentStatus: json["fulfillment_status"],
        reissuePanFromCardToken: json["reissue_pan_from_card_token"],
        newPanFromCardToken: json["new_pan_from_card_token"],
        instrumentType: json["instrument_type"],
        fulfillment: json["fulfillment"],
        activationActions: json["activation_actions"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_time": createdTime.toIso8601String(),
        "last_modified_time": lastModifiedTime.toIso8601String(),
        "token": token,
        "card_product_token": cardProductToken,
        "last_four": lastFour,
        "pan": pan,
        "expiration": expiration,
        "expiration_time": expirationTime.toIso8601String(),
        "cvv_number": cvvNumber,
        "chip_cvv_number": chipCvvNumber,
        "pin_is_set": pinIsSet,
        "state": state,
        "fulfillment_status": fulfillmentStatus,
        "reissue_pan_from_card_token": reissuePanFromCardToken,
        "new_pan_from_card_token": newPanFromCardToken,
        "instrument_type": instrumentType,
        "fulfillment": fulfillment,
        "activation_actions": activationActions,
      };
}
