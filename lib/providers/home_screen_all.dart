import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreenAll extends ChangeNotifier {
  int minutes = 1;
  int seconds = 0;
  bool isTimerWorking = false;

  void startTimer() async {
    isTimerWorking = true;
    notifyListeners();
    
    while (minutes > 0 || seconds > 0) {
      if (minutes == 0 && seconds == 0) {
        break;
      }

      await Future.delayed(const Duration(seconds: 1));
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

    minutes = 1;
    seconds = 0;
    notifyListeners();
  }
}
