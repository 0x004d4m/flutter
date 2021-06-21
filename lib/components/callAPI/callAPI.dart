import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:splashtest/components/splash/splashapi.dart';

Future<SplashAPI> getImage(count) async {
  final response = await http.post(
    Uri.parse(
        'http://3.124.190.213/api/e2e18c2c-b9d0-498f-abea-8716704814e4/suspects'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, int>{
      'count': count,
    }),
  );

  if (response.statusCode >= 200 && response.statusCode <= 300) {
    return SplashAPI.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to create album.');
  }
}
