import 'dart:js';

import 'package:flutter/material.dart';
import 'package:technews/App.dart';
import 'package:technews/choose_your_sources.dart';
import 'package:technews/home_page.dart';
import 'package:technews/log_in.dart';
import 'package:technews/on_boarding_1.dart';
import 'package:technews/select_topic.dart';
import 'package:technews/edit_profile.dart';
import 'package:technews/trending.dart';
import 'package:technews/latest.dart';

void main() {
  runApp(MaterialApp(
      title: 'Tech News App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.grey),
      initialRoute: '/home_page',
      routes: {
        '/': (context) => const MainApp(),
        '/on_boarding': (context) => const OnBoarding1(),
        '/log_in': (context) => const LogInPage(),
        '/home_page': (context) => const HomePage(),
        '/select_topic': (context) => const SelectTopics(),
        '/choose_news_sources': (context) => const ChooseNewsSources(),
        '/edit_profile': (context) => const EditProfile(),
        '/trending': (context) => const Trending(),
        '/latest': (context) => const Latest(),
      }));
}
