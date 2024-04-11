import 'dart:io';

import 'package:app/models/card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

final cardProvider = FutureProvider<List<CardModel>>((ref) async {
  final token = await getCredentials();
  final response = await http.get(
    Uri.parse('http://192.168.1.187:8000/api/v1/card/card-object'),
    headers: {
      HttpHeaders.authorizationHeader: token,
    },
  );
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((item) => CardModel.fromJson(item)).toList();
  } else {
    throw Exception('Failed to load cards');
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
