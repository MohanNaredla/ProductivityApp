import 'dart:async';

import 'package:flutter/material.dart';

class TimerProvider with ChangeNotifier {
  Duration totalTime = const Duration(minutes: 25, seconds: 0);
  Duration remainingTime = Duration.zero;
  Duration remainingBreakTime = Duration.zero;
  Duration totalBreakTime = const Duration(minutes: 10);
  Timer? timer;
  bool isWorkCompleted = false;
  bool isBreakCompleted = false;

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

  void startBreakTimer() {
    remainingBreakTime = totalBreakTime;
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (remainingBreakTime.inSeconds > 0) {
          remainingBreakTime =
              Duration(seconds: remainingBreakTime.inSeconds - 1);
          notifyListeners();
        } else {
          isBreakCompleted = true;
          notifyListeners();
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
      notifyListeners();
    } else if (min.inMinutes == 0 && sec.inSeconds >= 0) {
      totalTime = Duration(minutes: 0, seconds: sec.inSeconds);
      remainingTime = totalTime;
      notifyListeners();
    }
  }

  double returnPercentage() {
    return (remainingTime.inSeconds / totalTime.inSeconds);
  }

  String returnCenterText() {
    return "${remainingTime.inMinutes.toString().padLeft(2, '0')}:${(remainingTime.inSeconds % 60).toString().padLeft(2, '0')}";
  }

  double returnBreakPercentage() {
    return (remainingBreakTime.inSeconds / totalBreakTime.inSeconds);
  }

  String returnBreakCenterText() {
    return "${remainingBreakTime.inMinutes.toString().padLeft(2, '0')}:${(remainingBreakTime.inSeconds % 60).toString().padLeft(2, '0')}";
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
