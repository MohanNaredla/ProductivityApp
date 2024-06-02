import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:productivity/utils/constants/colors.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.taskName,
    required this.isCompleted,
    required this.onClicked,
    required this.onPressed,
  });

  final String taskName;
  final bool isCompleted;
  final Function(bool?)? onClicked;
  final Function(BuildContext context) onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 28,
      ),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              spacing: 6,
              onPressed: onPressed,
              icon: CupertinoIcons.delete_solid,
              backgroundColor: Colors.red.withOpacity(0.85),
              borderRadius: BorderRadius.circular(8),
            ),
          ],
        ),
        child: Container(
          margin: const EdgeInsets.only(right: 2),
          decoration: BoxDecoration(
            color: Colors.grey.shade400,
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.4),
                blurRadius: 10.0,
                spreadRadius: 0.0,
                offset: Offset(2.0, 5.0), // shadow direction: bottom right
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 14,
              horizontal: 8,
            ),
            child: Row(
              children: [
                Checkbox(
                  value: isCompleted,
                  onChanged: onClicked,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  checkColor: Colors.white,
                  fillColor: isCompleted
                      ? const WidgetStatePropertyAll(
                          AppColors.secondary_color_variant,
                        )
                      : const WidgetStatePropertyAll(
                          Colors.transparent,
                        ),
                ),
                Text(
                  taskName,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    decoration: isCompleted ? TextDecoration.lineThrough : null,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
