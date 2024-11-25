import 'package:flutter/material.dart';
import 'package:pomodoro/moduls/unfinshed_tasks_md.dart';

class CompletedTasks extends ChangeNotifier {
  List<AllTasksModul> tasks = [
    AllTasksModul("Read Book",
        "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}"),
    AllTasksModul("Clean the Room",
        "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}"),
    AllTasksModul("Finish All HW",
        "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}"),
    AllTasksModul("Start new Project",
        "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}"),
    AllTasksModul("Read Book",
        "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}"),
    AllTasksModul("Clean the Room",
        "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}"),
    AllTasksModul("Finish All HW",
        "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}"),
    AllTasksModul("Start new Project",
        "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}"),
  ];
}
