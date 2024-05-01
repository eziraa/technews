import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technews/controller/theme_controller.dart';

class Logo {
  Widget getLogo({double size = 140}) {
    final ThemeController themeController = Get.find<ThemeController>();

    return Container(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Image.asset('assets/images/logo.png'),
          Container(
            width: size,
            height: size,
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
            text: TextSpan(children: [
              const TextSpan(
                text: "Tech",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              TextSpan(
                text: "Buzz",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: themeController.themeMode.value == ThemeMode.dark
                      ? Colors.white70
                      : Colors.black87,
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }

  Widget getLogol({double size = 140}) {
    final ThemeController themeController = Get.find<ThemeController>();
    return Container(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Image.asset('assets/images/logo.png'),
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 20),
          RichText(
            text: TextSpan(children: [
              TextSpan(
                text: "Tech",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              TextSpan(
                text: "Buzz",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: themeController.themeMode.value == ThemeMode.dark
                      ? Colors.white70
                      : Colors.black87,
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
