import 'package:flutter/material.dart';
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

class _LatestPageState extends State<LatestPage> {
  final Logger _logger = Logger();

  List<dynamic> newsData = [];

  CustomWidget customWidget = CustomWidget();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(
      Uri.parse(
          "https://newsapi.org/v2/top-headlines?category=technology&language=en&apiKey=280cb4d976424cfe8ea56c6a40e8dd05"),
    );

    if (response.statusCode == 200) {
      _logger.d("Response body: ${response.body}");
      final decodedData = json.decode(response.body);
      _logger.d("Decoded data: $decodedData");
      setState(() {
        newsData = decodedData['articles']; // Update here
      });
    } else {
      _logger.e("Failed to fetch data. Status code: ${response.statusCode}");
      throw Exception('Failed to load data');
    }
  }

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
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            CustomSection.getNewsSourcesHrBar(),
            // Loop through newsData and create CustomSection.getANews widgets
            for (var article in newsData)
              CustomSection.getANews(
                context,
                article['articles']['title'], 
                article['articles']['urlToImage'], 
                article['articles']['content'], 
                article['articles']['source']['name'], 
                article['articles']['publishedAt'], 
              ),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
