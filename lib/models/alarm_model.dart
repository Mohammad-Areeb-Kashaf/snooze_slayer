import 'dart:convert';
import 'package:objectbox/objectbox.dart';

Alarm alarmFromMap(String str) => Alarm.fromMap(json.decode(str));

String alarmToMap(Alarm data) => json.encode(data.toMap());

@Entity()
class Alarm {
  int id = 0;
  String? label;
  String? time;
  List<String> daysShort = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"];
  List<String> days = [
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday"
  ];
  List<String> repeat;
  List<String>? missions;
  bool enabled = true;
  Snooze? snooze;

  Alarm({
    this.id = 0,
    this.label = "none",
    this.time = '03:50 PM',
    required this.repeat,
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
        id: json['id'],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "label": label,
        "time": time,
        "repeat": repeat,
        "missions": List<String>.from(missions!.map((x) => x)),
        "enabled": enabled,
        "snooze": snooze!.toMap(),
      };
}

class Snooze {
  final int minutes;
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
