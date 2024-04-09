import 'package:flutter/material.dart';
import 'package:technews/CustomWidget.dart';
import 'package:technews/custom-section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomWidget.getAppBar(context),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
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
                    _getTrending(),
                    CustomSection.getNews(context),
                    getANews(),
                    const SizedBox(height: 10),
                    getANews(),
                    const SizedBox(height: 10),
                    getANews(),
                    const SizedBox(height: 10),
                    getANews(),
                    const SizedBox(height: 10),
                    getANews(),
                    const SizedBox(height: 10),
                    getANews(),
                    const SizedBox(height: 10),
                    getANews(),
                    const SizedBox(height: 10),
                    getANews(),
                    const SizedBox(height: 10),
                    getANews(),
                    const SizedBox(height: 10),
                    getANews(),
                    const SizedBox(height: 10),
                    getANews(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomWidget.getBottomNavBar(context),
    );
  }

  Widget _getTrending() {
    return Container(
      margin: const EdgeInsets.only(top: 10),
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

  

  Widget getANews() {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/news-detail");
      },
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomWidget.getMediumImage("assets/images/6.jpg", size: 60),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomWidget.blurredText("Europe"),
                  CustomWidget.getNormalText(
                      "${"Ukraine's president, Zelenskey says".substring(0)}...",
                      size: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomWidget.getProfileImage("assets/images/bbc.jpg",
                          size: 15),
                      const SizedBox(
                        width: 5,
                      ),
                      CustomWidget.getBoldText("BBC News",
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
                      CustomWidget.blurredText("4hour ago", size: 10)
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
