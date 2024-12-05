import 'package:flutter/material.dart';
import 'package:pomodoro/moduls/all_tasks_modul.dart';

class CompletedTasks extends ChangeNotifier {
  List<AllTasksModul> tasks = [
    AllTasksModul("Start new Project",
        "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}"),
  ];

  void addNewCompletedTask(AllTasksModul task) {
    tasks.add(task);
    notifyListeners();
  }
}
