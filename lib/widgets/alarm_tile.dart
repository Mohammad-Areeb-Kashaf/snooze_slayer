import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:snooze_slayer/models/alarm_model.dart';

class AlarmTile extends StatefulWidget {
  const AlarmTile({super.key, required this.alarmData});

  final Alarm alarmData;

  @override
  State<AlarmTile> createState() => _AlarmTileState();
}

class _AlarmTileState extends State<AlarmTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Material(
        color: Color(0xff242424),
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () {},
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
                        widget.alarmData.label != "none"
                            ? Text(
                                widget.alarmData.label.toString(),
                                style: TextStyle(fontSize: 16),
                              )
                            : SizedBox.shrink(),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 8.0),
                          child: Text(
                            widget.alarmData.time.toString(),
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          widget.alarmData.repeat.toString(),
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FlutterSwitch(
                          value:
                              bool.parse(widget.alarmData.enabled.toString()),
                          onToggle: (bool value) {
                            setState(() {
                              widget.alarmData.enabled = value;
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
                        widget.alarmData.missions != null
                            ? widget.alarmData.missions!.contains("Math")
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
