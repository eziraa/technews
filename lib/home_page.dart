import 'package:flutter/material.dart';
import 'package:technews/CustomWidget.dart';
import 'package:technews/logo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomWidget().getAppBar(context),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [CustomWidget().getSearchBox()]),
      ),
    );
  }
}
