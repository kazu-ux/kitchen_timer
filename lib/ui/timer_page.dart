import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kitchen_timer/model/time_display_model.dart';
import 'package:kitchen_timer/model/timer_model.dart';
import 'package:provider/provider.dart';

class TimerPage extends StatelessWidget {
  const TimerPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final timeDisplayModel = context.read<TimeDisplayModel>();
    // context.read<TimerModel>().startTimer(timeDisplayModel.totalSeconds);
    final timerModel = context.read<TimerModel>()
      ..startTimer(timeDisplayModel.totalSeconds);

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Consumer<TimerModel>(
              builder: (context, model, _) {
                return Text(
                  (model.displayedTime).toString(),
                  style: const TextStyle(fontSize: 100),
                );
              },
            ),
            TextButton(
                onPressed: timerModel.resetTimer,
                child: const Text(
                  'ăȘă»ăă',
                  style: TextStyle(fontSize: 50),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    iconSize: 100,
                    onPressed: () {
                      timerModel.deleteTimer();
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.delete,
                    )),
                Selector<TimerModel, bool>(
                  selector: (context, model) => model.isRunning,
                  builder: (context, _, child) => timerModel.setIcon(),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
