class NewsProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _newsArticles = [];

  List<Map<String, dynamic>> get newsArticles => _newsArticles;

  Future<void> fetchNews() async {
    // Fetch news data from API and update _newsArticles
    notifyListeners();
  }
}