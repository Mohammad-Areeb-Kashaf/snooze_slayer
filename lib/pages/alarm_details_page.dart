import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scroll_datetime_picker/scroll_datetime_picker.dart';
import 'package:snooze_slayer/models/alarm_model.dart';

class AlarmDetailsPage extends StatefulWidget {
  const AlarmDetailsPage({super.key, required this.alarmData});

  final Alarm alarmData;

  @override
  State<AlarmDetailsPage> createState() => _AlarmDetailsPageState();
}

class _AlarmDetailsPageState extends State<AlarmDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final alarmData = widget.alarmData;
    return Scaffold(
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
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xff242424),
                      borderRadius: BorderRadius.circular(8)),
                  child: ScrollDateTimePicker(
                    itemExtent: 54,
                    dateOption: DateTimePickerOption(
                        dateFormat: DateFormat("h:mm a"),
                        minDate: DateTime(1900, 1, 1),
                        maxDate: DateTime(2200, 1, 1),
                        initialDate: DateFormat("h:mm a")
                            .parse(alarmData.time.toString())),
                    onChange: (time) {
                      alarmData.time = DateFormat("h:mm a").format(time);
                      print(alarmData.time);
                    },
                    infiniteScroll: true,
                    centerWidget: DateTimePickerCenterWidget(
                      builder: (context, constraints, child) =>
                          const DecoratedBox(
                        decoration: BoxDecoration(
                          color: Color(0xff242424),
                          border: Border(
                            top: BorderSide(width: 3, color: Colors.white),
                            bottom: BorderSide(width: 3, color: Colors.white),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
