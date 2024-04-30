import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technews/custom_widget.dart';
import 'package:technews/model/news_model.dart';
import 'package:technews/see_a_news.dart';
import 'package:technews/time.dart';
import 'package:technews/trending.dart';
import 'package:technews/utils.dart';

import 'controller/news_controller.dart';

class SearchOptions {
  String? type;
  String? task;
  SearchOptions({required this.type, required this.task});
}

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final NewsController controller = Get.put(NewsController());
  List<SearchOptions> options = [];
  SearchOptions activeOption = SearchOptions(type: 'News', task: '');
  @override
  void initState() {
    options = [];
    options.add(SearchOptions(type: 'News', task: 'Save'));
    options.add(SearchOptions(type: "Topics", task: "Add"));
    options.add(SearchOptions(type: "Source", task: "Follow"));
    activeOption = options[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: CustomWidget.getAppBar(context),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 10,
                      offset: const Offset(2, 5), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    const Icon(Icons.search, color: Colors.grey),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        decoration: const InputDecoration(
                          hintText: 'Search...',
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                        onChanged: (String text) => {
                          controller.searchNews(text),
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _getSearchOptions(),
                      Column(
                        children: [
                          for (int i = 0;
                              i < controller.searchedList.length;
                              i++)
                            _getANews(news: controller.searchedList[i])
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getSearchOptions() {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: [
            for (SearchOptions option in options)
              Column(
                children: [
                  Row(
                    children: [
                      TextButton(
                        child: CustomWidget.blurredText(option.type ?? ""),
                        onPressed: () {
                          setState(() {
                            activeOption = option;
                          });
                          controller.changeType(option.type ?? "");
                        },
                      ),
                      const SizedBox(width: 3)
                    ],
                  ),
                  Transform.translate(
                    offset: const Offset(-0, -14),
                    child: Container(
                      height: option.type == activeOption.type ? 3 : 0,
                      width: option.type == activeOption.type
                          ? "${activeOption.type}".length * 13
                          : 0,
                      color: Colors.blue,
                    ),
                  )
                ],
              )
          ]),
        ),
      ],
    );
  }

  Widget _getANews({required News news}) {
    return GestureDetector(
      onTap: () {
        Get.to(SeeNewsDetailPage(news: news));
      },
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            CustomWidget.getNetworkImage(news.urlToImage ?? "", size: 70),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                CustomWidget.getNormalText(
                    "${news.title}...", size: 10),
                Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [

                          CustomWidget.smallProfileImage(news.source.name,
                              size: 45),
                          
                          CustomWidget.getBoldText(news.source.name,
                              color: Colors.black54, size: 9),
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
                          CustomWidget.blurredText(
                              "${timeAgo(news.publishedAt.toString())}",
                              size: 10),
                        ],
                      ),
                      Container(
                        alignment: Alignment.bottomRight,
                        child: CustomWidget.blurredText(
                            textTrimmer(news.author ?? "No Author", 20)
                                    .contains("No Author")
                                ? "No Author"
                                : "By  ${textTrimmer(news.author ?? "No Author", 20)}",
                            size: 10),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
