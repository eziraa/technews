import 'package:get/get.dart';
import 'package:technews/model/news_model.dart';
import 'package:technews/services/remote_services.dart';

class NewsController extends GetxController {
  var newsList = List<News>.empty().obs;
  var searchedList = List<News>.empty().obs;

  @override
  void onInit() {
    super.onInit();
    fetchNews();
  }

  void fetchNews() async {
    var news = await RemoteServices.fetchTechNews();
    if (news.isNotEmpty) {
      newsList.addAll(news);
    }
  }

  void searchNews(List<News> newsList, String query) {
    searchedList.addAll(newsList
        .where((news) =>
            news.title!.toLowerCase().contains(query.toLowerCase()) ||
            news.source.name.toLowerCase().contains(query.toLowerCase()))
        .toList());
  }
}
