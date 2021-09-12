import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimerModel extends ChangeNotifier {
  int displayedSeconds = 0;
  int defaultSeconds = 0;

  bool isRunning = false;
  final dul = const Duration(seconds: 1);
  late Timer timer;

  void startTimer(int inputedSeconds) {
    if (defaultSeconds == 0) {
      defaultSeconds = inputedSeconds;
    }
    displayedSeconds = inputedSeconds;
    if (isRunning) {
      return;
    }

    timer = Timer.periodic(dul, (time) {
      // 残り秒数が0になったらTimerを止める
      if (displayedSeconds == 1) {
        time.cancel();
        isRunning = false;
      }

      displayedSeconds--;
      notifyListeners();
    });
    isRunning = true;
  }

  void resetTimer() {
    timer.cancel();
    displayedSeconds = defaultSeconds;
    print(defaultSeconds);
    isRunning = false;
    notifyListeners();
  }

  void deleteTimer() {
    timer.cancel();
    isRunning = false;
  }

  IconButton setIcon() {
    print(isRunning);
    if (isRunning) {
      return IconButton(
        iconSize: 100,
        onPressed: () {
          timer.cancel();

          isRunning = false;
          notifyListeners();
        },
        icon: const Icon(Icons.pause_circle),
      );
    }
    return IconButton(
      iconSize: 100,
      onPressed: () {
        if (displayedSeconds == 0) {
          return;
        }
        startTimer(displayedSeconds);
        isRunning = true;
        notifyListeners();
      },
      icon: const Icon(Icons.play_circle),
    );
  }
}
