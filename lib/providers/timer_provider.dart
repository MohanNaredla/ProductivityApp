import 'dart:async';

import 'package:flutter/material.dart';

class TimerProvider with ChangeNotifier {
  Duration totalTime = const Duration(minutes: 25, seconds: 0);
  Duration remainingTime = Duration.zero;
  Duration remainingBreakTime = Duration.zero;
  Duration totalBreakTime = Duration.zero;
  Timer? timer;
  bool isWorkCompleted = false;

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
          timer.cancel();
        }
      },
    );
  }

  bool checkWorkCompleted() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingTime.inSeconds == 0) {
        isWorkCompleted = true;
        notifyListeners();
      }
    });
    return isWorkCompleted;
  }

  void stopTimer() {
    timer!.cancel();
    remainingTime = totalTime;
    notifyListeners();
  }

  void updateDefaultTime(Duration min, Duration sec) {
    if (min.inMinutes > 0 && sec.inSeconds >= 0) {
      totalTime = Duration(minutes: min.inMinutes, seconds: sec.inSeconds);
      totalBreakTime = Duration(seconds: (totalTime.inSeconds * 20) ~/ 100);
      remainingTime = totalTime;
      remainingBreakTime = totalBreakTime;
      notifyListeners();
    } else if (min.inMinutes == 0 && sec.inSeconds >= 0) {
      totalTime = Duration(minutes: 0, seconds: sec.inSeconds);
      totalBreakTime = Duration(seconds: (totalTime.inSeconds * 20) ~/ 100);
      remainingTime = totalTime;
      remainingBreakTime = totalBreakTime;
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
