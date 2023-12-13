import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginService {
  static const String loginurl = 'https://ssik.in/api/authenticate';
  Future<String?> loginUser({
    required String username,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(loginurl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'username': username,
          'password': password,
          'rememberMe': true.toString(),
        }),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final String? jwtToken = data['id_token'];
        await _saveTokenToSharedPreferences(jwtToken);
        return jwtToken;
      } else {
        print('Error: ${response.statusCode}');
        print('Response: ${response.body}');
        return null;
      }
    } catch (e) {
      print('Exception: $e');
      return null;
    }
  }

  Future<void> _saveTokenToSharedPreferences(String? token) async {
    if (token != null) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('jwt_token', token);
    }
  }
}
