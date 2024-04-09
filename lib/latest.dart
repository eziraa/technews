import 'package:flutter/material.dart';
import 'package:technews/custom_widget.dart';

class LatestPage extends StatefulWidget {
  const LatestPage({super.key});

  @override
  State<LatestPage> createState() => _LatestPageState();
}

class _LatestPageState extends State<LatestPage> {
  CustomWidget customWidget = CustomWidget();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const SizedBox(
          child: Text(
            'Latest News',
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
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
