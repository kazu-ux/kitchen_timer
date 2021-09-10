import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimerModel extends ChangeNotifier {
  String secondsTimeDisplay = '';
  bool isRunning = false;
  final dul = const Duration(seconds: 1);
  late Timer timer;
  late int seconds;

  void startTimer(int seconds) {
    if (isRunning) {
      return;
    }

    timer = Timer.periodic(dul, (time) {
      // 残り秒数が0になったらTimerを止める
      if (secondsTimeDisplay == '1') {
        time.cancel();
        isRunning = false;
      }

      secondsTimeDisplay = (seconds - (time.tick - 1)).toString();
      notifyListeners();
    });
    isRunning = true;
  }

  void resetTimer() {
    print(seconds);
  }

  IconButton setIcon() {
    print('test');
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
        if (secondsTimeDisplay == '0') {
          return;
        }
        startTimer(int.parse(secondsTimeDisplay));
      },
      icon: const Icon(Icons.play_circle),
    );
  }
}
