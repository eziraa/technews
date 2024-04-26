import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:technews/model/news_model.dart';

class RemoteServices {
  static var client = http.Client();
  static Future<List<News>> fetchTechNews() async {
    var uri = Uri.parse(
        'https://newsapi.org/v2/top-headlines?category=technology&pageSize=40&language=en&apiKey=f78ba5b9d1f34e279c7e8b41654a846d');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var jsonString = response.body;
      var jsonObject = jsonDecode(jsonString);
      var newsJsonArray = jsonObject['articles'];
      return newsFromJson(jsonEncode(newsJsonArray));
    } else {
      return Future.error(response.statusCode);
    }
  }
}
