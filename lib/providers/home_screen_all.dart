// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pomodoro/customs/custom_snackbar.dart';
import 'package:pomodoro/providers/time_picking.dart';
import 'package:pomodoro/providers/to_do_tasks.dart';
import 'package:provider/provider.dart';

class HomeScreenAll extends ChangeNotifier {
  int minutes = 25;
  int seconds = 0;
  bool isTimerWorking = false;

  Map<String, dynamic> currentTask = {"task": null, "index": 0};

  void changeCurrentTask(String? task, int? index) {
    currentTask["task"] = task;
    currentTask["index"] = index;
    notifyListeners();
  }

  bool isPomodoro = true;

  void changeCurrentTimerH(int value) {
    if (value == 0) {
      minutes = 25;
      isPomodoro = true;
    } else if (value == 1) {
      minutes = 5;
      isPomodoro = false;
    } else {
      minutes = 15;
      isPomodoro = false;
    }
    seconds = 0;
    notifyListeners();
  }

  void quitTimer(BuildContext context) {
    minutes = 25;
    seconds = 0;
    isTimerWorking = false;
    Provider.of<TimePicking>(context, listen: false)
        .changeCurrentTimer(0, context);
    notifyListeners();
  }

  void startTimer(BuildContext context) async {
    isTimerWorking = true;
    notifyListeners();

    while (isTimerWorking && (minutes > 0 || seconds > 0)) {
      if (minutes == 0 && seconds == 0) {
        if (isPomodoro) {
          Provider.of<ToDoTasks>(context, listen: false)
              .removeTask(currentTask["index"], context);
          currentTask["task"] = null;
          currentTask["index"] = 0;
          showMySnackbar(context, "Task has been completed. ✔️");
        }
        Provider.of<TimePicking>(context, listen: false)
            .changeCurrentTimer(0, context);
        changeCurrentTimerH(0);
        notifyListeners();
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
          if (isPomodoro) {
            Provider.of<ToDoTasks>(context, listen: false)
                .removeTask(currentTask["index"], context);

            currentTask["task"] = null;
            currentTask["index"] = 0;
            showMySnackbar(context, "Task has been completed.");
          }
          Provider.of<TimePicking>(context, listen: false)
              .changeCurrentTimer(0, context);
          changeCurrentTimerH(0);
          notifyListeners();
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
