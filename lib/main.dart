import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technews/firebase_options.dart';
import 'package:technews/login.dart';
import 'package:technews/news_channel.dart';
import 'package:technews/on_boarding_1.dart';
import 'package:technews/search.dart';
import 'package:technews/sign_up.dart';
import 'package:technews/trending.dart';
import 'package:technews/latest.dart';
import 'package:technews/select_news_source.dart';

Future<void> main() async {
  // await dotenv.dotenv.load(fileName: '.env');

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    GetMaterialApp(
      title: 'Tech News App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.grey),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const HomePage()),
        GetPage(name: '/on_boarding', page: () => const OnBoarding1()),
        GetPage(name: '/log_in', page: () => const LogIn()),
        GetPage(name: '/trending', page: () => const Trending()),
        GetPage(name: '/latest', page: () => const LatestPage()),
        GetPage(name: '/search', page: () => const SearchPage()),
        GetPage(name: '/sign_up', page: () => const SignUpPage()),
        GetPage(name: '/select_news_source', page: () => const NewsSource()),
        GetPage(name: '/news_channel', page: () => const NewsChannel()),
      ],
    ),
  );
}
