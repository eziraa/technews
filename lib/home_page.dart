import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technews/custom_widget.dart';
import 'package:technews/custom-section.dart';

import 'controller/news_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {
  final NewsController controller = Get.put(NewsController());
  List<dynamic> techNews = []; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomWidget.getAppBar(context),
      body: Obx(
        () => Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: CustomWidget.getSearchBox(context),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _getTrending(),
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

  Widget _getTrending() {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CustomWidget.getBoldText("Trending", size: 24),
              Expanded(
                child: Container(),
              ),
              TextButton(
                child: CustomWidget.blurredText("See All"),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    "/trending",
                  );
                },
              )
              // Ico
            ],
          ),
          const SizedBox(
            height: 7,
          ),
          CustomWidget.getImage("assets/images/1.jpg"),
          CustomWidget.blurredText("Europe"),
          CustomWidget.getNormalText("Russian warship : Moskava sinks  ",
              size: 24),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomWidget.getProfileImage("assets/images/bbc.jpg"),
              const SizedBox(
                width: 5,
              ),
              CustomWidget.getBoldText("BBC News", color: Colors.black54),
              const SizedBox(
                width: 20,
              ),
              const Icon(
                Icons.access_time,
                size: 20,
              ),
              const SizedBox(
                width: 5,
              ),
              CustomWidget.blurredText("4hour ago")
            ],
          ),
        ],
      ),
    );
  }
}
