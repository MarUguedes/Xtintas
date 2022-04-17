import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthRepository {
  Future getAuth(String email, String password) async {
    print('mail$email');
    var url = Uri.parse('https://62546fae19bc53e2347e8008.mockapi.io/login');
    var response = await http.post(url, body: {
      "email": email,
      "password": password,
    });
    if(response.statusCode==201){
      
    }
    final token = jsonDecode(response.body)['access-token'];
    return token;
  }
}
