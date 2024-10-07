import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snooze_slayer/models/alarm_model.dart';

class RepeatDaysBottomSheet extends StatefulWidget {
  @override
  _RepeatDaysBottomSheetState createState() => _RepeatDaysBottomSheetState();
  final Alarm alarmData;

  const RepeatDaysBottomSheet({super.key, required this.alarmData});
}

class _RepeatDaysBottomSheetState extends State<RepeatDaysBottomSheet> {
  String? selectedRepeatOption;

  @override
  Widget build(BuildContext context) {
    final alarmData = widget.alarmData;
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
                var itemEnabled =
                    alarmData.repeat!.contains(alarmData.daysShort[index]) ||
                        alarmData.repeat.toString() == "[Daily]";
                return CheckboxListTile(
                  value: itemEnabled,
                  onChanged: (value) {
                    setState(() {
                      itemEnabled = value!;
                    });
                    if (value != true) {
                      alarmData.repeat!
                          .remove(alarmData.daysShort.elementAt(index));
                    } else {
                      alarmData.repeat!.add(alarmData.daysShort[index]);
                    }
                    alarmData.repeat!.sort((a, b) => alarmData.daysShort
                        .indexOf(a)
                        .compareTo(alarmData.daysShort.indexOf(b)));
                    if (alarmData.repeat.toString() ==
                        alarmData.daysShort.toString()) {
                      alarmData.repeat = ["Daily"];
                    }

                    print(alarmData.repeat);
                  },
                  title: Text(alarmData.days[index]),
                );
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Color(0xff343434)),
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)))),
              onPressed: () {
                Get.back();
              },
              child: Text('Done'),
            ),
          ],
        ),
      ),
    );
  }
}
