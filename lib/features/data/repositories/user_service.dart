import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/ultis/token_storage.dart';
import '../models/user_dto.dart';

class UserService {
  static const String baseUrl = 'http://localhost:8080/auth';

  static Future<UserDto> getProfile() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token == null) {
      throw Exception('Token not found. User not logged in.');
    }

    final url = Uri.parse('$baseUrl/profile');

    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        if (token != null) 'Authorization': 'Bearer $token', // <– thêm token nếu có
      },
    );

    print('Status code: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return UserDto.fromJson(data);
    } else {
      throw Exception('Failed to load profile:  ${response.statusCode}');
    }
  }

  static Future<void> updateProfile(UserDto user) async {
    final url = Uri.parse('$baseUrl/profile');
    final response = await http.put(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update profile');
    }
  }
}
