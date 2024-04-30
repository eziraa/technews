import 'package:get/get.dart';
import 'package:technews/model/news_model.dart';
import 'package:technews/services/remote_services.dart';

class NewsController extends GetxController {
  var newsList = List<News>.empty().obs;
  var searchedList = List<News>.empty().obs;
  var trendingNewsList = List<News>.empty().obs;
  var newsByLanguage = List<News>.empty().obs;
  var currentLan = "en".obs();

  String type = "news";

  @override
  void onInit() {
    super.onInit();
    fetchNews();
    fetchTrendingNews();
  }

  void fetchNews() async {
    var newsLists = await RemoteServices.fetchTrendingTechNews();
    if (newsLists.isNotEmpty) {
      newsLists.sort((a, b) => b.publishedAt.compareTo(a.publishedAt));
      newsList
          .addAll(newsLists.where((news) => news.source.name != "[Removed]"));
      searchedList.addAll(newsList);
    }
  }

  void fetchTrendingNews() async {
    var news = await RemoteServices.fetchTrendingTechNews();
    if (news.isNotEmpty) {
      trendingNewsList.addAll(news);
    }
  }

  void fetchNewsByLan(String language) async {
    var news = await RemoteServices.searchByLan(language);
    newsList.clear();
    if (news.isNotEmpty) {
      newsList.addAll(news);
      currentLan = language;
    }

  }

  void searchNews(String query) {
    searchedList.clear();
    if (query.isEmpty) {
      searchedList.addAll(newsList);
      return;
    }
    query = query.trim();
    searchedList.addAll(newsList
        .where((news) => type == "News"
            ? news.title!.toLowerCase().contains(query.toLowerCase())
            : type == "Topics"
                ? news.description!.toLowerCase().contains(query.toLowerCase())
                : news.source.name.toLowerCase().contains(query.toLowerCase()))
        .toList());
  }

  void changeType(String type) {
    this.type = type;
  }
}
