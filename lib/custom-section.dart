import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technews/custom_widget.dart';
import 'package:technews/see_a_news.dart';
import 'package:technews/time.dart';

import 'model/news_model.dart';

class CustomSection {
  static Widget getLatestNewsHeader(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 20, bottom: 0, right: 5, top: 10),
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
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children: [
          for (String item in [
            'All',
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
      ),
    );
  }

  static Widget getANews(BuildContext context, News news) {
    return GestureDetector(
      onTap: () {
        Get.to(SeeNewsDetailPage(news: news));
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomWidget.getNetworkImage(news.urlToImage ?? "", size: 70),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomWidget.blurredText(news.source?.name ?? ""),
                  CustomWidget.getNormalText(
                      "${news.title.toString().substring(0)}...",
                      size: 16),
                  getANewsFooter(context, 6, news: news),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget getANewsFooter(BuildContext context, double size,
      {News? news}) {
    return GestureDetector(
      onTap: () => {Get.to(SeeNewsDetailPage(), arguments: news)},
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // CustomWidget.getProfileImage(channelImageUrl,
          //   size: size * 4,
          // ),
          SizedBox(
            width: size,
          ),
          CustomWidget.getBoldText(
            news?.author ?? "No author",
            color: Colors.black54,
            size: size * 1.5,
          ),
          SizedBox(
            width: size,
          ),
          Icon(
            Icons.access_time,
            size: size * 2,
            color: Colors.black38,
          ),
          SizedBox(
            width: size,
          ),
          CustomWidget.blurredText(
              "${timeAgo(news!.publishedAt.toString()).toString().substring(1)} ago",
              size: size * 1.5),

          CustomWidget.blurredText(news.author ?? "No Author",
              size: size * 1.5),
        ],
      ),
    );
  }
}
