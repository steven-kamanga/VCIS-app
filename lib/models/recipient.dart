import 'dart:convert';

RecipientModel recipientModelFromJson(String str) =>
    RecipientModel.fromJson(json.decode(str));

String recipientModelToJson(RecipientModel data) => json.encode(data.toJson());

class RecipientModel {
  int id;
  String firstName;
  dynamic middleName;
  String lastName;
  String address1;
  dynamic address2;
  String city;
  String state;
  String zipp;
  String postalCode;
  String country;
  String phone;

  RecipientModel({
    required this.id,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.address1,
    required this.address2,
    required this.city,
    required this.state,
    required this.zipp,
    required this.postalCode,
    required this.country,
    required this.phone,
  });

  factory RecipientModel.fromJson(Map<String, dynamic> json) => RecipientModel(
        id: json["id"],
        firstName: json["first_name"],
        middleName: json["middle_name"],
        lastName: json["last_name"],
        address1: json["address1"],
        address2: json["address2"],
        city: json["city"],
        state: json["state"],
        zipp: json["zipp"],
        postalCode: json["postal_code"],
        country: json["country"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "middle_name": middleName,
        "last_name": lastName,
        "address1": address1,
        "address2": address2,
        "city": city,
        "state": state,
        "zipp": zipp,
        "postal_code": postalCode,
        "country": country,
        "phone": phone,
      };
}
