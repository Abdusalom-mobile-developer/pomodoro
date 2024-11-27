import 'package:flutter/material.dart';
import 'package:pomodoro/customs/custom_timer_buttons.dart';

class TimePicking extends ChangeNotifier {
  int currentTimer = 0;
  List<Widget> buttons = [
    CustomTimerButtons(
      true,
      "Pomodoro",
      0,
    ),
    CustomTimerButtons(
      false,
      "Short Break",
      1,
    ),
    CustomTimerButtons(
      false,
      "Long Break",
      2,
    )
  ];
  List<String> contents = [
    "Pomodoro",
    "Short Break",
    "Long Break",
  ];

  void changeCurrentTimer(int value, BuildContext context) {
    currentTimer = value;

    buttons.clear();

    for (int i = 0; i < 3; i++) {
      buttons.add(CustomTimerButtons(
        i == currentTimer,
        contents[i],
        i,
      ));
    }

    notifyListeners();
  }
}
