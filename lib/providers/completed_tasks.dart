import 'package:flutter/material.dart';
import 'package:pomodoro/moduls/unfinshed_tasks_md.dart';

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
