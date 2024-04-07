import 'package:flutter/material.dart';
import 'package:technews/CustomWidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CustomWidget customWidget = CustomWidget();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customWidget.getAppBar(context),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: customWidget.getSearchBox(),
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
                    _getNews(),
                    _getANews(),
                    const SizedBox(height: 10),
                    _getANews(),
                    const SizedBox(height: 10),
                    _getANews(),
                    const SizedBox(height: 10),
                    _getANews(),
                    const SizedBox(height: 10),
                    _getANews(),
                    const SizedBox(height: 10),
                    _getANews(),
                    const SizedBox(height: 10),
                    _getANews(),
                    const SizedBox(height: 10),
                    _getANews(),
                    const SizedBox(height: 10),
                    _getANews(),
                    const SizedBox(height: 10),
                    _getANews(),
                    const SizedBox(height: 10),
                    _getANews(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
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
              customWidget.getBoldText("Trending", size: 24),
              Expanded(
                child: Container(),
              ),
              TextButton(
                child: customWidget.blurredText("See All"),
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
          customWidget.getImage("assets/images/1.jpg"),
          customWidget.blurredText("Europe"),
          customWidget.getNormalText("Russian warship : Moskava sinks  ",
              size: 24),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              customWidget.getProfileImage("assets/images/bbc.jpg"),
              const SizedBox(
                width: 5,
              ),
              customWidget.getBoldText("BBC News", color: Colors.black54),
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
              customWidget.blurredText("4hour ago")
            ],
          ),
        ],
      ),
    );
  }

  Widget _getNews() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10, bottom: 0),
          child: Row(
            children: [
              customWidget.getBoldText("Latest", size: 24),
              Expanded(
                child: Container(),
              ),
              TextButton(
                child: customWidget.blurredText("See All"),
                onPressed: () {},
              )
              // Ico
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: [
            for (String item in [
              'Artificial Intelligence (AI)',
              'Machine Learning',
              'Data Science',
              'Blockchain and Cryptocurrency',
              'Cybersecurity',
              'Cloud Computing',
              'Internet of Things (IoT)',
              '5G and Connectivity',
              'Augmented Reality (AR) and Virtual Reality (VR)',
              'Gaming',
              'Mobile Technology',
              'Hardware',
              'Software Development',
              'Tech Policy and Regulation',
              'Tech Business and Startups',
              'Tech Events and Conferences'
            ])
              Row(
                children: [
                  TextButton(
                    child: customWidget.blurredText(item),
                    onPressed: () {},
                  ),
                  const SizedBox(width: 3)
                ],
              )
          ]),
        ),
      ],
    );
  }

  Widget _getANews() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          customWidget.getMediumImage("assets/images/6.jpg"),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customWidget.blurredText("Europe"),
              customWidget.getNormalText("Ukraine's president, Zelenskey says",
                  size: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  customWidget.getProfileImage("assets/images/bbc.jpg",
                      size: 15),
                  const SizedBox(
                    width: 5,
                  ),
                  customWidget.getBoldText("BBC News",
                      color: Colors.black54, size: 9),
                  const SizedBox(
                    width: 5,
                  ),
                  const Icon(
                    Icons.access_time,
                    size: 20,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  customWidget.blurredText("4hour ago", size: 10)
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}