import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technews/app.dart';
import 'package:technews/firebase_options.dart';
import 'package:technews/login.dart';
import 'package:technews/news_channel.dart';
import 'package:technews/on_boarding_1.dart';
import 'package:technews/saved.dart';
import 'package:technews/search.dart';
import 'package:technews/select_topic.dart';
import 'package:technews/edit_profile.dart';
import 'package:technews/settings.dart';
import 'package:technews/sign_up.dart';
import 'package:technews/trending.dart';
import 'package:technews/latest.dart';
import 'package:technews/notification.dart';
import 'package:technews/verify_email.dart';
import 'package:technews/select_news_source.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as dotenv;

Future<void> main() async {
  await dotenv.dotenv.load(fileName: '../.env');

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    GetMaterialApp(
      title: 'Tech News App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.grey),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const MainApp()),
        GetPage(name: '/on_boarding', page: () => const OnBoarding1()),
        GetPage(name: '/log_in', page: () => const LogIn()),
        GetPage(name: '/select_topic', page: () => const SelectTopics()),
        GetPage(name: '/edit_profile', page: () => const EditProfile()),
        GetPage(name: '/trending', page: () => const Trending()),
        GetPage(name: '/notification', page: () => const Notifications()),
        GetPage(name: '/latest', page: () => const LatestPage()),
        GetPage(name: '/search', page: () => const SearchPage()),
        GetPage(name: '/saved', page: () => const SavedPage()),
        GetPage(name: '/setting', page: () => const Settings()),
        GetPage(name: '/sign_up', page: () => const SignUpPage()),
        GetPage(name: '/verify_email', page: () => const VerifyEmail()),
        GetPage(name: '/settings', page: () => const Settings()),
        GetPage(name: '/select_news_source', page: () => const NewsSource()),
        GetPage(name: '/news_channel', page: () => const NewsChannel()),
      ],
    ),
  );
}
