import 'package:snooze_slayer/models/alarm_model.dart';
import 'package:snooze_slayer/objectbox.g.dart';

class ObjectBox {
  late final Store _store;
  late final Box<Alarm> alarmBox;

  ObjectBox._init(this._store) {
    alarmBox = Box<Alarm>(_store);
  }

  static Future<ObjectBox> init() async {
    final store = await openStore();
    return ObjectBox._init(store);
  }

  Alarm? getAlarm(int id) => alarmBox.get(id);

  Stream<List<Alarm>> getAlarmsStream() => alarmBox.query().watch(triggerImmediately: true).map((query)=> query.find());

  int createAlarm(Alarm alarm) => alarmBox.put(alarm);

  void updateAlarm(Alarm alarm) => alarmBox.put(alarm);

  bool deleteAlarm(int id) => alarmBox.remove(id);
}
