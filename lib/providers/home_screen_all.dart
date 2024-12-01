import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pomodoro/providers/time_picking.dart';
import 'package:pomodoro/providers/to_do_tasks.dart';
import 'package:provider/provider.dart';

class HomeScreenAll extends ChangeNotifier {
  int minutes = 25;
  int seconds = 0;
  bool isTimerWorking = false;

  Map<String, dynamic> currentTask = {"task": "", "index": 0};

  void changeCurrentTask(String task, int index) {
    currentTask["task"] = task;
    currentTask["index"] = index;
    notifyListeners();
  }

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

  void startTimer(BuildContext context) async {
    isTimerWorking = true;
    notifyListeners();

    while (isTimerWorking && (minutes > 0 || seconds > 0)) {
      if (minutes == 0 && seconds == 0) {
        // ignore: use_build_context_synchronously
        Provider.of<ToDoTasks>(context, listen: false)
            // ignore: use_build_context_synchronously
            .removeTask(currentTask["index"], context);
        changeCurrentTimerH(0);
        // ignore: use_build_context_synchronously
        Provider.of<TimePicking>(context, listen: false).changeCurrentTimer(0, context);
        break;
      }

      if (!isTimerWorking) {
        break;
      }

      seconds--;

      if (seconds <= 0) {
        seconds = 0;
        notifyListeners();
        await Future.delayed(const Duration(seconds: 1));
        if (minutes == 0 && seconds == 0) {
          // ignore: use_build_context_synchronously
          Provider.of<ToDoTasks>(context, listen: false)
              // ignore: use_build_context_synchronously
              .removeTask(currentTask["index"], context);
          changeCurrentTimerH(0);
           // ignore: use_build_context_synchronously
           Provider.of<TimePicking>(context, listen: false).changeCurrentTimer(0, context);
          break;
        }
        minutes -= 1;
        seconds = 59;
        notifyListeners();
      }

      notifyListeners();
      await Future.delayed(const Duration(seconds: 1));
    }

    minutes = 25;
    seconds = 0;
    isTimerWorking = false;
    notifyListeners();
  }
}
