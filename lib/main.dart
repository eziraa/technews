import 'package:flutter/material.dart';
import 'package:technews/select_topic.dart';

void main() {
  runApp(
    MaterialApp(
        title: 'Tech News App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.grey),
        home: const SelectTopics()),
  );
}

