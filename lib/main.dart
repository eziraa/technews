import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technews/app.dart';
import 'package:technews/home_page.dart';
import 'package:technews/log_in.dart';
import 'package:technews/news_channel.dart';
import 'package:technews/on_boarding_1.dart';
import 'package:technews/saved.dart';
import 'package:technews/search.dart';
import 'package:technews/see_a_news.dart';
import 'package:technews/select_topic.dart';
import 'package:technews/edit_profile.dart';
import 'package:technews/settings.dart';
import 'package:technews/sign_up.dart';
import 'package:technews/trending.dart';
import 'package:technews/latest.dart';
import 'package:technews/notification.dart';
import 'package:technews/verify_email.dart';
import 'package:technews/select_news_source.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: 'Tech News App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.grey),
      initialRoute: '/',
      routes: {
        '/': (context) => const MainApp(),
        '/on_boarding': (context) => const OnBoarding1(),
        '/log_in': (context) => const LogInPage(),
        '/home_page': (context) => const HomePage(),
        '/select_topic': (context) => const SelectTopics(),
        '/edit_profile': (context) => const EditProfile(),
        '/trending': (context) => const Trending(),
        '/notification': (context) => const Notifications(),
        '/latest': (context) => const LatestPage(),
        '/search': (context) => const SearchPage(),
        '/saved': (context) => const SavedPage(),
        '/news-detail': (context) => const SeeNewsDetailPage(),
        '/setting': (context) => const Settings(),
        '/sign_up': (context) => const SignUpPage(),
        '/verify_email': (context) => const VerifyEmail(),
        '/settings': (context) => const Settings(),
        '/select_news_source': (context) => const NewsSource(),
        '/news_channel': (context) => const NewsChannel()
      },
    ),
  );
}
