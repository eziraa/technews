import 'package:flutter/material.dart';
import 'package:technews/log_in.dart';
import 'package:technews/on_boarding_1.dart';
import 'package:technews/select_topic.dart';
import 'package:technews/sign_up.dart';

void main() {
  runApp(
    MaterialApp(
        title: 'Tech News App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.grey),
        home: SelectTopics()),
  );
}

