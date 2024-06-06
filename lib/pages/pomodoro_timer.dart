import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:productivity/pages/FallBackPages/work_timer.dart';
import 'package:productivity/pages/bottom_navigation.dart';
import 'package:productivity/providers/timer_provider.dart';

class PomodoroTimer extends StatefulWidget {
  const PomodoroTimer({super.key});

  @override
  State<PomodoroTimer> createState() => _PomodoroTimerState();
}

class _PomodoroTimerState extends State<PomodoroTimer> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TimerProvider>(
      builder: (context, value, child) =>
          value.isCompleted ? const BottomNavigation() : const WorkTimer(),
    );
  }
}
