import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snooze_slayer/pages/main_page.dart';

import 'helper/object_box.dart';

late ObjectBox objectBox;

void main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  objectBox = await ObjectBox.init();
  Get.put(objectBox);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Snooze Slayer',
      theme: ThemeData(
        fontFamily: 'Poppins',
        colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: Color(0xff0E8388),
          onPrimary: Colors.white,
          secondary: Color(0xff2E4F4F),
          onSecondary: Colors.white,
          error: Colors.red,
          onError: Colors.white,
          surface: Color(0xff2C3333),
          onSurface: Colors.white,
          tertiary: Color(0xffCBE4DE),
          onTertiary: Colors.black,
        ),
        splashColor: Colors.transparent,
      ),
      // darkTheme: ThemeData.dark().copyWith(
      //   scaffoldBackgroundColor: Color(0xff141414),
      //   appBarTheme: AppBarTheme(
      //     color: Color(0xff141414),
      //   ),
      // ),
      // themeMode: ThemeMode.dark,
      home: const MainPage(),
    );
  }
}
