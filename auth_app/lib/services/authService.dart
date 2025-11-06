import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class AuthService {
  static const String baseUrl = "http://10.0.2.2:8080/api/auth";
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

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
      final data = jsonDecode(response.body);

      await _storage.write(key: 'accessToken', value: data['accessToken']);
      await _storage.write(key: 'refreshToken', value: data['refreshToken']);

      print("Tokens stored successfully!");
      return data;
    } else {
      print("${response.body}, ${response.statusCode}");
      throw Exception("Failed to login: ${response.body}");
    }
  }

  Future<String?> getAccessToken() async {
    return await _storage.read(key: 'accessToken');
  }

  Future<String?> getRefreshToken() async {
    return await _storage.read(key: 'refreshToken');
  }

  Future<void> logOut() async {
    await _storage.deleteAll();
    print("Tokens cleareed!");
  }
}
