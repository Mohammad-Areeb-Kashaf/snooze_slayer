import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snooze_slayer/controller/theme_controller.dart';
import 'package:snooze_slayer/models/alarm_model.dart';
import 'package:snooze_slayer/widgets/alarm_tile.dart';
import 'package:snooze_slayer/widgets/scaffold_background.dart';

import '../controller/alarm_controller_object_box.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final AlarmControllerObjectBox alarmControllerObjectBox =
      Get.find<AlarmControllerObjectBox>();

  @override
  Widget build(BuildContext context) {
    return ScaffoldBackground(
      child: Scaffold(
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
                  Obx(() {
                    final alarms = alarmControllerObjectBox.alarms;
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
                                      id: alarms[alarmItemIndex].id);
                                },
                              ),
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
                  }),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            alarmControllerObjectBox.createAlarm(Alarm(
              label: "Alarm Label",
              time: '04:00 AM',
              repeat: ["Once"],
              enabled: true,
            ));
            final themeController = Get.find<ThemeController>();
            themeController.changeThemeMode();
          },
          child: Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.alarm), label: 'Alarm'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Settings'),
          ],
        ),
      ),
    );
  }
}
