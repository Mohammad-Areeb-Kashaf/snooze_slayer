import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snooze_slayer/constants.dart';
import 'package:snooze_slayer/pages/main_page.dart';

import 'controller/alarm_controller_object_box.dart';

late AlarmControllerObjectBox alarmControllerObjectBox;

void main()  async {
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
      // theme: ThemeData(
      //   fontFamily: 'Poppins',
      //   colorScheme: ColorScheme(
      //     brightness: Brightness.dark,
      //     primary: Color(0xff0E8388),
      //     onPrimary: Colors.white,
      //     secondary: Color(0xff2E4F4F),
      //     onSecondary: Colors.white,
      //     error: Colors.red,
      //     onError: Colors.white,
      //     surface: Color(0xff2C3333),
      //     onSurface: Colors.white,
      //     tertiary: Color(0xffCBE4DE),
      //     onTertiary: Colors.black,
      //   ),
      //   splashColor: Colors.transparent,
      // ),
      darkTheme: ThemeData(
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
          scaffoldBackgroundColor: Colors.transparent
      ),
      themeMode: ThemeMode.dark,
      home: const MainPage(),
    );
  }
}
