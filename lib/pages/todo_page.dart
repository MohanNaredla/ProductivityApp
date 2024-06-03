// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:productivity/components/AppComponents/create_dialog.dart';
import 'package:productivity/components/AppComponents/task_tile.dart';
import 'package:productivity/pages/FallBackPages/empty_tasks.dart';
import 'package:productivity/providers/task_provider.dart';
import 'package:provider/provider.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  @override
  Widget build(BuildContext context) {
    void createDialog() {
      showDialog(
        context: context,
        builder: (_) => const CreateDialog(),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(top: 14),
          child: Text(
            "Tasks",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 32,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
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
