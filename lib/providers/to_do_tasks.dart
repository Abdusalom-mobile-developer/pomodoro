import 'package:flutter/material.dart';
import 'package:pomodoro/moduls/unfinshed_tasks_md.dart';
import 'package:pomodoro/providers/completed_tasks.dart';
import 'package:provider/provider.dart';

class ToDoTasks extends ChangeNotifier {
  List<AllTasksModul> tasks = [
    AllTasksModul("Read Book",
        "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}"),
    AllTasksModul("Clean the Room",
        "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}"),
    AllTasksModul("Finish All HW",
        "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}"),
    AllTasksModul("Start new Project",
        "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}"),
  ];

  void removeTask(int index, BuildContext context) {
    Provider.of<CompletedTasks>(context, listen: false).addNewCompletedTask(tasks[index]);
    tasks.removeAt(index);
    notifyListeners();
  }
}
