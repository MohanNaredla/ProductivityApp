import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:productivity/utils/helper_functions/custom_page_route.dart';
import 'package:provider/provider.dart';

import 'package:productivity/components/AppComponents/button.dart';
import 'package:productivity/pages/pomodoro_timer.dart';
import 'package:productivity/providers/timer_provider.dart';
import 'package:productivity/utils/device/device_utils.dart';

class SelectTime extends StatefulWidget {
  const SelectTime({super.key});

  @override
  State<SelectTime> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SelectTime> {
  @override
  Widget build(BuildContext context) {
    Duration minPicker = const Duration(minutes: 25);
    Duration secPicker = const Duration(seconds: 00);

    return Container(
      decoration: const BoxDecoration(
        color: Color.fromRGBO(244, 244, 244, 1),
      ),
      width: double.infinity,
      height: DeviceUtils.getHeight(context) * 1 / 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 25),
            child: Center(
              child: Text(
                "Select Time",
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontSize: 28,
                ),
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: DeviceUtils.getWidth(context) / 2.5,
                  child: CupertinoPicker.builder(
                    itemExtent: 50,
                    childCount: 41,
                    scrollController: FixedExtentScrollController(
                      initialItem: 25,
                    ),
                    onSelectedItemChanged: (value) {
                      value >= 0 && value != 25
                          ? minPicker = Duration(minutes: value)
                          : null;
                      minPicker = Duration(minutes: value);
                    },
                    itemBuilder: (context, index) => Center(
                      child: index < 10
                          ? Text(
                              "0$index",
                              style: const TextStyle(
                                letterSpacing: 1.2,
                              ),
                            )
                          : Text(
                              "$index",
                              style: const TextStyle(
                                letterSpacing: 1.2,
                              ),
                            ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Center(
                  child: Text(
                    ':',
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                      fontSize: 28,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: DeviceUtils.getWidth(context) / 2.5,
                  child: CupertinoPicker.builder(
                    itemExtent: 50,
                    childCount: 41,
                    scrollController: FixedExtentScrollController(),
                    onSelectedItemChanged: (value) {
                      secPicker = Duration(seconds: value);
                    },
                    itemBuilder: (context, index) => Center(
                      child: index < 10
                          ? Text(
                              "0$index",
                              style: const TextStyle(
                                letterSpacing: 1.2,
                              ),
                            )
                          : Text(
                              "$index",
                              style: const TextStyle(
                                letterSpacing: 1.2,
                              ),
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 34,
              right: 44,
            ),
            child: Consumer<TimerProvider>(
              builder: (context, timerProvider, child) => MyButton(
                text: "Confirm",
                onPressed: () {
                  timerProvider.updateDefaultTime(minPicker, secPicker);
                  Navigator.of(context).pop();

                  Navigator.of(context).pushReplacement(
                    CustomPageRoute(
                      page: const PomodoroTimer(),
                    ),
                  );
                  timerProvider.startTimer();
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
