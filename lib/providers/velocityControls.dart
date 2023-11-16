import 'dart:io';
import 'package:app/models/velocityControl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

final velocityControlProvider =
    FutureProvider.family<VelocityModel, int>((ref, cardId) async {
  final token = await getCredentials();
  final response = await http.get(
    Uri.parse('http://172.20.10.4:8000/api/v1/card/velocity-control'),
    headers: {
      HttpHeaders.authorizationHeader: '$token',
    },
  );
  if (response.statusCode == 200) {
    List<VelocityModel> velocityControls = (json.decode(response.body) as List)
        .map((item) => VelocityModel.fromJson(item))
        .toList();
    return velocityControls.firstWhere((control) => control.cardId == cardId);
  } else {
    throw Exception('Failed to load velocity control');
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
