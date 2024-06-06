import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:productivity/data/tasks_database.dart';

class TaskProvider with ChangeNotifier {
  final box = Hive.box("TodoBox");
  TasksDatabase db = TasksDatabase();
  List _tasks = [];

  TaskProvider() {
    _initialiseData();
  }

  void _initialiseData() {
    db.loadData();
    _tasks = db.tasks;
    notifyListeners();
  }

  List get tasks => _tasks;

  void toggleCompletion(int index) {
    _tasks[index][1] = !_tasks[index][1];
    final List list = _tasks.removeAt(index);
    _tasks.add(list);
    db.updateTasks(_tasks);
    notifyListeners();
  }

  void addTask(String name) {
    _tasks.add([name, false]);
    db.updateTasks(_tasks);
    notifyListeners();
  }

  void removeTask(int index) {
    _tasks.removeAt(index);
    db.updateTasks(_tasks);
    notifyListeners();
  }
}
