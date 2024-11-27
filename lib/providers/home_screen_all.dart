import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreenAll extends ChangeNotifier {
  int minutes = 25;
  int seconds = 0;
  bool isTimerWorking = false;

  void changeCurrentTimerH(int value) {
    if (value == 0) {
      minutes = 25;
    } else if (value == 1) {
      minutes = 5;
    } else {
      minutes = 15;
    }
    seconds = 0;
    notifyListeners();
  }

  void quitTimer() {
    minutes = 25;
    seconds = 0;
    isTimerWorking = false;
    notifyListeners();
  }

  void startTimer() async {
    isTimerWorking = true;
    notifyListeners();

    while (isTimerWorking && (minutes > 0 || seconds > 0)) {
      if (minutes == 0 && seconds == 0) {
        break;
      }

      await Future.delayed(const Duration(seconds: 1));

      if (!isTimerWorking) {
        break;
      }

      seconds--;
      notifyListeners();

      if (seconds <= 0) {
        seconds = 0;
        notifyListeners();
        await Future.delayed(const Duration(seconds: 1));
        if (minutes == 0 && seconds == 0) {
          break;
        }
        minutes -= 1;
        seconds = 59;
        notifyListeners();
      }
    }

    minutes = 25;
    seconds = 0;
    isTimerWorking = false;
    notifyListeners();
  }
}
