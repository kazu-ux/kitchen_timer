import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kitchen_timer/db/db.dart';
import 'package:kitchen_timer/model/time_display_model.dart';
import 'package:kitchen_timer/ui/timer_page.dart';
import 'package:kitchen_timer/ui/widget/keyboard.dart';
import 'package:provider/provider.dart';

Future<void> pathTest() async {
  final memo = Memo();
  memo.testFunc();
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final timeDisplayModel = Provider.of<TimeDisplayModel>(context);
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
                GestureDetector(
                    onTap: timeDisplayModel.backspace,
                    onLongPress: timeDisplayModel.allDelete,
                    child: const Padding(
                      padding: EdgeInsets.all(20),
                      child: Icon(
                        Icons.backspace,
                        size: 40,
                      ),
                    ))
              ],
            ),
            const Keyboard(),
            GestureDetector(
              onTap: pathTest,
              child: const Icon(
                Icons.backup_table,
                size: 100,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (timeDisplayModel.totalSeconds == 0) {
            return;
          }

          Navigator.of(context)
              .push(MaterialPageRoute<void>(builder: (context) {
            return const TimerPage();
          }));
        },
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
