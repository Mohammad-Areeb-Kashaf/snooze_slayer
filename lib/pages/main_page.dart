import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snooze_slayer/helper/object_box.dart';
import 'package:snooze_slayer/models/alarm_model.dart';
import 'package:snooze_slayer/widgets/alarm_tile.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isAlarmEnabled = true;
  late ObjectBox objectBox;
  late Stream<List<Alarm>> streamAlarms;

  @override
  void initState() {
    super.initState();
    objectBox = Get.find<ObjectBox>();
    streamAlarms = objectBox.getAlarmsStream();
  }

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
                StreamBuilder(
                  stream: streamAlarms,
                  builder: (context, snapshot) {
                    final alarms = snapshot.data;
                    return alarms?.isNotEmpty == true
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: alarms?.length,
                                  itemBuilder: (context, alarmItemIndex) {
                                    return AlarmTile(
                                        id: alarms![alarmItemIndex].id);
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
        onPressed: () {
          objectBox.createAlarm(Alarm(
            label: "Alarm Label",
            time: '04:00 AM',
            repeat: ["Once"],
            enabled: true,
          ));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
