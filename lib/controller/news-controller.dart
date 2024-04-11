import 'dart:convert';
import 'package:http/http.dart' as http;

class NewsController {
  final String apiKey =
      'f78ba5b9d1f34e279c7e8b41654a846d'; // Replace with your actual API key

  Future<List<dynamic>> fetchTechNews() async {
    final response = await http.get(
      Uri.parse(
          'https://newsapi.org/v2/top-headlines?category=technology&apiKey=$apiKey'),
    );

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      return jsonData['articles'];
    } else {
      throw Exception('Failed to load news');
    }
  }
}
