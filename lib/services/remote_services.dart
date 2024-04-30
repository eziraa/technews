import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:technews/model/news_model.dart';
import 'package:intl/intl.dart';

class RemoteServices {
  static var client = http.Client();
  
  static Future<List<News>> fetchTechNews() async {
    DateTime now = DateTime.now();
    DateTime twoDaysAgo = now.subtract(Duration(days: 2));

    String formattedNow = DateFormat('yyyy-MM-dd').format(now);
    String formattedTwoDaysAgo = DateFormat('yyyy-MM-dd').format(twoDaysAgo);

    var uri = Uri.parse(
        'https://newsapi.org/v2/everything?q=technology&from=$formattedTwoDaysAgo&to=$formattedNow&pageSize=100&sortedBy=publishedAt&language=en&apiKey=f78ba5b9d1f34e279c7e8b41654a846d');
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

  static Future<List<News>> fetchTrendingTechNews() async {
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
  
  static Future<List<News>> searchByLan() async {
    var uri = Uri.parse(
        'https://newsapi.org/v2/top-headlines?category=technology&pageSize=40&language=ar&apiKey=f78ba5b9d1f34e279c7e8b41654a846d');
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
