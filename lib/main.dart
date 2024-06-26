import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technews/about.dart';
import 'package:technews/app.dart';
import 'package:technews/controller/theme_controller.dart';
import 'package:technews/edit_profile.dart';
import 'package:technews/firebase_options.dart';
import 'package:technews/home_page.dart';
import 'package:technews/latest.dart';
import 'package:technews/login.dart';
import 'package:technews/on_boarding_1.dart';
import 'package:technews/saved.dart';
import 'package:technews/search.dart';
import 'package:technews/trending.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: themeController.themeMode.value,
        initialRoute: '/',
        getPages: [
          GetPage(name: '/', page: () => MainApp()),
          GetPage(name: '/on_boarding', page: () => const OnBoarding1()),
          GetPage(name: '/log_in', page: () => const LogIn()),
          GetPage(name: '/home', page: () => const HomePage()),
          GetPage(name: '/trending', page: () => const Trending()),
          GetPage(name: '/latest', page: () => const LatestPage()),
          GetPage(name: '/search', page: () => const SearchPage()),
          GetPage(name: '/saved', page: () => const SavedPage()),
          GetPage(name: '/profile', page: () => const EditProfile()),
          GetPage(name: '/about', page: () => AboutPage()),
        ],
      ),
    );
  }
}

Future<void> main() async {
  // await dotenv.dotenv.load(fileName: '.env');

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}
