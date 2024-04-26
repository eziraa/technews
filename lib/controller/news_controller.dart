import 'package:get/get.dart';
import 'package:technews/model/news_model.dart';
import 'package:technews/services/remote_services.dart';

class NewsController extends GetxController {
  var newsList = List<News>.empty().obs;
  var searchedList = List<News>.empty().obs;

  String type = "news";

  @override
  void onInit() {
    super.onInit();
    fetchNews();
  }

  void fetchNews() async {
    var news = await RemoteServices.fetchTechNews();
    if (news.isNotEmpty) {
      newsList.addAll(news);
      searchedList.addAll(news);
    }
  }

  void searchNews(String query) {
    searchedList.clear();
    print(query.length);
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
    print(this.type);
  }
}
