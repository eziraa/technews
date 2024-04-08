import 'package:flutter/material.dart';
import 'package:technews/CustomWidget.dart';

class SavedPage extends StatefulWidget {
  const SavedPage({super.key});

  @override
  State<SavedPage> createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {
  CustomWidget customWidget = CustomWidget();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customWidget.getAppBar(context),
      body: Column(
        children: [
          customWidget.getSearchBox(context),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _getSavedNews(),
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

  Widget _getSavedNews() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 5, bottom: 0),
          child: Row(
            children: [
              customWidget.getBoldText("Saved", size: 24),
            ],
          ),
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
        ],
      ),
    );
  }
}
