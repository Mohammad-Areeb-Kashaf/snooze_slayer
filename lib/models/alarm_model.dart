import 'dart:convert';

import 'package:hive/hive.dart';

part 'alarm_model.g.dart';

Alarm alarmFromMap(String str) => Alarm.fromMap(json.decode(str));

String alarmToMap(Alarm data) => json.encode(data.toMap());

@HiveType(typeId: 0, adapterName: "AlarmAdapter")
class Alarm extends HiveObject {
  @HiveField(0)
  String? label;
  @HiveField(1)
  String? time;
  @HiveField(2)
  List<String> daysShort = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"];
  @HiveField(3)
  List<String> days = [
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday"
  ];
  @HiveField(4)
  List<String>? repeat;
  @HiveField(5)
  List<String>? missions;

  @HiveField(6)
  bool enabled = true;
  @HiveField(7)
  Snooze? snooze;

  Alarm({
    this.label = "none",
    this.time = '03:50 PM',
    this.repeat,
    this.missions,
    this.enabled = true,
    this.snooze,
  });

  factory Alarm.fromMap(Map<String, dynamic> json) => Alarm(
        label: json["label"],
        time: json["time"],
        repeat: json["repeat"],
        missions: List<String>.from(json["missions"].map((x) => x)),
        enabled: json["enabled"],
        snooze: Snooze.fromMap(json["snooze"]),
      );

  Map<String, dynamic> toMap() => {
        "label": label,
        "time": time,
        "repeat": repeat,
        "missions": List<String>.from(missions!.map((x) => x)),
        "enabled": enabled,
        "snooze": snooze!.toMap(),
      };
}

@HiveType(typeId: 1, adapterName: "SnoozeAdapter")
class Snooze {
  @HiveField(0)
  final int minutes;
  @HiveField(1)
  final int times;

  Snooze({
    required this.minutes,
    required this.times,
  });

  factory Snooze.fromMap(Map<String, dynamic> json) => Snooze(
        minutes: json["minutes"],
        times: json["times"],
      );

  Map<String, dynamic> toMap() => {
        "minutes": minutes,
        "times": times,
      };
}
