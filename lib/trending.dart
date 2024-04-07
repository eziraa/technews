import 'package:flutter/material.dart';

class Trending extends StatefulWidget {
  const Trending({super.key});

  @override
  State<Trending> createState() => _TrendingState();
}

String dotDisplayer(String text) {
  int textLength = text.length;
  if (textLength > 85) {
    return '${text.substring(0, 84)}...';
  } else {
    return text;
  }
}

class _TrendingState extends State<Trending> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const SizedBox(child: Text('Trending News', textAlign: TextAlign.left,),),
        leading: const IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: null,
        ),
      ),
      body: Center(
          child: Column(
        children: [
          Container(
            width: 380,
            height: 250,
            decoration: BoxDecoration(
                border: Border.all(width: 4, color: Colors.white),
                boxShadow: [
                  BoxShadow(
                      spreadRadius: 2,
                      blurRadius: 10,
                      color: Colors.black.withOpacity(0.1)),
                ],
                image: const DecorationImage(
                  image: AssetImage('assets/images/profile.jpg'),
                  fit: BoxFit.cover,
                )),
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
                margin: const EdgeInsets.only(left: 15, right: 10, bottom: 10),
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
                      image: AssetImage('assets/images/profile.jpg'),
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
      )),
    );
  }
}
