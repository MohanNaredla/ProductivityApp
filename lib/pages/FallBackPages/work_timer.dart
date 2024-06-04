import 'package:flutter/material.dart';
import 'package:productivity/components/TimerComponents/timer_card.dart';
import 'package:productivity/components/TimerComponents/timer_footer.dart';

class WorkTimer extends StatefulWidget {
  const WorkTimer({super.key});

  @override
  State<WorkTimer> createState() => _WorkTimerState();
}

class _WorkTimerState extends State<WorkTimer> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFFFDBB9),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TimerCard(),
          Padding(
            padding: EdgeInsets.only(
              top: 28.0,
              right: 40,
              left: 40,
              bottom: 70,
            ),
            child: TimerFooter(),
          ),
        ],
      ),
    );
  }
}
