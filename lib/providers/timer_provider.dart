import 'dart:async';

import 'package:flutter/material.dart';

class TimerProvider with ChangeNotifier {
  Duration totalTime = const Duration(
    minutes: 25,
    seconds: 0,
    microseconds: 0,
    milliseconds: 0,
  );
  Duration remainingTime = Duration.zero;
  Timer? timer;
  int cycles = 1;

  void startTimer() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (remainingTime.inSeconds > 0) {
          remainingTime = Duration(seconds: remainingTime.inSeconds - 1);
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

  void updateDefaultTime(Duration min, Duration sec) {
    if (min.inMinutes > 0 && sec.inSeconds >= 0) {
      totalTime = Duration(minutes: min.inMinutes, seconds: sec.inSeconds);
      remainingTime = totalTime;
    }
    notifyListeners();
  }

  void updateCycleCount(int val) {
    val > 0 ? cycles = val : cycles = 1;
    notifyListeners();
  }

  double getPercentage() {
    return (remainingTime.inSeconds / totalTime.inSeconds);
  }

  String returnCenterText() {
    return "${remainingTime.inMinutes.toString().padLeft(2, '0')}:${(remainingTime.inSeconds % 60).toString().padLeft(2, '0')}";
  }

  Duration getDefaultTime() {
    return totalTime;
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }
}
