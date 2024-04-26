import 'package:get/get.dart';
import 'package:technews/model/news_model.dart';
import 'package:technews/services/remote_services.dart';

class NewsController extends GetxController {
  var newsList = List<News>.empty().obs;

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
}
