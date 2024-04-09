import 'package:flutter/material.dart';
import 'package:technews/custom_widget.dart';

class CustomSection {
  static Widget getNews(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10, bottom: 0),
          child: Row(
            children: [
              CustomWidget.getBoldText("Latest", size: 24),
              Expanded(
                child: Container(),
              ),
              TextButton(
                child: CustomWidget.blurredText("See All"),
                onPressed: () {
                  Navigator.pushNamed(context, "/latest");
                },
              )
              // Ico
            ],
          ),
        ),
        getNewsSourcesHrBar()
      ],
    );
  }

  static getNewsSourcesHrBar() {
    return SingleChildScrollView(
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
                child: CustomWidget.blurredText(item),
                onPressed: () {},
              ),
              const SizedBox(width: 3)
            ],
          )
      ]),
    );
  }

  static Widget getANews(BuildContext context) {
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
