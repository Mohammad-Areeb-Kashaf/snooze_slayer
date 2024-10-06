import 'package:flutter/material.dart';
import 'package:snooze_slayer/models/alarm_model.dart';
import 'package:snooze_slayer/widgets/alarm_tile.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool isAlarmEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                      text: 'Welcome, ',
                      children: [
                        TextSpan(
                          text: 'Username',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        )
                      ],
                      style: TextStyle(fontSize: 18)),
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 10),
                Text(
                  'Ring in 15hr 49min',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                ),
                SizedBox(height: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AlarmTile(
                        alarmData:
                            Alarm(label: "Waking up", missions: ["Math"])),
                    AlarmTile(alarmData: Alarm(missions: ["Math"])),
                    AlarmTile(alarmData: Alarm(missions: ["Math"])),
                    AlarmTile(alarmData: Alarm(missions: ["Math"])),
                    AlarmTile(alarmData: Alarm()),
                    AlarmTile(alarmData: Alarm()),
                    AlarmTile(alarmData: Alarm()),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
