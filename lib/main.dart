import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:snooze_slayer/models/alarm_model.dart';
import 'package:snooze_slayer/pages/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(AlarmAdapter());
  Hive.registerAdapter(SnoozeAdapter());
  await Hive.openBox<Alarm>("alarms");
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
      home: const MainScreen(),
    );
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }
}
