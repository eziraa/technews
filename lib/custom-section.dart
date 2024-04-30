import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technews/controller/news-controller.dart';
import 'package:technews/custom_widget.dart';
import 'package:technews/see_a_news.dart';
import 'package:technews/time.dart';
import 'package:technews/trending.dart';
import 'package:technews/utils.dart';

import 'controller/news_controller.dart';
import 'model/news_model.dart';

class CustomSection {
  static Widget getLatestNewsHeader(
      BuildContext context, NewsController controller) {
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 20, bottom: 0, right: 5, top: 10),
          child: Row(
            children: [
              CustomWidget.getBoldText("All News", size: 24),
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
        Padding(
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
                      onPressed: () {
                        controller.newsByLanguage();
                      },
                    ),
                    const SizedBox(width: 3)
                  ],
                )
            ]),
          ),
        )
      ],
    );
  }

  static getNewsSourcesHrBar(NewsController controller) {
    return (
      child: Padding(
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
                    onPressed: () {
                      controller.newsByLanguage();
                    },
                  ),
                  const SizedBox(width: 3)
                ],
              )
          ]),
        ),
      ),
    );
  }

  static Widget getANews(BuildContext context, News news) {
    return GestureDetector(
      onTap: () {
        Get.to(SeeNewsDetailPage(news: news));
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 5, left: 20, right: 20),
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
                  CustomWidget.blurredText(news.source.name),
                  CustomWidget.getNormalText(
                      textTrimmer(news.title ?? "No Title", 70),
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

  static Widget getTrending(BuildContext context, List<News> newsList) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                CustomWidget.getBoldText("Latest", size: 24),
                Expanded(
                  child: Container(),
                ),

                // Ico
              ],
            ),
            const SizedBox(
              height: 7,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (int i = 0; i < newsList.length; i++)
                    GestureDetector(
                      onTap: () {
                        Get.to(SeeNewsDetailPage(news: newsList[i]));
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomWidget.getNetWorkImage(
                            newsList[i].urlToImage ?? "",
                          ),
                          CustomWidget.getNormalText(
                              textTrimmer(newsList[i].title ?? "No Title", 70),
                              size: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CustomWidget.smallProfileImage(
                                  newsList[i].source.name,
                                  size: 45),
                              CustomWidget.getBoldText(newsList[i].source.name,
                                  color: Colors.black54),
                              const SizedBox(
                                width: 15,
                              ),
                              const Icon(
                                Icons.access_time,
                                size: 15,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              CustomWidget.blurredText(
                                  "${timeAgo(newsList[i].publishedAt.toString())}",
                                  size: 14),
                            ],
                          ),
                        ],
                      ),
                    )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget getANewsFooter(BuildContext context, double size, {News? news}) {
  return GestureDetector(
    onTap: () => {Get.to(SeeNewsDetailPage(), arguments: news)},
    child: SizedBox(
      width: MediaQuery.of(context).size.width * 0.75,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: size,
              ),
              CustomWidget.getBoldText(
                (news!.author ?? "").contains("(")
                    ? (news.author ?? "").substring(
                        (news.author ?? "").indexOf("(") + 1,
                        (news.author ?? "").indexOf(")"))
                    : (news.author ?? "").contains(",")
                        ? news.author!.substring(0, news.author!.indexOf(","))
                        : news.author ?? "No Author",
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
                  "${timeAgo(news.publishedAt.toString())}",
                  size: size * 1.5),
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
  );
}
