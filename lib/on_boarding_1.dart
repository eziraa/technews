import 'package:flutter/material.dart';

class OnBoarding1 extends StatefulWidget {
  const OnBoarding1({super.key});

  @override
  State<OnBoarding1> createState() => _OnBoarding1State();
}

class _OnBoarding1State extends State<OnBoarding1> {
  Color color = Colors.red;

  @override
  void initState() {
    super.initState();
    color = Colors.blue;
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
            child: Container(
              color: Colors.blueAccent,
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
                const Row(
                  children: [
                    Icon(
                      Icons.circle,
                      color: Colors.red,
                      size: 15,
                    ),
                    Icon(
                      Icons.circle,
                      color: Colors.black26,
                      size: 15,
                    ),
                    Icon(
                      Icons.circle,
                      color: Colors.black26,
                      size: 15,
                    ),
                  ],
                ),
                Expanded(
                  child: Container(),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blueAccent),
                  child: ElevatedButton(
                    onPressed: null,
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
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
