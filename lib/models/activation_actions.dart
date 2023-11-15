// To parse this JSON data, do
//
//     final activationAction = activationActionFromJson(jsonString);

import 'dart:convert';

ActivationAction activationActionFromJson(String str) =>
    ActivationAction.fromJson(json.decode(str));

String activationActionToJson(ActivationAction data) =>
    json.encode(data.toJson());

class ActivationAction {
  int id;
  bool terminateReissuedSourceCard;
  String swapDigitalWalletTokensFromCardToken;
  int user;

  ActivationAction({
    required this.id,
    required this.terminateReissuedSourceCard,
    required this.swapDigitalWalletTokensFromCardToken,
    required this.user,
  });

  factory ActivationAction.fromJson(Map<String, dynamic> json) =>
      ActivationAction(
        id: json["id"],
        terminateReissuedSourceCard: json["terminate_reissued_source_card"],
        swapDigitalWalletTokensFromCardToken:
            json["swap_digital_wallet_tokens_from_card_token"],
        user: json["user"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "terminate_reissued_source_card": terminateReissuedSourceCard,
        "swap_digital_wallet_tokens_from_card_token":
            swapDigitalWalletTokensFromCardToken,
        "user": user,
      };
}
