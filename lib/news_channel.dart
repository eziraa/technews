import 'package:flutter/material.dart';

class NewsChannel extends StatefulWidget {
  const NewsChannel({super.key});

  @override
  State<NewsChannel> createState() => _NewsChannelState();
}

class _NewsChannelState extends State<NewsChannel> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text(
          'News channel',
          textAlign: TextAlign.center,
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
        actions: [
          IconButton(
            icon: const Icon(
              Icons.more_vert,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
