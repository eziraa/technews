import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:technews/custom_widget.dart';
import 'package:technews/custom-section.dart';
import 'package:technews/model/news_model.dart';
import 'package:technews/see_a_news.dart';
import 'package:technews/trending.dart';

import 'controller/news_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final NewsController controller = Get.put(NewsController());

  // List<dynamic> techNews = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomWidget.getAppBar(context),
      body: Obx(
        () => Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
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
                        onTap: () {
                          if (ModalRoute.of(context)?.settings.name !=
                              "/search") {
                            Navigator.pushNamed(context, "/search");
                          }
                        },
                        decoration: const InputDecoration(
                          hintText: 'Search...',
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                        onChanged: (String text) => {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomSection.getTrending(
                        context, controller.trendingNewsList),
                    CustomSection.getLatestNewsHeader(context),
                    Column(children: [
                      for (int i = 0; i < controller.newsList.length; i++)
                        CustomSection.getANews(context, controller.newsList[i])
                    ])
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomWidget.getBottomNavBar(context),
    );
  }
}
