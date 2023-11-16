import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

final totalAmountProvider = FutureProvider<String>((ref) async {
  final token = await getCredentials();
  final response = await http.get(
    Uri.parse('http://172.20.10.4:8000/api/v1/card/total-funds'),
    headers: {
      HttpHeaders.authorizationHeader: '$token',
    },
  );
  if (response.statusCode == 200) {
    return json.decode(response.body)['total_amount'];
  } else {
    throw Exception('Failed to load total amount');
  }
});

Future<String> getCredentials() async {
  String? token = '';

  SharedPreferences pref = await SharedPreferences.getInstance();
  token = pref.getString("token");
  if (token == null) {
    throw Exception('Token is null');
  }
  print("Token: ${token.toString()}");
  return token;
}
