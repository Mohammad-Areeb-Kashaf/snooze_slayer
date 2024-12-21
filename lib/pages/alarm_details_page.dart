import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scroll_datetime_picker/scroll_datetime_picker.dart';
import 'package:snooze_slayer/models/alarm_model.dart';
import 'package:snooze_slayer/widgets/repeat_days_bottom_sheet.dart';
import 'package:snooze_slayer/widgets/scaffold_background.dart';

import '../controller/alarm_controller_object_box.dart';

class AlarmDetailsPage extends StatefulWidget {
  const AlarmDetailsPage({super.key, required this.id});

  final int id;

  @override
  State<AlarmDetailsPage> createState() => _AlarmDetailsPageState();
}

class _AlarmDetailsPageState extends State<AlarmDetailsPage> {
  late AlarmControllerObjectBox alarmControllerObjectBox;
  late Alarm alarmData;

  @override
  Widget build(BuildContext context) {
    return ScaffoldBackground(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Ring in 8 hr. 27 min'),
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back_ios)),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Obx(() {
                alarmControllerObjectBox = Get.find<AlarmControllerObjectBox>();
                alarmData = alarmControllerObjectBox.getAlarm(widget.id);
                return Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        children: [
                          ScrollDateTimePicker(
                            itemExtent: 54,
                            dateOption: DateTimePickerOption(
                                dateFormat: DateFormat("h:mm a"),
                                minDate: DateTime(1900, 1, 1),
                                maxDate: DateTime(2200, 1, 1),
                                initialDate: DateFormat("h:mm a")
                                    .parse(alarmData.time.toString())),
                            onChange: (time) {
                              alarmData.time =
                                  DateFormat("h:mm a").format(time);
                            },
                            infiniteScroll: false,
                            centerWidget: DateTimePickerCenterWidget(
                              builder: (context, constraints, child) =>
                                  DecoratedBox(
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.primary,
                                  border: Border(
                                    top: BorderSide(
                                        width: 3, color: Colors.white),
                                    bottom: BorderSide(
                                        width: 3, color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            style: DateTimePickerStyle(
                              activeStyle: const TextStyle(
                                fontSize: 28,
                                letterSpacing: -0.5,
                                color: Colors.white,
                              ),
                              inactiveStyle: TextStyle(
                                fontSize: 20,
                                color: Colors.grey,
                              ),
                              disabledStyle: TextStyle(
                                fontSize: 20,
                                color: Theme.of(context).disabledColor,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) =>
                                    RepeatDaysBottomSheet(
                                  id: alarmData.id,
                                ),
                                barrierLabel: "Repeat",
                              );
                              setState(() {});
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Repeat'),
                                  Spacer(),
                                  Flexible(
                                    child: Text(
                                      alarmData.repeat
                                          .toString()
                                          .replaceFirst("[", "")
                                          .replaceFirst("]", ""),
                                    ),
                                  ),
                                  Icon(Icons.keyboard_arrow_right),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }
              ),
            ),
          ),
        ),
      ),
    );
  }
}
