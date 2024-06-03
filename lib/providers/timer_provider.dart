import 'dart:async';

import 'package:flutter/material.dart';

class TimerProvider with ChangeNotifier {
  Duration totalTime = const Duration(
    minutes: 25,
    seconds: 0,
    microseconds: 0,
    milliseconds: 0,
  );
  Duration? remainingTime;
  Timer? timer;

  TimerProvider() {
    remainingTime = Duration.zero;
  }

  void startTimer() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (remainingTime!.inSeconds < totalTime.inSeconds) {
          remainingTime = Duration(seconds: remainingTime!.inSeconds + 1);
          notifyListeners();
        } else {
          timer.cancel();
        }
      },
    );
  }

  void stopTimer() {
    timer!.cancel();
    remainingTime = totalTime;
    notifyListeners();
  }

  double getPercentage() {
    return (remainingTime!.inSeconds / totalTime.inSeconds);
  }

  void updateDefaultTime(Duration min, Duration sec) {
    totalTime = Duration(minutes: min.inMinutes, seconds: sec.inSeconds);
    notifyListeners();
  }

  Widget returnCenterText() {
    return Text(
        "${totalTime.inMinutes} : ${(totalTime.inSeconds % 60).toString().padLeft(2, '0')}");
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }
}
