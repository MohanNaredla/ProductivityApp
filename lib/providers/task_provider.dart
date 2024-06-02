import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TaskProvider with ChangeNotifier {
  final box = Hive.box("TodoBox");
  final List _tasks = [
    ["ABC", false],
    ["XYZ", false],
  ];

  List get tasks => _tasks;

  void toggleCompletion(int index) {
    _tasks[index][1] = !_tasks[index][1];
    notifyListeners();
  }

  void addTask(String name) {
    _tasks.add([name, false]);
    notifyListeners();
  }

  void removeTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }
}
