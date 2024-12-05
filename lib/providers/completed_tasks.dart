import 'package:flutter/material.dart';
import 'package:pomodoro/main.dart';
import 'package:pomodoro/moduls/all_tasks_modul.dart';

class CompletedTasks extends ChangeNotifier {
  List<AllTasksModul> tasks = [];


  void addNewCompletedTask(AllTasksModul task) async {
    tasks.add(task);
    notifyListeners();
    await box2.add(task);
  }

  void getAllCompletedTasks() {
    tasks.addAll(box2.values);
  }
}
