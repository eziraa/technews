import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
        leading: const IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: null,
        ),
      ),
      body: Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.only(top: 20),
          child: ListView(
            padding: const EdgeInsets.all(8),
            children: [
              Center(
                  child: Stack(children: [
                Container(
                  width: 130,
                  height: 130,
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
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a2/BBC_News_2022_%28Alt%29.svg/1200px-BBC_News_2022_%28Alt%29.svg.png"))),
                ),
                // Container(
                //   height: 50,
                //   width: 100,
                //   color: Colors.white,
                //   child: const Center(
                //       child: Text(
                //     'Follow',
                //   )),
                // ),
                // Container(
                //   height: 50,
                //   color: Colors.white,
                //   decoration: BoxDecoration(
                //       border: Border.all(width: 4, color: Colors.blue)),
                //   child: const Center(
                //       child: ElevatedButton(
                //           onPressed: null,
                //           child: Text(
                //             'Follow',
                //             style: TextStyle(color: Colors.blue),
                //           ))),
                // ),
              ])),
            ],
          )),
    );
  }
}
