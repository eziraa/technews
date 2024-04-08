import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:technews/CustomWidget.dart';

class NewsChannel extends StatefulWidget {
  const NewsChannel({super.key});

  @override
  State<NewsChannel> createState() => _NewsChannelState();
}

class _NewsChannelState extends State<NewsChannel> {
  CustomWidget customWidget = CustomWidget();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'News channel',
            textAlign: TextAlign.center,
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.more_vert,
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 15),
                      padding: const EdgeInsets.all(10),
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        border: Border.all(width: 4, color: Colors.white),
                        shape: BoxShape.circle,
                        image: const DecorationImage(
                          image: AssetImage('assets/images/bbc.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 70),
                      child: const Column(
                        children: [
                          Text(
                            '1.2M',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text('Followers')
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                    margin: const EdgeInsets.only(left: 25),
                    child: const Text(
                      'BBC News',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    )),
                Container(
                    margin: const EdgeInsets.only(left: 25),
                    child: const Text(
                      'is an operational division of the British Broadcasting Corporation responsible for gathering and broadcasting of news and current affairs.',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 150, 147, 147),
                      ),
                    )),
                Row(
                  children: [
                    Container(
                      margin:
                          const EdgeInsets.only(left: 25, top: 10, right: 60),
                      child:
                          CustomWidget().getElevatedBtn(context, 'Following'),
                    ),
                    Container(
                        margin: const EdgeInsets.only(top: 10),
                        child:
                            CustomWidget().getElevatedBtn(context, 'Website')),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Center(
                  child: Text(
                    'News',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Color.fromARGB(255, 150, 147, 147),
                    ),
                  ),
                ),
                const SizedBox(height: 10,)
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  margin: const EdgeInsets.only(left: 25),
                  child: Column(
                    children: [
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
            )
          ],
        ));
  }

  Widget _getANews() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          customWidget.getMediumImage("assets/images/6.jpg", size: 80),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customWidget.blurredText("Europe"),
              Text(
                "${"Ukraine's president, Zelenskey says hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh".substring(0, 30)}...",
                style: const TextStyle(fontSize: 18),
              ),
              // customWidget.getNormalText(
              //     "${"Ukraine's president, Zelenskey says hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh".substring(0, 20)}...",
              //     size: 18),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  customWidget.getProfileImage("assets/images/bbc.jpg",
                      size: 15),
                  const SizedBox(
                    width: 10,
                  ),
                  customWidget.getBoldText("BBC News",
                      color: Colors.black54, size: 12),
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(
                    Icons.access_time,
                    size: 13,
                    color: Colors.black38,
                  ),
                  const SizedBox(
                    width: 13,
                  ),
                  customWidget.blurredText("4hour ago", size: 13)
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
