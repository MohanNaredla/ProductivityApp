import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:productivity/pages/FallBackPages/work_timer.dart';
import 'package:productivity/providers/timer_provider.dart';
import 'package:productivity/pages/FallBackPages/break_timer.dart';
import 'package:productivity/pages/bottom_navigation.dart';
import 'package:productivity/utils/helper_functions/custom_page_route.dart';

class PomodoroTimer extends StatefulWidget {
  const PomodoroTimer({
    super.key,
  });

  @override
  State<PomodoroTimer> createState() => _PomodoroTimerState();
}

class _PomodoroTimerState extends State<PomodoroTimer> {
  @override
  Widget build(BuildContext context) {
    final timerProvider = Provider.of<TimerProvider>(context);
    while (true) {
      if (timerProvider.checkWorkCompleted()) {
        timerProvider.isWorkCompleted = false;
        Future.delayed(
          Duration(
            seconds: timerProvider.totalBreakTime.inSeconds,
          ),
          () {
            Navigator.of(context).pushReplacement(
              CustomPageRoute(
                page: const BottomNavigation(),
              ),
            );
          },
        );
        return const BreakTimer();
      } else {
        return const WorkTimer();
      }
    }
  }
}
