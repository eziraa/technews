import 'package:flutter/material.dart';
import 'package:technews/CustomWidget.dart';

class SearchOptions {
  String? type;
  String? task;
  SearchOptions({required this.type, required this.task});
}

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  CustomWidget customWidget = CustomWidget();
  List<SearchOptions> options = [];
  SearchOptions activeOption = SearchOptions(type: 'News', task: '');
  @override
  void initState() {
    options = [];
    options.add(SearchOptions(type: 'News', task: 'Save'));
    options.add(SearchOptions(type: "Topics", task: "Add"));
    options.add(SearchOptions(type: "Source", task: "Follow"));
    activeOption = options[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customWidget.getAppBar(context),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15),
            child: customWidget.getSearchBox(context),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _getSearchOptions(),
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

  Widget _getSearchOptions() {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: [
            for (SearchOptions option in options)
              Column(
                children: [
                  Row(
                    children: [
                      TextButton(
                        child: customWidget.blurredText(option.type ?? ""),
                        onPressed: () {
                          setState(() {
                            activeOption = option;
                          });
                        },
                      ),
                      const SizedBox(width: 3)
                    ],
                  ),
                  Transform.translate(
                    offset: const Offset(-0, -14),
                    child: Container(
                      height: option.type == activeOption.type ? 3 : 0,
                      width: option.type == activeOption.type
                          ? "${activeOption.type}".length * 13
                          : 0,
                      color: Colors.blue,
                    ),
                  )

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
          customWidget.getMediumImage("assets/images/6.jpg", size: 60),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customWidget.blurredText("Europe"),
              customWidget.getNormalText(
                  "${"Ukraine's president, Zelenskey says".substring(0, 10)}...",
                  size: 10),
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
                    size: 10,
                    color: Colors.black38,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  customWidget.blurredText("4hour ago", size: 10)
                ],
              ),
            ],
          ),
          customWidget.getElevatedBtn(context, activeOption.task ?? "")
        ],
      ),
    );
  }
}
