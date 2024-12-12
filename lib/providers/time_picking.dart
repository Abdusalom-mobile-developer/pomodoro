import 'package:flutter/material.dart';
import 'package:pomodoro/customs/custom_timer_buttons.dart';
import 'package:pomodoro/providers/home_screen_all.dart';
import 'package:provider/provider.dart';

class TimePicking extends ChangeNotifier {
  int currentTimer = 0;
  List<Widget> buttons = [
    CustomTimerButtons(
      true,
      "25 mins",
      0,
    ),
    CustomTimerButtons(
      false,
      "5 mins",
      1,
    ),
    CustomTimerButtons(
      false,
      "15 mins",
      2,
    )
  ];
  List<String> contents = [
    "25 mins",
    "5 mins",
    "15 mins",
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
    Provider.of<HomeScreenAll>(context, listen: false)
        .changeCurrentTimerH(value);
  }
}
