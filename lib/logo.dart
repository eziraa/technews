import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Image.asset('assets/images/logo.png'),
          const CircleAvatar(
            child: Icon(Icons.newspaper),
          ),
          const SizedBox(width: 10),
          RichText(
            text: const TextSpan(children: [
              TextSpan(
                text: "Touch",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              TextSpan(
                text: "Tech",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
