import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:snooze_slayer/models/alarm_model.dart';
import 'package:snooze_slayer/pages/alarm_details_page.dart';

class AlarmTile extends StatefulWidget {
  const AlarmTile({super.key, required this.alarmData});

  final Alarm alarmData;

  @override
  State<AlarmTile> createState() => _AlarmTileState();
}

class _AlarmTileState extends State<AlarmTile> {
  @override
  Widget build(BuildContext context) {
    final alarmData = widget.alarmData;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Material(
        color: Color(0xff242424),
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () {
            Get.to(AlarmDetailsPage(alarmData: alarmData));
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
                                style: TextStyle(fontSize: 16),
                              )
                            : SizedBox.shrink(),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 8.0),
                          child: Text(
                            alarmData.time.toString(),
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          alarmData.repeat == alarmData.daysShort
                              ? "Daily"
                              : alarmData.repeat
                                  .toString()
                                  .replaceFirst("[", "")
                                  .replaceFirst("]", ""),
                          style: TextStyle(fontSize: 14),
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
                          activeColor: Color(0xff000000),
                          inactiveColor: Color(0xff343434),
                          inactiveToggleColor: Color(0xff444444),
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
