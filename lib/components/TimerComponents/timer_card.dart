import 'package:flutter/material.dart';

import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:productivity/utils/helper_functions/add_size.dart';

class TimerCard extends StatefulWidget {
  const TimerCard({
    super.key,
    required this.text,
    required this.cardColor,
    required this.progressColor,
    required this.progressBackground,
    required this.centerText,
    required this.percentage,
  });

  final String text;
  final String centerText;
  final double percentage;
  final Color cardColor;
  final Color progressColor;
  final Color progressBackground;

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
              color: widget.cardColor,
              elevation: 8,
              child: Container(
                decoration: BoxDecoration(
                  color: widget.cardColor,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(57, 20, 57, 30),
                  child: Column(
                    children: [
                      Text(
                        widget.text,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      AddSize.addVertical(50.0),
                      CircularPercentIndicator(
                        center: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Time Left:"),
                            Text(
                              widget.centerText,
                              style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        radius: 120,
                        progressColor: widget.progressColor,
                        backgroundColor: widget.progressBackground,
                        lineWidth: 20,
                        circularStrokeCap: CircularStrokeCap.round,
                        percent: widget.percentage,
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
