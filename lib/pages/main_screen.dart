import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:snooze_slayer/controllers/alarm_controller.dart';
import 'package:snooze_slayer/models/alarm_model.dart';
import 'package:snooze_slayer/widgets/alarm_tile.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool isAlarmEnabled = true;
  final alarmController = AlarmController();

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
                SizedBox(height: 50),
                Text(
                  'Ring in 15hr 49min',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                ),
                SizedBox(height: 10),
                ValueListenableBuilder(
                  valueListenable: alarmController.alarmBox.listenable(),
                  builder: (context, alarmBox, _) {
                    final alarms = alarmBox.values.toList().cast<Alarm>();
                    alarmController.alarms = alarms;
                    return alarms.isNotEmpty
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: alarms.length,
                                  itemBuilder: (context, alarmItemIndex) {
                                    return AlarmTile(
                                        alarmData: alarms[alarmItemIndex]);
                                  })
                            ],
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(
                                child: Icon(
                                  Icons.alarm_off,
                                  size: 50,
                                ),
                              ),
                            ],
                          );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
