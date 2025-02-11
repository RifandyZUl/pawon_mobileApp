import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> registerUser(String username, String email, String password) async {
  final url = Uri.parse('http://10.0.2.2:5000/api/auth/register');

  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      'username': username,
      'email': email,
      'password': password,
    }),
  );

  if (response.statusCode == 201) {
    print('Registration successful: ${jsonDecode(response.body)}');
  } else {
    throw Exception('Failed to register user: ${response.body}');
  }
}
