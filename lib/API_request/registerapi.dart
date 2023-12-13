import 'dart:convert';
import 'package:http/http.dart' as http;

class RegistrationService {
  static const String apiUrl = 'https://ssik.in/api/register';

  Future<bool> registerUser({
    required String login,
    required String email,
    required String password,
    required String langKey,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'login': login,
          'email': email,
          'password': password,
          'langKey': langKey,
        }),
      );

      if (response.statusCode == 201) {
        return true;
      } else {
        print('Error: ${response.statusCode}');
        print('Response: ${response.body}');
        return false;
      }
    } catch (e) {
      print('Exception: $e');
      return false;
    }
  }
}
