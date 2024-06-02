import 'package:hive_flutter/hive_flutter.dart';

class TasksDatabase {
  List tasks = [];
  final _myBox = Hive.box("TodoBox");

  void loadData() {
    tasks = _myBox.get(
      "TASKS",
      defaultValue: tasks,
    );
  }

  void updateTasks(List task) {
    _myBox.put("TASKS", task);
  }
}
