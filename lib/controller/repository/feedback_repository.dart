import 'dart:convert';

import 'package:http/http.dart' as http;

class FeedBackRepository {
  Future postRating(int rating) async {
    var url = Uri.parse('https://62546fae19bc53e2347e8008.mockapi.io/rate');
    var post = await http.post(url, body: {
      "rating": "$rating",
    });
    final responseApi = jsonDecode(utf8.decode(post.bodyBytes));
    return responseApi;
  }
}
