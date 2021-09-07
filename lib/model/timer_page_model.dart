import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimerPageModel extends ChangeNotifier {
  bool isRunning = false;
  IconButton setIcon() {
    return IconButton(
      iconSize: 100,
      onPressed: () {},
      icon: const Icon(Icons.pause_circle),
    );
  }
}
