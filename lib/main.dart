import 'package:flutter/material.dart';
import 'package:technews/on_boarding_1.dart';

void main() {
  runApp(
    MaterialApp(
        title: 'Tech News App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.grey),
        home: const OnBoarding1()),
  );
}
