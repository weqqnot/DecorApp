import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user_dto.dart';

class AuthRepository {
  final String baseUrl;

  AuthRepository({required this.baseUrl});

  Future<void> register(UserDto user) async {
    final url = Uri.parse('$baseUrl/register');

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Đăng ký thất bại: ${response.body}');
    }
  }
}
