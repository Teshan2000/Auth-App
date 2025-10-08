import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  static const String baseUrl = "http://10.0.2.2:8080/api/auth";

  Future<Map<String, dynamic>> register(String email, String password) async {
    final response = await http.post(
      Uri.parse("$baseUrl/register"),
      headers: ({"Content-Type": "application/json"}),
      body: jsonEncode({"email": email, "password": password}),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print("${response.body}, ${response.statusCode}");
      throw Exception("Failed to register: ${response.body}");
    }
  }

  Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await http.post(
      Uri.parse("$baseUrl/login"),
      headers: ({"Content-Type": "application/json"}),
      body: jsonEncode({"email": email, "password": password}),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print("${response.body}, ${response.statusCode}");
      throw Exception("Failed to login: ${response.body}");
    }
  }
}
