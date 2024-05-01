import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  var themeMode = ThemeMode.dark.obs;
  Rx<Color> textColor = Colors.black87.obs;

  void changeMode(ThemeMode mode) {
    themeMode.value = mode;
    textColor.value = mode == ThemeMode.dark ? Colors.white70 : Colors.black87;
  }
}
