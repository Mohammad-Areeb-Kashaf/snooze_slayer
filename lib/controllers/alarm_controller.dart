import 'package:hive/hive.dart';
import 'package:snooze_slayer/models/alarm_model.dart';

class AlarmDBController {
  var alarms = <Alarm>[];

  Box<Alarm> alarmBox = Hive.box<Alarm>("alarms");

  addCurrentAlarms() {
    alarms = [
      Alarm(
        label: "Alarm 1",
        time: "4:00 PM",
        repeat: ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"],
        missions: ["Math"],
        snooze: Snooze(minutes: 5, times: 5),
      ),
      Alarm(
        time: "6:00 PM",
        repeat: ["SUN", "MON", "TUE"],
      ),
      Alarm(
        time: "6:00 PM",
      ),
    ];
    for (var alarm in alarms) {
      alarmBox.add(alarm);
    }
  }
}
