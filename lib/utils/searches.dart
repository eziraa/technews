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
class NewsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context);

    return Scaffold(
      body: newsProvider.newsArticles.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: newsProvider.newsArticles.length,
              itemBuilder: (context, index) {
                final article = newsProvider.newsArticles[index];
                return ListTile(
                  title: Text(article['title']),
                  subtitle: Text(article['description']),
                );
              },
            ),
    );
  }
}
class NewsApp extends StatefulWidget {
  @override
  _NewsAppState createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<NewsProvider>(context, listen: false).fetchNews();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Latest News'),
          centerTitle: true,
        ),
        body: NewsList(),
      ),
    );
  }
}