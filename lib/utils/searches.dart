class NewsProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _newsArticles = [];

  List<Map<String, dynamic>> get newsArticles => _newsArticles;

  Future<void> fetchNews() async {
    // Fetch news data from API and update _newsArticles
    notifyListeners();
  }
}
class NewsService {
  static const String _apiKey = 'YOUR_API_KEY';

  Future<List<Map<String, dynamic>>> fetchNews() async {
    // Make HTTP request to fetch news data
    return [];
  }
}