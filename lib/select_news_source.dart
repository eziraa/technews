import 'package:flutter/material.dart';

class NewsSource extends StatefulWidget {
  const NewsSource({super.key});

  @override
  State<NewsSource> createState() => _NewsSourceState();
}

class _NewsSourceState extends State<NewsSource> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Choose your News Source',
            style: TextStyle(fontSize: 20),
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.all(8),
          children: [
            Column(children: [
              Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  color: Colors.white,
                ),
                child: const Row(
                  children: [
                    Icon(Icons.search, color: Colors.grey),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search...',
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 100,
                height: 100,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(width: 4, color: Colors.white),
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 10,
                          color: Colors.black.withOpacity(0.1)),
                    ],
                    shape: BoxShape.circle,
                    image: const DecorationImage(
                      image: AssetImage('assets/images/bbc.jpg'),
                      fit: BoxFit.cover,
                    )),
              ),
              Container(
                height: 20,
                width: 100,
                color: Colors.white,
                child: const Center(
                    child: Text(
                  'BBC',
                  style: TextStyle(color: Colors.black),
                )),
              ),
              Container(
                margin: const EdgeInsets.all(5),
                height: 50,
                width: 100,
                color: Colors.white,
                child: const Center(
                  child: ElevatedButton(
                    onPressed: null,
                    child: Text(
                      'Follow',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                child: TextButton(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, "/home_page");
                  },
                  child: const Text(
                    'Finish',
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                ),
              ),
            ]),
          ],
        ));
  }
}
