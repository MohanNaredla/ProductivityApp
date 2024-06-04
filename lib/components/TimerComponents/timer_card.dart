import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:productivity/providers/timer_provider.dart';
import 'package:productivity/utils/constants/colors.dart';
import 'package:productivity/utils/helper_functions/add_size.dart';
import 'package:provider/provider.dart';

class TimerCard extends StatefulWidget {
  const TimerCard({super.key});

  @override
  State<TimerCard> createState() => _TimerCardState();
}

class _TimerCardState extends State<TimerCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 70.0),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              color: const Color(0xFFEAB07A),
              elevation: 8,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFEAB07A),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(57, 20, 57, 30),
                  child: Column(
                    children: [
                      const Text(
                        "Work Timer",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      AddSize.addVertical(50.0),
                      Consumer<TimerProvider>(
                        builder: (context, value, child) =>
                            CircularPercentIndicator(
                          center: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Time Left:"),
                              Text(
                                value.returnCenterText(),
                                style: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          radius: 120,
                          progressColor: AppColors.progressColor,
                          backgroundColor: AppColors.progressColor.withOpacity(
                            0.4,
                          ),
                          lineWidth: 20,
                          circularStrokeCap: CircularStrokeCap.round,
                          percent: value.getPercentage(),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
