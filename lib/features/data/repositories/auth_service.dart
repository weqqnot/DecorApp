import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static Future<bool> login(String identifier, String password) async {
    final url = Uri.parse('http://localhost:8080/auth/login');

    print('[LOGIN] 📨 Gửi yêu cầu đăng nhập tới server...');
    print('[LOGIN] 📧 Identifier: $identifier');
    print('[LOGIN] 🔑 Password: (ẩn vì lý do bảo mật)');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'identifier': identifier, 'password': password}),
      );

      print('[LOGIN] 📬 Server phản hồi với status code: ${response.statusCode}');
      print('[LOGIN] 🧾 Body: ${response.body}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = jsonDecode(response.body);

        final data = jsonResponse['data'];
        if (data == null || data is! Map) {
          print('[LOGIN] ❌ Không tìm thấy trường "data" hoặc không đúng định dạng');
          return false;
        }

        final token = data['token'];
        if (token == null || token.toString().isEmpty) {
          print('[LOGIN] ❌ Token rỗng hoặc null');
          return false;
        }

        // Lưu token vào SharedPreferences
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token);

        print('[LOGIN] ✅ Đăng nhập thành công, token: $token');
        return true;
      } else {
        print('[LOGIN] ❌ Đăng nhập thất bại: ${response.body}');
        return false;
      }
    } catch (e) {
      print('[LOGIN] ❗ Lỗi không xác định: $e');
      return false;
    }
  }
}
