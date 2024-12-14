import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/alarm_controller_object_box.dart';
import '../models/alarm_model.dart';

class RepeatDaysBottomSheet extends StatefulWidget {
  const RepeatDaysBottomSheet({super.key, required this.id});
  final int id;

  @override
  State<RepeatDaysBottomSheet> createState() => _RepeatDaysBottomSheetState();
}

class _RepeatDaysBottomSheetState extends State<RepeatDaysBottomSheet> {
  late final AlarmControllerObjectBox alarmControllerObjectBox;
  late final Alarm? alarmData;

  @override
  void initState() {
    alarmControllerObjectBox = Get.find<AlarmControllerObjectBox>();
    alarmData = alarmControllerObjectBox.getAlarm(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return BottomSheet(
      builder: (context) => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Center(
              //   child: Text(
              //     'Repeat',
              //     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              //   ),
              // ),
              // SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: alarmData?.daysShort.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CheckboxListTile(
                        value: alarmData!.repeat.contains("Daily") ||
                            alarmData!.repeat
                                .contains(alarmData?.daysShort[index]),
                        onChanged: (value) {
                          setState(() {
                            if (alarmData!.repeat.contains("Once")) {
                              alarmData!.repeat.remove("Once");
                            }
                            if (value!) {
                              alarmData!.repeat
                                  .add(alarmData!.daysShort[index]);
                              if (alarmData!.repeat.length ==
                                  alarmData!.daysShort.length) {
                                alarmData!.repeat = ["Daily"];
                              }
                            } else {
                              alarmData!.repeat
                                  .remove(alarmData!.daysShort[index]);
                              if (alarmData!.repeat.isEmpty) {
                                alarmData!.repeat.add("Once");
                              } else if (alarmData!.repeat.contains("Daily")) {
                                alarmData!.repeat.remove("Daily");
                                alarmData?.repeat.addAll(alarmData!.daysShort);
                                alarmData!.repeat
                                    .remove(alarmData!.daysShort[index]);
                              }
                            }
                
                            // Sort the list if it's not "Daily" or "Once"
                            if (alarmData!.repeat.length > 1 &&
                                !alarmData!.repeat.contains("Daily") &&
                                !alarmData!.repeat.contains("Once")) {
                              alarmData!.repeat.sort((a, b) => alarmData!
                                  .daysShort
                                  .indexOf(a)
                                  .compareTo(alarmData!.daysShort.indexOf(b)));
                            }
                          });
                        },
                        title: Text(alarmData!.days[index]),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 16),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                      Theme.of(context).colorScheme.primary),
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
                ),
                onPressed: () {
                  alarmControllerObjectBox.updateAlarm(alarmData!);
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
      ),
      onClosing: () {
        var lastAlarm = alarmControllerObjectBox.getAlarm(alarmData!.id);
        alarmData?.repeat = lastAlarm.repeat;
        alarmControllerObjectBox.updateAlarm(alarmData!);
      },
    );
  }
}
