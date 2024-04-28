import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:technews/controller/news_controller.dart';
import 'package:technews/custom-section.dart';
import 'package:technews/custom_widget.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:logger/logger.dart';

class LatestPage extends StatefulWidget {
  const LatestPage({Key? key}) : super(key: key);

  @override
  State<LatestPage> createState() => _LatestPageState();
}

String channelImageUrl = '';

class _LatestPageState extends State<LatestPage> {
  CustomWidget customWidget = CustomWidget();
  final NewsController controller = Get.put(NewsController());
  List<dynamic> techNews = [];
  // final Logger _logger = Logger();

  // List<dynamic> newsData = [];

  // @override
  // void initState() {
  //   super.initState();
  //   fetchData();
  // }

  // Future<void> fetchData() async {
  //   final response = await http.get(
  //     Uri.parse(
  //         "https://newsapi.org/v2/top-headlines?category=technology&language=en&apiKey=280cb4d976424cfe8ea56c6a40e8dd05"),
  //   );

  //   if (response.statusCode == 200) {
  //     _logger.d("Response body: ${response.body}");
  //     final decodedData = json.decode(response.body);
  //     _logger.d("Decoded data: $decodedData");
  //     setState(() {
  //       newsData = decodedData['articles']; // Update here
  //     });
  //   } else {
  //     _logger.e("Failed to fetch data. Status code: ${response.statusCode}");
  //     throw Exception('Failed to load data');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const SizedBox(
          child: Text(
            'Latest News',
            textAlign: TextAlign.left,
          ),
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
      ),
      body: Obx(
        () => Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(children: [
                      for (int i = 0; i < controller.newsList.length; i++)
                        CustomSection.getANews(context, controller.newsList[i])
                    ])
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
