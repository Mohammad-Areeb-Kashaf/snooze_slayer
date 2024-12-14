import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:snooze_slayer/helper/object_box.dart';
import 'package:snooze_slayer/models/alarm_model.dart';
import 'package:snooze_slayer/pages/alarm_details_page.dart';

class AlarmTile extends StatefulWidget {
  const AlarmTile({super.key, required this.id});

  final int id;

  @override
  State<AlarmTile> createState() => _AlarmTileState();
}

class _AlarmTileState extends State<AlarmTile> {
  late ObjectBox objectBox;
  late Alarm alarmData;

  @override
  void initState() {
    super.initState();
    objectBox = Get.find<ObjectBox>();
    alarmData = objectBox.getAlarm(widget.id)!;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Material(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () {
            Get.to(() => AlarmDetailsPage(id: alarmData.id));
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        alarmData.label != "none"
                            ? Text(
                                alarmData.label.toString(),
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              )
                            : SizedBox.shrink(),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5.0,
                          ),
                          child: Text(
                            alarmData.time.toString(),
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          alarmData.repeat.toString() ==
                                  alarmData.daysShort.toString()
                              ? "Daily"
                              : alarmData.repeat
                                  .toString()
                                  .replaceFirst("[", "")
                                  .replaceFirst("]", ""),
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FlutterSwitch(
                          value: bool.parse(alarmData.enabled.toString()),
                          onToggle: (bool value) {
                            setState(() {
                              alarmData.enabled = value;
                            });
                          },
                          activeColor: Theme.of(context).colorScheme.primary,
                          inactiveColor: Theme.of(context).colorScheme.surface,
                          inactiveToggleColor:
                              Theme.of(context).colorScheme.secondary,
                          activeToggleColor:
                              Theme.of(context).colorScheme.tertiary,
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Missions',
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(width: 10),
                        alarmData.missions != null
                            ? alarmData.missions!.contains("Math")
                                ? SvgPicture.asset(
                                    'assets/icons/calculate.svg',
                                    height: 30,
                                    width: 30,
                                  )
                                : Icon(
                                    Icons.close,
                                    size: 30,
                                  )
                            : Icon(
                                Icons.close,
                                size: 30,
                              )
                      ],
                    ),
                    PopupMenuButton(
                      itemBuilder: (BuildContext context) {
                        return [
                          PopupMenuItem(
                            child: Text('Delete'),
                            onTap: () {
                              objectBox.deleteAlarm(alarmData.id);
                            },
                          ),
                        ];
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
