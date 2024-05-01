import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  
  static Future<List<News>> searchByLan(String language) async {
    DateTime now = DateTime.now();
    DateTime beforeSomeDaysAgo = now.subtract(Duration(days: 30));

    String formattedNow = DateFormat('yyyy-MM-dd').format(now);
    String formattedBeforeSomeDaysAgo =
        DateFormat('yyyy-MM-dd').format(beforeSomeDaysAgo);

    var uri = Uri.parse(
        'https://newsapi.org/v2/everything?q=technology&language=$language&from=$formattedBeforeSomeDaysAgo&to=$formattedNow&pageSize=100&sortedBy=publishedAt&language=en&apiKey=f78ba5b9d1f34e279c7e8b41654a846d');
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
  static Future<void> saveNews(News news) async {
    final String userId = "1";

    final String newsJson = jsonEncode(news.toJson());

    final DocumentReference savedNewsDoc =
        FirebaseFirestore.instance.collection('savedNews').doc(userId);

    final DocumentSnapshot docSnapshot = await savedNewsDoc.get();
    if (docSnapshot.exists) {
      List<String> savedNews = List<String>.from(docSnapshot['news'] as List);
      savedNews.add(newsJson);
      await savedNewsDoc.update({
        'news': savedNews,
      });
    } else {
      await savedNewsDoc.set({
        'news': [newsJson],
      });
    }
  }

  static Future<List<News>> getSavedNews() async {
    final String userId = "1";

    final DocumentReference savedNewsDoc =
        FirebaseFirestore.instance.collection('savedNews').doc(userId);

    final DocumentSnapshot docSnapshot = await savedNewsDoc.get();
    if (docSnapshot.exists) {
      String savedNewsJson = (docSnapshot['news']).toString();
      var jsonObject = jsonDecode(savedNewsJson);
      return newsFromJson(jsonEncode(jsonObject));
    } else {
      return [];
    }
  }
  static Future<void> removeNews(News news) async {
    final String userId = "1";

    final String newsJson = jsonEncode(news.toJson());

    final DocumentReference savedNewsDoc =
        FirebaseFirestore.instance.collection('savedNews').doc(userId);

    final DocumentSnapshot docSnapshot = await savedNewsDoc.get();
    if (docSnapshot.exists) {
      List<String> savedNews = List<String>.from(docSnapshot['news'] as List);
      savedNews.remove(newsJson);
      await savedNewsDoc.update({
        'news': savedNews,
      });
    } else {
      print("No saved news found");
    }
  }

// Future<News> getNews() async {
//   final String userId = "1";

//   final DocumentReference newsDoc =
//       FirebaseFirestore.instance.collection('news').doc(userId);

//   final DocumentSnapshot docSnapshot = await newsDoc.get();
//   if (docSnapshot.exists) {
//     Map<String, dynamic> newsData = docSnapshot.data() as Map<String, dynamic>;
//     String newsJson = jsonEncode(newsData);
//     return newsFromJson(newsJson);
//   } else {
//     throw Exception('Document does not exist');
//   }
// }

}
