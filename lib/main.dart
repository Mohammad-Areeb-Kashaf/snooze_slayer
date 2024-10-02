import 'package:flutter/material.dart';
import 'package:snooze_slayer/pages/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Snooze Slayer',
      theme: ThemeData(fontFamily: 'Poppins'),
      darkTheme:
          ThemeData.dark().copyWith(scaffoldBackgroundColor: Color(0xff141414)),
      themeMode: ThemeMode.dark,
      home: const MainScreen(),
    );
  }
}
