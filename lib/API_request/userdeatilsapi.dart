import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class getuserdata {
  Future<Map<String, dynamic>> getUserDetails() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? jwtToken = prefs.getString('jwt_token');

    if (jwtToken == null) {
      throw Exception("JWT token not available");
    }
    final Uri apiUrl = Uri.parse('https://ssik.in/api/account');
    try {
      final response = await http.get(
        apiUrl,
        headers: {
          'Authorization': 'Bearer $jwtToken',
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> userData = json.decode(response.body);
        return userData;
      } else {
        throw Exception(
            'Failed to load user details. Status Code: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error fetching user details: $error');
    }
  }
}
