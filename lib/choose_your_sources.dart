import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewsSource {
  AssetImage asset = const AssetImage("assets/images/logo.png");
  String name = "BBC";
  OutlinedButton button = OutlinedButton(
    onPressed: null,
    style: OutlinedButton.styleFrom(backgroundColor: Colors.blueAccent),
    child: const Text(
      "Following",
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 20.0,
      ),
    ),
  );
}

class ChooseNewsSources extends StatefulWidget {
  const ChooseNewsSources({super.key});

  @override
  State<ChooseNewsSources> createState() => _ChooseNewsSourcesState();
}

class _ChooseNewsSourcesState extends State<ChooseNewsSources> {
  List<NewsSource> newsSources = [];
  @override
  void initState() {
    newsSources = [
      NewsSource(),
      NewsSource(),
      NewsSource(),
      NewsSource(),
      NewsSource(),
      NewsSource(),
      NewsSource(),
      NewsSource(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Row(
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.arrow_back_sharp)),
              const SizedBox(
                width: 30,
              ),
              const Text(
                "Choose your news sources",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Wrap(
              spacing: 20,
              runSpacing: 20,
              children: [
                ...newsSources.map(
                  (source) {
                    return Flexible(
                      child: Container(
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              child: Image(
                                image: source.asset,
                                width: 30,
                                height: 30,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              source.name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 0, 0, 0)),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              child: source.button,
                            ),
                            const SizedBox(
                              height: 10,
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
