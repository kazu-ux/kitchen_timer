import 'dart:async';

import 'package:flutter/cupertino.dart';

class TimerModel extends ChangeNotifier {
  String secondsTimeDisplay = '';
  int inputedSeconds = 0;
  final dul = const Duration(seconds: 1);

  void startTimer(int seconds) {
    Timer.periodic(dul, (time) {
      if (secondsTimeDisplay == '1') {
        time.cancel();
      }
      secondsTimeDisplay = (seconds--).toString();

      notifyListeners();
    });
  }
}
