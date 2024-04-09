import 'package:flutter/material.dart';
import 'package:technews/CustomWidget.dart';

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
}
