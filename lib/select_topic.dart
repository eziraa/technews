import 'package:flutter/material.dart';

class SelectTopics extends StatefulWidget {
  const SelectTopics({super.key});

  @override
  State<SelectTopics> createState() => _SelectTopicsState();
}

class _SelectTopicsState extends State<SelectTopics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(top: 20),
        child: const Column(
          children: [
            Row(
              children: [
                Icon(Icons.arrow_back_sharp),
                SizedBox(
                  width: 30,
                ),
                Text(
                  "Choose your topics",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
