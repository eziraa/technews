import 'package:flutter/material.dart';
import 'package:technews/choose_your_sources.dart';
import 'package:technews/log_in.dart';
import 'package:technews/on_boarding_1.dart';
import 'package:technews/select_topic.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Tech News App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.grey),
      initialRoute: '/',
      routes: {
        '/': (context) => const OnBoarding1(),
        '/log_in': (context) => const LogInPage(),
        '/select_topic': (context) => const SelectTopics(),
      },
    ),
  );
}
