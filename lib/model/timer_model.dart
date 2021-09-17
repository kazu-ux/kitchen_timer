import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimerModel extends ChangeNotifier {
  late String displayedTime;
  int countSeconds = 0;
  int defaultSeconds = 0;

  bool isRunning = false;
  final dul = const Duration(seconds: 1);
  late Timer timer;

  void startTimer(int inputedSeconds) {
    if (defaultSeconds == 0) {
      defaultSeconds = inputedSeconds;
    }
    countSeconds = inputedSeconds;
    if (isRunning) {
      return;
    }
    convertTimeFormat(inputedSeconds);
    timer = Timer.periodic(dul, (time) {
      // 残り秒数が0になったらTimerを止める
      if (displayedTime == '00:00:01') {
        time.cancel();
        isRunning = false;
      }
      convertTimeFormat(inputedSeconds--);
      notifyListeners();
    });
    isRunning = true;
  }

  void resetTimer() {
    timer.cancel();
    // countSeconds = defaultSeconds;
    convertTimeFormat(defaultSeconds);
    print(defaultSeconds);
    isRunning = false;
    notifyListeners();
  }

  void deleteTimer() {
    timer.cancel();
    isRunning = false;
    defaultSeconds = 0;
  }

  void convertTimeFormat(int totalSeconds) {
    final hours = totalSeconds ~/ 3600;
    late int minutes;
    if (totalSeconds ~/ 60 == 60) {
      minutes = 0;
    } else {
      minutes = totalSeconds ~/ 60;
    }

    final seconds = totalSeconds % 60;

    // print(totalSeconds % 3600);

    displayedTime =
        '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
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
        if (countSeconds == 0) {
          return;
        }
        startTimer(countSeconds);
        isRunning = true;
        notifyListeners();
      },
      icon: const Icon(Icons.play_circle),
    );
  }
}
