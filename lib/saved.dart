import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technews/controller/news_controller.dart';
import 'package:technews/custom-section.dart';
import 'package:technews/custom_widget.dart';
import 'package:technews/model/news_model.dart';

class SavedPage extends StatefulWidget {
  const SavedPage({super.key});

  @override
  State<SavedPage> createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {
  final NewsController newsController = Get.put(NewsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomWidget.getAppBar(context),
      body: Obx(
        () => Container(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: CustomWidget.getSearchBox(context),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // _savedNewsHeader(),
                          for (News news in newsController.savedNews)
                            CustomSection.getANews(context, news)
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomWidget.getBottomNavBar(context, 2),
    );
  }

  Widget _savedNewsHeader() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 5, bottom: 0),
          child: Row(
            children: [
              CustomWidget.getBoldText("Saved", size: 24),
            ],
          ),
        ),
      ],
    );
  }

  Widget _getANews(News news) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          CustomWidget.getNetworkImage(news.urlToImage ?? "", size: 60),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomWidget.getNormalText(
                  "${"Ukraine's president, Zelenskey says".substring(0, 10)}...",
                  size: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomWidget.getProfileImage("assets/images/bbc.jpg",
                      size: 15),
                  const SizedBox(
                    width: 5,
                  ),
                  CustomWidget.getBoldText("BBC News", size: 9),
                  const SizedBox(
                    width: 5,
                  ),
                  const Icon(
                    Icons.access_time,
                    size: 10,
                    color: Colors.black38,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  CustomWidget.blurredText("4hour ago", size: 10)
                ],
              ),
            ],
          ),
          CustomWidget.getElevatedBtn(context, "Remove")
        ],
      ),
    );
  }
}
