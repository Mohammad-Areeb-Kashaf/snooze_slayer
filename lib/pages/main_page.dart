import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snooze_slayer/models/alarm_model.dart';
import 'package:snooze_slayer/widgets/alarm_tile.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
                SizedBox(height: 50),
                Text(
                  'Ring in 15hr 49min',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                ),
                SizedBox(height: 10),
                // ValueListenableBuilder(
                //   valueListenable: alarmController.alarmBox.listenable(),
                //   builder: (context, alarmBox, _) {
                    // final alarms = alarmBox!.values.toList().cast<Alarm>();
                    // alarmController.alarms.value = alarms;
                    // return alarms.isNotEmpty
                    //     ? Column(
                    //         mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //         crossAxisAlignment: CrossAxisAlignment.stretch,
                    //         children: [
                    //           ListView.builder(
                    //               shrinkWrap: true,
                    //               physics: NeverScrollableScrollPhysics(),
                    //               itemCount: alarms.length,
                    //               itemBuilder: (context, alarmItemIndex) {
                    //                 return AlarmTile(
                    //                     alarmData: alarms[alarmItemIndex]);
                    //               })
                    //         ],
                    //       )
                    //     : Column(
                    //         mainAxisAlignment: MainAxisAlignment.center,
                    //         crossAxisAlignment: CrossAxisAlignment.center,
                    //         children: [
                    //           Center(
                    //             child: Icon(
                    //               Icons.alarm_off,
                    //               size: 50,
                    //             ),
                    //           ),
                    //         ],
                    //       );
                //     return SizedBox();
                //   },
                // ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // alarmController.createAlarm(Alarm(
          //   label: "Alarm Label",
          //   time: '04:00 AM',
          //   repeat: ["Once"],
          //   enabled: true,
          // ));
          // alarmController.readAlarms();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
