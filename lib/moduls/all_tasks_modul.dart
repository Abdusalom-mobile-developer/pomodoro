import 'package:hive/hive.dart';
part 'all_tasks_modul.g.dart';

@HiveType(typeId: 0)
class AllTasksModul {
  @HiveField(0)
  String task;

  @HiveField(1)
  String time;

  AllTasksModul(this.task, this.time);
}
