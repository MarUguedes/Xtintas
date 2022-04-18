import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:xtintas/models/ink.dart';

class InkRepository {
  Future getInk() async {


    String url = 'https://62546fae19bc53e2347e8008.mockapi.io/paints';

    final response = await http.get(Uri.parse(url), headers: <String, String>{"Content-Type": "application/json", "Acept":"application/json"});

    final json = jsonDecode(utf8.decode(response.bodyBytes)) as Map;

    final mapJson = json['data'].map<Ink>((ink) => Ink.fromJson(ink)).toList();
    
   
    return mapJson;
  }
}
