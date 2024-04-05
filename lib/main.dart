import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:technews/choose_your_sources.dart';
import 'package:technews/log_in.dart';
import 'package:technews/on_boarding_1.dart';
import 'package:technews/select_topic.dart';
=======
import 'package:technews/edit_profile.dart';
>>>>>>> 191efa7ddaeb21357591824263a4f1f3c4f94caa

void main() {
  runApp(
    MaterialApp(
<<<<<<< HEAD
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
=======
        title: 'Tech News App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.grey),
        home: const EditProfile()),
>>>>>>> 191efa7ddaeb21357591824263a4f1f3c4f94caa
  );
}
