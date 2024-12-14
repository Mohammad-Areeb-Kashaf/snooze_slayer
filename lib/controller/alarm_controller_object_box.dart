import 'package:get/get.dart';
import 'package:snooze_slayer/models/alarm_model.dart';
import 'package:snooze_slayer/objectbox.g.dart';

class AlarmControllerObjectBox extends GetxController {
  late final Store _store;
  late final Box<Alarm> alarmBox;
  final RxList<Alarm> alarms = <Alarm>[].obs;

  AlarmControllerObjectBox._init(this._store) {
    alarmBox = Box<Alarm>(_store);
  }

  static Future<AlarmControllerObjectBox> init() async {
    final store = await openStore();
    return AlarmControllerObjectBox._init(store);
  }

  @override
  onInit() {
    super.onInit();
    getAlarms();
  }

  getAlarms() {
    getAlarmsStream().listen((alarmItems) {
      alarms.clear();
      if (alarmItems.isNotEmpty) {
        alarms.addAll(alarmItems);
      }
    });
  }

  Alarm getAlarm(int id) => alarms.firstWhere((alarm) => alarm.id == id);

  Stream<List<Alarm>> getAlarmsStream() => alarmBox
      .query()
      .watch(triggerImmediately: true)
      .map((query) => query.find());

  int createAlarm(Alarm alarm) => alarmBox.put(alarm);

  void updateAlarm(Alarm alarm) => alarmBox.put(alarm);

  bool deleteAlarm(int id) => alarmBox.remove(id);
}
