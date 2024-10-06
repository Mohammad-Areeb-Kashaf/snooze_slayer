import 'dart:convert';

Alarm alarmFromMap(String str) => Alarm.fromMap(json.decode(str));

String alarmToMap(Alarm data) => json.encode(data.toMap());

class Alarm {
  String? label;
  String? time;
  List<String> days = [
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday"
  ];
  String? repeat;
  List<dynamic>? missions;

  bool enabled = true;
  Snooze? snooze;

  Alarm({
    this.label = "none",
    this.time = '03:50 PM',
    this.repeat = "Daily",
    this.missions,
    this.enabled = true,
    this.snooze,
  });

  factory Alarm.fromMap(Map<String, dynamic> json) => Alarm(
        label: json["label"],
        time: json["time"],
        repeat: json["Daily"],
        missions: List<dynamic>.from(json["missions"].map((x) => x)),
        enabled: json["enabled"],
        snooze: Snooze.fromMap(json["snooze"]),
      );

  Map<String, dynamic> toMap() => {
        "label": label,
        "time": time,
        "repeat": repeat,
        "missions": List<dynamic>.from(missions!.map((x) => x)),
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
