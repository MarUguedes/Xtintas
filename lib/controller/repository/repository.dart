import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthRepository {
  Future getAuth(String email, String senha) async {
    String url = 'https://6250779de3e5d24b3422e657.mockapi.io/api/v1/users';
    final response = await http.get(Uri.parse(url));
    final json = jsonDecode(response.body);
    print(json);
  }
}
