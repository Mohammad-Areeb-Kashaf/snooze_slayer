import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  final ValueNotifier<ThemeMode> notifier = ValueNotifier(ThemeMode.light);

  void changeThemeMode() {
    notifier.value =
        notifier.value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
  }
}
