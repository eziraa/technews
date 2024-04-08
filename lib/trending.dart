import 'package:flutter/material.dart';
import 'package:technews/CustomWidget.dart';

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
  CustomWidget custom = CustomWidget();
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
          return Center(
              child: Column(
            children: [
              custom.getImage('assets/images/bbc.jpg'),
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
              Row(
                children: [
                  Container(
                    margin:
                        const EdgeInsets.only(left: 15, right: 10, bottom: 10),
                    width: 40,
                    height: 40,
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
                  const SizedBox(
                    child: Text('BBC News'),
                  ),
                  const IconButton(
                    icon: Icon(
                      Icons.access_time,
                    ),
                    onPressed: null,
                  ),
                  const SizedBox(
                    child: Text('4h ago'),
                  ),
                ],
              )
            ],
          ));
        },
      ),
    );
  }
}
