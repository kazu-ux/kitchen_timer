import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kitchen_timer/model/kitchen_timer_model.dart';
import 'package:kitchen_timer/ui/widget/keyboard.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    /* final kitchenTimerModel1 = context.select(
        (KitchenTimerModel inputedNumber) => inputedNumber.inputedNumber); */
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('キッチンタイマー'),
      ),
      body: Center(
        child: Column(
          children: [
            Consumer<KitchenTimerModel>(
              builder: (context, model, _) => Text(
                model.inputedNumber,
                style: const TextStyle(fontSize: 80),
              ),
            ),
            const Keyboard(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<KitchenTimerModel>().testFunc('test');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
