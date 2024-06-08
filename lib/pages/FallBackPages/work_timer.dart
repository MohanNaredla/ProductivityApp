import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:productivity/components/TimerComponents/timer_buttons.dart';

import 'package:productivity/components/TimerComponents/timer_card.dart';
import 'package:productivity/components/TimerComponents/timer_footer.dart';
import 'package:productivity/providers/timer_provider.dart';
import 'package:productivity/utils/constants/colors.dart';
import 'package:provider/provider.dart';

class WorkTimer extends StatefulWidget {
  const WorkTimer({super.key});

  @override
  State<WorkTimer> createState() => _WorkTimerState();
}

class _WorkTimerState extends State<WorkTimer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFDBB9),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<TimerProvider>(
            builder: (context, value, child) => TimerCard(
              text: "Work Timer",
              cardColor: const Color(0xFFEAB07A),
              progressColor: AppColors.progressColor,
              progressBackground: AppColors.progressColor.withOpacity(0.4),
              centerText: value.returnCenterText(),
              percentage: value.returnPercentage(),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              top: 28.0,
              right: 40,
              left: 40,
              bottom: 70,
            ),
            child: TimerFooter(
              cardColor: Color(0xFFEAB07A),
              iconBackground: Color(0xFFFFDBB9),
              icon: FontAwesomeIcons.penToSquare,
              cardTitle: "This is your work time",
              cardSubTitle: "Let's focus on getting things done",
              timerButtons: TimerButtons(
                text1: "I need a break",
                text2: "End this session",
                bottomColor: Color(0xFFFFDBB9),
                topColor: Color(0xFFFF9B3F),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
