import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kitchen_timer/model/time_display_model.dart';
import 'package:kitchen_timer/model/timer_model.dart';
import 'package:kitchen_timer/ui/timer_page.dart';
import 'package:kitchen_timer/ui/widget/keyboard.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final timeDisplayModel = Provider.of<TimeDisplayModel>(context);
    var inputedTime = '';
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('キッチンタイマー'),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Consumer<TimeDisplayModel>(
                  builder: (context, model, _) => Text(
                    model.time,
                    style: const TextStyle(fontSize: 80),
                  ),
                ),
                IconButton(
                  onPressed: timeDisplayModel.backspace,
                  icon: const Icon(Icons.backspace),
                  iconSize: 40,
                )
              ],
            ),
            const Keyboard(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute<void>(builder: (context) {
            return TimerPage(
              seconds: timeDisplayModel.totalSeconds,
            );
          }));
        },
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
