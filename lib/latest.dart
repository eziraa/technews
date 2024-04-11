import 'package:flutter/material.dart';
import 'package:technews/custom-section.dart';
import 'package:technews/custom_widget.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
import 'package:http/http.dart' as http;
import 'dart:convert';

// 280cb4d976424cfe8ea56c6a40e8dd05

class LatestPage extends StatefulWidget {
  const LatestPage({super.key});

  @override
  State<LatestPage> createState() => _LatestPageState();
}

class _LatestPageState extends State<LatestPage> {
  CustomWidget customWidget = CustomWidget();
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
            CustomSection.getANews(context),
            const SizedBox(height: 5),
            CustomSection.getANews(context),
            const SizedBox(height: 5),
            CustomSection.getANews(context),
            const SizedBox(height: 5),
            CustomSection.getANews(context),
            const SizedBox(height: 5),
            CustomSection.getANews(context),
            const SizedBox(height: 5),
            CustomSection.getANews(context),
            const SizedBox(height: 5),
            CustomSection.getANews(context),
            const SizedBox(height: 5),
            CustomSection.getANews(context),
            const SizedBox(height: 5),
            CustomSection.getANews(context),
            const SizedBox(height: 5),
            CustomSection.getANews(context),
            const SizedBox(height: 5),
            CustomSection.getANews(context),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
