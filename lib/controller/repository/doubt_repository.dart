import 'dart:convert';

import 'package:http/http.dart' as http;

class DoubtRepository {
  Future postQuestion(String question) async {
    var url = Uri.parse('https://62546fae19bc53e2347e8008.mockapi.io/question',);
    var response = await http.post(url, body: {
      "question": "$question", 
    });
    final json = jsonDecode(utf8.decode(response.bodyBytes));
    return json;
  }
}
