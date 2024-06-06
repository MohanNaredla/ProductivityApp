import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:productivity/components/AppComponents/button.dart';
import 'package:productivity/pages/pomodoro_timer.dart';
import 'package:productivity/providers/timer_provider.dart';
import 'package:productivity/utils/device/device_utils.dart';
import 'package:productivity/utils/helper_functions/custom_page_route.dart';
import 'package:provider/provider.dart';

class SelectCycles extends StatefulWidget {
  const SelectCycles({super.key});

  @override
  State<SelectCycles> createState() => _SelectCyclesState();
}

class _SelectCyclesState extends State<SelectCycles> {
  @override
  Widget build(BuildContext context) {
    int cycles = 1;
    return AlertDialog(
      backgroundColor: const Color.fromRGBO(244, 244, 244, 1),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 14.0),
            child: Center(
              child: Text(
                "Select Cycles",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          SizedBox(
            height: DeviceUtils.getHeight(context) * 1 / 5,
            child: CupertinoPicker.builder(
              childCount: 10,
              scrollController: FixedExtentScrollController(
                initialItem: 1,
              ),
              itemBuilder: (context, index) => Center(
                child: Text("${index + 1}"),
              ),
              itemExtent: 50,
              onSelectedItemChanged: (value) {
                cycles = value;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 40,
            ),
            child: Consumer<TimerProvider>(
              builder: (_, value, index) => MyButton(
                text: "Start Timer",
                onPressed: () {
                  value.updateCycleCount(cycles);
                  value.checkCompleted();
                  Navigator.of(context).pop();
                  Navigator.of(context).pushReplacement(
                    CustomPageRoute(
                      page: const PomodoroTimer(),
                    ),
                  );
                  Future.delayed(
                    const Duration(milliseconds: 5),
                    () => value.startTimer(),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
