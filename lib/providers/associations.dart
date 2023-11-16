import 'dart:io';
import 'package:app/models/associations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

final associationProvider =
    FutureProvider.autoDispose<List<AssociationModel>>((ref) async {
  final token = await getCredentials();
  final response = await http.get(
    Uri.parse('http://172.20.10.4:8000/api/v1/card/association'),
    headers: {
      HttpHeaders.authorizationHeader: '$token',
    },
  );
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((item) => AssociationModel.fromJson(item)).toList();
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
  print("Token: ${token.toString()}");
  return token;
}
