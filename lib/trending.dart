import 'package:flutter/material.dart';
import 'package:technews/custom-section.dart';
import 'package:technews/custom_widget.dart';

class Trending extends StatefulWidget {
  const Trending({super.key});

  @override
  State<Trending> createState() => _TrendingState();
}

String dotDisplayer(String text) {
  int textLength = text.length;
  if (textLength > 70) {
    return '${text.substring(0, 69)}...';
  } else {
    return text;
  }
}

class _TrendingState extends State<Trending> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const SizedBox(
          child: Text(
            'Trending News',
            textAlign: TextAlign.left,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                  CustomWidget.getImage('assets/images/6.jpg'),
              const Text(
                'Europe',
                textAlign: TextAlign.left,
              ),
              SizedBox(
                width: 380,
                height: 50,
                child: Text(
                  dotDisplayer(
                      'Europe Europe: Lorem, ipsum dolor sit amet consect etur adipisicing elit.Lorem, ipsum dolor ipsum dolor'),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.left, // Aligning text to the left
                ),
              ),
                  CustomSection.getANewsFooter(context, 10)
            ],
          ));
        },
      ),
    );
  }
}
