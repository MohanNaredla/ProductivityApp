import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:productivity/components/TimerComponents/timer_card.dart';
import 'package:productivity/components/TimerComponents/timer_footer.dart';
import 'package:productivity/providers/timer_provider.dart';
import 'package:productivity/utils/constants/colors.dart';
import 'package:productivity/components/TimerComponents/timer_buttons.dart';

class BreakTimer extends StatefulWidget {
  const BreakTimer({super.key});

  @override
  State<BreakTimer> createState() => _BreakTimerState();
}

class _BreakTimerState extends State<BreakTimer> {
  @override
  void initState() {
    final provider = Provider.of<TimerProvider>(context, listen: false);
    provider.startBreakTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB9DCFF),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<TimerProvider>(
            builder: (context, value, child) => TimerCard(
              text: "Break Timer",
              cardColor: const Color(0xFF7BB4ED),
              progressColor: AppColors.progressColorBreak,
              progressBackground: AppColors.progressColorBreak.withOpacity(0.4),
              centerText: value.returnBreakCenterText(),
              percentage: value.returnBreakPercentage(),
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
              cardColor: Color(0xFF7BB4ED),
              iconBackground: Color(0xFFB5D8FB),
              icon: FontAwesomeIcons.beerMugEmpty,
              cardTitle: "This is break time",
              cardSubTitle: "Let's breathe and relax a bit",
              timerButtons: TimerButtons(
                text1: "Start Working Again",
                text2: "End this session",
                topColor: Color(0xFF2B7BC9),
                bottomColor: Color(0xFFB7D9FC),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
