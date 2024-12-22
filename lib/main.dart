import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snooze_slayer/constants.dart';
import 'package:snooze_slayer/pages/main_page.dart';

import 'controller/alarm_controller_object_box.dart';

late AlarmControllerObjectBox alarmControllerObjectBox;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  alarmControllerObjectBox = await AlarmControllerObjectBox.init();
  Get.put(alarmControllerObjectBox);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Snooze Slayer',
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: kLightFrameColor),
        fontFamily: 'Epilogue',
        colorScheme: ColorScheme.light(
          primary: kLightPrimaryColor,
          secondary: kLightSecondaryColor,
          tertiary: kLightGlassEffectColor,
          onPrimary: kLightTextColor,
          onSecondary: kLightTextColor,
          onSurface: kLightTextColor,
          surface: kLightFrameColor,
        ),
        splashColor: Colors.transparent,
        scaffoldBackgroundColor: Colors.transparent,
      ),
      darkTheme: ThemeData(
        appBarTheme: AppBarTheme(color: kDarkFrameColor),
        fontFamily: 'Epilogue',
        colorScheme: ColorScheme.dark(
          primary: kDarkPrimaryColor,
          secondary: kDarkSecondaryColor,
          tertiary: kDarkGlassEffectColor,
          onPrimary: kDarkTextColor,
          onSecondary: kDarkTextColor,
          onSurface: kDarkTextColor,
          surface: kDarkFrameColor,
        ),
        splashColor: Colors.transparent,
        scaffoldBackgroundColor: Colors.transparent,
      ),
      themeMode: ThemeMode.dark,
      home: const MainPage(),
    );
  }
}
