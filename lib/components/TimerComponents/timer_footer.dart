import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:productivity/components/TimerComponents/timer_buttons.dart';
import 'package:productivity/utils/device/device_utils.dart';

class TimerFooter extends StatelessWidget {
  const TimerFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Card(
            color: const Color(0xFFEAB07A),
            elevation: 8,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(
                        0xFFFFDBB9,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Icon(
                        FontAwesomeIcons.penToSquare,
                        size: DeviceUtils.getHeight(context) * 0.03,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "This is your work time",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w800,
                            letterSpacing: -0.2,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Let's focus on getting things done",
                          style: TextStyle(
                            fontSize: 13,
                            letterSpacing: -0.1,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const TimerButtons(
            text1: "I need a break",
            text2: "End this session",
          )
        ],
      ),
    );
  }
}
