import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool isAlarmEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                    text: 'Welcome, ',
                    children: [
                      TextSpan(
                        text: 'Username',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      )
                    ],
                    style: TextStyle(fontSize: 18)),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 10),
              Text(
                'Ring in 15hr 49min',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              ),
              SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xff191919),
                    ),
                    child: Row(
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
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Mission',
                              style: TextStyle(fontSize: 14),
                            ),
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
                              activeColor: Color(0xff121212),
                              inactiveColor: Color(0xff242424),
                              inactiveToggleColor: Color(0xff343434),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: PopupMenuButton(
                                itemBuilder: (BuildContext context) {
                                  return [
                                    PopupMenuItem(
                                      child: Text('Delete'),
                                    ),
                                    PopupMenuItem(
                                      child: Text('Delete'),
                                    ),
                                    PopupMenuItem(
                                      child: Text('Delete'),
                                    ),
                                  ];
                                },
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
