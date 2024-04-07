// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class OnBoardingPage {
  List<Color> colorList = [];
  String imageAddress = "";
  int pageIndex = 0;
  OnBoardingPage(
      {required this.colorList,
      required this.imageAddress,
      required this.pageIndex});
}

class OnBoarding1 extends StatefulWidget {
  const OnBoarding1({super.key});

  @override
  State<OnBoarding1> createState() => _OnBoarding1State();
}

class _OnBoarding1State extends State<OnBoarding1> {
  OnBoardingPage page =
      OnBoardingPage(colorList: [], imageAddress: "imageAddress", pageIndex: 1);
  @override
  void initState() {
    page = OnBoardingPage(colorList: [
      Colors.blue,
      const Color.fromRGBO(0, 0, 0, 0.259),
      Colors.black26
    ], imageAddress: "assets/images/onboard-0.png", pageIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.5,
            child: Image(
              image: AssetImage(page.imageAddress),
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, top: 20, right: 20),
            child: RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'Get instant Tech News',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 50, bottom: 20),
            child: const Text(
              "Lorem, ipsum dolor sit amet consectetur adipisicing elit. Possimus, in praesentium? Perspiciatis nulla unde tempora, doloribus optio voluptates, ipsam, sed nam sunt earum quae harum debitis veniam repellat at enim?",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: "arial"),
            ),
          ),
          const SizedBox(height: 80),
          Container(
            margin: const EdgeInsets.all(20),
            child: Row(
              children: [
                Row(
                  children: List.generate(
                      3,
                      (index) => Icon(
                            Icons.circle,
                            color: page.colorList[index],
                            size: 15,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blueAccent),
                  child: ElevatedButton(
                    onPressed: () {
                      if (page.pageIndex < 2) {
                        page.colorList[page.pageIndex] = Colors.black26;
                        page.colorList[page.pageIndex + 1] = Colors.blueAccent;
                        setState(() {
                          page = OnBoardingPage(
                            colorList: page.colorList,
                            pageIndex: page.pageIndex + 1,
                            imageAddress:
                                "assets/images/onboard-${++page.pageIndex}.png",
                          );
                          },
                        );
                      } else {
                        Navigator.pushNamed(context, "/log_in");
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: Colors.blueAccent),
                    child: const Text(
                      "Next",
                      style: TextStyle(
                          color: Color.fromARGB(255, 250, 254, 253),
                          fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
