import 'package:flutter/material.dart';
import 'package:productivity/components/AppComponents/button.dart';
import 'package:productivity/components/LoginComponents/input_field.dart';
import 'package:productivity/providers/task_provider.dart';

import 'package:productivity/utils/device/device_utils.dart';
import 'package:provider/provider.dart';

class CreateDialog extends StatelessWidget {
  const CreateDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController createController = TextEditingController();
    return Consumer<TaskProvider>(
      builder: (context, taskProvider, child) => AlertDialog(
        backgroundColor: Colors.grey.shade400,
        content: Container(
          padding:
              const EdgeInsets.only(top: 18, left: 10, right: 10, bottom: 12),
          height: DeviceUtils.getHeight(context) * 0.157,
          width: DeviceUtils.getWidth(context) * 0.7,
          decoration: const BoxDecoration(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 18),
                child: InputField(
                  hint: "Enter Task Name",
                  controller: createController,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MyButton(
                    text: "Save",
                    onPressed: () {
                      taskProvider.addTask(createController.text);
                      Navigator.of(context).pop();
                      createController.clear();
                    },
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  MyButton(
                    text: "Cancel",
                    onPressed: () {
                      Navigator.of(context).pop();
                      createController.clear();
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
