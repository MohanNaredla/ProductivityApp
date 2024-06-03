import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:productivity/components/AppComponents/button.dart';
import 'package:productivity/providers/timer_provider.dart';
import 'package:productivity/utils/constants/colors.dart';
import 'package:productivity/utils/device/device_utils.dart';
import 'package:productivity/utils/helper_functions/add_size.dart';
import 'package:provider/provider.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({super.key});

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  @override
  Widget build(BuildContext context) {
    var minutePicker = const Duration(minutes: 0);
    var secondPicker = const Duration(seconds: 0);
    return Scaffold(
      body: Center(
        child: Consumer<TimerProvider>(
          builder: (context, value, child) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularPercentIndicator(
                center: value.returnCenterText(),
                radius: 140,
                animation: false,
                lineWidth: 20,
                percent: value.getPercentage(),
                progressColor: AppColors.secondary_color_variant,
                backgroundColor:
                    AppColors.secondary_color_variant.withOpacity(0.3),
                circularStrokeCap: CircularStrokeCap.round,
              ),
              AddSize.addVertical(84.0),
              ElevatedButton(
                onPressed: () {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (_) => Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      width: DeviceUtils.getWidth(context),
                      height: 350,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: DeviceUtils.getWidth(context) / 2.5,
                                  child: CupertinoPicker.builder(
                                    backgroundColor: Colors.white,
                                    magnification: 1.2,
                                    itemExtent: 40,
                                    childCount: 41,
                                    onSelectedItemChanged: (value) {
                                      minutePicker = Duration(minutes: value);
                                    },
                                    scrollController:
                                        FixedExtentScrollController(
                                      initialItem: 25,
                                    ),
                                    itemBuilder: (_, index) => Center(
                                      child: index < 10
                                          ? Text("0$index")
                                          : Text("$index"),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: DeviceUtils.getWidth(context) / 2.5,
                                  child: CupertinoPicker.builder(
                                    backgroundColor: Colors.white,
                                    magnification: 1.2,
                                    itemExtent: 40,
                                    childCount: 61,
                                    onSelectedItemChanged: (value) {
                                      secondPicker = Duration(seconds: value);
                                    },
                                    scrollController:
                                        FixedExtentScrollController(),
                                    itemBuilder: (_, index) => Center(
                                      child: index < 10
                                          ? Text("0$index")
                                          : Text("$index"),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(bottom: 40, right: 30),
                            child: MyButton(
                              text: "Start",
                              onPressed: () {
                                value.updateDefaultTime(
                                  minutePicker,
                                  secondPicker,
                                );

                                Navigator.of(context).pop();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                child: const Text("Start Timer"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
