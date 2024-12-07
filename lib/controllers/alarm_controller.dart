import 'package:hive/hive.dart';
import 'package:snooze_slayer/models/alarm_model.dart';

class AlarmController {
  var alarms = <Alarm>[];
  Box<Alarm> alarmBox = Hive.box<Alarm>("alarms");

  createAlarm(Alarm newAlarm) {
    alarmBox.add(newAlarm);
  }

  updateAlarm(Alarm alarm) {
    alarm.save();
  }

  deleteAlarm(Alarm alarm) {
    alarm.delete();
  }
}
