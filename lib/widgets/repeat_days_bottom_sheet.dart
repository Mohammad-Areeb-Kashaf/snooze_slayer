import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:snooze_slayer/models/alarm_model.dart';

class RepeatDaysBottomSheet extends StatefulWidget {
  const RepeatDaysBottomSheet({super.key, required this.alarmData});
  final Alarm alarmData;

  @override
  State<RepeatDaysBottomSheet> createState() => _RepeatDaysBottomSheetState();
}

class _RepeatDaysBottomSheetState extends State<RepeatDaysBottomSheet> {
  String? selectedRepeatOption;

  @override
  Widget build(BuildContext context) {
    final alarmData = widget.alarmData;
    if (alarmData.repeat.toString() == "[Once]") {
      alarmData.repeat.remove("Once");
      print(alarmData.repeat.toString());
      print("day: ${DateTime.now().weekday}");
      alarmData.repeat.add(alarmData.daysShort[
          DateFormat("h:mm a").parse(alarmData.time.toString()).weekday]);
    } else if (alarmData.repeat.toString() == "[Daily]") {
      alarmData.repeat.remove("Daily");
      alarmData.repeat = alarmData.daysShort;
    }
    return Container(
      padding: EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text('Repeat',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 16),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: alarmData.daysShort.length,
              itemBuilder: (BuildContext context, index) {
                List<bool> enabledRepeatDays = [];

                enabledRepeatDays =
                    List.generate(alarmData.daysShort.length, (index) {
                  if (alarmData.repeat.contains(alarmData.daysShort[index]) ||
                      alarmData.repeat == ["Daily"]) {
                    return true;
                  } else {
                    return false;
                  }
                }, growable: false);

                return CheckboxListTile(
                  value: enabledRepeatDays[index],
                  onChanged: (value) {
                    setState(() {
                      enabledRepeatDays[index] = value!;
                    });

                    if (value != true) {
                      setState(() {
                        alarmData.repeat
                            .remove(alarmData.daysShort.elementAt(index));
                        enabledRepeatDays[index] = value!;
                      });
                    } else {
                      setState(() {
                        alarmData.repeat.add(alarmData.daysShort[index]);
                        enabledRepeatDays[index] = value!;
                      });
                    }
                    setState(() {
                      alarmData.repeat.sort((a, b) => alarmData.daysShort
                          .indexOf(a)
                          .compareTo(alarmData.daysShort.indexOf(b)));
                    });
                    if (alarmData.repeat.toString() ==
                        alarmData.daysShort.toString()) {
                      setState(() {
                        enabledRepeatDays = List.generate(6, (index) {
                          return true;
                        });
                        alarmData.repeat = ["Daily"];
                      });
                    }
                  },
                  title: Text(alarmData.days[index]),
                );
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                      Theme.of(context).colorScheme.primary),
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)))),
              onPressed: () {
                Get.back();
              },
              child: Text(
                'Done',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
