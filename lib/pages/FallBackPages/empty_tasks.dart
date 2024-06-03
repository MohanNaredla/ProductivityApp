import 'package:flutter/material.dart';

class EmptyTasks extends StatelessWidget {
  const EmptyTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 104),
        child: Center(
          child: Text(
            "Get Started By Creating a Task By Clicking on The Button Below",
            textAlign: TextAlign.center,
            softWrap: true,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
