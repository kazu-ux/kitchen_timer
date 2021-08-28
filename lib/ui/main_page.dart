import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kitchen_timer/model/kitchen_timer_model.dart';
import 'package:kitchen_timer/ui/timer_page.dart';
import 'package:kitchen_timer/ui/widget/keyboard.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final kitchenTimerModel = Provider.of<KitchenTimerModel>(context);
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
                Consumer<KitchenTimerModel>(
                  builder: (context, model, _) => Text(
                    model.time,
                    style: const TextStyle(fontSize: 80),
                  ),
                ),
                IconButton(
                  onPressed: kitchenTimerModel.backspace,
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
              testStr: kitchenTimerModel.totalSeconds,
            );
          }));
        },
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
