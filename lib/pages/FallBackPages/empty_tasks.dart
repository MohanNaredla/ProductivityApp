import 'package:flutter/material.dart';
import 'package:productivity/components/AppComponents/empty_text.dart';

class EmptyTasks extends StatelessWidget {
  const EmptyTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return const EmptyText(
      text: "Get Started By Creating a Task By Clicking on The Button Below",
    );
  }
}
