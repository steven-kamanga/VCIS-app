import 'dart:io';

import 'package:app/models/funding.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

final fundingProvider =
    FutureProvider.family<FundingModel, int>((ref, cardNumber) async {
  final token = await getCredentials();
  final response = await http.get(
    Uri.parse('http://192.168.1.187:8000/api/v1/card/funding'),
    headers: {
      HttpHeaders.authorizationHeader: token,
    },
  );
  if (response.statusCode == 200) {
    List<FundingModel> fundings = (json.decode(response.body) as List)
        .map((item) => FundingModel.fromJson(item))
        .toList();
    return fundings.firstWhere((funding) => funding.card == cardNumber);
  } else {
    throw Exception('Failed to load funding');
  }
});

Future<String> getCredentials() async {
  String? token = '';

  SharedPreferences pref = await SharedPreferences.getInstance();
  token = pref.getString("token");
  if (token == null) {
    throw Exception('Token is null');
  }
  // print("Token: ${token.toString()}");
  return token;
}
