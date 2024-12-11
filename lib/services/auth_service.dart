import 'dart:convert'; // Untuk JSON parsing
import 'package:http/http.dart' as http;

class AuthService {
  final String baseUrl = "http://127.0.0.1:8000/api/login"; 

  // Fungsi untuk login
  Future<Map<String, dynamic>> login(String username, String password) async {
    final url = Uri.parse('$baseUrl/login');
    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'username': username,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        // Jika login berhasil
        final data = json.decode(response.body);
        return {
          'success': true,
          'data': data,
        };
      } else {
        // Jika login gagal
        final error = json.decode(response.body);
        return {
          'success': false,
          'message': error['message'] ?? 'Login failed',
        };
      }
    } catch (e) {
      // Tangkap error
      return {
        'success': false,
        'message': 'Something went wrong: $e',
      };
    }
  }
}