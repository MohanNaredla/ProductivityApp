// ignore_for_file: unused_element
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:productivity/components/AppComponents/create_dialog.dart';
import 'package:productivity/components/AppComponents/task_tile.dart';
import 'package:productivity/pages/FallBackPages/empty_tasks.dart';
import 'package:productivity/providers/task_provider.dart';
import 'package:productivity/components/AppComponents/app_bar_title.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  @override
  Widget build(BuildContext context) {
    void createDialog() {
      showGeneralDialog(
        context: context,
        transitionBuilder: (context, animation, secondaryAnimation, child) =>
            ScaleTransition(
          scale: Tween<double>(begin: 0.5, end: 1.0).animate(animation),
          child: FadeTransition(
              opacity: Tween<double>(begin: 0.92, end: 1.0).animate(animation),
              child: const CreateDialog()),
        ),
        barrierDismissible: true,
        barrierLabel: '',
        transitionDuration: const Duration(milliseconds: 400),
        pageBuilder: (_, __, ___) => Container(),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitle(title: "Tasks"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Consumer<TaskProvider>(
          builder: (_, taskProvider, child) => taskProvider.tasks.isEmpty
              ? const EmptyTasks()
              : ListView.builder(
                  itemCount: taskProvider.tasks.length,
                  itemBuilder: (context, index) {
                    return TaskTile(
                      taskName: taskProvider.tasks[index][0],
                      isCompleted: taskProvider.tasks[index][1],
                      onClicked: (value) {
                        taskProvider.toggleCompletion(index);
                      },
                      onPressed: (context) => taskProvider.removeTask(index),
                    );
                  },
                ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 12, right: 10),
        child: FloatingActionButton(
          onPressed: () => createDialog(),
          child: const Icon(
            FontAwesomeIcons.plus,
            size: 22,
            color: Color.fromRGBO(255, 255, 255, 0.8),
          ),
        ),
      ),
    );
  }
}
