import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flexible Row Example'),
        ),
        body: Container(
          padding: const EdgeInsets.all(8.0),
          child: Wrap(
            children: [
              Flexible(
                child: Container(
                  color: Colors.blue,
                  height: 100,
                  width: 100,
                ),
              ),
              Flexible(
                child: Container(
                  color: Colors.green,
                  height: 100,
                  width: 100,
                ),
              ),
              Flexible(
                child: Container(
                  color: Colors.red,
                  height: 100,
                  width: 100,
                ),
              ),
              // Add more Flexible widgets for additional items
            ],
          ),
        ),
      ),
    );
  }
}
