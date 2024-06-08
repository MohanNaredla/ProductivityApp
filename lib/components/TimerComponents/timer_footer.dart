import 'package:flutter/material.dart';

import 'package:productivity/utils/device/device_utils.dart';

class TimerFooter extends StatelessWidget {
  const TimerFooter({
    super.key,
    required this.icon,
    required this.cardTitle,
    required this.cardSubTitle,
    required this.cardColor,
    required this.iconBackground,
    required this.timerButtons,
  });

  final IconData icon;
  final String cardTitle;
  final String cardSubTitle;
  final Color cardColor;
  final Color iconBackground;
  final Widget timerButtons;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Card(
            color: cardColor,
            elevation: 8,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: iconBackground,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Icon(
                        icon,
                        size: DeviceUtils.getHeight(context) * 0.03,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cardTitle,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w800,
                            letterSpacing: -0.2,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          cardSubTitle,
                          style: const TextStyle(
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
          timerButtons,
        ],
      ),
    );
  }
}
