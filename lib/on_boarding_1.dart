import 'package:flutter/material.dart';

class OnBoardingPage {
  Color? color;
  AssetImage? image;
  bool isActive = false;

  OnBoardingPage(this.color, this.image, this.isActive);
}

class OnBoarding1 extends StatefulWidget {
  const OnBoarding1({super.key});

  @override
  State<OnBoarding1> createState() => _OnBoarding1State();
}

class _OnBoarding1State extends State<OnBoarding1> {
  List<OnBoardingPage> pages = [];

  @override
  void initState() {
    super.initState();
    pages = [
      OnBoardingPage(
          Colors.blue, const AssetImage('assets/images/onboarding1.png'), true),
      OnBoardingPage(Colors.black26,
          const AssetImage('assets/images/onboarding2.png'), false),
      OnBoardingPage(Colors.black26,
          const AssetImage('assets/images/onboarding3.png'), false),
    ];
    pages[0].isActive = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.6,
            child:
                const Image(image: AssetImage("assets/images/onboard-1.png")),
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
              '\nlorum impsum d Null Null Null Null Null Null Null Null Null Null Null Null Null Null Null Null Null Null Null Null Null',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.black,
                fontSize: 16,
              ),
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
                      (index) => const Icon(
                            Icons.circle,
                            color: Colors.red,
                            size: 15,
                          )),
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
                      for (int i = 0; i < pages.length; i++) {
                        if (pages[i].isActive) {
                          pages[i].isActive = false;
                          pages[i + 1].isActive = true;
                          break;
                        }
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
