import 'package:flutter/material.dart';
import 'package:technews/custom_widget.dart';
import 'package:technews/logo.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Logo(),
              const SizedBox(height: 20),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.all(20),
                // child: const Text(
                //   'A place to stay up to date with the latest tech news.',
                //   textAlign: TextAlign.center,
                //   style: TextStyle(
                //     fontSize: 18,
                //     fontWeight: FontWeight.w300,
                //   ),
                // ),
                child: RichText(
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
      ),
    );
  }
}
