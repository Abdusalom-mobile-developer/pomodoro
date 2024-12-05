import 'package:flutter/material.dart';
import 'package:pomodoro/main.dart';
import 'package:pomodoro/moduls/all_tasks_modul.dart';
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

  void getTasks() {
    tasks.addAll(box.values);
    notifyListeners();
  }

  void addNewTask(AllTasksModul task) async {
    await box.add(task);
    tasks.add(task);
    notifyListeners();
  }

  void removeTask(int index, BuildContext context) async {
    Provider.of<CompletedTasks>(context, listen: false)
        .addNewCompletedTask(tasks[index]);
    notifyListeners();
    for (var entry in box.toMap().entries) {
      var key = entry.key;
      var value = entry.value;

      if (value.task == tasks[index].task) {
        await box.delete(key);
      }
    }
    tasks.removeAt(index);
    notifyListeners();
  }
}
