import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';

class AlarmTile extends StatefulWidget {
  const AlarmTile({super.key});

  @override
  State<AlarmTile> createState() => _AlarmTileState();
}

class _AlarmTileState extends State<AlarmTile> {
  bool isAlarmEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Material(
        color: Color(0xff242424),
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () {
            print("Button pressed");
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
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '7:00 AM',
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                        Text(
                          'Daily',
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(height: 5),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FlutterSwitch(
                          value: isAlarmEnabled,
                          onToggle: (bool value) {
                            setState(() {
                              isAlarmEnabled = value;
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
                        SvgPicture.asset(
                          'assets/icons/calculate.svg',
                          height: 30,
                          width: 30,
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
