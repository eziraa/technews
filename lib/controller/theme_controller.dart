import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  var themeMode = ThemeMode.dark.obs;

  void changeMode(ThemeMode mode) {
    themeMode.value = mode;
  }
}
