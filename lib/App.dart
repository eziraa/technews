import 'package:flutter/material.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset(
                    'assets/images/logo.png',
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 10),
                RichText(
                  text: const TextSpan(children: [
                    TextSpan(
                      text: "Tech",
                      style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                    TextSpan(
                      text: "Buzz",
                      style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ]),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.all(30),
              child: Column(
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      text: 'A place to ',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                          color: Colors.blueGrey),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'stay up to date ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blueGrey)),
                        TextSpan(
                          text: ' with the ',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                              color: Colors.blueGrey),
                        ),
                        TextSpan(
                            text: 'latest tech news. ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blueGrey)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/on_boarding");
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  backgroundColor: Colors.blueAccent),
              child: const Text(
                'Get Started',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 250, 254, 253),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
