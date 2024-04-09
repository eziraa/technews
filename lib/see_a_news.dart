import 'package:flutter/material.dart';
import 'package:technews/custom_widget.dart';

class SeeNewsDetailPage extends StatefulWidget {
  const SeeNewsDetailPage({super.key});

  @override
  State<SeeNewsDetailPage> createState() => _SeeNewsDetailPageState();
}

class _SeeNewsDetailPageState extends State<SeeNewsDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomWidget.getAppBarWithShare(context),
      body: Column(
        children: [
          Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  CustomWidget.getProfileImage("assets/images/1.jpg",
                      size: 100),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomWidget.getBoldText("BBC News"),
                      CustomWidget.blurredText("15 minute ago"),
                    ],
                  ),
                  Expanded(child: Container()),
                  CustomWidget.getElevatedBtn(context, "Following")
                ],
              )),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomWidget.getImage("assets/images/4.jpg"),
                    const SizedBox(height: 10),
                    CustomWidget.blurredText("Europe"),
                    CustomWidget.getBoldText(
                        "Apple products becoming available in the world and will be available"),
                    getNewsBody(),
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

  Widget getNewsBody() {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Column(children: [
        CustomWidget.getNormalText(
            "The three dots often seen in user interfaces, especially on mobile devices, are typically referred to as  icon. In user interface design, they indicate that there are additional options available that are not immediately visible"),
        const SizedBox(
          height: 5,
        ),
        CustomWidget.getNormalText(
            "The three dots often seen in user interfaces, especially on mobile devices, are typically referred to as  icon. In user interface design, they indicate that there are additional options available that are not immediately visible"),
        const SizedBox(
          height: 5,
        ),
        CustomWidget.getNormalText(
            "The three dots often seen in user interfaces, especially on mobile devices, are typically referred to as  icon. In user interface design, they indicate that there are additional options available that are not immediately visible"),
      ]),
    );
  }

  Widget getNews() {
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
                    child: CustomWidget.blurredText(item),
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

  Widget getANews() {
    return SingleChildScrollView(
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
    );
  }
}
