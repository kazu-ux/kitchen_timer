import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kitchen_timer/model/timer_model.dart';
import 'package:provider/provider.dart';

class TimerPage extends StatelessWidget {
  final int seconds;
  TimerPage({Key? key, required this.seconds}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    context.read<TimerModel>().startTimer(seconds);
    // final secondsTimeDisplay = context.read<TimerModel>().secondsTimeDisplay;

    return Scaffold(
      body: Center(child: Consumer<TimerModel>(
        builder: (context, model, _) {
          return _TimeDisplay();
        },
      )),
    );
  }
}

class _TimeDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final secondsTimeDisplay = context.watch<TimerModel>().secondsTimeDisplay;
    print(secondsTimeDisplay.toString());
    return Text(
      secondsTimeDisplay,
      style: const TextStyle(fontSize: 40),
    );
  }
}
