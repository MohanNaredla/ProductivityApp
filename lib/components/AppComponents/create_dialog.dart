import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:productivity/components/AppComponents/button.dart';
import 'package:productivity/components/LoginComponents/input_field.dart';
import 'package:productivity/providers/task_provider.dart';
import 'package:productivity/utils/constants/colors.dart';

class CreateDialog extends StatelessWidget {
  const CreateDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController createController = TextEditingController();
    return Consumer<TaskProvider>(
      builder: (context, taskProvider, child) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
        backgroundColor: AppColors.background_light,
        content: Padding(
          padding: const EdgeInsets.only(
            top: 24.0,
            bottom: 0.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 38,
                ),
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
